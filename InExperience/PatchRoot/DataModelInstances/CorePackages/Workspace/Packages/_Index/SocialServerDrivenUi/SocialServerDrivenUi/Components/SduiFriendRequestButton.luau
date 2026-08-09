local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local foundationModule = require(parent.Foundation)
local signalsReactModule = require(parent.SignalsReact)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local friendsStore = require(parent.DataHydration).Friends.FriendsStore
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local enums = require(parent.FriendsNetworking).Enums
local button = foundationModule.Button
local enums_1 = foundationModule.Enums
local small = enums_1.InputSize.Small
local var4 = enums.FriendshipOriginSourceType.PlayerSearch.rawValue()

return reactModule.memo(function(p0) --[[ line: 46 | named "SduiFriendRequestButton" ]]
	-- upvalues: useDispatch (ref), signalsReactModule (ref), friendsStore (ref), reactModule (ref), var4 (ref), setCurrentToastMessage (ref), button (ref), enums_1 (ref), small (ref)
	local userId = p0.userId
	local var5 = useDispatch()
	local var6 = signalsReactModule.useSignalState(friendsStore.get().GetFriendshipStatus(userId or "").data)
	local var7 = if var6 ~= Enum.FriendStatus.FriendRequestSent then var6 == Enum.FriendStatus.FriendRequestReceived else true
	
	return if var6 == nil or var6 == Enum.FriendStatus.Friend then nil else reactModule.createElement("TextButton", {
		BackgroundTransparency = 1,
		Text = "",
		AutomaticSize = Enum.AutomaticSize.XY,
		LayoutOrder = p0.layoutOrder,
		Visible = p0.visible ~= nil or p0.visible
	}, {
		Button = reactModule.createElement(button, {
			icon = "icons/common/plus",
			variant = if var7 then enums_1.ButtonVariant.SubEmphasis else enums_1.ButtonVariant.OverMedia,
			isDisabled = var7,
			size = p0.size or small,
			onActivated = if not var7 then reactModule.useCallback(function() --[[ line: 60 ]]
				-- upvalues: var7 (ref), userId (ref), p0 (ref), var4 (copy), friendsStore (copy), var5 (ref), setCurrentToastMessage (copy)
				if var7 or userId == nil then return end
				friendsStore.get().RequestFriendship(userId, if typeof(p0.source) == "string" and p0.source ~= "" then p0.source else var4):andThen(function() --[[ line: 71 ]]
					-- upvalues: var5 (copy), setCurrentToastMessage (copy)
					var5(setCurrentToastMessage({
						toastMessage = "Feature.Friends.Action.FriendRequestSent",
						isLocalized = false
					}))
				end):catch(function(_) --[[ line: 77 ]]
					-- upvalues: var5 (copy), setCurrentToastMessage (copy)
					var5(setCurrentToastMessage({
						toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
						isLocalized = false
					}))
				end)
			end, { var7, userId, p0.source, var5 }) else nil
		})
	})
end)