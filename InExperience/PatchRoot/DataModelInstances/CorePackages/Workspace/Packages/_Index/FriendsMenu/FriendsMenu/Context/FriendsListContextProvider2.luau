local playersService = game:GetService("Players")
local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local utils = parent_1.utils
local friendsMenuDependenciesModule = require(parent_1.FriendsMenuDependencies)
local reactModule = require(parent_2.React)
local userLibModule = require(parent_2.UserLib)
local roactUtilsModule = require(parent_2.RoactUtils)
local userProfilesModule = require(parent_2.UserProfiles)
local friendsCommonModule = require(parent_2.FriendsCommon)
local cryoModule = require(parent_2.Cryo)
local graphQLServerModule = require(parent_2.GraphQLServer)
local constants = userLibModule.Utils.Constants
local thumbnailRequest = userLibModule.Utils.ThumbnailRequest
local preloadUsersThumbnail = userLibModule.Thunks.PreloadUsersThumbnail
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local sortFriendsByCorrectedPresenceAndRank = friendsMenuDependenciesModule.sortFriendsByCorrectedPresenceAndRank
local networkImpl = friendsMenuDependenciesModule.networkImpl
local presenceType = graphQLServerModule.types.PresenceType
local getFriendsSearchModule = require(parent_1.Requests.GetFriendsSearch)
local constantsModule = require(parent_1.Constants)
local sortInvitesByScoreIXPModule = require(parent_1.Experiments.SortInvitesByScoreIXP)
local friendsListContextModule = require(parent.FriendsListContext)
local useFriendsListOrderedByPresence = friendsCommonModule.Hooks.useFriendsListOrderedByPresence
local generateDummyFriendsModule = require(utils.generateDummyFriends)
local fFlagFilterOutDeletedAccountsGameInvitesModule = require(parent_1.Flags.FFlagFilterOutDeletedAccountsGameInvites)
local fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt = require(parent_2.SharedFlags).FFlagGameInviteOpenModalWithoutBlockingOnCanPrompt
local userModel = userLibModule.Models.UserModel
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
	-- upvalues: sortInvitesByScoreIXPModule (ref), networkImpl (ref), playersService (ref), useDispatch (ref), reactModule (ref), generateDummyFriendsModule (ref), useFriendsListOrderedByPresence (ref), userProfilesModule (ref), preloadUsersThumbnail (ref), t (ref), userModel (ref), presenceType (ref), fFlagFilterOutDeletedAccountsGameInvitesModule (ref), constantsModule (ref), sortFriendsByCorrectedPresenceAndRank (ref), cryoModule (ref), getFriendsSearchModule (ref), fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt (ref), friendsListContextModule (ref)
	local var1 = if sortInvitesByScoreIXPModule.FFlagEnableSortInvitesByScoreExperiment then sortInvitesByScoreIXPModule.useSortInvitesByScoreExperiment() else nil
	local var2 = if p1.networkImplOverride then p1.networkImplOverride else networkImpl
	local var3 = if playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else "0"
	local var4 = useDispatch()
	local var5, var6 = reactModule.useState("")
	local var7, var8 = reactModule.useState(true)
	local t_1 = {}
	local var9, var10 = reactModule.useState(generateDummyFriendsModule(10))
	local var11 = useFriendsListOrderedByPresence({
		pageSize = 50,
		shouldListenToPresenceUpdates = false,
		userId = var3
	})
	local var12 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = {},
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	
	local var13 = function(p2, p3)
		-- upvalues: var4 (ref), preloadUsersThumbnail (copy), t (copy), var12 (ref), p1 (ref), userModel (copy), var11 (ref), presenceType (copy), fFlagFilterOutDeletedAccountsGameInvitesModule (copy), constantsModule (copy), var1 (ref), sortInvitesByScoreIXPModule (copy), sortFriendsByCorrectedPresenceAndRank (copy), var10 (ref), var8 (ref), t_1 (write), cryoModule (copy)
		var4(preloadUsersThumbnail(p2, t.ThumbnailRequest.InviteToGame, nil))
		var12:fetchMore({ variables = { userIds = p2 } }):andThen(function(p4)
			-- upvalues: p2 (ref), p1 (copy), userModel (copy), var11 (copy), presenceType (copy), fFlagFilterOutDeletedAccountsGameInvitesModule (copy), constantsModule (copy), var1 (copy), sortInvitesByScoreIXPModule (copy), p3 (ref), sortFriendsByCorrectedPresenceAndRank (copy), var10 (copy), var8 (copy)
			local OFFLINE, lastLocation
			local t = {}
			
			for i, v in p2 do
				if not p1.excludedFriendsSet or not p1.excludedFriendsSet[v] then
					OFFLINE = userModel.PresenceType.OFFLINE
					lastLocation = nil
					
					for i_1, v_1 in var11.onlineFriends do
						if v == v_1.id then
							if not v_1.presence then break end
							local userPresenceType = v_1.presence.userPresenceType
							
							if userPresenceType == presenceType.InGame then
								OFFLINE = userModel.PresenceType.IN_GAME
							elseif userPresenceType == presenceType.Online then
								OFFLINE = userModel.PresenceType.ONLINE
							elseif userPresenceType == presenceType.InStudio then
								OFFLINE = userModel.PresenceType.IN_STUDIO
							end
							lastLocation = v_1.presence.lastLocation
							break
						end
					end
					for i_1, v_1 in p4.data.userProfiles do
						if (not fFlagFilterOutDeletedAccountsGameInvitesModule or v_1.names.username ~= constantsModule.NameAccountDeleted) and v_1.id == v then
							table.insert(t, {
								id = v,
								presence = OFFLINE,
								lastLocation = lastLocation,
								displayName = v_1.names.combinedName,
								name = v_1.names.username,
								friendRank = if var1 or sortInvitesByScoreIXPModule.FFlagSortInvitesByScoreEnabledForAll then p3 and p3[v] else nil
							})
							break
						end
					end
				end
			end
			table.sort(t, sortFriendsByCorrectedPresenceAndRank)
			var10(t)
			var8(false)
		end):catch(function(p5)
			-- upvalues: var8 (copy)
			print("error", p5)
			var8(false)
		end)
		
		return if t_1 then cryoModule.List.join(t_1, p2) else p2
	end
	
	t_1 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), getFriendsSearchModule (copy), var2 (write), var3 (ref), var1 (ref), sortInvitesByScoreIXPModule (copy), cryoModule (copy), var13 (ref), var11 (ref), t_1 (write), fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt (copy), var10 (ref), var8 (ref)
		if var5 == "" then
			if not var11.onlineFriends or not var11.offlineFriends then
				return {}
			end
			local t = {}
			local var14 = if var1 or sortInvitesByScoreIXPModule.FFlagSortInvitesByScoreEnabledForAll then {} else nil
			
			for i, v in cryoModule.List.join(var11.offlineFriends, var11.onlineFriends) do
				if cryoModule.List.find(t_1, v.id) == nil then
					table.insert(t, v.id)
					
					if var1 or sortInvitesByScoreIXPModule.FFlagSortInvitesByScoreEnabledForAll then
						var14[v.id] = i
					end
				end
			end
			if not fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt or #t ~= 0 then
				return var13(t, var14)
			elseif var11.isLoading then
				return {}
			end
			var10({})
			var8(false)
			
			return {}
		else
			getFriendsSearchModule(var2, var3, var5, 20):andThen(function(p5)
				-- upvalues: var1 (copy), sortInvitesByScoreIXPModule (copy), cryoModule (copy), var13 (copy)
				local var15 = if var1 or sortInvitesByScoreIXPModule.FFlagSortInvitesByScoreEnabledForAll then {} else nil
				
				return var13(cryoModule.List.map(p5.responseBody.PageItems, function(p6, p7)
					-- upvalues: var1 (copy), sortInvitesByScoreIXPModule (copy), var15 (ref)
					if var1 or sortInvitesByScoreIXPModule.FFlagSortInvitesByScoreEnabledForAll then
						var15[p6.id] = p7
					end
					return tostring(p6.id)
				end), var15)
			end):catch(function(p5)
				print("error", p5)
			end)
		end
	end, {
		var11.onlineFriends,
		var11.offlineFriends,
		var5,
		if fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt then var11.isLoading else nil
	})
	
	return reactModule.createElement(friendsListContextModule.Provider, {
		value = {
			isFriendsListFetchFailed = false,
			friends = var9,
			hasFriends = not cryoModule.isEmpty(var11.onlineFriends) or not cryoModule.isEmpty(var11.offlineFriends),
			isFetchingFriends = var12.loading or (p1.isLoadingCustomParams or (var7 or fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt and var11.isLoading)),
			friendsNames = { loading = var12 and var12.loading },
			fetchMoreFriends = var11.fetchMoreFriends,
			searchFriends = var6,
			searchFriendsString = var5
		}
	}, p1.children)
end