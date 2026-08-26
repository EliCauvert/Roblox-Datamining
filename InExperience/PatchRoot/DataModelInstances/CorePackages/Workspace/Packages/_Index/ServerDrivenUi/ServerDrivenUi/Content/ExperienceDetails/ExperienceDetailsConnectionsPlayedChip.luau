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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), signalsReactModule (ref), game (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), reactModule (ref), playersService (ref), gameConnectionsPlayedChipClicked (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), sduiChip (ref), avatarGroupType (ref)
	local layoutOrder = p1.layoutOrder
	local universeId = p1.universeId
	local var2 = useDispatch()
	local var3 = signalsReactModule.useSignalState(game.getConnectionsPlayedStore(false).getConnectionsPlayed(universeId).data)
	local var4 = signalsReactModule.useSignalState(game.getGameInfoStore(false).getAndFetchGameInfo(universeId).data)
	local var5 = if var3 then var3.userIds else {}
	local var6 = if var3 then var3.totalCount else 0
	local var7 = useLocalization({
		connectionsPlayed = {
			if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.FriendsPlayed" else "Feature.Friends.Label.ConnectionsPlayed",
			numberOfConnections = var6
		},
		connectionsRecentlyPlayed = {
			if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.FriendsRecentlyPlayed" else "Feature.Friends.Label.ConnectionsRecentlyPlayed",
			numberOfConnections = var6
		},
		connectionRecentlyPlayed = {
			if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.FriendRecentlyPlayed" else "Feature.Friends.Label.ConnectionRecentlyPlayed"
		}
	})
	local var8 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), playersService (copy), gameConnectionsPlayedChipClicked (copy), universeId (ref), var6 (ref), appPage (copy), var5 (ref), var7 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy)
		local rootPlaceId = var4 and var4.rootPlaceId
		
		if rootPlaceId then
			gameConnectionsPlayedChipClicked({
				uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
				universeId = universeId,
				placeId = tostring(rootPlaceId),
				totalConnections = var6
			}, "ExperienceDetailsConnectionsPlayedChip")
		end
		local t = {
			name = appPage.SocialProofVerticalUserListSheet,
			extraProps = {
				userIds = var5,
				title = if var6 == 1 then var7.connectionRecentlyPlayed else var7.connectionsRecentlyPlayed
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var2(navigateDown(t))
	end, {
		var2, universeId, var4, var6, var7, playersService.LocalPlayer
	})
	
	if var6 == 0 then
		return nil
	end
	local connectionsPlayed = var7.connectionsPlayed
	local t = {}
	
	for i = 1, math.min(2, #var5) do
		table.insert(t, var5[i])
	end
	return reactModule.createElement(sduiChip, {
		text = connectionsPlayed,
		leading = {
			type = "AvatarGroup",
			props = { max = 2, avatars = t, type = avatarGroupType.Stacked }
		},
		onActivated = var8,
		layoutOrder = layoutOrder
	})
end)