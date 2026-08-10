local socialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local parent = socialServerDrivenUi.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local foundationModule = require(parent.Foundation)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local signalsReactModule = require(parent.SignalsReact)
local sharedFlagsModule = require(parent.SharedFlags)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local firePlayerFriendAddTelemetryModule = require(socialServerDrivenUi.Analytics.firePlayerFriendAddTelemetry)
local sduiRequestFriendshipActionModule = require(socialServerDrivenUi.Actions.SduiRequestFriendshipAction)
local friendsStore = require(parent.DataHydration).Friends.FriendsStore
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local enums = require(parent.FriendsNetworking).Enums
local sduiActionType = sduiCoreSystemModule.SduiActionType
local iconButton = foundationModule.IconButton
local enums_1 = foundationModule.Enums
local fFlagSduiSearchPeoplePlayerTileTelemetry = sharedFlagsModule.FFlagSduiSearchPeoplePlayerTileTelemetry
local fFlagSduiRequestFriendshipActionHandler = sharedFlagsModule.FFlagSduiRequestFriendshipActionHandler
local small = enums_1.InputSize.Small
local var9 = enums.FriendshipOriginSourceType.PlayerSearch.rawValue()

return reactModule.memo(function(p0) --[[ line: 60 | named "SduiFriendRequestButton" ]]
	-- upvalues: useDispatch (ref), signalsReactModule (ref), friendsStore (ref), reactModule (ref), fFlagSduiRequestFriendshipActionHandler (ref), sduiRequestFriendshipActionModule (ref), sduiActionType (ref), var9 (ref), setCurrentToastMessage (ref), fFlagSduiSearchPeoplePlayerTileTelemetry (ref), firePlayerFriendAddTelemetryModule (ref), iconButton (ref), enums_1 (ref), small (ref)
	local userId = p0.userId
	local var10 = useDispatch()
	local var11 = signalsReactModule.useSignalState(friendsStore.get().GetFriendshipStatus(userId or "").data)
	local var12 = if var11 ~= Enum.FriendStatus.FriendRequestSent then var11 == Enum.FriendStatus.FriendRequestReceived else true
	local useCallback = reactModule.useCallback
	useCallback = useCallback(function() --[[ line: 75 ]]
		-- upvalues: var12 (ref), userId (ref), fFlagSduiRequestFriendshipActionHandler (copy), p0 (ref), sduiRequestFriendshipActionModule (copy), sduiActionType (copy), var9 (copy), friendsStore (copy), var10 (ref), setCurrentToastMessage (copy), fFlagSduiSearchPeoplePlayerTileTelemetry (copy), firePlayerFriendAddTelemetryModule (copy)
		if var12 or userId == nil then return end
		if fFlagSduiRequestFriendshipActionHandler and p0.sduiContext then
			sduiRequestFriendshipActionModule({
				actionType = sduiActionType.RequestFriendship,
				actionParams = { targetUserId = userId, source = p0.source }
			}, p0.analyticsContext, p0.sduiContext)
			
			return
		end
		friendsStore.get().RequestFriendship(userId, if typeof(p0.source) == "string" and p0.source ~= "" then p0.source else var9):andThen(function() --[[ line: 94 ]]
			-- upvalues: var10 (copy), setCurrentToastMessage (copy)
			var10(setCurrentToastMessage({
				toastMessage = "Feature.Friends.Action.FriendRequestSent",
				isLocalized = false
			}))
		end):catch(function(_) --[[ line: 100 ]]
			-- upvalues: var10 (copy), setCurrentToastMessage (copy)
			var10(setCurrentToastMessage({
				toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
				isLocalized = false
			}))
		end)
		
		if fFlagSduiSearchPeoplePlayerTileTelemetry then
			firePlayerFriendAddTelemetryModule(userId, p0.analyticsContext, p0.sduiContext)
		end
	end, {
		var12, userId, p0.source, var10,
		if fFlagSduiSearchPeoplePlayerTileTelemetry or fFlagSduiRequestFriendshipActionHandler then p0.analyticsContext else nil,
		if fFlagSduiSearchPeoplePlayerTileTelemetry or fFlagSduiRequestFriendshipActionHandler then p0.sduiContext else nil
	})
	
	return if var11 == nil or var11 == Enum.FriendStatus.Friend then nil else reactModule.createElement("TextButton", {
		BackgroundTransparency = 1,
		Text = "",
		AutomaticSize = Enum.AutomaticSize.XY,
		LayoutOrder = p0.layoutOrder,
		Visible = p0.visible ~= nil or p0.visible
	}, {
		Button = reactModule.createElement(iconButton, {
			icon = "icons/common/plus_small",
			isCircular = true,
			variant = enums_1.ButtonVariant.OverMedia,
			isDisabled = var12,
			size = p0.size or small,
			onActivated = useCallback
		})
	})
end)