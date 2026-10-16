local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local StateLayerModeModule = require(Foundation.Enums.StateLayerMode)
local TextModule = require(Foundation.Components.Text)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(Frame) --[[ Line: 21 | Named "CalendarDay" ]]
	-- upvalues: UseTokensModule (copy), ReactModule (copy), TextModule (copy), StateLayerModeModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	
	return ReactModule.createElement(TextModule, {
		tag = "auto-xy text-title-small text-align-x-center text-align-y-center",
		textStyle = {
			Color3 = if Frame.isSelected then UseTokensModuleResult.Inverse.Content.Emphasis.Color3 elseif Frame.isSelectable and Frame.emphasizeText then UseTokensModuleResult.Color.Content.Emphasis.Color3 else UseTokensModuleResult.Color.Content.Muted.Color3,
			Transparency = if Frame.isSelected or Frame.isSelectable and Frame.emphasizeText then 0 else 0.5
		},
		backgroundStyle = if Frame.isSelected then UseTokensModuleResult.Color.System.Contrast elseif Frame.highlight then UseTokensModuleResult.Color.ActionStandard.Background else nil,
		LayoutOrder = Frame.LayoutOrder,
		onActivated = if Frame.isSelectable then Frame.onActivated else nil,
		RichText = not Frame.isSelectable,
		stateLayer = {
			mode = if Frame.isSelected then StateLayerModeModule.Inverse else StateLayerModeModule.Default
		},
		Text = if Frame.isSelectable then Frame.Text else `<s>{Frame.Text}</s>`,
		testId = Frame.testId
	})
end