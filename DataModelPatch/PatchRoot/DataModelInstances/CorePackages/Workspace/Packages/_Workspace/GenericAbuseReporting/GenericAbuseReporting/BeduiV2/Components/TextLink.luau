local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ControlState = FoundationModule.Enums.ControlState
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local IconName = FoundationModule.Enums.IconName
local Text = FoundationModule.Text

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), GetIconRichTextFunction (copy), IconName (copy), ControlState (copy), Text (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local IconRichText = GetIconRichTextFunction(IconName.ArrowUpRightFromSquare)
	
	return ReactModule.createElement(Text, {
		RichText = true,
		Text = if UseStateResult then `<u>{p1.text}</u> {IconRichText}` else `{p1.text} {IconRichText}`,
		onActivated = p1.onActivated,
		onStateChanged = ReactModule.useCallback(function(Hover)
			-- upvalues: UseStateResult2 (copy), ControlState (upval)
			UseStateResult2(Hover == ControlState.Hover)
		end, {}),
		tag = p1.tag or "auto-xy text-body-medium text-wrap text-align-x-left radius-small content-emphasis",
		LayoutOrder = p1.layoutOrder
	})
end)