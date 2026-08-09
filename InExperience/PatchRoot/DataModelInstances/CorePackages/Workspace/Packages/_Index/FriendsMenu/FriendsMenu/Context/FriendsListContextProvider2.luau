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

return function(p0) --[[ line: 55 ]]
	-- upvalues: sortInvitesByScoreIXPModule (ref), networkImpl (ref), playersService (ref), useDispatch (ref), reactModule (ref), generateDummyFriendsModule (ref), useFriendsListOrderedByPresence (ref), userProfilesModule (ref), preloadUsersThumbnail (ref), t (ref), userModel (ref), presenceType (ref), fFlagFilterOutDeletedAccountsGameInvitesModule (ref), constantsModule (ref), sortFriendsByCorrectedPresenceAndRank (ref), cryoModule (ref), getFriendsSearchModule (ref), friendsListContextModule (ref)
	local var16 = if sortInvitesByScoreIXPModule.FFlagEnableSortInvitesByScoreExperiment then sortInvitesByScoreIXPModule.useSortInvitesByScoreExperiment() else nil
	local var17 = if p0.networkImplOverride then p0.networkImplOverride else networkImpl
	local var18 = if playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else "0"
	local var19 = useDispatch()
	local var20, var21 = reactModule.useState("")
	local var22, var23 = reactModule.useState(true)
	local t_1 = {}
	local var25, var26 = reactModule.useState(generateDummyFriendsModule(10))
	local var27 = useFriendsListOrderedByPresence({
		pageSize = 50,
		shouldListenToPresenceUpdates = false,
		userId = var18
	})
	local var28 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = {},
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	
	local var29 = function(p1, p2) --[[ line: 85 ]]
		-- upvalues: var19 (ref), preloadUsersThumbnail (copy), t (copy), var28 (ref), p0 (ref), userModel (copy), var27 (ref), presenceType (copy), fFlagFilterOutDeletedAccountsGameInvitesModule (copy), constantsModule (copy), var16 (ref), sortInvitesByScoreIXPModule (copy), sortFriendsByCorrectedPresenceAndRank (copy), var26 (ref), var23 (ref), t_1 (write), cryoModule (copy)
		var19(preloadUsersThumbnail(p1, t.ThumbnailRequest.InviteToGame, nil))
		var28:fetchMore({ variables = { userIds = p1 } }):andThen(function(p4) --[[ line: 93 ]]
			-- upvalues: p1 (ref), p0 (copy), userModel (copy), var27 (copy), presenceType (copy), fFlagFilterOutDeletedAccountsGameInvitesModule (copy), constantsModule (copy), var16 (copy), sortInvitesByScoreIXPModule (copy), p2 (ref), sortFriendsByCorrectedPresenceAndRank (copy), var26 (copy), var23 (copy)
			local OFFLINE, lastLocation
			local t = {}
			
			for i, v in p1 do
				if not p0.excludedFriendsSet or not p0.excludedFriendsSet[v] then
					OFFLINE = userModel.PresenceType.OFFLINE
					lastLocation = nil
					
					for i_1, v_1 in var27.onlineFriends do
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
								friendRank = if var16 or sortInvitesByScoreIXPModule.FFlagSortInvitesByScoreEnabledForAll then p2 and p2[v] else nil
							})
							break
						end
					end
				end
			end
			table.sort(t, sortFriendsByCorrectedPresenceAndRank)
			var26(t)
			var23(false)
		end):catch(function(p3) --[[ line: 144 ]]
			-- upvalues: var23 (copy)
			print("error", p3)
			var23(false)
		end)
		
		return if t_1 then cryoModule.List.join(t_1, p1) else p1
	end
	
	t_1 = reactModule.useMemo(function() --[[ line: 152 ]]
		-- upvalues: var20 (ref), getFriendsSearchModule (copy), var17 (write), var18 (ref), var16 (ref), sortInvitesByScoreIXPModule (copy), cryoModule (copy), var29 (ref), var27 (ref), t_1 (write)
		if var20 == "" then
			if not var27.onlineFriends or not var27.offlineFriends then
				return {}
			end
			local t = {}
			local var32 = if var16 or sortInvitesByScoreIXPModule.FFlagSortInvitesByScoreEnabledForAll then {} else nil
			
			for i, v in cryoModule.List.join(var27.offlineFriends, var27.onlineFriends) do
				if cryoModule.List.find(t_1, v.id) == nil then
					table.insert(t, v.id)
					
					if var16 or sortInvitesByScoreIXPModule.FFlagSortInvitesByScoreEnabledForAll then
						var32[v.id] = i
					end
				end
			end
			return var29(t, var32)
		else
			getFriendsSearchModule(var17, var18, var20, 20):andThen(function(p6) --[[ line: 154 ]]
				-- upvalues: var16 (copy), sortInvitesByScoreIXPModule (copy), cryoModule (copy), var29 (copy)
				local var33 = if var16 or sortInvitesByScoreIXPModule.FFlagSortInvitesByScoreEnabledForAll then {} else nil
				
				return var29(cryoModule.List.map(p6.responseBody.PageItems, function(p7, p8) --[[ line: 159 ]]
					-- upvalues: var16 (copy), sortInvitesByScoreIXPModule (copy), var33 (ref)
					if var16 or sortInvitesByScoreIXPModule.FFlagSortInvitesByScoreEnabledForAll then
						var33[p7.id] = p8
					end
					return tostring(p7.id)
				end), var33)
			end):catch(function(p5) --[[ line: 166 ]]
				print("error", p5)
			end)
		end
	end, { var27.onlineFriends, var27.offlineFriends, var20 })
	
	return reactModule.createElement(friendsListContextModule.Provider, {
		value = {
			isFriendsListFetchFailed = false,
			friends = var25,
			hasFriends = not cryoModule.isEmpty(var27.onlineFriends) or not cryoModule.isEmpty(var27.offlineFriends),
			isFetchingFriends = var28.loading or (p0.isLoadingCustomParams or var22),
			friendsNames = { loading = var28 and var28.loading },
			fetchMoreFriends = var27.fetchMoreFriends,
			searchFriends = var21,
			searchFriendsString = var20
		}
	}, p0.children)
end