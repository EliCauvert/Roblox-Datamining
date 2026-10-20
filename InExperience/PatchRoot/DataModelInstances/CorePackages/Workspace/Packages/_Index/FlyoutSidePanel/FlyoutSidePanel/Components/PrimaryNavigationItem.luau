local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local StatusIndicator = FoundationModule.StatusIndicator
local StatusIndicatorVariant = FoundationModule.Enums.StatusIndicatorVariant
local ConstantsModule = require(script.Parent.Parent.Constants)
local GetTestIdFunction = require(Parent.RoactUtils).getTestId
local FFlagLuaAppAddTestIdsForArrow = require(Parent.SharedFlags).FFlagLuaAppAddTestIdsForArrow

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy), FFlagLuaAppAddTestIdsForArrow (copy), GetTestIdFunction (copy), Icon (copy), IconSize (copy), Text (copy), StatusIndicator (copy), StatusIndicatorVariant (copy), ConstantsModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = p1.layoutOrder }, {
		PrimaryNavigationButton = ReactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = "",
			[ReactModule.Event.Activated] = p1.onActivated,
			[ReactModule.Tag] = if FFlagLuaAppAddTestIdsForArrow then GetTestIdFunction("core-ui-flyout-nav-item", p1.testId) else nil
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, UseTokensResult.Gap.Small)
			}),
			IconContainer = if p1.icon then ReactModule.createElement(FoundationModule.View, { tag = "auto-xy padding-small", LayoutOrder = 1 }, {
				Icon = ReactModule.createElement(Icon, {
					style = UseTokensResult.Color.Content.Emphasis,
					name = p1.icon,
					size = IconSize.Medium
				})
			}) else nil,
			Text = if p1.text then ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy padding-y-small text-align-x-left text-truncate-end text-title-large text-wrap content-emphasis",
				Text = p1.text
			}) else nil
		}),
		StatusIndicator = if p1.notificationCount then ReactModule.createElement(StatusIndicator, {
			LayoutOrder = 3,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -UseTokensResult.Gap.Medium, 0.5, 0),
			value = p1.notificationCount,
			variant = StatusIndicatorVariant.Emphasis,
			max = ConstantsModule.MAX_SHOWN_STATUS_INDICATOR_COUNT
		}) else nil
	})
end