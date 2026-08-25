local avatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local parent = avatarExperienceUIKit.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local getFixedTabHeightModule = require(avatarExperienceUIKit.Utils.getFixedTabHeight)
local fFlagAXCategoryMenuVisualFixes = require(parent.AvatarExperienceFlags).FFlagAXCategoryMenuVisualFixes
local text = foundationModule.Text
local view = foundationModule.View
local t = { Transparency = 1 }
local t_1 = {
	FillDirection = Enum.FillDirection.Vertical,
	HorizontalAlignment = Enum.HorizontalAlignment.Left,
	VerticalAlignment = Enum.VerticalAlignment.Center,
	SortOrder = Enum.SortOrder.LayoutOrder
}
local t_2 = { Transparency = 1 }

return reactModule.forwardRef(function(p0, p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), t (ref), fFlagAXCategoryMenuVisualFixes (ref), getFixedTabHeightModule (ref), t_1 (ref), text (ref), t_2 (ref)
	local var7 = useTokens()
	local padding = p0.padding or Vector2.new(var7.Padding.Small, var7.Padding.Medium)
	
	return reactModule.createElement(view, {
		ref = p1,
		onActivated = p0.onActivated,
		backgroundStyle = t,
		padding = if fFlagAXCategoryMenuVisualFixes then Vector2.new(padding.X, 0) else padding,
		Size = if fFlagAXCategoryMenuVisualFixes then UDim2.fromOffset(0, getFixedTabHeightModule(var7)) else UDim2.fromScale(0, 0),
		AutomaticSize = if fFlagAXCategoryMenuVisualFixes then Enum.AutomaticSize.X else Enum.AutomaticSize.XY,
		layout = if fFlagAXCategoryMenuVisualFixes then t_1 else nil,
		LayoutOrder = p0.LayoutOrder
	}, {
		Text = reactModule.createElement(text, {
			Text = p0.text,
			textStyle = if p0.isActive then p0.activeTextStyle or var7.Color.Content.Emphasis else p0.textStyle or var7.Color.Content.Muted,
			fontStyle = p0.fontStyle or var7.Typography.TitleLarge,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = t_2
		})
	})
end)