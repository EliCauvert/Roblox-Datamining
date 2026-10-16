local Parent = script.Parent
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent1.dependencies)
local React = DependenciesModule.React
local NotificationContentFrameModule = require(Parent.NotificationContentFrame)
local UseStyleFunction = DependenciesModule.UIBlox.Core.Style.useStyle
local ConstantsModule = require(Parent1.constants)
local UseNotificationCardDataModule = require(Parent1.context.useNotificationCardData)
local DefaultCardPadding = ConstantsModule.Padding.DefaultCardPadding
local DefaultContentPadding = ConstantsModule.DefaultContentPadding
local DefaultCardCornerRadius = ConstantsModule.DefaultCardCornerRadius

return function(p1) --[[ Line: 20 ]]
	-- upvalues: UseNotificationCardDataModule (copy), ConstantsModule (copy), DefaultCardPadding (copy), UseStyleFunction (copy), React (copy), DefaultCardCornerRadius (copy), DefaultContentPadding (copy), NotificationContentFrameModule (copy)
	local UseNotificationCardDataModuleResult = UseNotificationCardDataModule()
	local CardSize = UseNotificationCardDataModuleResult.cardSize
	local CardPadding = if CardSize and CardSize.cardPadding then CardSize.cardPadding else DefaultCardPadding
	
	return React.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = UseStyleFunction().Theme.BackgroundUIDefault.Color,
		BackgroundTransparency = if UseNotificationCardDataModuleResult.cardTransparency then UseNotificationCardDataModuleResult.cardTransparency else ConstantsModule.CardTransparency.Default,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder
	}, {
		UICorner = React.createElement("UICorner", { CornerRadius = DefaultCardCornerRadius }),
		UIListLayout = React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, DefaultContentPadding),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = React.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, CardPadding),
			PaddingLeft = UDim.new(0, CardPadding),
			PaddingRight = UDim.new(0, CardPadding),
			PaddingTop = UDim.new(0, CardPadding)
		}),
		NotificationContentFrame = React.createElement(NotificationContentFrameModule)
	})
end