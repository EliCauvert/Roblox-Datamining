local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local statusIndicator = foundationModule.StatusIndicator
local statusIndicatorVariant = foundationModule.Enums.StatusIndicatorVariant
local flags = foundationModule.Utility.Flags
local constantsModule = require(script.Parent.Parent.Constants)

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref), icon (ref), iconSize (ref), text (ref), statusIndicator (ref), flags (ref), statusIndicatorVariant (ref), constantsModule (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = p1.layoutOrder }, {
		PrimaryNavigationButton = reactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = "",
			[reactModule.Event.Activated] = p1.onActivated
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, var1.Gap.Small)
			}),
			IconContainer = if p1.icon then reactModule.createElement(foundationModule.View, { tag = "auto-xy padding-small", LayoutOrder = 1 }, {
				Icon = reactModule.createElement(icon, {
					style = var1.Color.Content.Emphasis,
					name = p1.icon,
					size = iconSize.Medium
				})
			}) else nil,
			Text = if p1.text then reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy padding-y-small text-align-x-left text-truncate-end text-title-large text-wrap content-emphasis",
				Text = p1.text
			}) else nil
		}),
		StatusIndicator = if p1.notificationCount then reactModule.createElement(statusIndicator, {
			LayoutOrder = 3,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -var1.Gap.Medium, 0.5, 0),
			value = p1.notificationCount,
			variant = if flags.FoundationStatusIndicatorVariantExperiment then statusIndicatorVariant.Contrast_Experiment else statusIndicatorVariant.Emphasis,
			max = constantsModule.MAX_SHOWN_STATUS_INDICATOR_COUNT
		}) else nil
	})
end