local GroupPeekSdui = script:FindFirstAncestor("GroupPeekSdui")
local Parent = GroupPeekSdui.Parent
local GroupPeekSduiConstantsModule = require(GroupPeekSdui.GroupPeekSduiConstants)
local SharedFlagsModule = require(Parent.SharedFlags)

return function()
	-- upvalues: SharedFlagsModule (copy), Parent (copy), GroupPeekSduiConstantsModule (copy), GroupPeekSdui (copy)
	if SharedFlagsModule.FFlagSduiCustomFormEnabled then
		require(Parent.CustomForms).getSduiCustomFormVerticalRegistry().registerVertical(GroupPeekSduiConstantsModule.CUSTOM_FORM_VERTICAL, {
			submit = require(GroupPeekSdui.CustomForm.submitGroupCustomFormResponse),
			fetchResults = require(GroupPeekSdui.CustomForm.fetchGroupCustomFormResults)
		})
	end
	if SharedFlagsModule.FFlagSduiReactionsComponent then
		require(Parent.SduiSharedContent).getSduiContentReactionVerticalRegistry().registerVertical(GroupPeekSduiConstantsModule.CONTENT_REACTION_VERTICAL, {
			toggle = require(GroupPeekSdui.Reactions.toggleAnnouncementReaction)
		})
	end
end