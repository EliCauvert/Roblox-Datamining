local parent = script.Parent
local parent_1 = parent.Parent
local constantsModule = require(parent_1.constants)
local dependenciesModule = require(parent_1.dependencies)
local context = parent_1.context
local _ = require(parent_1.type)
local notificationActionsFrameModule = require(parent.NotificationActionsFrame)
local notificationContentFrameModule = require(parent.NotificationContentFrame)
local useNotificationCardDataModule = require(context.useNotificationCardData)
local useNotificationCardStateModule = require(context.useNotificationCardState)
local UIBlox = dependenciesModule.UIBlox
local reactModule = require(parent_1.Parent.React)
local useStyle = UIBlox.Core.Style.useStyle
local interactable = UIBlox.Core.Control.Interactable
local defaultCardPadding = constantsModule.Padding.DefaultCardPadding
local defaultContentPadding = constantsModule.DefaultContentPadding
local defaultCardCornerRadius = constantsModule.DefaultCardCornerRadius

return function(p1)
	-- upvalues: useNotificationCardDataModule (ref), constantsModule (ref), defaultCardPadding (ref), useStyle (ref), useNotificationCardStateModule (ref), reactModule (ref), interactable (ref), defaultCardCornerRadius (ref), defaultContentPadding (ref), notificationContentFrameModule (ref), notificationActionsFrameModule (ref)
	local var1 = useNotificationCardDataModule()
	local cardSize = var1.cardSize
	local var2 = if var1.cardTransparency then var1.cardTransparency else constantsModule.CardTransparency.Default
	local var3 = if cardSize and cardSize.cardPadding then cardSize.cardPadding else defaultCardPadding
	local var4 = useStyle()
	local handleActions = var1.handleActions
	local var5 = useNotificationCardStateModule("textBody")
	local var6 = var5 and var5[1]
	
	return reactModule.createElement(interactable, {
		AutoButtonColor = false,
		BackgroundColor3 = var4.Theme.BackgroundUIDefault.Color,
		BackgroundTransparency = var2,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		onStateChanged = function() end,
		Size = UDim2.new(1, 0, 0, 0),
		[reactModule.Event.Activated] = function()
			-- upvalues: handleActions (ref), var6 (ref)
			if handleActions and var6 then
				handleActions(var6)
			end
		end
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = defaultCardCornerRadius }),
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, defaultContentPadding),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, var3),
			PaddingLeft = UDim.new(0, var3),
			PaddingRight = UDim.new(0, var3),
			PaddingTop = UDim.new(0, var3)
		}),
		NotificationContentFrame = reactModule.createElement(notificationContentFrameModule, {
			showHoldButton = p1.showHoldButton,
			shouldAutoFocus = p1.shouldAutoFocus,
			holdProgress = p1.holdProgress
		}),
		NotificationActionsFrame = reactModule.createElement(notificationActionsFrameModule, { shouldAutoFocus = p1.shouldAutoFocus })
	})
end