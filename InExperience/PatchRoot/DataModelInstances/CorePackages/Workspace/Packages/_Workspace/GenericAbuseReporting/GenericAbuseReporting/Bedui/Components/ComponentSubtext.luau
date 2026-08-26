local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), text (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(text, {
		tag = "auto-xy",
		Text = p1.requirementMessage,
		textStyle = if p1.isOptional then var1.Color.Content.Muted else var1.Color.System.Alert,
		fontStyle = var1.Typography.CaptionMedium,
		Visible = if p1.isOptional or p1.isErrorState then true else false,
		LayoutOrder = p1.layoutOrder
	})
end)