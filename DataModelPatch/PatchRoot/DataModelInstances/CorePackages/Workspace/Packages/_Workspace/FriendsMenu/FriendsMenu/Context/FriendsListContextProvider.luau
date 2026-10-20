local Players = game:GetService("Players")
local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local FriendsMenuDependenciesModule = require(Parent1.FriendsMenuDependencies)
local _ = require(Parent1.friendsMenuModalType)
local ReactModule = require(Parent2.React)
local UserLibModule = require(Parent2.UserLib)
local RoactUtilsModule = require(Parent2.RoactUtils)
local UserProfilesModule = require(Parent2.UserProfiles)
local GetFFlagEnableFriendsListSearchNormalizationErrorFixFunction = require(Parent2.SharedFlags).GetFFlagEnableFriendsListSearchNormalizationErrorFix
local UserModel = UserLibModule.Models.UserModel
local Constants = UserLibModule.Utils.Constants
local ApiFetchUsersPresencesFunction = UserLibModule.Thunks.ApiFetchUsersPresences
local UpdateUsersFunction = UserLibModule.Thunks.UpdateUsers
local PreloadUsersThumbnailFunction = UserLibModule.Thunks.PreloadUsersThumbnail
local NetworkImpl = FriendsMenuDependenciesModule.networkImpl
local SortFriendsByCorrectedPresenceAndRank = FriendsMenuDependenciesModule.sortFriendsByCorrectedPresenceAndRank
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local FriendsListContextModule = require(Parent.FriendsListContext)
local GenerateDummyFriendsModule = require(Parent1.utils.generateDummyFriends)
local DEPRECATEDUsersGetFriendsFunction = require(Parent2.Http).Requests.DEPRECATED_UsersGetFriends
local UserSorts = require(Parent1.Constants).UserSorts
local config = {
	InviteAvatarThumbnailType = Constants.RbxAvatarThumbnailTypesFromEnum.HeadShot,
	InviteAvatarThumbnailSize = Constants.RbxThumbnailSizes.Size150x150,
	InviteAvatarRbxthumbType = Constants.RbxthumbTypes.AvatarHeadShot
}
config.ThumbnailRequest = {
	InviteToGame = {
		UserLibModule.Utils.ThumbnailRequest.fromData(config.InviteAvatarThumbnailType, config.InviteAvatarThumbnailSize)
	}
}

