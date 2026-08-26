local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local useState = reactModule.useState
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local conversationExitTypeModule = require(appChat.Analytics.Enums.ConversationExitType)
local pendingStateIndicatorModule = require(script.Parent.PendingStateIndicator)
local pendingStateModalContainerModule = require(script.Parent.PendingStateModalContainer)
local t = {
	topBarHeight = 0,
	networkErrorText = "PLACEHOLDER There was a network error, please try again later",
	shouldShowPhoneVerificationUpsell = false,
	shouldShowIneligibleModal = false,
	onConversationUnmount = function(_) end,
	navigateToToast = function(_) end,
	navigateBack = function() end
}

return memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useState (ref), useCallback (ref), useRef (ref), conversationExitTypeModule (ref), useEffect (ref), reactModule (ref), pendingStateIndicatorModule (ref), pendingStateModalContainerModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local style = var1.style or useStyle()
	local var2, var3 = useState(0)
	local var4 = useCallback(function(p2)
		-- upvalues: var3 (ref)
		var3(p2)
	end, { var3 })
	local var5 = useCallback(function()
		-- upvalues: var1 (ref)
		var1.navigateToToast({
			toastProps = { toastContent = { toastTitle = var1.networkErrorText } }
		})
	end, { var1.navigateToToast, var1.networkErrorText })
	local var6 = useRef(conversationExitTypeModule.Default)
	local var7 = useCallback(function(_, p2, p3)
		-- upvalues: var1 (ref), var6 (ref), conversationExitTypeModule (copy)
		if not var1.wideMode and p2 == Enum.SwipeDirection.Right and p3 == 1 then
			var6.current = conversationExitTypeModule.SwipedRight
			var1.navigateBack()
		end
	end, { var1.wideMode, var1.navigateBack })
	useEffect(function()
		-- upvalues: var1 (ref), var6 (ref), conversationExitTypeModule (copy)
		return function()
			-- upvalues: var1 (copy), var6 (copy), conversationExitTypeModule (copy)
			var1.onConversationUnmount(var6.current)
			var6.current = conversationExitTypeModule.Default
		end
	end, {})
	
	return reactModule.createElement("TextButton", {
		BackgroundColor3 = style.Theme.BackgroundDefault.Color,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Transparency = style.Tokens.Color.None.Transparency,
		Text = "",
		LayoutOrder = var1.layoutOrder,
		[reactModule.Event.TouchSwipe] = var7
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		PendingStateIndicator = reactModule.createElement(pendingStateIndicatorModule, { layoutOrder = 1, size = UDim2.new(1, 0, 1, -var2) }),
		ConversationBottomModal = reactModule.createElement(pendingStateModalContainerModule, {
			layoutOrder = 2,
			conversationId = var1.conversationId,
			showNetworkErrorToast = var5,
			onHeightChanged = var4
		})
	})
end)