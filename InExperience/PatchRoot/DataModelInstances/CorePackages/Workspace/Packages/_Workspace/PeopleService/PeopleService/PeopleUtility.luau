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

local function comparePeople(p0, p1)
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	local var3 = p0.Name:lower()
	local var4 = p1.Name:lower()
	
	if p0 == localPlayer then
		var3 = " "
	end
	if p1 == localPlayer then
		var4 = " "
	end
	return var3 < var4
end

return {
	getInExperienceCombinedName = function(p2)
		-- upvalues: userProfileStore (ref)
		local t = {}
		
		for i, v in userProfileStore.get().fetchNamesByUserIds(p2)(false).data do
			t[p2[i]] = v.names.getInExperienceCombinedName
		end
		return t
	end,
	getPlatformData = function(p3)
		-- upvalues: userProfileStore (ref)
		local t = {}
		
		for i, v in userProfileStore.get().fetchNamesByUserIds(p3)(false).data do
			t[p3[i]] = {
				platformName = v.names.getPlatformName,
				platformProfileId = v.getPlatformProfileId
			}
		end
		return t
	end,
	canShowPlatformProfile = function(p4)
		-- upvalues: status (ref)
		return game:GetEngineFeature("PlatformFriendsService") and (game:GetEngineFeature("PlatformFriendsProfile") and (status and (status:IsProfileEnabled() and (p4 and p4 ~= ""))))
	end,
	showPlatformProfile = function(p5)
		-- upvalues: status (ref)
		if game:GetEngineFeature("PlatformFriendsService") and (game:GetEngineFeature("PlatformFriendsProfile") and (status and (status:IsProfileEnabled() and (p5 and p5 ~= "")))) then
			status:ShowProfile(p5)
		end
	end,
	comparePeople = comparePeople,
	sortPeople = function(p6)
		-- upvalues: comparePeople (ref)
		table.sort(p6, comparePeople)
		
		return p6
	end,
	sortPersonStores = if getFFlagPeoplePageEnablePersonSignalStore() then if getFFlagPeoplePageEnablePersonSignalStore() then function(p7)
		-- upvalues: sortTableByValue (ref), playersService (ref)
		for i, v in sortTableByValue(p7, function(p8, p9)
			-- upvalues: playersService (copy)
			local person = p8.value.getPerson()
			local person_1 = p9.value.getPerson()
			local localPlayer = playersService.LocalPlayer
			local var9 = person.Name:lower()
			local var10 = person_1.Name:lower()
			
			if person == localPlayer then
				var9 = " "
			end
			if person_1 == localPlayer then
				var10 = " "
			end
			return var9 < var10
		end) do
			local key = p7[v.key]
			
			if key then
				key.setOrder(i)
			end
		end
	end else nil else nil,
	showPersonButtons = function(p10, p11)
		-- upvalues: playersService (ref)
		local localPlayer = playersService.LocalPlayer
		
		return p10 ~= nil and (localPlayer ~= nil and (p10 ~= localPlayer and (p11 > 0 and localPlayer.UserId > 0)))
	end
}