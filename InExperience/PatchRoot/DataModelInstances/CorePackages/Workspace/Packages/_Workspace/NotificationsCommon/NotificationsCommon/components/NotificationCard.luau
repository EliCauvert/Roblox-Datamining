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

return function(p0) --[[ line: 20 ]]
	-- upvalues: useNotificationCardDataModule (ref), constantsModule (ref), defaultCardPadding (ref), useStyle (ref), react (ref), defaultCardCornerRadius (ref), defaultContentPadding (ref), notificationContentFrameModule (ref)
	local var4 = useNotificationCardDataModule()
	local cardSize = var4.cardSize
	local var5 = if cardSize and cardSize.cardPadding then cardSize.cardPadding else defaultCardPadding
	
	return react.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = useStyle().Theme.BackgroundUIDefault.Color,
		BackgroundTransparency = if var4.cardTransparency then var4.cardTransparency else constantsModule.CardTransparency.Default,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.layoutOrder
	}, {
		UICorner = react.createElement("UICorner", { CornerRadius = defaultCardCornerRadius }),
		UIListLayout = react.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, defaultContentPadding),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = react.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, var5),
			PaddingLeft = UDim.new(0, var5),
			PaddingRight = UDim.new(0, var5),
			PaddingTop = UDim.new(0, var5)
		}),
		NotificationContentFrame = react.createElement(notificationContentFrameModule)
	})
end