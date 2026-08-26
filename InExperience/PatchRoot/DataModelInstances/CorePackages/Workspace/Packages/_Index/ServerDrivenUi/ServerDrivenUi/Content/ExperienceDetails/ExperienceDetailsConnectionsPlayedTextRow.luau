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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useDispatch (ref), useDeviceType (ref), deviceType (ref), game (ref), signalsReactModule (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), reactModule (ref), playersService (ref), gameConnectionsPlayedChipClicked (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), avatarGroupType (ref), inputSize (ref), sduiTextAccessoryRow (ref)
	local layoutOrder = p1.layoutOrder
	local universeId = p1.universeId
	local name = p1.name
	local var2 = useTokens()
	local var3 = useDispatch()
	local var4 = useDeviceType() == deviceType.Phone
	local var5 = signalsReactModule.useSignalState(game.getConnectionsPlayedStore(false).getConnectionsPlayed(universeId).data)
	local var6 = signalsReactModule.useSignalState(game.getGameInfoStore(false).getAndFetchGameInfo(universeId).data)
	local var7 = if var5 then var5.userIds else {}
	local var8 = if var5 then var5.totalCount else #var7
	local var9 = useLocalization({
		connectionsRecentlyPlayed = {
			if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.FriendsRecentlyPlayed" else "Feature.Friends.Label.ConnectionsRecentlyPlayed",
			numberOfConnections = var8
		},
		connectionRecentlyPlayed = {
			if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.FriendRecentlyPlayed" else "Feature.Friends.Label.ConnectionRecentlyPlayed"
		},
		playedByUserAndOthersPlural = {
			if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.PlayedByUserAndOthers.FriendsRename" else "Feature.Friends.Label.PlayedByUserAndOthers",
			name = name or "",
			numOfOthers = var8 - 1
		},
		playedByUserAndOneOther = {
			if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.PlayedByUserAndOneOther.FriendsRename" else "Feature.Friends.Label.PlayedByUserAndOneOther",
			name = name or ""
		},
		playedByUser = { "Feature.Friends.Label.PlayedByUser", name = name or "" }
	})
	local _ = nil
	local var10 = if name and name ~= "" then if var8 == 1 then var9.playedByUser elseif var8 == 2 then var9.playedByUserAndOneOther else var9.playedByUserAndOthersPlural elseif var8 == 1 then var9.connectionRecentlyPlayed else var9.connectionsRecentlyPlayed
	local rootPlaceId = var6 and var6.rootPlaceId
	local var11 = reactModule.useCallback(function()
		-- upvalues: rootPlaceId (ref), playersService (copy), gameConnectionsPlayedChipClicked (copy), universeId (ref), var8 (ref), appPage (copy), var7 (ref), var9 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var3 (ref), navigateDown (copy)
		if rootPlaceId then
			gameConnectionsPlayedChipClicked({
				uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
				universeId = universeId,
				placeId = tostring(rootPlaceId),
				totalConnections = var8
			}, "ExperienceDetailsConnectionsPlayedChip")
		end
		local t = {
			name = appPage.SocialProofVerticalUserListSheet,
			extraProps = {
				userIds = var7,
				title = if var8 == 1 then var9.connectionRecentlyPlayed else var9.connectionsRecentlyPlayed
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var3(navigateDown(t))
	end, {
		var3, universeId, rootPlaceId, var7, var8, var9, playersService.LocalPlayer
	})
	local var12 = reactModule.useMemo(function()
		-- upvalues: var7 (ref)
		return { table.unpack(var7, 1, math.min(2, #var7)) }
	end, { var7 })
	local var13 = if var4 then var2.Color.Surface.Surface_100 else var2.Color.Surface.Surface_0
	
	return if var8 == 0 then nil else reactModule.createElement(sduiTextAccessoryRow, {
		testId = "--experience-details-connections-played-text-row",
		text = var10,
		leading = reactModule.useMemo(function()
			-- upvalues: var12 (ref), avatarGroupType (copy), inputSize (copy), var13 (ref)
			return {
				type = "AvatarGroup",
				max = 2,
				avatars = var12,
				groupType = avatarGroupType.Stacked,
				size = inputSize.XSmall,
				backplateStyle = var13
			}
		end, { var12, var13 }),
		gap = var2.Gap.Small,
		fontStyle = reactModule.useMemo(function()
			-- upvalues: var2 (ref)
			return { FontSize = var2.FontSize.FontSize_300 }
		end, { var2 }),
		onActivated = var11,
		layoutOrder = layoutOrder
	})
end)