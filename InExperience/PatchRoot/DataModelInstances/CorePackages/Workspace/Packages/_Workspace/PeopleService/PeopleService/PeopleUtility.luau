local Players = game:GetService("Players")
local Parent = script.Parent
local Parent1 = Parent.Parent
local UserProfilesModule = require(Parent1.UserProfiles)
local SortTableByValueFunction = require(Parent1.CoreScriptsRoactCommon).Utilities.sortTableByValue
local _ = require(Parent.createPersonStore)
local GetFFlagPeoplePageEnablePersonSignalStoreFunction = require(Parent.Flags).GetFFlagPeoplePageEnablePersonSignalStore
local FFlagUserProfilePlatformProfile = require(Parent1.SharedFlags).FFlagUserProfilePlatformProfile
local _, Result = pcall(function()
	return game:GetService("PlatformFriendsService")
end)
local UserProfileStore = UserProfilesModule.Stores.UserProfileStore

local function comparePeople(A, B): boolean
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	local Lowered = A.Name:lower()
	local Lowered1 = B.Name:lower()
	
	if A == LocalPlayer then
		Lowered = " "
	end
	if B == LocalPlayer then
		Lowered1 = " "
	end
	return Lowered < Lowered1
end

local v1 = if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then function(p1)
	-- upvalues: SortTableByValueFunction (copy), Players (copy)
	for i, value in SortTableByValueFunction(p1, function(p2, p3): boolean
		-- upvalues: Players (upval)
		local Person = p2.value.getPerson()
		local Person1 = p3.value.getPerson()
		local LocalPlayer = Players.LocalPlayer
		local Lowered = Person.Name:lower()
		local Lowered1 = Person1.Name:lower()
		
		if Person == LocalPlayer then
			Lowered = " "
		end
		if Person1 == LocalPlayer then
			Lowered1 = " "
		end
		return Lowered < Lowered1
	end) do
		local v2 = p1[value.key]
		
		if v2 then
			v2.setOrder(i)
		end
	end
end else nil

return {
	getInExperienceCombinedName = function(p2)
		-- upvalues: UserProfileStore (copy)
		local GetInExperienceCombinedNames = {}
		
		for i, entry in UserProfileStore.get().fetchNamesByUserIds(p2)(false).data do
			GetInExperienceCombinedNames[p2[i]] = entry.names.getInExperienceCombinedName
		end
		return GetInExperienceCombinedNames
	end,
	getPlatformData = function(p3)
		-- upvalues: UserProfileStore (copy), FFlagUserProfilePlatformProfile (copy)
		local t = {}
		
		for i, entry in UserProfileStore.get().fetchNamesByUserIds(p3, nil, FFlagUserProfilePlatformProfile)(false).data do
			t[p3[i]] = {
				platformName = entry.names.getPlatformName,
				platformProfileId = entry.getPlatformProfileId
			}
		end
		return t
	end,
	canShowPlatformProfile = function(p4): boolean
		-- upvalues: Result (copy)
		return game:GetEngineFeature("PlatformFriendsService") and (game:GetEngineFeature("PlatformFriendsProfile") and (Result and (Result:IsProfileEnabled() and (p4 and p4 ~= ""))))
	end,
	showPlatformProfile = function(PlatformUserId)
		-- upvalues: Result (copy)
		if game:GetEngineFeature("PlatformFriendsService") and (game:GetEngineFeature("PlatformFriendsProfile") and (Result and (Result:IsProfileEnabled() and (PlatformUserId and PlatformUserId ~= "")))) then
			Result:ShowProfile(PlatformUserId)
		end
	end,
	comparePeople = comparePeople,
	sortPeople = function(List)
		-- upvalues: comparePeople (copy)
		table.sort(List, comparePeople)
		
		return List
	end,
	sortPersonStores = if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then v1 else nil,
	showPersonButtons = function(LocalPlayer, p4: number): boolean
		-- upvalues: Players (copy)
		local LocalPlayer1 = Players.LocalPlayer
		
		return LocalPlayer ~= nil and (LocalPlayer1 ~= nil and (LocalPlayer ~= LocalPlayer1 and (p4 > 0 and LocalPlayer1.UserId > 0)))
	end
}