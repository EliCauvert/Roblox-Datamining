local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.AppChatNetworking)
local GetFFlagEnableSocialCardsFunction = require(Parent.SharedFlags).GetFFlagEnableSocialCards
local _ = require(AppChat.MessageData.Types)

return function(p1, ConversationId) --[[ Line: 22 | Named "buildConversationMessageFromApi" ]]
	-- upvalues: GetFFlagEnableSocialCardsFunction (copy)
	return {
		id = p1.id,
		type = p1.type,
		content = p1.content,
		created_at = p1.created_at,
		sender_user_id = p1.sender_user_id,
		moderation_type = p1.moderation_type,
		visibility = p1.visibility,
		preview_content = p1.preview_content,
		content_to_display = p1.content_to_display or p1.content,
		replies_to = p1.replies_to,
		cards = if GetFFlagEnableSocialCardsFunction() then p1.cards else nil,
		filtered_for_receivers = p1.filtered_for_receivers,
		is_previewable = p1.is_previewable,
		conversationId = ConversationId,
		stableKey = p1.id
	}
end