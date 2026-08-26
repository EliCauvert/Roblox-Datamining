local playersService = game:GetService("Players")
local parent = script.Parent
local parent_1 = parent.Parent
local utils = parent_1.utils
local parent_2 = parent_1.Parent
local friendsMenuDependenciesModule = require(parent_1.FriendsMenuDependencies)
local constantsModule = require(parent_1.Constants)
local _ = require(parent_1.friendsMenuModalType)
local reactModule = require(parent_2.React)
local requests = require(parent_2.Http).Requests
local userLibModule = require(parent_2.UserLib)
local roactUtilsModule = require(parent_2.RoactUtils)
local userProfilesModule = require(parent_2.UserProfiles)
local getFFlagEnableFriendsListSearchNormalizationErrorFix = require(parent_2.SharedFlags).GetFFlagEnableFriendsListSearchNormalizationErrorFix
local userModel = userLibModule.Models.UserModel
local constants = userLibModule.Utils.Constants
local apiFetchUsersPresences = userLibModule.Thunks.ApiFetchUsersPresences
local updateUsers = userLibModule.Thunks.UpdateUsers
local thumbnailRequest = userLibModule.Utils.ThumbnailRequest
local preloadUsersThumbnail = userLibModule.Thunks.PreloadUsersThumbnail
local networkImpl = friendsMenuDependenciesModule.networkImpl
local sortFriendsByCorrectedPresenceAndRank = friendsMenuDependenciesModule.sortFriendsByCorrectedPresenceAndRank
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local friendsListContextModule = require(parent.FriendsListContext)
local generateDummyFriendsModule = require(utils.generateDummyFriends)
local DEPRECATED_UsersGetFriends = requests.DEPRECATED_UsersGetFriends
local userSorts = constantsModule.UserSorts
local t = {
	InviteAvatarThumbnailType = constants.RbxAvatarThumbnailTypesFromEnum.HeadShot,
	InviteAvatarThumbnailSize = constants.RbxThumbnailSizes.Size150x150,
	InviteAvatarRbxthumbType = constants.RbxthumbTypes.AvatarHeadShot
}
t.ThumbnailRequest = {
	InviteToGame = {
		thumbnailRequest.fromData(t.InviteAvatarThumbnailType, t.InviteAvatarThumbnailSize)
	}
}

