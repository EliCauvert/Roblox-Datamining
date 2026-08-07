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

return function(p0) --[[ line: 22 | named "PrimaryNavigationItem" ]]
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref), icon (ref), iconSize (ref), text (ref), statusIndicator (ref), flags (ref), statusIndicatorVariant (ref), constantsModule (ref)
	local var3 = useTokens()
	
	return reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = p0.layoutOrder }, {
		PrimaryNavigationButton = reactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = "",
			[reactModule.Event.Activated] = p0.onActivated
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, var3.Gap.Small)
			}),
			IconContainer = if p0.icon then reactModule.createElement(foundationModule.View, { tag = "auto-xy padding-small", LayoutOrder = 1 }, {
				Icon = reactModule.createElement(icon, {
					style = var3.Color.Content.Emphasis,
					name = p0.icon,
					size = iconSize.Medium
				})
			}) else nil,
			Text = if p0.text then reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy padding-y-small text-align-x-left text-truncate-end text-title-large text-wrap content-emphasis",
				Text = p0.text
			}) else nil
		}),
		StatusIndicator = if p0.notificationCount then reactModule.createElement(statusIndicator, {
			LayoutOrder = 3,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -var3.Gap.Medium, 0.5, 0),
			value = p0.notificationCount,
			variant = if flags.FoundationStatusIndicatorVariantExperiment then statusIndicatorVariant.Contrast_Experiment else statusIndicatorVariant.Emphasis,
			max = constantsModule.MAX_SHOWN_STATUS_INDICATOR_COUNT
		}) else nil
	})
end