local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local Players = game:GetService("Players")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsReactModule = require(Parent.SignalsReact)
local GameConnectionsPlayedChipClickedFunction = require(Parent.DiscoveryAnalytics).Events.gameConnectionsPlayedChipClicked
local SduiTextAccessoryRow = require(Parent.SduiSharedContent).SduiTextAccessoryRow
local AvatarGroupType = FoundationModule.Enums.AvatarGroupType
local InputSize = FoundationModule.Enums.InputSize
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Game1 = require(Parent.DataHydration).Game
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseDeviceTypeFunction = require(Parent.RobloxAppHooks).useDeviceType
local DeviceType = require(Parent.RobloxAppEnums).DeviceType
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseDispatchFunction (copy), UseDeviceTypeFunction (copy), DeviceType (copy), Game1 (copy), SignalsReactModule (copy), UseLocalizationFunction (copy), ReactModule (copy), Players (copy), GameConnectionsPlayedChipClickedFunction (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), AvatarGroupType (copy), InputSize (copy), SduiTextAccessoryRow (copy)
	local LayoutOrder = p1.layoutOrder
	local UniverseId = p1.universeId
	local Name = p1.name
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local IsUseDeviceTypeResultMatch = UseDeviceTypeFunction() == DeviceType.Phone
	local UseSignalStateResult = SignalsReactModule.useSignalState(Game1.getConnectionsPlayedStore(false).getConnectionsPlayed(UniverseId).data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(Game1.getGameInfoStore(false).getAndFetchGameInfo(UniverseId).data)
	local UserIds = if UseSignalStateResult then UseSignalStateResult.userIds else {}
	local TotalCount = if UseSignalStateResult then UseSignalStateResult.totalCount else #UserIds
	local UseLocalizationResult = UseLocalizationFunction({
		connectionsRecentlyPlayed = {
			"Feature.Friends.Label.FriendsRecentlyPlayed",
			numberOfConnections = TotalCount
		},
		connectionRecentlyPlayed = { "Feature.Friends.Label.FriendRecentlyPlayed" },
		playedByUserAndOthersPlural = {
			"Feature.Friends.Label.PlayedByUserAndOthers.FriendsRename",
			name = Name or "",
			numOfOthers = TotalCount - 1
		},
		playedByUserAndOneOther = {
			"Feature.Friends.Label.PlayedByUserAndOneOther.FriendsRename",
			name = Name or ""
		},
		playedByUser = { "Feature.Friends.Label.PlayedByUser", name = Name or "" }
	})
	local PlayedByUser = if Name and Name ~= "" then if TotalCount == 1 then UseLocalizationResult.playedByUser elseif TotalCount == 2 then UseLocalizationResult.playedByUserAndOneOther else UseLocalizationResult.playedByUserAndOthersPlural elseif TotalCount == 1 then UseLocalizationResult.connectionRecentlyPlayed else UseLocalizationResult.connectionsRecentlyPlayed
	local RootPlaceId = UseSignalStateResult1 and UseSignalStateResult1.rootPlaceId
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: RootPlaceId (copy), Players (upval), GameConnectionsPlayedChipClickedFunction (upval), UniverseId (copy), TotalCount (copy), AppPage (upval), UserIds (copy), UseLocalizationResult (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
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
		UseDispatchResult, UniverseId, RootPlaceId, UserIds, TotalCount,
		UseLocalizationResult, Players.LocalPlayer
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UserIds (copy)
		return { table.unpack(UserIds, 1, (math.min(2, #UserIds))) }
	end, { UserIds })
	local Surface100 = if IsUseDeviceTypeResultMatch then UseTokensResult.Color.Surface.Surface_100 else UseTokensResult.Color.Surface.Surface_0
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), AvatarGroupType (upval), InputSize (upval), Surface100 (copy)
		return {
			type = "AvatarGroup",
			max = 2,
			avatars = UseMemoResult,
			groupType = AvatarGroupType.Stacked,
			size = InputSize.XSmall,
			backplateStyle = Surface100
		}
	end, { UseMemoResult, Surface100 })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseTokensResult (copy)
		return { FontSize = UseTokensResult.FontSize.FontSize_300 }
	end, { UseTokensResult })
	
	return if TotalCount == 0 then nil else ReactModule.createElement(SduiTextAccessoryRow, {
		testId = "--experience-details-connections-played-text-row",
		text = PlayedByUser,
		leading = UseMemoResult1,
		gap = UseTokensResult.Gap.Small,
		fontStyle = UseMemoResult2,
		onActivated = UseResult,
		layoutOrder = LayoutOrder
	})
end)