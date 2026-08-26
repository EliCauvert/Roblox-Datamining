local parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(parent.AppChatNetworking)
local messageModelModule = require(script.Parent.MessageModel)
local dateTime = require(parent.Time).DateTime

return {
	responseUser = function(p1)
		-- upvalues: messageModelModule (ref), dateTime (ref)
		return {
			id = if p1.id then p1.id else "message-id",
			type = messageModelModule.SenderTypes.User,
			sender_user_id = if p1.sender_user_id then p1.sender_user_id else 1,
			sent = if p1.sent then p1.sent else dateTime.fromIsoDate("2021-01-01T00:00:00Z"),
			content = if p1.content then p1.content else "message-content",
			created_at = if p1.created_at then p1.created_at else dateTime.fromIsoDate("2021-01-01T00:00:00Z"),
			moderation_type = if p1.moderation_type then p1.moderation_type else "trusted_comms",
			is_previewable = if p1.is_previewable ~= nil then false else p1.is_previewable,
			is_badgeable = if p1.is_badgeable ~= nil then false else p1.is_badgeable
		}
	end,
	responseSystem = function(p1)
		return {
			type = "system",
			id = if p1.id then p1.id else "message-id",
			sent = if p1.sent then p1.sent else "2021-01-01T00:00:00Z",
			content = if p1.content then p1.content else "message-content",
			created_at = if p1.created_at then p1.created_at else "2021-01-01T00:00:00Z"
		}
	end
}