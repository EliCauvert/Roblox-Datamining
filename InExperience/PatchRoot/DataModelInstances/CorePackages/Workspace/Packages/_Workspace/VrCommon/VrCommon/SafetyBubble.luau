local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local Players = game:GetService("Players")
local VRService = game:GetService("VRService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local SafetyBubbleModule = {}
SafetyBubbleModule.__index = SafetyBubbleModule
local CreateFunction = require(script:FindFirstAncestor("VrCommon").Parent.AppCommonLib).Create
local FIntSafetyBubbleRadiusModule = require(script.Parent.FIntSafetyBubbleRadius)
local ScaledFIntSafetyBubbleTransparencyPercentModule = require(script.Parent.FIntSafetyBubbleTransparencyPercent) * 0.01

function SafetyBubbleModule.new() --[[ Line: 26 ]]
	-- upvalues: SafetyBubbleModule (copy), UserGameSettings (copy), CreateFunction (copy), RbxAnalyticsService (copy)
	local self = setmetatable({}, SafetyBubbleModule)
	self.subjects = {}
	self.mode = UserGameSettings.VRSafetyBubbleMode
	self.enabled = self.mode ~= Enum.VRSafetyBubbleMode.Anyone
	self.updateCadence = 0.2
	self.Toggled = CreateFunction("BindableEvent")({ Name = "SafetyBubbleToggled" })
	UserGameSettings:GetPropertyChangedSignal("VRSafetyBubbleMode"):Connect(function() --[[ Line: 39 ]]
		-- upvalues: self (copy), UserGameSettings (upval), RbxAnalyticsService (upval)
		self.mode = UserGameSettings.VRSafetyBubbleMode
		local IsNotModeMatch = self.mode ~= Enum.VRSafetyBubbleMode.Anyone
		
		if self.enabled ~= IsNotModeMatch then
			self.enabled = IsNotModeMatch
			self.Toggled:Fire()
			RbxAnalyticsService:ReportCounter("VR-SafetyBubble-" .. (if IsNotModeMatch then "On" else "Off"))
		end
	end)
	
	return self
end

function SafetyBubbleModule:ToggleEnabled() --[[ Line: 54 ]]
	-- upvalues: UserGameSettings (copy)
	UserGameSettings.VRSafetyBubbleMode = self.enabled and Enum.VRSafetyBubbleMode.Anyone or Enum.VRSafetyBubbleMode.NoOne
end

function SafetyBubbleModule:HasToolAncestor(Parent) --[[ Line: 59 ]]
	return Parent ~= nil and Parent.Parent ~= nil and (Parent.Parent:IsA("Tool") or self:HasToolAncestor(Parent.Parent))
end

function SafetyBubbleModule.IsValidPartToModify(p1, Object): boolean --[[ Line: 66 ]]
	return if Object:IsA("BasePart") or Object:IsA("Decal") then not p1:HasToolAncestor(Object) else false
end

function SafetyBubbleModule:CachePartsRecursive(Object, SubjectIndex) --[[ Line: 73 ]]
	if Object then
		if self:IsValidPartToModify(Object) then
			self.subjects[SubjectIndex].cachedParts[Object] = true
			self.subjects[SubjectIndex].transparencyDirty = true
		end
		for _, child in pairs(Object:GetChildren()) do
			self:CachePartsRecursive(child, SubjectIndex)
		end
	end
end

function SafetyBubbleModule:TeardownTransparency(SubjectIndex) --[[ Line: 85 ]]
	for i, _ in pairs(self.subjects[SubjectIndex].cachedParts) do
		i.LocalTransparencyModifier = 0
	end
	self.subjects[SubjectIndex].cachedParts = {}
	self.subjects[SubjectIndex].transparencyDirty = true
	self.subjects[SubjectIndex].lastTransparency = nil
	
	if self.subjects[SubjectIndex].descendantAddedConn then
		self.subjects[SubjectIndex].descendantAddedConn:disconnect()
		self.subjects[SubjectIndex].descendantAddedConn = nil
	end
	if self.subjects[SubjectIndex].descendantRemovingConn then
		self.subjects[SubjectIndex].descendantRemovingConn:disconnect()
		self.subjects[SubjectIndex].descendantRemovingConn = nil
	end
	for i1, toolDescendantAddedConn in pairs(self.subjects[SubjectIndex].toolDescendantAddedConns) do
		toolDescendantAddedConn:Disconnect()
		self.subjects[SubjectIndex].toolDescendantAddedConns[i1] = nil
	end
	for i2, toolDescendantRemovingConn in pairs(self.subjects[SubjectIndex].toolDescendantRemovingConns) do
		toolDescendantRemovingConn:Disconnect()
		self.subjects[SubjectIndex].toolDescendantRemovingConns[i2] = nil
	end
end

function SafetyBubbleModule:GetSubjectIndex(Character): number --[[ Line: 111 ]]
	local CountSubjects = #self.subjects
	local Count = 1
	while Count <= CountSubjects do
		if self.subjects[Count].character == Character then
			return Count
		end
		Count += 1
	end
	return 0
end

function SafetyBubbleModule:SubjectExists(Character): boolean --[[ Line: 125 ]]
	return self:GetSubjectIndex(Character) > 0
end

function SafetyBubbleModule:SetupTransparency(Character) --[[ Line: 131 ]]
	local SubjectIndex = self:GetSubjectIndex(Character)
	
	if SubjectIndex == 0 then return end
	if self.subjects[SubjectIndex].descendantAddedConn then
		self.subjects[SubjectIndex].descendantAddedConn:disconnect()
	end
	self.subjects[SubjectIndex].descendantAddedConn = Character.DescendantAdded:Connect(function(Descendant) --[[ Line: 140 ]]
		-- upvalues: SubjectIndex (ref), self (copy), Character (copy)
		SubjectIndex = self:GetSubjectIndex(Character)
		
		if SubjectIndex == 0 then return end
		if self:IsValidPartToModify(Descendant) then
			self.subjects[SubjectIndex].cachedParts[Descendant] = true
			self.subjects[SubjectIndex].transparencyDirty = true
		end
	end)
	
	if self.descendantRemovingConn then
		self.descendantRemovingConn:disconnect()
	end
	self.descendantRemovingConn = Character.DescendantRemoving:connect(function(Descendant) --[[ Line: 156 ]]
		-- upvalues: SubjectIndex (ref), self (copy), Character (copy)
		SubjectIndex = self:GetSubjectIndex(Character)
		
		if SubjectIndex == 0 then return end
		if self.subjects[SubjectIndex] and self.subjects[SubjectIndex].cachedParts[Descendant] then
			self.subjects[SubjectIndex].cachedParts[Descendant] = nil
			Descendant.LocalTransparencyModifier = 0
		end
	end)
	self:CachePartsRecursive(Character, SubjectIndex)
end

function SafetyBubbleModule:AddSubject(Character) --[[ Line: 172 ]]
	local CountSubjects = #self.subjects
	local Count = 1
	while Count <= CountSubjects do
		if self.subjects[Count].character == Character then return end
		Count += 1
	end
	table.insert(self.subjects, {
		transparencyDirty = false,
		lastTransparency = nil,
		descendantAddedConn = nil,
		descendantRemovingConn = nil,
		character = nil,
		toolDescendantAddedConns = {},
		toolDescendantRemovingConns = {},
		cachedParts = {}
	})
	self.subjects[Count].character = Character
	self:SetupTransparency(Character)
end

function SafetyBubbleModule:update(p1) --[[ Line: 202 ]]
	-- upvalues: FIntSafetyBubbleRadiusModule (copy), VRService (copy), Players (copy), ScaledFIntSafetyBubbleTransparencyPercentModule (copy)
	local CurrentCamera = workspace.CurrentCamera
	
	if not CurrentCamera then return end
	if self.enabled then
		local Largest = math.max(FIntSafetyBubbleRadiusModule * CurrentCamera.HeadScale, 0.1)
		local Character = nil
		local NewLargest = Largest + 3
		local ScaledUserCFrame = CurrentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)
		self.updateCadence -= p1
		
		if self.updateCadence <= 0 then
			self.updateCadence = 0.2
			
			for _, player in pairs(Players:GetPlayers()) do
				if player.Character and player ~= Players.LocalPlayer then
					if self.mode == Enum.VRSafetyBubbleMode.OnlyFriends and Players.LocalPlayer:IsFriendsWithAsync(player.UserId) then
						local SubjectIndex: number = self:GetSubjectIndex(player.Character)
						
						if SubjectIndex > 0 then
							self:TeardownTransparency(SubjectIndex)
							table.remove(self.subjects, SubjectIndex)
						end
					elseif not self:SubjectExists(player.Character) and player.Character then
						local BoundingCFrame, BoundingSize = player.Character:GetBoundingBox()
						local MagnitudeDelta = (BoundingCFrame.Position - ScaledUserCFrame.Position).Magnitude - BoundingSize.Z
						
						if MagnitudeDelta < NewLargest then
							NewLargest = MagnitudeDelta
							Character = player.Character
						end
					end
				end
			end
			if Character then
				self:AddSubject(Character)
			end
		end
		if not self.subjects or #self.subjects == 0 then return end
		local CountSubjects = #self.subjects
		while CountSubjects > 0 do
			local BoundingCFrame1, BoundingSize1 = self.subjects[CountSubjects].character:GetBoundingBox()
			
			if Largest * 2 < (BoundingCFrame1.Position - ScaledUserCFrame.Position).Magnitude - BoundingSize1.Z then
				self:TeardownTransparency(CountSubjects)
				table.remove(self.subjects, CountSubjects)
			end
			CountSubjects -= 1
		end
		local CountSubjects1 = #self.subjects
		local Count = 1
		while Count <= CountSubjects1 do
			local ScaledFIntSafetyBubbleTransparencyPercentModule1 = 0
			local Character1 = self.subjects[Count].character
			local Distance = nil
			
			if Character1.PrimaryPart then
				Distance = (Vector3.new(Character1:GetPrimaryPartCFrame().p.x, ScaledUserCFrame.Position.Y, Character1:GetPrimaryPartCFrame().p.z) - ScaledUserCFrame.Position).Magnitude
			else
				local BoundingCFrame2, BoundingSize2 = Character1:GetBoundingBox()
				Distance = (BoundingCFrame2.Position - ScaledUserCFrame.Position).Magnitude - BoundingSize2.Z
			end
			if Distance < Largest then
				if CountSubjects1 > 3 then
					ScaledFIntSafetyBubbleTransparencyPercentModule1 = 1
				else
					local ScaledLargest = Largest * 0.75
					ScaledFIntSafetyBubbleTransparencyPercentModule1 = if Distance < ScaledLargest then ScaledFIntSafetyBubbleTransparencyPercentModule else (1 - (Distance - ScaledLargest) / (Largest - ScaledLargest)) * ScaledFIntSafetyBubbleTransparencyPercentModule
				end
			end
			if not self.subjects[Count].lastTransparency then
				self.subjects[Count].transparencyDirty = true
			end
			local ClampedValue = math.clamp(ScaledFIntSafetyBubbleTransparencyPercentModule1, 0, 1)
			
			if self.subjects[Count].transparencyDirty or self.subjects[Count].lastTransparency ~= ClampedValue then
				for i1, _ in pairs(self.subjects[Count].cachedParts) do
					i1.LocalTransparencyModifier = ClampedValue
				end
				self.subjects[Count].transparencyDirty = false
				self.subjects[Count].lastTransparency = ClampedValue
			end
			local Tool = Character1:FindFirstChildOfClass("Tool")
			
			if Tool then
				for _, Part in pairs(Tool:GetChildren()) do
					if Part:IsA("BasePart") then
						Part.LocalTransparencyModifier = ClampedValue
					end
				end
			end
			Count += 1
		end
		return
	else
		if self.subjects and #self.subjects > 0 then
			for i = 1, #self.subjects do
				self:TeardownTransparency(i)
			end
			self.subjects = {}
		end
	end
end

return SafetyBubbleModule