return function(p1)
	-- upvalues: networkImpl (ref), reactModule (ref), generateDummyFriendsModule (ref), useDispatch (ref), userProfilesModule (ref), getFFlagEnableFriendsListSearchNormalizationErrorFix (ref), playersService (ref), DEPRECATED_UsersGetFriends (ref), userSorts (ref), userModel (ref), updateUsers (ref), preloadUsersThumbnail (ref), t (ref), apiFetchUsersPresences (ref), useSelector (ref), sortFriendsByCorrectedPresenceAndRank (ref), friendsListContextModule (ref)
	local var1 = if p1.networkImplOverride then p1.networkImplOverride else networkImpl
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState({})
	local var8, var9 = reactModule.useState("")
	local var10, var11 = reactModule.useState(generateDummyFriendsModule(7))
	local var12 = useDispatch()
	local _ = nil
	local var13 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = var6,
		query = userProfilesModule.Queries.userProfilesAllNamesByUserIds
	})
	
	local var14 = function(p2)
		-- upvalues: p1 (ref), var8 (ref), var13 (write), userProfilesModule (copy), getFFlagEnableFriendsListSearchNormalizationErrorFix (copy)
		if not p2 or not p2.isFriend then
			return false
		elseif p1.excludedFriendsSet and p1.excludedFriendsSet[p2.id] then
			return false
		elseif var8 == nil or var8 == "" then
			return true
		end
		local displayName = p2.displayName or ""
		local name = p2.name or ""
		local var15 = ""
		local var16 = ""
		local var17 = ""
		
		if var13 and var13.data then
			local names = userProfilesModule.Selectors.getUserProfileFromId(var13.data, p2.id).names
			
			if names then
				var15 = names.alias or ""
				displayName = names.displayName or ""
				name = names.username or ""
				var16 = names.contactName or ""
				var17 = names.platformName or ""
			end
		end
		local normalized = utf8.nfdnormalize(displayName)
		local normalized_1 = utf8.nfdnormalize(var15)
		local normalized_2 = utf8.nfdnormalize(var16)
		local normalized_3 = utf8.nfdnormalize(var17)
		local normalized_4 = nil
		
		if getFFlagEnableFriendsListSearchNormalizationErrorFix() then
			pcall(function()
				-- upvalues: normalized_4 (write), var8 (copy)
				normalized_4 = utf8.nfdnormalize(var8)
			end)
		else
			normalized_4 = utf8.nfdnormalize(var8)
		end
		local var18
		if not getFFlagEnableFriendsListSearchNormalizationErrorFix() then
			return if string.find(normalized_1:lower(), normalized_4:lower(), 1, true) == nil then if string.find(normalized_2:lower(), normalized_4:lower(), 1, true) == nil then if string.find(normalized_3:lower(), normalized_4:lower(), 1, true) == nil then if string.find(normalized:lower(), normalized_4:lower(), 1, true) == nil then string.find(name:lower(), var8:lower(), 1, true) ~= nil else true else true else true else true
		elseif normalized_4 then
			var18 = if string.find(normalized_1:lower(), normalized_4:lower(), 1, true) == nil then if string.find(normalized_2:lower(), normalized_4:lower(), 1, true) == nil then if string.find(normalized_3:lower(), normalized_4:lower(), 1, true) == nil then if string.find(normalized:lower(), normalized_4:lower(), 1, true) == nil then string.find(name:lower(), var8:lower(), 1, true) ~= nil else true else true else true else true
		end
		return var18
	end
	
	local _ = function(p2)
		-- upvalues: var13 (write), userProfilesModule (copy)
		local var15 = if var13 and var13.data then userProfilesModule.Selectors.getCombinedNameFromId(var13.data, p2.id) else nil
		
		return if var15 == nil then p2.displayName else var15
	end
	
	local _ = function(p2)
		-- upvalues: var13 (write), userProfilesModule (copy)
		local var15 = if var13 and var13.data then userProfilesModule.Selectors.getUsernameFromId(var13.data, p2.id) else nil
		
		return if var15 == nil then p2.name else var15
	end
	
	reactModule.useEffect(function()
		-- upvalues: playersService (copy), var2 (ref), var3 (ref), var5 (ref), DEPRECATED_UsersGetFriends (copy), var1 (write), userSorts (copy), userModel (copy), var12 (ref), updateUsers (copy), var7 (ref), preloadUsersThumbnail (copy), t (copy), apiFetchUsersPresences (copy)
		local var15 = if playersService and playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else nil
		
		if not var2 and var15 then
			var3(true)
			var5(false)
			DEPRECATED_UsersGetFriends(var1, var15, userSorts.StatusFrequents):andThen(function(p2)
				-- upvalues: userModel (copy), var12 (copy), updateUsers (copy), var7 (copy)
				local responseBody = p2.responseBody
				local t = {}
				local t_1 = {}
				
				for i, v in pairs(responseBody.data) do
					local var16 = tostring(v.id)
					v.isFriend = true
					v.friendRank = i
					v.name = ""
					v.displayName = ""
					local var17 = userModel.fromDataTable(v)
					table.insert(t, var16)
					t_1[var17.id] = var17
				end
				var12(updateUsers(t_1))
				var7(t)
				
				return t
			end, function(_)
				-- upvalues: var3 (copy), var5 (copy)
				var3(false)
				var5(true)
				
				return {}
			end):andThen(function(p3)
				-- upvalues: var12 (copy), preloadUsersThumbnail (copy), t (copy), apiFetchUsersPresences (copy), var1 (copy)
				var12(preloadUsersThumbnail(p3, t.ThumbnailRequest.InviteToGame, nil))
				
				return var12(apiFetchUsersPresences(var1, p3))
			end):andThen(function(_)
				-- upvalues: var3 (copy)
				var3(false)
			end, function(_)
				-- upvalues: var3 (copy), var5 (copy)
				var3(false)
				var5(true)
			end)
		end
	end, {})
	local var16 = useSelector(function(p2)
		return p2.Users
	end)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var11 (ref), generateDummyFriendsModule (copy), var16 (ref), var14 (ref), var13 (write), userProfilesModule (copy), sortFriendsByCorrectedPresenceAndRank (copy)
		if var2 then
			var11(generateDummyFriendsModule(7))
			
			return
		end
		local t = {}
		
		for i, v in pairs(var16) do
			if var14(v) then
				t[#t + 1] = v
				local var17 = if var13 and var13.data then userProfilesModule.Selectors.getCombinedNameFromId(var13.data, v.id) else nil
				v.displayName = if var17 == nil then v.displayName else var17
				local var18 = if var13 and var13.data then userProfilesModule.Selectors.getUsernameFromId(var13.data, v.id) else nil
				v.name = if var18 == nil then v.name else var18
			end
		end
		table.sort(t, sortFriendsByCorrectedPresenceAndRank)
		var11(t)
	end, {
		var16,
		var8,
		tostring(var2),
		tostring(var13 and var13.loading)
	})
	
	return reactModule.createElement(friendsListContextModule.Provider, {
		value = {
			friends = var10,
			hasFriends = #var6 > 0,
			isFetchingFriends = var2 or p1.isLoadingCustomParams,
			isFriendsListFetchFailed = var4,
			friendsNames = { loading = var13 and var13.loading },
			searchFriends = var9,
			searchFriendsString = var8
		}
	}, p1.children)
end