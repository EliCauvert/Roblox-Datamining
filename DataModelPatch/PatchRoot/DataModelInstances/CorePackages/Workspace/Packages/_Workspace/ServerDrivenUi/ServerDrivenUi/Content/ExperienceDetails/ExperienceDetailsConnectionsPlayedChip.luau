local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local Players = game:GetService("Players")
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local Game1 = require(Parent.DataHydration).Game
local SduiChip = require(Parent.SduiSharedContent).SduiChip
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local AppPage = require(Parent.RobloxAppEnums).AppPage
local GameConnectionsPlayedChipClickedFunction = require(Parent.DiscoveryAnalytics).Events.gameConnectionsPlayedChipClicked
local AvatarGroupType = require(Parent.Foundation).Enums.AvatarGroupType
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagConnectionsToFriendsRename = SharedFlagsModule.FFlagConnectionsToFriendsRename
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), SignalsReactModule (copy), Game1 (copy), UseLocalizationFunction (copy), FFlagConnectionsToFriendsRename (copy), ReactModule (copy), Players (copy), GameConnectionsPlayedChipClickedFunction (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), SduiChip (copy), AvatarGroupType (copy)
	local LayoutOrder = p1.layoutOrder
	local UniverseId = p1.universeId
	local UseDispatchResult = UseDispatchFunction()
	local UseSignalStateResult = SignalsReactModule.useSignalState(Game1.getConnectionsPlayedStore(false).getConnectionsPlayed(UniverseId).data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(Game1.getGameInfoStore(false).getAndFetchGameInfo(UniverseId).data)
	local UserIds = if UseSignalStateResult then UseSignalStateResult.userIds else {}
	local TotalCount = if UseSignalStateResult then UseSignalStateResult.totalCount else 0
	local UseLocalizationResult = UseLocalizationFunction({
		connectionsPlayed = {
			if FFlagConnectionsToFriendsRename then "Feature.Friends.Label.FriendsPlayed" else "Feature.Friends.Label.ConnectionsPlayed",
			numberOfConnections = TotalCount
		},
		connectionsRecentlyPlayed = {
			if FFlagConnectionsToFriendsRename then "Feature.Friends.Label.FriendsRecentlyPlayed" else "Feature.Friends.Label.ConnectionsRecentlyPlayed",
			numberOfConnections = TotalCount
		},
		connectionRecentlyPlayed = {
			if FFlagConnectionsToFriendsRename then "Feature.Friends.Label.FriendRecentlyPlayed" else "Feature.Friends.Label.ConnectionRecentlyPlayed"
		}
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseSignalStateResult1 (copy), Players (upval), GameConnectionsPlayedChipClickedFunction (upval), UniverseId (copy), TotalCount (copy), AppPage (upval), UserIds (copy), UseLocalizationResult (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		local RootPlaceId = UseSignalStateResult1 and UseSignalStateResult1.rootPlaceId
		
		if RootPlaceId then
			GameConnectionsPlayedChipClickedFunction({
				uid = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId),
				universeId = UniverseId,
				placeId = tostring(RootPlaceId),
				totalConnections = TotalCount
			}, "ExperienceDetailsConnectionsPlayedChip")
		end
		local config = {
			name = AppPage.SocialProofVerticalUserListSheet,
			extraProps = {
				userIds = UserIds,
				title = if TotalCount == 1 then UseLocalizationResult.connectionRecentlyPlayed else UseLocalizationResult.connectionsRecentlyPlayed
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, {
		UseDispatchResult, UniverseId, UseSignalStateResult1, TotalCount,
		UseLocalizationResult, Players.LocalPlayer
	})
	
	if TotalCount == 0 then
		return nil
	end
	local ConnectionsPlayed = UseLocalizationResult.connectionsPlayed
	local Avatars = {}
	
	for i = 1, math.min(2, #UserIds) do
		table.insert(Avatars, UserIds[i])
	end
	return ReactModule.createElement(SduiChip, {
		text = ConnectionsPlayed,
		leading = {
			type = "AvatarGroup",
			props = {
				max = 2,
				avatars = Avatars,
				type = AvatarGroupType.Stacked
			}
		},
		onActivated = UseResult,
		layoutOrder = LayoutOrder
	})
end)