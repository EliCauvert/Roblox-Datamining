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
local var1 = enums.FriendshipOriginSourceType.PlayerSearch.rawValue()

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), signalsReactModule (ref), friendsStore (ref), reactModule (ref), fFlagSduiRequestFriendshipActionHandler (ref), sduiRequestFriendshipActionModule (ref), sduiActionType (ref), var1 (ref), setCurrentToastMessage (ref), fFlagSduiSearchPeoplePlayerTileTelemetry (ref), firePlayerFriendAddTelemetryModule (ref), iconButton (ref), enums_1 (ref), small (ref)
	local userId = p1.userId
	local var2 = useDispatch()
	local var3 = signalsReactModule.useSignalState(friendsStore.get().GetFriendshipStatus(userId or "").data)
	local var4 = if var3 ~= Enum.FriendStatus.FriendRequestSent then var3 == Enum.FriendStatus.FriendRequestReceived else true
	local useCallback = reactModule.useCallback
	useCallback = useCallback(function()
		-- upvalues: var4 (ref), userId (ref), fFlagSduiRequestFriendshipActionHandler (copy), p1 (ref), sduiRequestFriendshipActionModule (copy), sduiActionType (copy), var1 (copy), friendsStore (copy), var2 (ref), setCurrentToastMessage (copy), fFlagSduiSearchPeoplePlayerTileTelemetry (copy), firePlayerFriendAddTelemetryModule (copy)
		if var4 or userId == nil then return end
		if fFlagSduiRequestFriendshipActionHandler and p1.sduiContext then
			sduiRequestFriendshipActionModule({
				actionType = sduiActionType.RequestFriendship,
				actionParams = { targetUserId = userId, source = p1.source }
			}, p1.analyticsContext, p1.sduiContext)
			
			return
		end
		friendsStore.get().RequestFriendship(userId, if typeof(p1.source) == "string" and p1.source ~= "" then p1.source else var1):andThen(function()
			-- upvalues: var2 (copy), setCurrentToastMessage (copy)
			var2(setCurrentToastMessage({
				toastMessage = "Feature.Friends.Action.FriendRequestSent",
				isLocalized = false
			}))
		end):catch(function(_)
			-- upvalues: var2 (copy), setCurrentToastMessage (copy)
			var2(setCurrentToastMessage({
				toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
				isLocalized = false
			}))
		end)
		
		if fFlagSduiSearchPeoplePlayerTileTelemetry then
			firePlayerFriendAddTelemetryModule(userId, p1.analyticsContext, p1.sduiContext)
		end
	end, {
		var4, userId, p1.source, var2,
		if fFlagSduiSearchPeoplePlayerTileTelemetry or fFlagSduiRequestFriendshipActionHandler then p1.analyticsContext else nil,
		if fFlagSduiSearchPeoplePlayerTileTelemetry or fFlagSduiRequestFriendshipActionHandler then p1.sduiContext else nil
	})
	
	return if var3 == nil or var3 == Enum.FriendStatus.Friend then nil else reactModule.createElement("TextButton", {
		BackgroundTransparency = 1,
		Text = "",
		AutomaticSize = Enum.AutomaticSize.XY,
		LayoutOrder = p1.layoutOrder,
		Visible = p1.visible ~= nil or p1.visible
	}, {
		Button = reactModule.createElement(iconButton, {
			icon = "icons/common/plus_small",
			isCircular = true,
			variant = enums_1.ButtonVariant.OverMedia,
			isDisabled = var4,
			size = p1.size or small,
			onActivated = useCallback
		})
	})
end)