return function(p1)
	-- upvalues: NetworkImpl (copy), ReactModule (copy), GenerateDummyFriendsModule (copy), UseDispatchFunction (copy), UserProfilesModule (copy), GetFFlagEnableFriendsListSearchNormalizationErrorFixFunction (copy), Players (copy), DEPRECATEDUsersGetFriendsFunction (copy), UserSorts (copy), UserModel (copy), UpdateUsersFunction (copy), PreloadUsersThumbnailFunction (copy), config (copy), ApiFetchUsersPresencesFunction (copy), UseSelectorFunction (copy), SortFriendsByCorrectedPresenceAndRank (copy), FriendsListContextModule (copy)
	local NetworkImplOverride = nil
	NetworkImplOverride = if p1.networkImplOverride then p1.networkImplOverride else NetworkImpl
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState({})
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState("")
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState((GenerateDummyFriendsModule(7)))
	local UseDispatchResult = UseDispatchFunction()
	local UseUserProfilesFetchResult = nil
	UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = UseStateResult3,
		query = UserProfilesModule.Queries.userProfilesAllNamesByUserIds
	})
	
	local function v33(p2): boolean
		-- upvalues: p1 (copy), UseStateResult4 (copy), UseUserProfilesFetchResult (ref), UserProfilesModule (upval), GetFFlagEnableFriendsListSearchNormalizationErrorFixFunction (upval)
		if not p2 or not p2.isFriend then
			return false
		end
		if p1.excludedFriendsSet and p1.excludedFriendsSet[p2.id] then
			return false
		end
		if UseStateResult4 == nil or UseStateResult4 == "" then
			return true
		end
		local DisplayName = p2.displayName or ""
		local Name = p2.name or ""
		local Alias = ""
		local ContactName = ""
		local PlatformName = ""
		
		if UseUserProfilesFetchResult and UseUserProfilesFetchResult.data then
			local Names = UserProfilesModule.Selectors.getUserProfileFromId(UseUserProfilesFetchResult.data, p2.id).names
			
			if Names then
				Alias = Names.alias or ""
				DisplayName = Names.displayName or ""
				Name = Names.username or ""
				ContactName = Names.contactName or ""
				PlatformName = Names.platformName or ""
			end
		end
		local NfdnormalizeResult: string = utf8.nfdnormalize(DisplayName)
		local NfdnormalizeResult1: string = utf8.nfdnormalize(Alias)
		local NfdnormalizeResult2: string = utf8.nfdnormalize(ContactName)
		local NfdnormalizeResult3: string = utf8.nfdnormalize(PlatformName)
		local NfdnormalizeResult4 = nil
		
		if GetFFlagEnableFriendsListSearchNormalizationErrorFixFunction() then
			pcall(function()
				-- upvalues: NfdnormalizeResult4 (ref), UseStateResult4 (upval)
				NfdnormalizeResult4 = utf8.nfdnormalize(UseStateResult4)
			end)
		else
			NfdnormalizeResult4 = utf8.nfdnormalize(UseStateResult4)
		end
		return (if GetFFlagEnableFriendsListSearchNormalizationErrorFixFunction() then NfdnormalizeResult4 and (string.find(NfdnormalizeResult1:lower(), NfdnormalizeResult4:lower(), 1, true) ~= nil or (string.find(NfdnormalizeResult2:lower(), NfdnormalizeResult4:lower(), 1, true) ~= nil or (string.find(NfdnormalizeResult3:lower(), NfdnormalizeResult4:lower(), 1, true) ~= nil or string.find(NfdnormalizeResult:lower(), NfdnormalizeResult4:lower(), 1, true) ~= nil))) else string.find(NfdnormalizeResult1:lower(), NfdnormalizeResult4:lower(), 1, true) ~= nil or (string.find(NfdnormalizeResult2:lower(), NfdnormalizeResult4:lower(), 1, true) ~= nil or (string.find(NfdnormalizeResult3:lower(), NfdnormalizeResult4:lower(), 1, true) ~= nil or string.find(NfdnormalizeResult:lower(), NfdnormalizeResult4:lower(), 1, true) ~= nil))) or string.find(Name:lower(), UseStateResult4:lower(), 1, true) ~= nil
	end
	
	local function _(p2)
		-- upvalues: UseUserProfilesFetchResult (ref), UserProfilesModule (upval)
		local CombinedNameFromId = if UseUserProfilesFetchResult and UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, p2.id) else nil
		
		return if CombinedNameFromId == nil then p2.displayName else CombinedNameFromId
	end
	
	local _ = function(p2)
		-- upvalues: UseUserProfilesFetchResult (ref), UserProfilesModule (upval)
		local UsernameFromId = if UseUserProfilesFetchResult and UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getUsernameFromId(UseUserProfilesFetchResult.data, p2.id) else nil
		
		return if UsernameFromId == nil then p2.name else UsernameFromId
	end
	
	ReactModule.useEffect(function()
		-- upvalues: Players (upval), UseStateResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), DEPRECATEDUsersGetFriendsFunction (upval), NetworkImplOverride (ref), UserSorts (upval), UserModel (upval), UseDispatchResult (copy), UpdateUsersFunction (upval), UseStateResult2_2 (copy), PreloadUsersThumbnailFunction (upval), config (upval), ApiFetchUsersPresencesFunction (upval)
		local Text = if Players and Players.LocalPlayer then tostring(Players.LocalPlayer.UserId) else nil
		
		if not UseStateResult and Text then
			UseStateResult2(true)
			UseStateResult2_1(false)
			DEPRECATEDUsersGetFriendsFunction(NetworkImplOverride, Text, UserSorts.StatusFrequents):andThen(function(Result)
				-- upvalues: UserModel (upval), UseDispatchResult (upval), UpdateUsersFunction (upval), UseStateResult2_2 (upval)
				local List = {}
				local FromDataTableResults = {}
				
				for FriendRank, entry in pairs(Result.responseBody.data) do
					entry.isFriend = true
					entry.friendRank = FriendRank
					entry.name = ""
					entry.displayName = ""
					local FromDataTableResult = UserModel.fromDataTable(entry)
					table.insert(List, (tostring(entry.id)))
					FromDataTableResults[FromDataTableResult.id] = FromDataTableResult
				end
				UseDispatchResult(UpdateUsersFunction(FromDataTableResults))
				UseStateResult2_2(List)
				
				return List
			end, function(_)
				-- upvalues: UseStateResult2 (upval), UseStateResult2_1 (upval)
				UseStateResult2(false)
				UseStateResult2_1(true)
				
				return {}
			end):andThen(function(Result)
				-- upvalues: UseDispatchResult (upval), PreloadUsersThumbnailFunction (upval), config (upval), ApiFetchUsersPresencesFunction (upval), NetworkImplOverride (upval)
				UseDispatchResult(PreloadUsersThumbnailFunction(Result, config.ThumbnailRequest.InviteToGame, nil))
				
				return UseDispatchResult(ApiFetchUsersPresencesFunction(NetworkImplOverride, Result))
			end):andThen(function(_)
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(false)
			end, function(_)
				-- upvalues: UseStateResult2 (upval), UseStateResult2_1 (upval)
				UseStateResult2(false)
				UseStateResult2_1(true)
			end)
		end
	end, {})
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.Users
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseStateResult2_4 (copy), GenerateDummyFriendsModule (upval), UseSelectorResult (copy), v33 (copy), UseUserProfilesFetchResult (ref), UserProfilesModule (upval), SortFriendsByCorrectedPresenceAndRank (upval)
		if UseStateResult then
			UseStateResult2_4(GenerateDummyFriendsModule(7))
			
			return
		end
		local List = {}
		
		for _, value in pairs(UseSelectorResult) do
			if v33(value) then
				List[#List + 1] = value
				local CombinedNameFromId = if UseUserProfilesFetchResult and UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, value.id) else nil
				value.displayName = if CombinedNameFromId == nil then value.displayName else CombinedNameFromId
				local UsernameFromId = if UseUserProfilesFetchResult and UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getUsernameFromId(UseUserProfilesFetchResult.data, value.id) else nil
				value.name = if UsernameFromId == nil then value.name else UsernameFromId
			end
		end
		table.sort(List, SortFriendsByCorrectedPresenceAndRank)
		UseStateResult2_4(List)
	end, {
		UseSelectorResult,
		UseStateResult4,
		tostring(UseStateResult),
		(tostring(UseUserProfilesFetchResult and UseUserProfilesFetchResult.loading))
	})
	
	return ReactModule.createElement(FriendsListContextModule.Provider, {
		value = {
			friends = UseStateResult5,
			hasFriends = #UseStateResult3 > 0,
			isFetchingFriends = UseStateResult or p1.isLoadingCustomParams,
			isFriendsListFetchFailed = UseStateResult1,
			friendsNames = {
				loading = UseUserProfilesFetchResult and UseUserProfilesFetchResult.loading
			},
			searchFriends = UseStateResult2_3,
			searchFriendsString = UseStateResult4
		}
	}, p1.children)
end