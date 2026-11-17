local _ = require(script.Parent.ChatParticipantView)
local UseChatOverflowMenuModule = require(script.Parent.Parent.useChatOverflowMenu)
local EscapeRichTextModule = require(script.Parent.Parent.escapeRichText)

return function(Frame)
	-- upvalues: UseChatOverflowMenuModule (copy), EscapeRichTextModule (copy)
	return {
		title = Frame.title,
		titlePill = if Frame.titlePill then {
			label = EscapeRichTextModule(Frame.titlePill.label),
			variant = Frame.titlePill.variant
		} else nil,
		description = Frame.description,
		icon = if Frame.iconType == "user" then { iconType = "user", iconTargetId = Frame.iconTargetId } else { iconType = "role", iconText = Frame.iconText },
		ctaButton = Frame.ctaButton,
		menu = UseChatOverflowMenuModule(Frame.overflowActions),
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId or "--groups-chat-participant"
	}
end