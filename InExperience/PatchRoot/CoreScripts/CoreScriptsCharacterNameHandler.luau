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

local function setName(value, p0, p1) --[[ line: 29 ]]
	-- upvalues: t (ref)
	local inExperienceCombinedName = p1.names.inExperienceCombinedName
	local displayName = p1.names.displayName
	
	if p1.names.displayName == value.DisplayName then
		value.InternalDisplayName = inExperienceCombinedName
		t[p0].HumanoidDisplayNameChanged = value:GetPropertyChangedSignal("DisplayName"):Connect(function() --[[ line: 36 ]]
			-- upvalues: displayName (ref), value (ref)
			if displayName ~= value.DisplayName then
				value.InternalDisplayName = ""
			end
		end)
	end
end

local function checkHumanoid(p2, p3, p4) --[[ line: 44 ]]
	-- upvalues: setName (ref), t (ref)
	local humanoid = p3:FindFirstChildWhichIsA("Humanoid")
	
	if humanoid then
		setName(humanoid, p2, p4)
	end
	t[p2].CharacterHumanoidAdded = p3.ChildAdded:Connect(function(p5) --[[ line: 49 ]]
		-- upvalues: setName (copy), p2 (ref), p4 (ref)
		if p5:IsA("Humanoid") then
			setName(p5, p2, p4)
		end
	end)
end

local function setNameOnCharacterAdded(value, p6) --[[ line: 56 ]]
	-- upvalues: t (ref), checkHumanoid (ref)
	t[value] = {}
	
	if value.Character then
		checkHumanoid(value, value.Character, p6)
	end
	t[value].CharacterAdded = value.CharacterAdded:Connect(function(p7) --[[ line: 62 ]]
		-- upvalues: checkHumanoid (copy), value (ref), p6 (ref)
		checkHumanoid(value, p7, p6)
	end)
	t[value].CharacterRemoving = value.CharacterRemoving:Connect(function() --[[ line: 65 ]]
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

local function setCurrentPlayersNames() --[[ line: 77 ]]
	-- upvalues: playersService (ref), userProfileStore (ref), fixCharacterNameHandlerNilProfileCrash (ref), setNameOnCharacterAdded (ref)
	local players = playersService:GetPlayers()
	local t = {}
	local t_1 = {}
	
	for i, v in pairs(players) do
		table.insert(t, tostring(v.UserId))
		t_1[tostring(v.UserId)] = v
	end
	userProfileStore.get().fetchNamesByUserIds(t, function(p8) --[[ line: 85 ]]
		-- upvalues: t_1 (ref), fixCharacterNameHandlerNilProfileCrash (copy), setNameOnCharacterAdded (copy)
		local data = p8.data
		
		if p8.status == "success" then
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

local function onPlayerAdded(p9) --[[ line: 104 ]]
	-- upvalues: userProfileStore (ref), fixCharacterNameHandlerNilProfileCrash (ref), setNameOnCharacterAdded (ref)
	userProfileStore.get().fetchNamesByUserIds({ tostring(p9.UserId) }, function(p10) --[[ line: 105 ]]
		-- upvalues: fixCharacterNameHandlerNilProfileCrash (copy), setNameOnCharacterAdded (copy), p9 (ref)
		local var14
		local status = p10.status
		local data = p10.data
		
		if fixCharacterNameHandlerNilProfileCrash then
			var14 = false
			
			if #data > 0 then
				local _ = data[1].names ~= nil
			end
		else
			var14 = true
		end
		if status == "success" and var14 then
			local var15 = data[1]
			setNameOnCharacterAdded(p9, {
				names = {
					inExperienceCombinedName = var15.names.getInExperienceCombinedName(false),
					displayName = var15.names.getDisplayName(false)
				}
			})
		end
	end)
end

local function onPlayerRemoving(p11) --[[ line: 122 ]]
	-- upvalues: t (ref), fFlagUserProfileStoreQueryRefetch (ref), userProfileStore (ref)
	local var16 = t[p11]
	
	if t[p11] then
		for i, v in pairs(var16) do
			v:Disconnect()
		end
		t[p11] = nil
	end
	if fFlagUserProfileStoreQueryRefetch then
		userProfileStore.get().invalidateCachedNamesForUserIds({ tostring(p11.UserId) })
	end
end

setCurrentPlayersNames()
playersService.PlayerAdded:Connect(onPlayerAdded)
playersService.PlayerRemoving:Connect(onPlayerRemoving)