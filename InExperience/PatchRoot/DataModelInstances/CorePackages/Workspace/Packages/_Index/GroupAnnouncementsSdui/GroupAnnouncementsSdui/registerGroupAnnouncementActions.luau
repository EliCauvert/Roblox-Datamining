local GroupAnnouncementsSdui = script:FindFirstAncestor("GroupAnnouncementsSdui")
local Parent = GroupAnnouncementsSdui.Parent
local GroupAnnouncementSduiConstantsModule = require(GroupAnnouncementsSdui.GroupAnnouncementSduiConstants)

return function()
	-- upvalues: Parent (copy), GroupAnnouncementSduiConstantsModule (copy), GroupAnnouncementsSdui (copy)
	require(Parent.CustomForms).getSduiCustomFormVerticalRegistry().registerVertical(GroupAnnouncementSduiConstantsModule.CUSTOM_FORM_VERTICAL, {
		submit = require(GroupAnnouncementsSdui.CustomForm.submitGroupCustomFormResponse),
		fetchResults = require(GroupAnnouncementsSdui.CustomForm.fetchGroupCustomFormResults)
	})
end