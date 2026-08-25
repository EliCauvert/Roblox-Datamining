local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(parent.AppChatNetworking)
local getFFlagEnableSocialCards = require(parent.SharedFlags).GetFFlagEnableSocialCards
local _ = require(appChat.MessageData.Types)

return function(p0, p1)
	-- upvalues: getFFlagEnableSocialCards (ref)
	return {
		id = p0.id,
		type = p0.type,
		content = p0.content,
		created_at = p0.created_at,
		sender_user_id = p0.sender_user_id,
		moderation_type = p0.moderation_type,
		visibility = p0.visibility,
		preview_content = p0.preview_content,
		content_to_display = p0.content_to_display or p0.content,
		replies_to = p0.replies_to,
		cards = if getFFlagEnableSocialCards() then p0.cards else nil,
		filtered_for_receivers = p0.filtered_for_receivers,
		conversationId = p1,
		stableKey = p0.id
	}
end