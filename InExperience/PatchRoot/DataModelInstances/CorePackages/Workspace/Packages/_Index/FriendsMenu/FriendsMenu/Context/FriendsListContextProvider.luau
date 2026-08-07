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

return function(p0) --[[ line: 62 ]]
	-- upvalues: networkImpl (ref), reactModule (ref), generateDummyFriendsModule (ref), useDispatch (ref), userProfilesModule (ref), getFFlagEnableFriendsListSearchNormalizationErrorFix (ref), playersService (ref), DEPRECATED_UsersGetFriends (ref), userSorts (ref), userModel (ref), updateUsers (ref), preloadUsersThumbnail (ref), t (ref), apiFetchUsersPresences (ref), useSelector (ref), sortFriendsByCorrectedPresenceAndRank (ref), friendsListContextModule (ref)
	local var10 = if p0.networkImplOverride then p0.networkImplOverride else networkImpl
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(false)
	local var15, var16 = reactModule.useState({})
	local var17, var18 = reactModule.useState("")
	local var19, var20 = reactModule.useState(generateDummyFriendsModule(7))
	local var21 = useDispatch()
	local _ = nil
	local var22 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = var15,
		query = userProfilesModule.Queries.userProfilesAllNamesByUserIds
	})
	
	local var23 = function(p1) --[[ line: 89 ]]
		-- upvalues: p0 (ref), var17 (ref), var22 (write), userProfilesModule (copy), getFFlagEnableFriendsListSearchNormalizationErrorFix (copy)
		if not p1 or not p1.isFriend then
			return false
		elseif p0.excludedFriendsSet and p0.excludedFriendsSet[p1.id] then
			return false
		elseif var17 == nil or var17 == "" then
			return true
		end
		local displayName = p1.displayName or ""
		local name = p1.name or ""
		local var27 = ""
		local var28 = ""
		local var29 = ""
		
		if var22 and var22.data then
			local names = userProfilesModule.Selectors.getUserProfileFromId(var22.data, p1.id).names
			
			if names then
				var27 = names.alias or ""
				displayName = names.displayName or ""
				name = names.username or ""
				var28 = names.contactName or ""
				var29 = names.platformName or ""
			end
		end
		local normalized = utf8.nfdnormalize(displayName)
		local normalized_1 = utf8.nfdnormalize(var27)
		local normalized_2 = utf8.nfdnormalize(var28)
		local normalized_3 = utf8.nfdnormalize(var29)
		local normalized_4 = nil
		
		if getFFlagEnableFriendsListSearchNormalizationErrorFix() then
			pcall(function() --[[ line: 126 ]]
				-- upvalues: normalized_4 (write), var17 (copy)
				normalized_4 = utf8.nfdnormalize(var17)
			end)
		else
			normalized_4 = utf8.nfdnormalize(var17)
		end
		local var35
		if not getFFlagEnableFriendsListSearchNormalizationErrorFix() then
			return if string.find(normalized_1:lower(), normalized_4:lower(), 1, true) == nil then if string.find(normalized_2:lower(), normalized_4:lower(), 1, true) == nil then if string.find(normalized_3:lower(), normalized_4:lower(), 1, true) == nil then if string.find(normalized:lower(), normalized_4:lower(), 1, true) == nil then string.find(name:lower(), var17:lower(), 1, true) ~= nil else true else true else true else true
		elseif normalized_4 then
			var35 = if string.find(normalized_1:lower(), normalized_4:lower(), 1, true) == nil then if string.find(normalized_2:lower(), normalized_4:lower(), 1, true) == nil then if string.find(normalized_3:lower(), normalized_4:lower(), 1, true) == nil then if string.find(normalized:lower(), normalized_4:lower(), 1, true) == nil then string.find(name:lower(), var17:lower(), 1, true) ~= nil else true else true else true else true
		end
		return var35
	end
	
	local _ = function(p2) --[[ line: 156 ]]
		-- upvalues: var22 (write), userProfilesModule (copy)
		local var36 = if var22 and var22.data then userProfilesModule.Selectors.getCombinedNameFromId(var22.data, p2.id) else nil
		
		return if var36 == nil then p2.displayName else var36
	end
	
	local _ = function(p3) --[[ line: 168 ]]
		-- upvalues: var22 (write), userProfilesModule (copy)
		local var37 = if var22 and var22.data then userProfilesModule.Selectors.getUsernameFromId(var22.data, p3.id) else nil
		
		return if var37 == nil then p3.name else var37
	end
	
	reactModule.useEffect(function() --[[ line: 180 ]]
		-- upvalues: playersService (copy), var11 (ref), var12 (ref), var14 (ref), DEPRECATED_UsersGetFriends (copy), var10 (write), userSorts (copy), userModel (copy), var21 (ref), updateUsers (copy), var16 (ref), preloadUsersThumbnail (copy), t (copy), apiFetchUsersPresences (copy)
		local var38 = if playersService and playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else nil
		
		if not var11 and var38 then
			var12(true)
			var14(false)
			DEPRECATED_UsersGetFriends(var10, var38, userSorts.StatusFrequents):andThen(function(p5) --[[ line: 190 ]]
				-- upvalues: userModel (copy), var21 (copy), updateUsers (copy), var16 (copy)
				local responseBody = p5.responseBody
				local t = {}
				local t_1 = {}
				
				for i, v in pairs(responseBody.data) do
					local var41 = tostring(v.id)
					v.isFriend = true
					v.friendRank = i
					v.name = ""
					v.displayName = ""
					local var42 = userModel.fromDataTable(v)
					table.insert(t, var41)
					t_1[var42.id] = var42
				end
				var21(updateUsers(t_1))
				var16(t)
				
				return t
			end, function(_) --[[ line: 209 ]]
				-- upvalues: var12 (copy), var14 (copy)
				var12(false)
				var14(true)
				
				return {}
			end):andThen(function(p4) --[[ line: 215 ]]
				-- upvalues: var21 (copy), preloadUsersThumbnail (copy), t (copy), apiFetchUsersPresences (copy), var10 (copy)
				var21(preloadUsersThumbnail(p4, t.ThumbnailRequest.InviteToGame, nil))
				
				return var21(apiFetchUsersPresences(var10, p4))
			end):andThen(function(_) --[[ line: 223 ]]
				-- upvalues: var12 (copy)
				var12(false)
			end, function(_) --[[ line: 225 ]]
				-- upvalues: var12 (copy), var14 (copy)
				var12(false)
				var14(true)
			end)
		end
	end, {})
	local var24 = useSelector(function(p6) --[[ line: 232 ]]
		return p6.Users
	end)
	reactModule.useEffect(function() --[[ line: 236 ]]
		-- upvalues: var11 (ref), var20 (ref), generateDummyFriendsModule (copy), var24 (ref), var23 (ref), var22 (write), userProfilesModule (copy), sortFriendsByCorrectedPresenceAndRank (copy)
		if var11 then
			var20(generateDummyFriendsModule(7))
			
			return
		end
		local t = {}
		
		for i, v in pairs(var24) do
			if var23(v) then
				t[#t + 1] = v
				local var44 = if var22 and var22.data then userProfilesModule.Selectors.getCombinedNameFromId(var22.data, v.id) else nil
				v.displayName = if var44 == nil then v.displayName else var44
				local var45 = if var22 and var22.data then userProfilesModule.Selectors.getUsernameFromId(var22.data, v.id) else nil
				v.name = if var45 == nil then v.name else var45
			end
		end
		table.sort(t, sortFriendsByCorrectedPresenceAndRank)
		var20(t)
	end, {
		var24,
		var17,
		tostring(var11),
		tostring(var22 and var22.loading)
	})
	
	return reactModule.createElement(friendsListContextModule.Provider, {
		value = {
			friends = var19,
			hasFriends = #var15 > 0,
			isFetchingFriends = var11 or p0.isLoadingCustomParams,
			isFriendsListFetchFailed = var13,
			friendsNames = { loading = var22 and var22.loading },
			searchFriends = var18,
			searchFriendsString = var17
		}
	}, p0.children)
end