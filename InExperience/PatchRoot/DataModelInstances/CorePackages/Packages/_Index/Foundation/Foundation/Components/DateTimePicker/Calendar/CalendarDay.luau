local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local stateLayerModeModule = require(foundation.Enums.StateLayerMode)
local textModule = require(foundation.Components.Text)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function(p1)
	-- upvalues: useTokensModule (ref), reactModule (ref), textModule (ref), stateLayerModeModule (ref)
	local var1 = useTokensModule()
	
	return reactModule.createElement(textModule, {
		tag = "auto-xy text-title-small text-align-x-center text-align-y-center",
		textStyle = {
			Color3 = if p1.isSelected then var1.Inverse.Content.Emphasis.Color3 elseif p1.isSelectable and p1.emphasizeText then var1.Color.Content.Emphasis.Color3 else var1.Color.Content.Muted.Color3,
			Transparency = if p1.isSelected or p1.isSelectable and p1.emphasizeText then 0 else 0.5
		},
		backgroundStyle = if p1.isSelected then var1.Color.System.Contrast elseif p1.highlight then var1.Color.ActionStandard.Background else nil,
		LayoutOrder = p1.LayoutOrder,
		onActivated = if p1.isSelectable then p1.onActivated else nil,
		RichText = not p1.isSelectable,
		stateLayer = {
			mode = if p1.isSelected then stateLayerModeModule.Inverse else stateLayerModeModule.Default
		},
		Text = if p1.isSelectable then p1.Text else `<s>{p1.Text}</s>`,
		testId = p1.testId
	})
end