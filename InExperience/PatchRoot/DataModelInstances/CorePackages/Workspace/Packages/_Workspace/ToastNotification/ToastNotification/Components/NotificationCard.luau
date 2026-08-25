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

return function(p0)
	-- upvalues: useNotificationCardDataModule (ref), constantsModule (ref), defaultCardPadding (ref), useStyle (ref), useNotificationCardStateModule (ref), reactModule (ref), interactable (ref), defaultCardCornerRadius (ref), defaultContentPadding (ref), notificationContentFrameModule (ref), notificationActionsFrameModule (ref)
	local var7 = useNotificationCardDataModule()
	local cardSize = var7.cardSize
	local var8 = if var7.cardTransparency then var7.cardTransparency else constantsModule.CardTransparency.Default
	local var9 = if cardSize and cardSize.cardPadding then cardSize.cardPadding else defaultCardPadding
	local var10 = useStyle()
	local handleActions = var7.handleActions
	local var11 = useNotificationCardStateModule("textBody")
	local var12 = var11 and var11[1]
	
	return reactModule.createElement(interactable, {
		AutoButtonColor = false,
		BackgroundColor3 = var10.Theme.BackgroundUIDefault.Color,
		BackgroundTransparency = var8,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		onStateChanged = function() end,
		Size = UDim2.new(1, 0, 0, 0),
		[reactModule.Event.Activated] = function()
			-- upvalues: handleActions (ref), var12 (ref)
			if handleActions and var12 then
				handleActions(var12)
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
			PaddingBottom = UDim.new(0, var9),
			PaddingLeft = UDim.new(0, var9),
			PaddingRight = UDim.new(0, var9),
			PaddingTop = UDim.new(0, var9)
		}),
		NotificationContentFrame = reactModule.createElement(notificationContentFrameModule, {
			showHoldButton = p0.showHoldButton,
			shouldAutoFocus = p0.shouldAutoFocus,
			holdProgress = p0.holdProgress
		}),
		NotificationActionsFrame = reactModule.createElement(notificationActionsFrameModule, { shouldAutoFocus = p0.shouldAutoFocus })
	})
end