local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local stateLayerModeModule = require(foundation.Enums.StateLayerMode)
local textModule = require(foundation.Components.Text)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function(p0)
	-- upvalues: useTokensModule (ref), reactModule (ref), textModule (ref), stateLayerModeModule (ref)
	local var5 = useTokensModule()
	
	return reactModule.createElement(textModule, {
		tag = "auto-xy text-title-small text-align-x-center text-align-y-center",
		textStyle = {
			Color3 = if p0.isSelected then var5.Inverse.Content.Emphasis.Color3 elseif p0.isSelectable and p0.emphasizeText then var5.Color.Content.Emphasis.Color3 else var5.Color.Content.Muted.Color3,
			Transparency = if p0.isSelected or p0.isSelectable and p0.emphasizeText then 0 else 0.5
		},
		backgroundStyle = if p0.isSelected then var5.Color.System.Contrast elseif p0.highlight then var5.Color.ActionStandard.Background else nil,
		LayoutOrder = p0.LayoutOrder,
		onActivated = if p0.isSelectable then p0.onActivated else nil,
		RichText = not p0.isSelectable,
		stateLayer = {
			mode = if p0.isSelected then stateLayerModeModule.Inverse else stateLayerModeModule.Default
		},
		Text = if p0.isSelectable then p0.Text else `<s>{p0.Text}</s>`,
		testId = p0.testId
	})
end