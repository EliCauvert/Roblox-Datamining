local parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(parent.AppChatNetworking)
local messageModelModule = require(script.Parent.MessageModel)
local dateTime = require(parent.Time).DateTime

return {
	responseUser = function(p0)
		-- upvalues: messageModelModule (ref), dateTime (ref)
		return {
			id = if p0.id then p0.id else "message-id",
			type = messageModelModule.SenderTypes.User,
			sender_user_id = if p0.sender_user_id then p0.sender_user_id else 1,
			sent = if p0.sent then p0.sent else dateTime.fromIsoDate("2021-01-01T00:00:00Z"),
			content = if p0.content then p0.content else "message-content",
			created_at = if p0.created_at then p0.created_at else dateTime.fromIsoDate("2021-01-01T00:00:00Z"),
			moderation_type = if p0.moderation_type then p0.moderation_type else "trusted_comms",
			is_previewable = if p0.is_previewable ~= nil then false else p0.is_previewable,
			is_badgeable = if p0.is_badgeable ~= nil then false else p0.is_badgeable
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