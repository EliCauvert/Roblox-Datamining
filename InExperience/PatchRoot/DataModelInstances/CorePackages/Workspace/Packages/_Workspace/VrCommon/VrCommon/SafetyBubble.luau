local parent = script:FindFirstAncestor("VrCommon").Parent
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local playersService = game:GetService("Players")
local VRService = game:GetService("VRService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local t = {}
t.__index = t
local create = require(parent.AppCommonLib).Create
local fIntSafetyBubbleRadiusModule = require(script.Parent.FIntSafetyBubbleRadius)
local var6 = require(script.Parent.FIntSafetyBubbleTransparencyPercent) * 0.01

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
		local var8 = tbl.mode ~= Enum.VRSafetyBubbleMode.Anyone
		
		if tbl.enabled ~= var8 then
			tbl.enabled = var8
			tbl.Toggled:Fire()
			rbxAnalyticsService:ReportCounter("VR-SafetyBubble-" .. (if var8 then "On" else "Off"))
		end
	end)
	
	return tbl
end

function t:ToggleEnabled()
	-- upvalues: userGameSettingsService (ref)
	userGameSettingsService.VRSafetyBubbleMode = if self.enabled then Enum.VRSafetyBubbleMode.Anyone else Enum.VRSafetyBubbleMode.NoOne
end

function t:HasToolAncestor(p0)
	return if p0 == nil or p0.Parent == nil then false else p0.Parent:IsA("Tool") or self:HasToolAncestor(p0.Parent)
end

function t:IsValidPartToModify(p1)
	return if p1:IsA("BasePart") or p1:IsA("Decal") then not self:HasToolAncestor(p1) else false
end

function t:CachePartsRecursive(p2, p3)
	if p2 then
		if self:IsValidPartToModify(p2) then
			self.subjects[p3].cachedParts[p2] = true
			self.subjects[p3].transparencyDirty = true
		end
		for i, v in pairs(p2:GetChildren()) do
			self:CachePartsRecursive(v, p3)
		end
	end
end

function t:TeardownTransparency(p4)
	for i, v in pairs(self.subjects[p4].cachedParts) do
		i.LocalTransparencyModifier = 0
	end
	self.subjects[p4].cachedParts = {}
	self.subjects[p4].transparencyDirty = true
	self.subjects[p4].lastTransparency = nil
	
	if self.subjects[p4].descendantAddedConn then
		self.subjects[p4].descendantAddedConn:disconnect()
		self.subjects[p4].descendantAddedConn = nil
	end
	if self.subjects[p4].descendantRemovingConn then
		self.subjects[p4].descendantRemovingConn:disconnect()
		self.subjects[p4].descendantRemovingConn = nil
	end
	for i_1, v_1 in pairs(self.subjects[p4].toolDescendantAddedConns) do
		v_1:Disconnect()
		self.subjects[p4].toolDescendantAddedConns[i_1] = nil
	end
	for i_2, v_2 in pairs(self.subjects[p4].toolDescendantRemovingConns) do
		v_2:Disconnect()
		self.subjects[p4].toolDescendantRemovingConns[i_2] = nil
	end
end

function t:GetSubjectIndex(p5)
	local subjectsCount = #self.subjects
	local var10 = 1
	while var10 <= subjectsCount do
		if self.subjects[var10].character ~= p5 then
			var10 += 1
			continue
		end
		return var10
	end
	return 0
end

function t:SubjectExists(p6)
	return self:GetSubjectIndex(p6) > 0
end

function t:SetupTransparency(p7)
	local var11 = self:GetSubjectIndex(p7)
	
	if var11 == 0 then return end
	if self.subjects[var11].descendantAddedConn then
		self.subjects[var11].descendantAddedConn:disconnect()
	end
	self.subjects[var11].descendantAddedConn = p7.DescendantAdded:Connect(function(p8)
		-- upvalues: var11 (write), self (ref), p7 (ref)
		var11 = self:GetSubjectIndex(p7)
		
		if var11 == 0 then return end
		if self:IsValidPartToModify(p8) then
			self.subjects[var11].cachedParts[p8] = true
			self.subjects[var11].transparencyDirty = true
		end
	end)
	
	if self.descendantRemovingConn then
		self.descendantRemovingConn:disconnect()
	end
	self.descendantRemovingConn = p7.DescendantRemoving:connect(function(p9)
		-- upvalues: var11 (write), self (ref), p7 (ref)
		var11 = self:GetSubjectIndex(p7)
		
		if var11 == 0 then return end
		if self.subjects[var11] and self.subjects[var11].cachedParts[p9] then
			self.subjects[var11].cachedParts[p9] = nil
			p9.LocalTransparencyModifier = 0
		end
	end)
	self:CachePartsRecursive(p7, var11)
end

function t:AddSubject(p10)
	local subjectsCount = #self.subjects
	local var13 = 1
	while var13 <= subjectsCount do
		if self.subjects[var13].character ~= p10 then
			var13 += 1
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
	self.subjects[var13].character = p10
	self:SetupTransparency(p10)
end

function t:update(p11)
	-- upvalues: fIntSafetyBubbleRadiusModule (ref), VRService (ref), playersService (ref), var6 (ref)
	local currentCamera = workspace.CurrentCamera
	
	if not currentCamera then return end
	if self.enabled then
		local maxValue = math.max(fIntSafetyBubbleRadiusModule * currentCamera.HeadScale, 0.1)
		local character = nil
		local var15 = maxValue + 3
		local var16 = currentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)
		self.updateCadence -= p11
		
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
						local var19 = (boundingBox.Position - var16.Position).Magnitude - boundingBox_1.Z
						
						if var19 < var15 then
							var15 = var19
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
			
			if maxValue * 2 < (boundingBox.Position - var16.Position).Magnitude - boundingBox_1.Z then
				self:TeardownTransparency(subjectsCount)
				table.remove(self.subjects, subjectsCount)
			end
			subjectsCount -= 1
		end
		local subjectsCount_1 = #self.subjects
		local var25 = 1
		while var25 <= subjectsCount_1 do
			local magnitude
			local var26 = 0
			local character_1 = self.subjects[var25].character
			local _ = 0
			
			if character_1.PrimaryPart then
				magnitude = (Vector3.new(character_1:GetPrimaryPartCFrame().p.x, var16.Position.Y, character_1:GetPrimaryPartCFrame().p.z) - var16.Position).Magnitude
			else
				local boundingBox, boundingBox_1 = character_1:GetBoundingBox()
				magnitude = (boundingBox.Position - var16.Position).Magnitude - boundingBox_1.Z
			end
			if magnitude < maxValue then
				if subjectsCount_1 > 3 then
					var26 = 1
				else
					local var29 = maxValue * 0.75
					var26 = if magnitude < var29 then var6 else (1 - (magnitude - var29) / (maxValue - var29)) * var6
				end
			end
			if not self.subjects[var25].lastTransparency then
				self.subjects[var25].transparencyDirty = true
			end
			var26 = math.clamp(var26, 0, 1)
			
			if self.subjects[var25].transparencyDirty or self.subjects[var25].lastTransparency ~= var26 then
				for i_1, v in pairs(self.subjects[var25].cachedParts) do
					i_1.LocalTransparencyModifier = var26
				end
				self.subjects[var25].transparencyDirty = false
				self.subjects[var25].lastTransparency = var26
			end
			local tool = character_1:FindFirstChildOfClass("Tool")
			
			if tool then
				for v, v in pairs(tool:GetChildren()) do
					if v:IsA("BasePart") then
						v.LocalTransparencyModifier = var26
					end
				end
			end
			var25 += 1
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