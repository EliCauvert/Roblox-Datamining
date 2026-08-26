local parent = script.Parent
local parent_1 = parent.Parent
local context = parent_1.context
local dependenciesModule = require(parent_1.dependencies)
local react = dependenciesModule.React
local notificationContentFrameModule = require(parent.NotificationContentFrame)
local useStyle = dependenciesModule.UIBlox.Core.Style.useStyle
local constantsModule = require(parent_1.constants)
local useNotificationCardDataModule = require(context.useNotificationCardData)
local defaultCardPadding = constantsModule.Padding.DefaultCardPadding
local defaultContentPadding = constantsModule.DefaultContentPadding
local defaultCardCornerRadius = constantsModule.DefaultCardCornerRadius

return function(p1)
	-- upvalues: useNotificationCardDataModule (ref), constantsModule (ref), defaultCardPadding (ref), useStyle (ref), react (ref), defaultCardCornerRadius (ref), defaultContentPadding (ref), notificationContentFrameModule (ref)
	local var1 = useNotificationCardDataModule()
	local cardSize = var1.cardSize
	local var2 = if cardSize and cardSize.cardPadding then cardSize.cardPadding else defaultCardPadding
	
	return react.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = useStyle().Theme.BackgroundUIDefault.Color,
		BackgroundTransparency = if var1.cardTransparency then var1.cardTransparency else constantsModule.CardTransparency.Default,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder
	}, {
		UICorner = react.createElement("UICorner", { CornerRadius = defaultCardCornerRadius }),
		UIListLayout = react.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, defaultContentPadding),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = react.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, var2),
			PaddingLeft = UDim.new(0, var2),
			PaddingRight = UDim.new(0, var2),
			PaddingTop = UDim.new(0, var2)
		}),
		NotificationContentFrame = react.createElement(notificationContentFrameModule)
	})
end