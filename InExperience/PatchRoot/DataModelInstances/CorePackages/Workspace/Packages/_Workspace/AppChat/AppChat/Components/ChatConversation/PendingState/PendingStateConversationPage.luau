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

return memo(function(p0)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useState (ref), useCallback (ref), useRef (ref), conversationExitTypeModule (ref), useEffect (ref), reactModule (ref), pendingStateIndicatorModule (ref), pendingStateModalContainerModule (ref)
	local var7 = cryoModule.Dictionary.join(t, p0)
	local style = var7.style or useStyle()
	local var9, var10 = useState(0)
	local var11 = useCallback(function(p1)
		-- upvalues: var10 (ref)
		var10(p1)
	end, { var10 })
	local var12 = useCallback(function()
		-- upvalues: var7 (ref)
		var7.navigateToToast({
			toastProps = { toastContent = { toastTitle = var7.networkErrorText } }
		})
	end, { var7.navigateToToast, var7.networkErrorText })
	local var13 = useRef(conversationExitTypeModule.Default)
	local var14 = useCallback(function(_, p2, p3)
		-- upvalues: var7 (ref), var13 (ref), conversationExitTypeModule (copy)
		if not var7.wideMode and p2 == Enum.SwipeDirection.Right and p3 == 1 then
			var13.current = conversationExitTypeModule.SwipedRight
			var7.navigateBack()
		end
	end, { var7.wideMode, var7.navigateBack })
	useEffect(function()
		-- upvalues: var7 (ref), var13 (ref), conversationExitTypeModule (copy)
		return function()
			-- upvalues: var7 (copy), var13 (copy), conversationExitTypeModule (copy)
			var7.onConversationUnmount(var13.current)
			var13.current = conversationExitTypeModule.Default
		end
	end, {})
	
	return reactModule.createElement("TextButton", {
		BackgroundColor3 = style.Theme.BackgroundDefault.Color,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Transparency = style.Tokens.Color.None.Transparency,
		Text = "",
		LayoutOrder = var7.layoutOrder,
		[reactModule.Event.TouchSwipe] = var14
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		PendingStateIndicator = reactModule.createElement(pendingStateIndicatorModule, { layoutOrder = 1, size = UDim2.new(1, 0, 1, -var9) }),
		ConversationBottomModal = reactModule.createElement(pendingStateModalContainerModule, {
			layoutOrder = 2,
			conversationId = var7.conversationId,
			showNetworkErrorToast = var12,
			onHeightChanged = var11
		})
	})
end)