local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens

return ReactModule.memo(function(p1) --[[ Line: 16 | Named "ComponentSubtext" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(Text, {
		tag = "auto-xy",
		Text = p1.requirementMessage,
		textStyle = if p1.isOptional then UseTokensResult.Color.Content.Muted else UseTokensResult.Color.System.Alert,
		fontStyle = UseTokensResult.Typography.CaptionMedium,
		Visible = if p1.isOptional or p1.isErrorState then true else false,
		LayoutOrder = p1.layoutOrder
	})
end)