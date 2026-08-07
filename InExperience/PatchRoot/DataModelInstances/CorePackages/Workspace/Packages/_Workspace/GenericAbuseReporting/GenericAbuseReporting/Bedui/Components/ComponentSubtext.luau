local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(function(p0) --[[ line: 16 | named "ComponentSubtext" ]]
	-- upvalues: useTokens (ref), reactModule (ref), text (ref)
	local var2 = useTokens()
	
	return reactModule.createElement(text, {
		tag = "auto-xy",
		Text = p0.requirementMessage,
		textStyle = if p0.isOptional then var2.Color.Content.Muted else var2.Color.System.Alert,
		fontStyle = var2.Typography.CaptionMedium,
		Visible = if p0.isOptional or p0.isErrorState then true else false,
		LayoutOrder = p0.layoutOrder
	})
end)