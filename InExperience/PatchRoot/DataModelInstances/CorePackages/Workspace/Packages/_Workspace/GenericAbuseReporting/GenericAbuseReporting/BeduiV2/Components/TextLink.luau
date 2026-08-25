local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local controlState = foundationModule.Enums.ControlState
local getIconRichText = foundationModule.Utility.getIconRichText
local iconName = foundationModule.Enums.IconName
local text = foundationModule.Text

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), getIconRichText (ref), iconName (ref), controlState (ref), text (ref)
	local var2, var3 = reactModule.useState(false)
	local var4 = getIconRichText(iconName.ArrowUpRightFromSquare)
	
	return reactModule.createElement(text, {
		RichText = true,
		Text = if var2 then `<u>{p0.text}</u> {var4}` else `{p0.text} {var4}`,
		onActivated = p0.onActivated,
		onStateChanged = reactModule.useCallback(function(p1)
			-- upvalues: var3 (ref), controlState (copy)
			var3(p1 == controlState.Hover)
		end, {}),
		tag = p0.tag or "auto-xy text-body-medium text-wrap text-align-x-left radius-small content-emphasis",
		LayoutOrder = p0.layoutOrder
	})
end)