local playersService = game:GetService("Players")
local parent = script.Parent
local parent_1 = parent.Parent
local userProfilesModule = require(parent_1.UserProfiles)
local sortTableByValue = require(parent_1.CoreScriptsRoactCommon).Utilities.sortTableByValue
local _ = require(parent.createPersonStore)
local getFFlagPeoplePageEnablePersonSignalStore = require(parent.Flags).GetFFlagPeoplePageEnablePersonSignalStore
local _, status = pcall(function()
	return game:GetService("PlatformFriendsService")
end)
local userProfileStore = userProfilesModule.Stores.UserProfileStore

local function comparePeople(p1, p2)
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	local var1 = p1.Name:lower()
	local var2 = p2.Name:lower()
	
	if p1 == localPlayer then
		var1 = " "
	end
	if p2 == localPlayer then
		var2 = " "
	end
	return var1 < var2
end

return {
	getInExperienceCombinedName = function(p1)
		-- upvalues: userProfileStore (ref)
		local t = {}
		
		for i, v in userProfileStore.get().fetchNamesByUserIds(p1)(false).data do
			t[p1[i]] = v.names.getInExperienceCombinedName
		end
		return t
	end,
	getPlatformData = function(p2)
		-- upvalues: userProfileStore (ref)
		local t = {}
		
		for i, v in userProfileStore.get().fetchNamesByUserIds(p2)(false).data do
			t[p2[i]] = {
				platformName = v.names.getPlatformName,
				platformProfileId = v.getPlatformProfileId
			}
		end
		return t
	end,
	canShowPlatformProfile = function(p3)
		-- upvalues: status (ref)
		return game:GetEngineFeature("PlatformFriendsService") and (game:GetEngineFeature("PlatformFriendsProfile") and (status and (status:IsProfileEnabled() and (p3 and p3 ~= ""))))
	end,
	showPlatformProfile = function(p3)
		-- upvalues: status (ref)
		if game:GetEngineFeature("PlatformFriendsService") and (game:GetEngineFeature("PlatformFriendsProfile") and (status and (status:IsProfileEnabled() and (p3 and p3 ~= "")))) then
			status:ShowProfile(p3)
		end
	end,
	comparePeople = comparePeople,
	sortPeople = function(p3)
		-- upvalues: comparePeople (ref)
		table.sort(p3, comparePeople)
		
		return p3
	end,
	sortPersonStores = if getFFlagPeoplePageEnablePersonSignalStore() then if getFFlagPeoplePageEnablePersonSignalStore() then function(p3)
		-- upvalues: sortTableByValue (ref), playersService (ref)
		for i, v in sortTableByValue(p3, function(p4, p5)
			-- upvalues: playersService (copy)
			local person = p4.value.getPerson()
			local person_1 = p5.value.getPerson()
			local localPlayer = playersService.LocalPlayer
			local var1 = person.Name:lower()
			local var2 = person_1.Name:lower()
			
			if person == localPlayer then
				var1 = " "
			end
			if person_1 == localPlayer then
				var2 = " "
			end
			return var1 < var2
		end) do
			local key = p3[v.key]
			
			if key then
				key.setOrder(i)
			end
		end
	end else nil else nil,
	showPersonButtons = function(p4, p5)
		-- upvalues: playersService (ref)
		local localPlayer = playersService.LocalPlayer
		
		return p4 ~= nil and (localPlayer ~= nil and (p4 ~= localPlayer and (p5 > 0 and localPlayer.UserId > 0)))
	end
}