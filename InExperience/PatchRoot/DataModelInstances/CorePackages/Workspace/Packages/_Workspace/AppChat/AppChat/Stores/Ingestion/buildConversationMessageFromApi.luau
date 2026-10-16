local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(parent.AppChatNetworking)
local getFFlagEnableSocialCards = require(parent.SharedFlags).GetFFlagEnableSocialCards
local _ = require(appChat.MessageData.Types)

return function(p1, p2)
	-- upvalues: getFFlagEnableSocialCards (ref)
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
		cards = if getFFlagEnableSocialCards() then p1.cards else nil,
		filtered_for_receivers = p1.filtered_for_receivers,
		conversationId = p2,
		stableKey = p1.id
	}
end