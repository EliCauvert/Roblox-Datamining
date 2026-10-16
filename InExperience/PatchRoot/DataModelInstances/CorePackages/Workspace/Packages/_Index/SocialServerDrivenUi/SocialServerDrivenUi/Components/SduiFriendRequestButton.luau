local SocialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local Parent = SocialServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsReactModule = require(Parent.SignalsReact)
local SharedFlagsModule = require(Parent.SharedFlags)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local FirePlayerFriendAddTelemetryModule = require(SocialServerDrivenUi.Analytics.firePlayerFriendAddTelemetry)
local SduiRequestFriendshipActionModule = require(SocialServerDrivenUi.Actions.SduiRequestFriendshipAction)
local GetCurrentUserIdModule = require(SocialServerDrivenUi.Common.getCurrentUserId)
local FriendsStore = require(Parent.DataHydration).Friends.FriendsStore
local FriendsStoreChallengeNetworkModule = require(SocialServerDrivenUi.Networking.friendsStoreChallengeNetwork)
local FFlagEnableFriendsStoreChallengeInterceptor = require(Parent.SharedFlags).FFlagEnableFriendsStoreChallengeInterceptor
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local SduiActionType = require(Parent.SduiCoreSystem).SduiActionType
local IconButton = FoundationModule.IconButton
local Enums = FoundationModule.Enums
local FFlagSduiSearchPeoplePlayerTileTelemetry = SharedFlagsModule.FFlagSduiSearchPeoplePlayerTileTelemetry
local FFlagSduiRequestFriendshipActionHandler = SharedFlagsModule.FFlagSduiRequestFriendshipActionHandler
local FFlagSduiFriendRequestButtonHideForSelfModule = require(SocialServerDrivenUi.Flags.FFlagSduiFriendRequestButtonHideForSelf)
local Small = Enums.InputSize.Small
local RawValueResult = require(Parent.FriendsNetworking).Enums.FriendshipOriginSourceType.PlayerSearch.rawValue()

return ReactModule.memo(function(p1) --[[ Line: 67 | Named "SduiFriendRequestButton" ]]
	-- upvalues: UseDispatchFunction (copy), SignalsReactModule (copy), FriendsStore (copy), ReactModule (copy), FFlagSduiRequestFriendshipActionHandler (copy), SduiRequestFriendshipActionModule (copy), SduiActionType (copy), RawValueResult (copy), FFlagEnableFriendsStoreChallengeInterceptor (copy), FriendsStoreChallengeNetworkModule (copy), SetCurrentToastMessageFunction (copy), FFlagSduiSearchPeoplePlayerTileTelemetry (copy), FirePlayerFriendAddTelemetryModule (copy), FFlagSduiFriendRequestButtonHideForSelfModule (copy), GetCurrentUserIdModule (copy), IconButton (copy), Enums (copy), Small (copy)
	local UserId = p1.userId
	local UseDispatchResult = UseDispatchFunction()
	local UseSignalStateResult = SignalsReactModule.useSignalState(FriendsStore.get().GetFriendshipStatus(UserId or "").data)
	local IsUseSignalStateResultMatch: boolean = UseSignalStateResult == Enum.FriendStatus.FriendRequestSent or UseSignalStateResult == Enum.FriendStatus.FriendRequestReceived
	local UseResult = ReactModule.useCallback(function() --[[ Line: 82 ]]
		-- upvalues: IsUseSignalStateResultMatch (copy), UserId (copy), FFlagSduiRequestFriendshipActionHandler (upval), p1 (copy), SduiRequestFriendshipActionModule (upval), SduiActionType (upval), RawValueResult (upval), FriendsStore (upval), FFlagEnableFriendsStoreChallengeInterceptor (upval), FriendsStoreChallengeNetworkModule (upval), UseDispatchResult (copy), SetCurrentToastMessageFunction (upval), FFlagSduiSearchPeoplePlayerTileTelemetry (upval), FirePlayerFriendAddTelemetryModule (upval)
		if IsUseSignalStateResultMatch or UserId == nil then return end
		if FFlagSduiRequestFriendshipActionHandler and p1.sduiContext then
			SduiRequestFriendshipActionModule({
				actionType = SduiActionType.RequestFriendship,
				actionParams = { targetUserId = UserId, source = p1.source }
			}, p1.analyticsContext, p1.sduiContext)
			
			return
		end
		FriendsStore.get().RequestFriendship(UserId, if typeof(p1.source) == "string" and p1.source ~= "" then p1.source else RawValueResult, nil, if FFlagEnableFriendsStoreChallengeInterceptor then FriendsStoreChallengeNetworkModule else nil):andThen(function() --[[ Line: 106 ]]
			-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval)
			UseDispatchResult(SetCurrentToastMessageFunction({
				toastMessage = "Feature.Friends.Action.FriendRequestSent",
				isLocalized = false
			}))
		end):catch(function(_) --[[ Line: 112 ]]
			-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval)
			UseDispatchResult(SetCurrentToastMessageFunction({
				toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
				isLocalized = false
			}))
		end)
		
		if FFlagSduiSearchPeoplePlayerTileTelemetry then
			FirePlayerFriendAddTelemetryModule(UserId, p1.analyticsContext, p1.sduiContext)
		end
	end, {
		IsUseSignalStateResultMatch, UserId, p1.source, UseDispatchResult,
		if FFlagSduiSearchPeoplePlayerTileTelemetry or FFlagSduiRequestFriendshipActionHandler then p1.analyticsContext else nil,
		if FFlagSduiSearchPeoplePlayerTileTelemetry or FFlagSduiRequestFriendshipActionHandler then p1.sduiContext else nil
	})
	
	return if UseSignalStateResult == nil or UseSignalStateResult == Enum.FriendStatus.Friend then nil elseif FFlagSduiFriendRequestButtonHideForSelfModule and UserId ~= nil and UserId == GetCurrentUserIdModule() then nil else ReactModule.createElement("TextButton", {
		BackgroundTransparency = 1,
		Text = "",
		AutomaticSize = Enum.AutomaticSize.XY,
		LayoutOrder = p1.layoutOrder,
		Visible = p1.visible == nil or p1.visible
	}, {
		Button = ReactModule.createElement(IconButton, {
			icon = "icons/common/plus_small",
			isCircular = true,
			variant = Enums.ButtonVariant.OverMedia,
			isDisabled = IsUseSignalStateResultMatch,
			size = p1.size or Small,
			onActivated = UseResult
		})
	})
end)