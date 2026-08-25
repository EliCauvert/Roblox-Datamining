local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local playersService = game:GetService("Players")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local signalsReactModule = require(parent.SignalsReact)
local game = require(parent.DataHydration).Game
local sduiChip = require(parent.SduiSharedContent).SduiChip
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local appPage = require(parent.RobloxAppEnums).AppPage
local gameConnectionsPlayedChipClicked = require(parent.DiscoveryAnalytics).Events.gameConnectionsPlayedChipClicked
local avatarGroupType = foundationModule.Enums.AvatarGroupType
local useLocalization = localizationModule.Hooks.useLocalization
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var6 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return reactModule.memo(function(p0)
	-- upvalues: useDispatch (ref), signalsReactModule (ref), game (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), reactModule (ref), playersService (ref), gameConnectionsPlayedChipClicked (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var6 (ref), navigateDown (ref), sduiChip (ref), avatarGroupType (ref)
	local layoutOrder = p0.layoutOrder
	local universeId = p0.universeId
	local var7 = useDispatch()
	local var8 = signalsReactModule.useSignalState(game.getConnectionsPlayedStore(false).getConnectionsPlayed(universeId).data)
	local var9 = signalsReactModule.useSignalState(game.getGameInfoStore(false).getAndFetchGameInfo(universeId).data)
	local var10 = if var8 then var8.userIds else {}
	local var11 = if var8 then var8.totalCount else 0
	local var12 = useLocalization({
		connectionsPlayed = {
			if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.FriendsPlayed" else "Feature.Friends.Label.ConnectionsPlayed",
			numberOfConnections = var11
		},
		connectionsRecentlyPlayed = {
			if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.FriendsRecentlyPlayed" else "Feature.Friends.Label.ConnectionsRecentlyPlayed",
			numberOfConnections = var11
		},
		connectionRecentlyPlayed = {
			if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.FriendRecentlyPlayed" else "Feature.Friends.Label.ConnectionRecentlyPlayed"
		}
	})
	local var13 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), playersService (copy), gameConnectionsPlayedChipClicked (copy), universeId (ref), var11 (ref), appPage (copy), var10 (ref), var12 (ref), fFlagSignalsNavP3Dispatch (copy), var6 (copy), var7 (ref), navigateDown (copy)
		local rootPlaceId = var9 and var9.rootPlaceId
		
		if rootPlaceId then
			gameConnectionsPlayedChipClicked({
				uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
				universeId = universeId,
				placeId = tostring(rootPlaceId),
				totalConnections = var11
			}, "ExperienceDetailsConnectionsPlayedChip")
		end
		local t = {
			name = appPage.SocialProofVerticalUserListSheet,
			extraProps = {
				userIds = var10,
				title = if var11 == 1 then var12.connectionRecentlyPlayed else var12.connectionsRecentlyPlayed
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var6.down(var6.fromLegacyPage(t))
			
			return
		end
		var7(navigateDown(t))
	end, {
		var7, universeId, var9, var11, var12, playersService.LocalPlayer
	})
	
	if var11 == 0 then
		return nil
	end
	local connectionsPlayed = var12.connectionsPlayed
	local t = {}
	
	for i = 1, math.min(2, #var10) do
		table.insert(t, var10[i])
	end
	return reactModule.createElement(sduiChip, {
		text = connectionsPlayed,
		leading = {
			type = "AvatarGroup",
			props = { max = 2, avatars = t, type = avatarGroupType.Stacked }
		},
		onActivated = var13,
		layoutOrder = layoutOrder
	})
end)