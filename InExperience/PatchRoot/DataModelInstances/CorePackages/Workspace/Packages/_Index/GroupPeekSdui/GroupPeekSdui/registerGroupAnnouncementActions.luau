local GroupPeekSdui = script:FindFirstAncestor("GroupPeekSdui")
local Parent = GroupPeekSdui.Parent
local GroupPeekSduiConstantsModule = require(GroupPeekSdui.GroupPeekSduiConstants)

return function()
	-- upvalues: Parent (copy), GroupPeekSduiConstantsModule (copy), GroupPeekSdui (copy)
	require(Parent.CustomForms).getSduiCustomFormVerticalRegistry().registerVertical(GroupPeekSduiConstantsModule.CUSTOM_FORM_VERTICAL, {
		submit = require(GroupPeekSdui.CustomForm.submitGroupCustomFormResponse),
		fetchResults = require(GroupPeekSdui.CustomForm.fetchGroupCustomFormResults)
	})
end