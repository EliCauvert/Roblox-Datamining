local AvatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local Parent = AvatarExperienceUIKit.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetFixedTabHeightModule = require(AvatarExperienceUIKit.Utils.getFixedTabHeight)
local FFlagAXCategoryMenuVisualFixes = require(Parent.AvatarExperienceFlags).FFlagAXCategoryMenuVisualFixes
local Text = FoundationModule.Text
local View = FoundationModule.View
local BackgroundStyle = { Transparency = 1 }
local config = {
	FillDirection = Enum.FillDirection.Vertical,
	HorizontalAlignment = Enum.HorizontalAlignment.Left,
	VerticalAlignment = Enum.VerticalAlignment.Center,
	SortOrder = Enum.SortOrder.LayoutOrder
}
local BackgroundStyle1 = { Transparency = 1 }

return (ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), BackgroundStyle (copy), FFlagAXCategoryMenuVisualFixes (copy), GetFixedTabHeightModule (copy), config (copy), Text (copy), BackgroundStyle1 (copy)
	local UseTokensResult = UseTokensFunction()
	local Padding = Frame.padding or Vector2.new(UseTokensResult.Padding.Small, UseTokensResult.Padding.Medium)
	
	return ReactModule.createElement(View, {
		ref = Ref,
		onActivated = Frame.onActivated,
		backgroundStyle = BackgroundStyle,
		padding = if FFlagAXCategoryMenuVisualFixes then Vector2.new(Padding.X, 0) else Padding,
		Size = if FFlagAXCategoryMenuVisualFixes then UDim2.fromOffset(0, GetFixedTabHeightModule(UseTokensResult)) else UDim2.fromScale(0, 0),
		AutomaticSize = if FFlagAXCategoryMenuVisualFixes then Enum.AutomaticSize.X else Enum.AutomaticSize.XY,
		layout = if FFlagAXCategoryMenuVisualFixes then config else nil,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Text = ReactModule.createElement(Text, {
			Text = Frame.text,
			textStyle = if Frame.isActive then Frame.activeTextStyle or UseTokensResult.Color.Content.Emphasis else Frame.textStyle or UseTokensResult.Color.Content.Muted,
			fontStyle = Frame.fontStyle or UseTokensResult.Typography.TitleLarge,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = BackgroundStyle1
		})
	})
end))