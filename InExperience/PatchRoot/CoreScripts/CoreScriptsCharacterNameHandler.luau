local playersService = game:GetService("Players")
local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("CoreGui")
local userProfileStore = require(corePackagesService.Workspace.Packages.UserProfiles).Stores.UserProfileStore
local fFlagUserProfileStoreQueryRefetch = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagUserProfileStoreQueryRefetch
local fixCharacterNameHandlerNilProfileCrash = game:DefineFastFlag("FixCharacterNameHandlerNilProfileCrash", false)
local t = {}
local _ = {
	CharacterAdded = "CharacterAdded",
	CharacterRemoving = "CharacterRemoving",
	HumanoidDisplayNameChanged = "HumanoidDisplayNameChanged",
	CharacterHumanoidAdded = "CharacterHumanoidAdded"
}

local function setName(value, p1, p2)
	-- upvalues: t (ref)
	local inExperienceCombinedName = p2.names.inExperienceCombinedName
	local displayName = p2.names.displayName
	
	if p2.names.displayName == value.DisplayName then
		value.InternalDisplayName = inExperienceCombinedName
		t[p1].HumanoidDisplayNameChanged = value:GetPropertyChangedSignal("DisplayName"):Connect(function()
			-- upvalues: displayName (ref), value (ref)
			if displayName ~= value.DisplayName then
				value.InternalDisplayName = ""
			end
		end)
	end
end

local function checkHumanoid(p1, p2, p3)
	-- upvalues: setName (ref), t (ref)
	local humanoid = p2:FindFirstChildWhichIsA("Humanoid")
	
	if humanoid then
		setName(humanoid, p1, p3)
	end
	t[p1].CharacterHumanoidAdded = p2.ChildAdded:Connect(function(p4)
		-- upvalues: setName (copy), p1 (ref), p3 (ref)
		if p4:IsA("Humanoid") then
			setName(p4, p1, p3)
		end
	end)
end

local function setNameOnCharacterAdded(value, p1)
	-- upvalues: t (ref), checkHumanoid (ref)
	t[value] = {}
	
	if value.Character then
		checkHumanoid(value, value.Character, p1)
	end
	t[value].CharacterAdded = value.CharacterAdded:Connect(function(p2)
		-- upvalues: checkHumanoid (copy), value (ref), p1 (ref)
		checkHumanoid(value, p2, p1)
	end)
	t[value].CharacterRemoving = value.CharacterRemoving:Connect(function()
		-- upvalues: t (copy), value (ref)
		local humanoidDisplayNameChanged = t[value].HumanoidDisplayNameChanged
		
		if t[value].CharacterHumanoidAdded then
			t[value].CharacterHumanoidAdded:Disconnect()
		end
		if humanoidDisplayNameChanged then
			t[value].HumanoidDisplayNameChanged:Disconnect()
		end
	end)
end

local function setCurrentPlayersNames()
	-- upvalues: playersService (ref), userProfileStore (ref), fixCharacterNameHandlerNilProfileCrash (ref), setNameOnCharacterAdded (ref)
	local players = playersService:GetPlayers()
	local t = {}
	local t_1 = {}
	
	for i, v in pairs(players) do
		table.insert(t, tostring(v.UserId))
		t_1[tostring(v.UserId)] = v
	end
	userProfileStore.get().fetchNamesByUserIds(t, function(p1)
		-- upvalues: t_1 (ref), fixCharacterNameHandlerNilProfileCrash (copy), setNameOnCharacterAdded (copy)
		local data = p1.data
		
		if p1.status == "success" then
			for i, v in data do
				local userId = t_1[v.userId]
				
				if not fixCharacterNameHandlerNilProfileCrash or userId and v.names ~= nil then
					setNameOnCharacterAdded(userId, {
						names = {
							inExperienceCombinedName = v.names.getInExperienceCombinedName(false),
							displayName = v.names.getDisplayName(false)
						}
					})
				end
			end
		end
	end)
end

local function onPlayerAdded(p1)
	-- upvalues: userProfileStore (ref), fixCharacterNameHandlerNilProfileCrash (ref), setNameOnCharacterAdded (ref)
	userProfileStore.get().fetchNamesByUserIds({ tostring(p1.UserId) }, function(p2)
		-- upvalues: fixCharacterNameHandlerNilProfileCrash (copy), setNameOnCharacterAdded (copy), p1 (ref)
		local var1
		local status = p2.status
		local data = p2.data
		
		if fixCharacterNameHandlerNilProfileCrash then
			var1 = false
			
			if #data > 0 then
				local _ = data[1].names ~= nil
			end
		else
			var1 = true
		end
		if status == "success" and var1 then
			local var2 = data[1]
			setNameOnCharacterAdded(p1, {
				names = {
					inExperienceCombinedName = var2.names.getInExperienceCombinedName(false),
					displayName = var2.names.getDisplayName(false)
				}
			})
		end
	end)
end

local function onPlayerRemoving(p1)
	-- upvalues: t (ref), fFlagUserProfileStoreQueryRefetch (ref), userProfileStore (ref)
	local var1 = t[p1]
	
	if t[p1] then
		for i, v in pairs(var1) do
			v:Disconnect()
		end
		t[p1] = nil
	end
	if fFlagUserProfileStoreQueryRefetch then
		userProfileStore.get().invalidateCachedNamesForUserIds({ tostring(p1.UserId) })
	end
end

setCurrentPlayersNames()
playersService.PlayerAdded:Connect(onPlayerAdded)
playersService.PlayerRemoving:Connect(onPlayerRemoving)