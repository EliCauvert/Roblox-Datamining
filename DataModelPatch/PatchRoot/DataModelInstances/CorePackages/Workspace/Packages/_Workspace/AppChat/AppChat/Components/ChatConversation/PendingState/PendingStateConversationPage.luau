local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local ConversationExitTypeModule = require(AppChat.Analytics.Enums.ConversationExitType)
local PendingStateIndicatorModule = require(script.Parent.PendingStateIndicator)
local PendingStateModalContainerModule = require(script.Parent.PendingStateModalContainer)
local config = {
	topBarHeight = 0,
	networkErrorText = "PLACEHOLDER There was a network error, please try again later",
	shouldShowPhoneVerificationUpsell = false,
	shouldShowIneligibleModal = false,
	onConversationUnmount = function(_) end,
	navigateToToast = function(_) end,
	navigateBack = function() end
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), UseStateFunction (copy), UseCallbackFunction (copy), UseRefFunction (copy), ConversationExitTypeModule (copy), UseEffectFunction (copy), ReactModule (copy), PendingStateIndicatorModule (copy), PendingStateModalContainerModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	local Style = JoinResult.style or UseStyleResult
	local UseStateResult, UseStateResult2 = UseStateFunction(0)
	local UseCallbackResult = UseCallbackFunction(function(p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2)
	end, { UseStateResult2 })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: JoinResult (copy)
		JoinResult.navigateToToast({
			toastProps = {
				toastContent = { toastTitle = JoinResult.networkErrorText }
			}
		})
	end, { JoinResult.navigateToToast, JoinResult.networkErrorText })
	local UseRefResult = UseRefFunction(ConversationExitTypeModule.Default)
	local UseCallbackResult2 = UseCallbackFunction(function(_, SwipeDirection, p2)
		-- upvalues: JoinResult (copy), UseRefResult (copy), ConversationExitTypeModule (upval)
		if not JoinResult.wideMode and SwipeDirection == Enum.SwipeDirection.Right and p2 == 1 then
			UseRefResult.current = ConversationExitTypeModule.SwipedRight
			JoinResult.navigateBack()
		end
	end, { JoinResult.wideMode, JoinResult.navigateBack })
	UseEffectFunction(function()
		-- upvalues: JoinResult (copy), UseRefResult (copy), ConversationExitTypeModule (upval)
		return function()
			-- upvalues: JoinResult (upval), UseRefResult (upval), ConversationExitTypeModule (upval)
			JoinResult.onConversationUnmount(UseRefResult.current)
			UseRefResult.current = ConversationExitTypeModule.Default
		end
	end, {})
	
	return ReactModule.createElement("TextButton", {
		BackgroundColor3 = Style.Theme.BackgroundDefault.Color,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Transparency = Style.Tokens.Color.None.Transparency,
		Text = "",
		LayoutOrder = JoinResult.layoutOrder,
		[ReactModule.Event.TouchSwipe] = UseCallbackResult2
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		PendingStateIndicator = ReactModule.createElement(PendingStateIndicatorModule, {
			layoutOrder = 1,
			size = UDim2.new(1, 0, 1, -UseStateResult)
		}),
		ConversationBottomModal = ReactModule.createElement(PendingStateModalContainerModule, {
			layoutOrder = 2,
			conversationId = JoinResult.conversationId,
			showNetworkErrorToast = UseCallbackResult1,
			onHeightChanged = UseCallbackResult
		})
	})
end)