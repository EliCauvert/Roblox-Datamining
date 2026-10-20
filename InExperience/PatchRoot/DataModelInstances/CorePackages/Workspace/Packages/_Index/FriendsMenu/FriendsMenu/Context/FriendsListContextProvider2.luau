local Players = game:GetService("Players")
local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local FriendsMenuDependenciesModule = require(Parent1.FriendsMenuDependencies)
local ReactModule = require(Parent2.React)
local UserLibModule = require(Parent2.UserLib)
local UserProfilesModule = require(Parent2.UserProfiles)
local CryoModule = require(Parent2.Cryo)
local Constants = UserLibModule.Utils.Constants
local PreloadUsersThumbnailFunction = UserLibModule.Thunks.PreloadUsersThumbnail
local UseDispatchFunction = require(Parent2.RoactUtils).Hooks.RoactRodux.useDispatch
local SortFriendsByCorrectedPresenceAndRank = FriendsMenuDependenciesModule.sortFriendsByCorrectedPresenceAndRank
local NetworkImpl = FriendsMenuDependenciesModule.networkImpl
local PresenceType = require(Parent2.GraphQLServer).types.PresenceType
local GetFriendsSearchModule = require(Parent1.Requests.GetFriendsSearch)
local ConstantsModule = require(Parent1.Constants)
local SortInvitesByScoreIXPModule = require(Parent1.Experiments.SortInvitesByScoreIXP)
local FriendsListContextModule = require(Parent.FriendsListContext)
local UseFriendsListOrderedByPresenceFunction = require(Parent2.FriendsCommon).Hooks.useFriendsListOrderedByPresence
local GenerateDummyFriendsModule = require(Parent1.utils.generateDummyFriends)
local FFlagFilterOutDeletedAccountsGameInvitesModule = require(Parent1.Flags.FFlagFilterOutDeletedAccountsGameInvites)
local FFlagGameInviteOpenModalWithoutBlockingOnCanPrompt = require(Parent2.SharedFlags).FFlagGameInviteOpenModalWithoutBlockingOnCanPrompt
local UserModel = UserLibModule.Models.UserModel
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
	-- upvalues: SortInvitesByScoreIXPModule (copy), NetworkImpl (copy), Players (copy), UseDispatchFunction (copy), ReactModule (copy), GenerateDummyFriendsModule (copy), UseFriendsListOrderedByPresenceFunction (copy), UserProfilesModule (copy), PreloadUsersThumbnailFunction (copy), config (copy), UserModel (copy), PresenceType (copy), FFlagFilterOutDeletedAccountsGameInvitesModule (copy), ConstantsModule (copy), SortFriendsByCorrectedPresenceAndRank (copy), CryoModule (copy), GetFriendsSearchModule (copy), FFlagGameInviteOpenModalWithoutBlockingOnCanPrompt (copy), FriendsListContextModule (copy)
	local UseSortInvitesByScoreExperimentResult = if SortInvitesByScoreIXPModule.FFlagEnableSortInvitesByScoreExperiment then SortInvitesByScoreIXPModule.useSortInvitesByScoreExperiment() else nil
	local NetworkImplOverride = nil
	NetworkImplOverride = if p1.networkImplOverride then p1.networkImplOverride else NetworkImpl
	local Text: string = if Players.LocalPlayer then tostring(Players.LocalPlayer.UserId) else "0"
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	local UseMemoResult = {}
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState((GenerateDummyFriendsModule(10)))
	local UseFriendsListOrderedByPresenceResult = UseFriendsListOrderedByPresenceFunction({
		pageSize = 50,
		shouldListenToPresenceUpdates = false,
		userId = Text
	})
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = {},
		query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	
	local function v36(Ids, p2)
		-- upvalues: UseDispatchResult (copy), PreloadUsersThumbnailFunction (upval), config (upval), UseUserProfilesFetchResult (copy), p1 (copy), UserModel (upval), UseFriendsListOrderedByPresenceResult (copy), PresenceType (upval), FFlagFilterOutDeletedAccountsGameInvitesModule (upval), ConstantsModule (upval), UseSortInvitesByScoreExperimentResult (copy), SortInvitesByScoreIXPModule (upval), SortFriendsByCorrectedPresenceAndRank (upval), UseStateResult2_2 (copy), UseStateResult2_1 (copy), UseMemoResult (ref), CryoModule (upval)
		UseDispatchResult(PreloadUsersThumbnailFunction(Ids, config.ThumbnailRequest.InviteToGame, nil))
		UseUserProfilesFetchResult:fetchMore({ variables = { userIds = Ids } }):andThen(function(Result)
			-- upvalues: Ids (copy), p1 (upval), UserModel (upval), UseFriendsListOrderedByPresenceResult (upval), PresenceType (upval), FFlagFilterOutDeletedAccountsGameInvitesModule (upval), ConstantsModule (upval), UseSortInvitesByScoreExperimentResult (upval), SortInvitesByScoreIXPModule (upval), p2 (copy), SortFriendsByCorrectedPresenceAndRank (upval), UseStateResult2_2 (upval), UseStateResult2_1 (upval)
			local List = {}
			local LastLocation = nil
			local OFFLINE = nil
			
			for _, id in Ids do
				if not p1.excludedFriendsSet or not p1.excludedFriendsSet[id] then
					OFFLINE = UserModel.PresenceType.OFFLINE
					LastLocation = nil
					
					for _, onlineFriend in UseFriendsListOrderedByPresenceResult.onlineFriends do
						if id == onlineFriend.id then
							if not onlineFriend.presence then break end
							local UserPresenceType = onlineFriend.presence.userPresenceType
							
							if UserPresenceType == PresenceType.InGame then
								OFFLINE = UserModel.PresenceType.IN_GAME
							elseif UserPresenceType == PresenceType.Online then
								OFFLINE = UserModel.PresenceType.ONLINE
							elseif UserPresenceType == PresenceType.InStudio then
								OFFLINE = UserModel.PresenceType.IN_STUDIO
							end
							LastLocation = onlineFriend.presence.lastLocation
							break
						else
							continue
						end
					end
					for _, userProfile in Result.data.userProfiles do
						if (not FFlagFilterOutDeletedAccountsGameInvitesModule or userProfile.names.username ~= ConstantsModule.NameAccountDeleted) and userProfile.id == id then
							table.insert(List, {
								id = id,
								presence = OFFLINE,
								lastLocation = LastLocation,
								displayName = userProfile.names.combinedName,
								name = userProfile.names.username,
								friendRank = if UseSortInvitesByScoreExperimentResult or SortInvitesByScoreIXPModule.FFlagSortInvitesByScoreEnabledForAll then p2 and p2[id] else nil
							})
							break
						end
					end
				end
			end
			table.sort(List, SortFriendsByCorrectedPresenceAndRank)
			UseStateResult2_2(List)
			UseStateResult2_1(false)
		end):catch(function(Err)
			-- upvalues: UseStateResult2_1 (upval)
			print("error", Err)
			UseStateResult2_1(false)
		end)
		
		return if UseMemoResult then CryoModule.List.join(UseMemoResult, Ids) else Ids
	end
	
	UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), GetFriendsSearchModule (upval), NetworkImplOverride (ref), Text (copy), UseSortInvitesByScoreExperimentResult (copy), SortInvitesByScoreIXPModule (upval), CryoModule (upval), v36 (copy), UseFriendsListOrderedByPresenceResult (copy), UseMemoResult (ref), FFlagGameInviteOpenModalWithoutBlockingOnCanPrompt (upval), UseStateResult2_2 (copy), UseStateResult2_1 (copy)
		if UseStateResult == "" then
			if UseFriendsListOrderedByPresenceResult.onlineFriends and UseFriendsListOrderedByPresenceResult.offlineFriends then
				local Ids = {}
				local T = if UseSortInvitesByScoreExperimentResult or SortInvitesByScoreIXPModule.FFlagSortInvitesByScoreEnabledForAll then {} else nil
				for i, value in CryoModule.List.join(UseFriendsListOrderedByPresenceResult.offlineFriends, UseFriendsListOrderedByPresenceResult.onlineFriends) do
					if CryoModule.List.find(UseMemoResult, value.id) == nil then
						table.insert(Ids, value.id)
						
						if UseSortInvitesByScoreExperimentResult or SortInvitesByScoreIXPModule.FFlagSortInvitesByScoreEnabledForAll then
							T[value.id] = i
						end
					end
				end
				if not FFlagGameInviteOpenModalWithoutBlockingOnCanPrompt or #Ids ~= 0 then
					return (v36(Ids, T))
				elseif UseFriendsListOrderedByPresenceResult.isLoading then
					return {}
				else
					UseStateResult2_2({})
					UseStateResult2_1(false)
					
					return {}
				end
			end
		else
			GetFriendsSearchModule(NetworkImplOverride, Text, UseStateResult, 20):andThen(function(Result)
				-- upvalues: UseSortInvitesByScoreExperimentResult (upval), SortInvitesByScoreIXPModule (upval), CryoModule (upval), v36 (upval)
				local T = if UseSortInvitesByScoreExperimentResult or SortInvitesByScoreIXPModule.FFlagSortInvitesByScoreEnabledForAll then {} else nil
				
				return (v36(CryoModule.List.map(Result.responseBody.PageItems, function(p3, p4): string
					-- upvalues: UseSortInvitesByScoreExperimentResult (upval), SortInvitesByScoreIXPModule (upval), T (copy)
					if UseSortInvitesByScoreExperimentResult or SortInvitesByScoreIXPModule.FFlagSortInvitesByScoreEnabledForAll then
						T[p3.id] = p4
					end
					return (tostring(p3.id))
				end), T))
			end):catch(function(Err)
				print("error", Err)
			end)
		end
		return {}
	end, {
		UseFriendsListOrderedByPresenceResult.onlineFriends,
		UseFriendsListOrderedByPresenceResult.offlineFriends,
		UseStateResult,
		if FFlagGameInviteOpenModalWithoutBlockingOnCanPrompt then UseFriendsListOrderedByPresenceResult.isLoading else nil
	})
	
	return ReactModule.createElement(FriendsListContextModule.Provider, {
		value = {
			isFriendsListFetchFailed = false,
			friends = UseStateResult3,
			hasFriends = not CryoModule.isEmpty(UseFriendsListOrderedByPresenceResult.onlineFriends) or not CryoModule.isEmpty(UseFriendsListOrderedByPresenceResult.offlineFriends),
			isFetchingFriends = UseUserProfilesFetchResult.loading or (p1.isLoadingCustomParams or (UseStateResult1 or FFlagGameInviteOpenModalWithoutBlockingOnCanPrompt and UseFriendsListOrderedByPresenceResult.isLoading)),
			friendsNames = {
				loading = UseUserProfilesFetchResult and UseUserProfilesFetchResult.loading
			},
			fetchMoreFriends = UseFriendsListOrderedByPresenceResult.fetchMoreFriends,
			searchFriends = UseStateResult2,
			searchFriendsString = UseStateResult
		}
	}, p1.children)
end