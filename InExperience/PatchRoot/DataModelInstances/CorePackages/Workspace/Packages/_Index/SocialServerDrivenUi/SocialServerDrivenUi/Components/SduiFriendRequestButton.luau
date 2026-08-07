local socialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local parent = socialServerDrivenUi.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCoreSystem)
local signalsReactModule = require(parent.SignalsReact)
local sharedFlagsModule = require(parent.SharedFlags)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local firePlayerFriendAddTelemetryModule = require(socialServerDrivenUi.Analytics.firePlayerFriendAddTelemetry)
local friendsStore = require(parent.DataHydration).Friends.FriendsStore
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local enums = require(parent.FriendsNetworking).Enums
local iconButton = foundationModule.IconButton
local enums_1 = foundationModule.Enums
local fFlagSduiSearchPeoplePlayerTileTelemetry = sharedFlagsModule.FFlagSduiSearchPeoplePlayerTileTelemetry
local small = enums_1.InputSize.Small
local var7 = enums.FriendshipOriginSourceType.PlayerSearch.rawValue()

return reactModule.memo(function(p0) --[[ line: 56 | named "SduiFriendRequestButton" ]]
	-- upvalues: useDispatch (ref), signalsReactModule (ref), friendsStore (ref), reactModule (ref), var7 (ref), setCurrentToastMessage (ref), fFlagSduiSearchPeoplePlayerTileTelemetry (ref), firePlayerFriendAddTelemetryModule (ref), iconButton (ref), enums_1 (ref), small (ref)
	local userId = p0.userId
	local var8 = useDispatch()
	local var9 = signalsReactModule.useSignalState(friendsStore.get().GetFriendshipStatus(userId or "").data)
	local var10 = if var9 ~= Enum.FriendStatus.FriendRequestSent then var9 == Enum.FriendStatus.FriendRequestReceived else true
	
	return if var9 == nil or var9 == Enum.FriendStatus.Friend then nil else reactModule.createElement("TextButton", {
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
			isDisabled = var10,
			size = p0.size or small,
			onActivated = reactModule.useCallback(function() --[[ line: 71 ]]
				-- upvalues: var10 (ref), userId (ref), p0 (ref), var7 (copy), friendsStore (copy), var8 (ref), setCurrentToastMessage (copy), fFlagSduiSearchPeoplePlayerTileTelemetry (copy), firePlayerFriendAddTelemetryModule (copy)
				if var10 or userId == nil then return end
				friendsStore.get().RequestFriendship(userId, if typeof(p0.source) == "string" and p0.source ~= "" then p0.source else var7):andThen(function() --[[ line: 82 ]]
					-- upvalues: var8 (copy), setCurrentToastMessage (copy)
					var8(setCurrentToastMessage({
						toastMessage = "Feature.Friends.Action.FriendRequestSent",
						isLocalized = false
					}))
				end):catch(function(_) --[[ line: 88 ]]
					-- upvalues: var8 (copy), setCurrentToastMessage (copy)
					var8(setCurrentToastMessage({
						toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
						isLocalized = false
					}))
				end)
				
				if fFlagSduiSearchPeoplePlayerTileTelemetry then
					firePlayerFriendAddTelemetryModule(userId, p0.analyticsContext, p0.sduiContext)
				end
			end, {
				var10, userId, p0.source, var8,
				if fFlagSduiSearchPeoplePlayerTileTelemetry then p0.analyticsContext else nil,
				if fFlagSduiSearchPeoplePlayerTileTelemetry then p0.sduiContext else nil
			})
		})
	})
end)