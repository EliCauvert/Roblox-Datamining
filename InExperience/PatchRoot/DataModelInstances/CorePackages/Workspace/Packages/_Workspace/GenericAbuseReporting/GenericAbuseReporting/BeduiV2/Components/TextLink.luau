local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local controlState = foundationModule.Enums.ControlState
local getIconRichText = foundationModule.Utility.getIconRichText
local iconName = foundationModule.Enums.IconName
local text = foundationModule.Text

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), getIconRichText (ref), iconName (ref), controlState (ref), text (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = getIconRichText(iconName.ArrowUpRightFromSquare)
	
	return reactModule.createElement(text, {
		RichText = true,
		Text = if var1 then `<u>{p1.text}</u> {var3}` else `{p1.text} {var3}`,
		onActivated = p1.onActivated,
		onStateChanged = reactModule.useCallback(function(p2)
			-- upvalues: var2 (ref), controlState (copy)
			var2(p2 == controlState.Hover)
		end, {}),
		tag = p1.tag or "auto-xy text-body-medium text-wrap text-align-x-left radius-small content-emphasis",
		LayoutOrder = p1.layoutOrder
	})
end)