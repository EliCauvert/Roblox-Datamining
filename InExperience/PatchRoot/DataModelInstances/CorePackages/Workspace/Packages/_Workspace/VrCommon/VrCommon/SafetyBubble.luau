local parent = script:FindFirstAncestor("VrCommon").Parent
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local playersService = game:GetService("Players")
local VRService = game:GetService("VRService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local t = {}
t.__index = t
local create = require(parent.AppCommonLib).Create
local fIntSafetyBubbleRadiusModule = require(script.Parent.FIntSafetyBubbleRadius)
local var1 = require(script.Parent.FIntSafetyBubbleTransparencyPercent) * 0.01

function t.new()
	-- upvalues: t (ref), userGameSettingsService (ref), create (ref), rbxAnalyticsService (ref)
	local tbl = setmetatable({}, t)
	tbl.subjects = {}
	tbl.mode = userGameSettingsService.VRSafetyBubbleMode
	tbl.enabled = tbl.mode ~= Enum.VRSafetyBubbleMode.Anyone
	tbl.updateCadence = 0.2
	tbl.Toggled = create("BindableEvent")({ Name = "SafetyBubbleToggled" })
	userGameSettingsService:GetPropertyChangedSignal("VRSafetyBubbleMode"):Connect(function()
		-- upvalues: tbl (ref), userGameSettingsService (copy), rbxAnalyticsService (copy)
		tbl.mode = userGameSettingsService.VRSafetyBubbleMode
		local var2 = tbl.mode ~= Enum.VRSafetyBubbleMode.Anyone
		
		if tbl.enabled ~= var2 then
			tbl.enabled = var2
			tbl.Toggled:Fire()
			rbxAnalyticsService:ReportCounter("VR-SafetyBubble-" .. (if var2 then "On" else "Off"))
		end
	end)
	
	return tbl
end

function t:ToggleEnabled()
	-- upvalues: userGameSettingsService (ref)
	userGameSettingsService.VRSafetyBubbleMode = if self.enabled then Enum.VRSafetyBubbleMode.Anyone else Enum.VRSafetyBubbleMode.NoOne
end

function t:HasToolAncestor(p1)
	return if p1 == nil or p1.Parent == nil then false else p1.Parent:IsA("Tool") or self:HasToolAncestor(p1.Parent)
end

function t:IsValidPartToModify(p1)
	return if p1:IsA("BasePart") or p1:IsA("Decal") then not self:HasToolAncestor(p1) else false
end

function t:CachePartsRecursive(p1, p2)
	if p1 then
		if self:IsValidPartToModify(p1) then
			self.subjects[p2].cachedParts[p1] = true
			self.subjects[p2].transparencyDirty = true
		end
		for i, v in pairs(p1:GetChildren()) do
			self:CachePartsRecursive(v, p2)
		end
	end
end

function t:TeardownTransparency(p3)
	for i, v in pairs(self.subjects[p3].cachedParts) do
		i.LocalTransparencyModifier = 0
	end
	self.subjects[p3].cachedParts = {}
	self.subjects[p3].transparencyDirty = true
	self.subjects[p3].lastTransparency = nil
	
	if self.subjects[p3].descendantAddedConn then
		self.subjects[p3].descendantAddedConn:disconnect()
		self.subjects[p3].descendantAddedConn = nil
	end
	if self.subjects[p3].descendantRemovingConn then
		self.subjects[p3].descendantRemovingConn:disconnect()
		self.subjects[p3].descendantRemovingConn = nil
	end
	for i_1, v_1 in pairs(self.subjects[p3].toolDescendantAddedConns) do
		v_1:Disconnect()
		self.subjects[p3].toolDescendantAddedConns[i_1] = nil
	end
	for i_2, v_2 in pairs(self.subjects[p3].toolDescendantRemovingConns) do
		v_2:Disconnect()
		self.subjects[p3].toolDescendantRemovingConns[i_2] = nil
	end
end

function t:GetSubjectIndex(p4)
	local subjectsCount = #self.subjects
	local var2 = 1
	while var2 <= subjectsCount do
		if self.subjects[var2].character ~= p4 then
			var2 += 1
			continue
		end
		return var2
	end
	return 0
end

function t:SubjectExists(p5)
	return self:GetSubjectIndex(p5) > 0
end

function t:SetupTransparency(p5)
	local var3 = self:GetSubjectIndex(p5)
	
	if var3 == 0 then return end
	if self.subjects[var3].descendantAddedConn then
		self.subjects[var3].descendantAddedConn:disconnect()
	end
	self.subjects[var3].descendantAddedConn = p5.DescendantAdded:Connect(function(p6)
		-- upvalues: var3 (write), self (ref), p5 (ref)
		var3 = self:GetSubjectIndex(p5)
		
		if var3 == 0 then return end
		if self:IsValidPartToModify(p6) then
			self.subjects[var3].cachedParts[p6] = true
			self.subjects[var3].transparencyDirty = true
		end
	end)
	
	if self.descendantRemovingConn then
		self.descendantRemovingConn:disconnect()
	end
	self.descendantRemovingConn = p5.DescendantRemoving:connect(function(p6)
		-- upvalues: var3 (write), self (ref), p5 (ref)
		var3 = self:GetSubjectIndex(p5)
		
		if var3 == 0 then return end
		if self.subjects[var3] and self.subjects[var3].cachedParts[p6] then
			self.subjects[var3].cachedParts[p6] = nil
			p6.LocalTransparencyModifier = 0
		end
	end)
	self:CachePartsRecursive(p5, var3)
end

function t:AddSubject(p5)
	local subjectsCount = #self.subjects
	local var3 = 1
	while var3 <= subjectsCount do
		if self.subjects[var3].character ~= p5 then
			var3 += 1
			continue
		end
		return
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
	self.subjects[var3].character = p5
	self:SetupTransparency(p5)
end

function t:update(p6)
	-- upvalues: fIntSafetyBubbleRadiusModule (ref), VRService (ref), playersService (ref), var1 (ref)
	local currentCamera = workspace.CurrentCamera
	
	if not currentCamera then return end
	if self.enabled then
		local maxValue = math.max(fIntSafetyBubbleRadiusModule * currentCamera.HeadScale, 0.1)
		local character = nil
		local var4 = maxValue + 3
		local var5 = currentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)
		self.updateCadence -= p6
		
		if self.updateCadence <= 0 then
			self.updateCadence = 0.2
			
			for i_1, v in pairs(playersService:GetPlayers()) do
				if v.Character and v ~= playersService.LocalPlayer then
					if self.mode == Enum.VRSafetyBubbleMode.OnlyFriends and playersService.LocalPlayer:IsFriendsWithAsync(v.UserId) then
						local characterSubjectIndex = self:GetSubjectIndex(v.Character)
						
						if characterSubjectIndex > 0 then
							self:TeardownTransparency(characterSubjectIndex)
							table.remove(self.subjects, characterSubjectIndex)
						end
					elseif not self:SubjectExists(v.Character) and v.Character then
						local boundingBox, boundingBox_1 = v.Character:GetBoundingBox()
						local var6 = (boundingBox.Position - var5.Position).Magnitude - boundingBox_1.Z
						
						if var6 < var4 then
							var4 = var6
							character = v.Character
						end
					end
				end
			end
			if character then
				self:AddSubject(character)
			end
		end
		if not self.subjects or #self.subjects == 0 then return end
		local subjectsCount = #self.subjects
		while subjectsCount > 0 do
			local boundingBox, boundingBox_1 = self.subjects[subjectsCount].character:GetBoundingBox()
			
			if maxValue * 2 < (boundingBox.Position - var5.Position).Magnitude - boundingBox_1.Z then
				self:TeardownTransparency(subjectsCount)
				table.remove(self.subjects, subjectsCount)
			end
			subjectsCount -= 1
		end
		local subjectsCount_1 = #self.subjects
		local var7 = 1
		while var7 <= subjectsCount_1 do
			local magnitude
			local var8 = 0
			local character_1 = self.subjects[var7].character
			local _ = 0
			
			if character_1.PrimaryPart then
				magnitude = (Vector3.new(character_1:GetPrimaryPartCFrame().p.x, var5.Position.Y, character_1:GetPrimaryPartCFrame().p.z) - var5.Position).Magnitude
			else
				local boundingBox, boundingBox_1 = character_1:GetBoundingBox()
				magnitude = (boundingBox.Position - var5.Position).Magnitude - boundingBox_1.Z
			end
			if magnitude < maxValue then
				if subjectsCount_1 > 3 then
					var8 = 1
				else
					local var9 = maxValue * 0.75
					var8 = if magnitude < var9 then var1 else (1 - (magnitude - var9) / (maxValue - var9)) * var1
				end
			end
			if not self.subjects[var7].lastTransparency then
				self.subjects[var7].transparencyDirty = true
			end
			var8 = math.clamp(var8, 0, 1)
			
			if self.subjects[var7].transparencyDirty or self.subjects[var7].lastTransparency ~= var8 then
				for i_1, v in pairs(self.subjects[var7].cachedParts) do
					i_1.LocalTransparencyModifier = var8
				end
				self.subjects[var7].transparencyDirty = false
				self.subjects[var7].lastTransparency = var8
			end
			local tool = character_1:FindFirstChildOfClass("Tool")
			
			if tool then
				for v, v in pairs(tool:GetChildren()) do
					if v:IsA("BasePart") then
						v.LocalTransparencyModifier = var8
					end
				end
			end
			var7 += 1
		end
		return
	elseif self.subjects and #self.subjects > 0 then
		for i = 1, #self.subjects do
			self:TeardownTransparency(i)
		end
		self.subjects = {}
	end
end

return t