local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local playersService = game:GetService("Players")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local dataHydrationModule = require(parent.DataHydration)
local signalsReactModule = require(parent.SignalsReact)
local roactUtilsModule = require(parent.RoactUtils)
local gameConnectionsPlayedChipClicked = require(parent.DiscoveryAnalytics).Events.gameConnectionsPlayedChipClicked
local sduiTextAccessoryRow = require(parent.SduiSharedContent).SduiTextAccessoryRow
local avatarGroupType = foundationModule.Enums.AvatarGroupType
local inputSize = foundationModule.Enums.InputSize
local appPage = require(parent.RobloxAppEnums).AppPage
local game = dataHydrationModule.Game
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = localizationModule.Hooks.useLocalization
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useDeviceType = require(parent.RobloxAppHooks).useDeviceType
local deviceType = require(parent.RobloxAppEnums).DeviceType
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var8 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), useDispatch (ref), useDeviceType (ref), deviceType (ref), game (ref), signalsReactModule (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), reactModule (ref), playersService (ref), gameConnectionsPlayedChipClicked (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var8 (ref), navigateDown (ref), avatarGroupType (ref), inputSize (ref), sduiTextAccessoryRow (ref)
	local layoutOrder = p0.layoutOrder
	local universeId = p0.universeId
	local name = p0.name
	local var9 = useTokens()
	local var10 = useDispatch()
	local var11 = useDeviceType() == deviceType.Phone
	local var12 = signalsReactModule.useSignalState(game.getConnectionsPlayedStore(false).getConnectionsPlayed(universeId).data)
	local var13 = signalsReactModule.useSignalState(game.getGameInfoStore(false).getAndFetchGameInfo(universeId).data)
	local var14 = if var12 then var12.userIds else {}
	local var15 = if var12 then var12.totalCount else #var14
	local var16 = useLocalization({
		connectionsRecentlyPlayed = {
			if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.FriendsRecentlyPlayed" else "Feature.Friends.Label.ConnectionsRecentlyPlayed",
			numberOfConnections = var15
		},
		connectionRecentlyPlayed = {
			if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.FriendRecentlyPlayed" else "Feature.Friends.Label.ConnectionRecentlyPlayed"
		},
		playedByUserAndOthersPlural = {
			if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.PlayedByUserAndOthers.FriendsRename" else "Feature.Friends.Label.PlayedByUserAndOthers",
			name = name or "",
			numOfOthers = var15 - 1
		},
		playedByUserAndOneOther = {
			if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.PlayedByUserAndOneOther.FriendsRename" else "Feature.Friends.Label.PlayedByUserAndOneOther",
			name = name or ""
		},
		playedByUser = { "Feature.Friends.Label.PlayedByUser", name = name or "" }
	})
	local _ = nil
	local var17 = if name and name ~= "" then if var15 == 1 then var16.playedByUser elseif var15 == 2 then var16.playedByUserAndOneOther else var16.playedByUserAndOthersPlural elseif var15 == 1 then var16.connectionRecentlyPlayed else var16.connectionsRecentlyPlayed
	local rootPlaceId = var13 and var13.rootPlaceId
	local var19 = reactModule.useCallback(function()
		-- upvalues: rootPlaceId (ref), playersService (copy), gameConnectionsPlayedChipClicked (copy), universeId (ref), var15 (ref), appPage (copy), var14 (ref), var16 (ref), fFlagSignalsNavP3Dispatch (copy), var8 (copy), var10 (ref), navigateDown (copy)
		if rootPlaceId then
			gameConnectionsPlayedChipClicked({
				uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
				universeId = universeId,
				placeId = tostring(rootPlaceId),
				totalConnections = var15
			}, "ExperienceDetailsConnectionsPlayedChip")
		end
		local t = {
			name = appPage.SocialProofVerticalUserListSheet,
			extraProps = {
				userIds = var14,
				title = if var15 == 1 then var16.connectionRecentlyPlayed else var16.connectionsRecentlyPlayed
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var8.down(var8.fromLegacyPage(t))
			
			return
		end
		var10(navigateDown(t))
	end, {
		var10, universeId, rootPlaceId, var14, var15, var16, playersService.LocalPlayer
	})
	local var20 = reactModule.useMemo(function()
		-- upvalues: var14 (ref)
		return { table.unpack(var14, 1, math.min(2, #var14)) }
	end, { var14 })
	local var21 = if var11 then var9.Color.Surface.Surface_100 else var9.Color.Surface.Surface_0
	
	return if var15 == 0 then nil else reactModule.createElement(sduiTextAccessoryRow, {
		testId = "--experience-details-connections-played-text-row",
		text = var17,
		leading = reactModule.useMemo(function()
			-- upvalues: var20 (ref), avatarGroupType (copy), inputSize (copy), var21 (ref)
			return {
				type = "AvatarGroup",
				max = 2,
				avatars = var20,
				groupType = avatarGroupType.Stacked,
				size = inputSize.XSmall,
				backplateStyle = var21
			}
		end, { var20, var21 }),
		gap = var9.Gap.Small,
		fontStyle = reactModule.useMemo(function()
			-- upvalues: var9 (ref)
			return { FontSize = var9.FontSize.FontSize_300 }
		end, { var9 }),
		onActivated = var19,
		layoutOrder = layoutOrder
	})
end)