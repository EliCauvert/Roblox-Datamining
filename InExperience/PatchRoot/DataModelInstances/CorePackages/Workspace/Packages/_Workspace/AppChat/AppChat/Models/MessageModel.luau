local playersService = game:GetService("Players")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dateTime = require(parent.Time).DateTime
local generateStringId = require(parent.AppCommonLib).GenerateStringId
local loggerModule = require(script.Parent.Logger)
local getFFlagEnableSocialCards = require(parent.SharedFlags).GetFFlagEnableSocialCards
local fFlagAppChatEnableAutotranslationModule = require(appChat.Flags.FFlagAppChatEnableAutotranslation)
local t = {
	new = function(p1)
		return { universeId = tostring(p1) }
	end
}
local t_1 = {
	SenderTypes = {
		User = "user",
		System = "system",
		UnknownType = "unknown_type"
	},
	MessageTypes = {
		PlainText = "PlainText",
		Link = "Link",
		System = "System"
	},
	LinkTypes = { Game = "Game" },
	ModerationTypes = {
		TrustedComms = "trusted_comms",
		Moderated = "moderated",
		Invalid = "invalid",
		UnknownType = "unknown_type"
	},
	VisibilityTypes = {
		Visible = "visible",
		Hidden = "hidden",
		Invalid = "invalid"
	}
}

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	t_1.__index = t_1
	p1 = p1 or {}
	setmetatable(p1, t_1)
	
	return p1
end

function t_1.fromWeb(p1, p2, p3)
	-- upvalues: t_1 (ref), dateTime (ref)
	if t_1.DoRequiredFieldsPresent(p1) then
		local var1 = t_1.new()
		var1.id = p1.id
		var1.senderTargetId = tostring(p1.senderTargetId)
		var1.senderType = p1.senderType
		var1.read = p1.read
		var1.sent = dateTime.fromIsoDate(p1.sent)
		var1.conversationId = tostring(p2)
		var1.previousMessageId = p3
		var1.filteredForReceivers = false
		var1:parseContentWeb(p1)
		
		return var1
	end
	return nil
end

function t_1.fromSentWeb(p1, p2)
	-- upvalues: t_1 (ref), playersService (ref), dateTime (ref)
	if t_1.DoRequiredFieldsPresentForSent(p1) then
		local var1 = t_1.new()
		var1.id = p1.messageId
		var1.senderTargetId = tostring(playersService.LocalPlayer.UserId)
		var1.senderType = "User"
		var1.read = true
		var1.sent = dateTime.fromIsoDate(p1.sent)
		var1.conversationId = tostring(p2)
		var1.previousMessageId = ""
		var1.filteredForReceivers = p1.filteredForReceivers
		var1:parseContentSentWeb(p1)
		
		return var1
	end
	return nil
end

function t_1.newSendingId()
	-- upvalues: generateStringId (ref)
	return "sending-message-" .. generateStringId()
end

function t_1.newSending(p1)
	-- upvalues: t_1 (ref), playersService (ref)
	assert(p1, "props argument is missing")
	assert(p1.id, "props.id argument is missing")
	assert(p1.messageType, "props.messageType argument is missing")
	assert(p1.order, "props.order argument is missing")
	assert(p1.conversationId, "props.conversationId argument is missing")
	assert(p1.sent, "props.sent argument is missing")
	local var1 = t_1.new(p1)
	var1.senderTargetId = tostring(playersService.LocalPlayer.UserId)
	var1.senderType = t_1.SenderTypes.User
	var1.moderated = false
	var1.failed = false
	var1.stableKey = var1.id
	
	return var1
end

function t_1.DoRequiredFieldsPresent(p1)
	return p1 and (p1.id and (p1.messageType and (p1.senderTargetId and p1.sent)))
end

function t_1.DoRequiredFieldsPresentForSent(p1)
	return p1 and (p1.messageId and (p1.messageType and p1.sent))
end

function t_1.parseContentWeb(p1, p2)
	-- upvalues: t_1 (ref), t (ref)
	p1:parseContent(p2)
	
	if p2.messageType == t_1.MessageTypes.Link and p2.link and (p2.link.type == t_1.LinkTypes.Game and p2.link.game) then
		p1.gameLink = t.new(p2.link.game.universeId)
	end
end

function t_1.parseContentSentWeb(p1, p2)
	-- upvalues: t_1 (ref), t (ref)
	p1:parseContent(p2)
	
	if p2.messageType == t_1.MessageTypes.Link and p2.chatMessageLinkType == t_1.LinkTypes.Game then
		p1.gameLink = t.new(p2.universeId)
	end
end

function t_1.parseContent(p1, p2)
	-- upvalues: t_1 (ref)
	p1.messageType = p2.messageType
	
	if p2.messageType == t_1.MessageTypes.PlainText then
		p1.content = p2.content
		
		return
	end
	p1.content = nil
end

function t_1.fromChannelsApi(p1, p2, p3, _)
	-- upvalues: t_1 (ref), dateTime (ref), getFFlagEnableSocialCards (ref), fFlagAppChatEnableAutotranslationModule (ref)
	if not t_1.DoRequiredFieldsPresentFromChannelsApi(p1) then
		return nil
	end
	local var1 = t_1.new()
	var1.id = p1.id
	var1.read = true
	var1.sent = dateTime.fromIsoDate(p1.created_at)
	var1.conversationId = tostring(p2)
	var1.previousMessageId = p3
	var1.filteredForReceivers = false
	var1.content = p1.content
	var1.previewContent = p1.preview_content
	
	if p1.type == t_1.SenderTypes.User then
		var1:serializeForUserMessage(p1)
	elseif p1.type == t_1.SenderTypes.System then
		var1:serializeForSystemMessage(p1)
	end
	var1.cards = if getFFlagEnableSocialCards() then p1.cards else nil
	
	if getFFlagEnableSocialCards() then
		var1.senderTargetId = tostring(p1.sender_user_id)
	end
	var1.stableKey = var1.id
	var1.isBadgeable = p1.is_badgeable
	var1.isPreviewable = p1.is_previewable
	
	if fFlagAppChatEnableAutotranslationModule then
		var1.contentToDisplay = p1.content_to_display
	end
	return var1
end

function t_1.serializeForUserMessage(p1, p2)
	-- upvalues: t_1 (ref), loggerModule (ref)
	p1.senderTargetId = tostring(p2.sender_user_id)
	p1.senderType = t_1.SenderTypes.User
	p1.moderationType = p2.moderation_type
	p1.repliesTo = t_1.fromChannelsApi(p2.replies_to, nil, nil, true)
	
	if p2.visibility and (p2.visibility == t_1.VisibilityTypes.Visible or p2.visibility == t_1.VisibilityTypes.Hidden) then
		p1.visibility = p2.visibility
	else
		p1.visibility = t_1.VisibilityTypes.Invalid
		loggerModule:debug("Message visibility type is invalid for message id: " .. p19.id)
	end
	p1.messageType = t_1.MessageTypes.PlainText
end

function t_1.serializeForSystemMessage(p1, _)
	-- upvalues: t_1 (ref)
	p1.senderType = t_1.SenderTypes.System
	p1.messageType = t_1.MessageTypes.System
end

function t_1.DoRequiredFieldsPresentFromChannelsApi(p1)
	-- upvalues: t_1 (ref)
	return if p1 then if p1.type == t_1.SenderTypes.User then p1.id and (p1.sender_user_id and p1.created_at) else p1.type == t_1.SenderTypes.System and (p1.id and p1.created_at) else false
end

function t_1.parseContentFromChannelsApi(p1, p2)
	-- upvalues: t_1 (ref)
	p1.messageType = t_1.MessageTypes.PlainText
	p1.content = p2.content
end

function t_1.fromSentChannelsApi(p1, p2, p3)
	-- upvalues: t_1 (ref), dateTime (ref), loggerModule (ref)
	if not t_1.DoRequiredFieldsPresentForSentFromChannelsApi(p1) then
		return nil
	end
	local var1 = t_1.new()
	var1.id = p1.messages[1].id
	var1.senderTargetId = tostring(p1.messages[1].sender_user_id)
	var1.senderType = t_1.SenderTypes.User
	var1.read = true
	var1.sent = dateTime.fromIsoDate(p1.messages[1].created_at)
	var1.conversationId = tostring(p2)
	var1.previousMessageId = ""
	var1.moderationType = p1.messages[1].moderation_type
	var1.stableKey = p3 or var1.id
	var1.isBadgeable = p1.messages[1].is_badgeable
	var1.isPreviewable = p1.messages[1].is_previewable
	var1.filteredForReceivers = false
	var1.messageType = t_1.MessageTypes.PlainText
	var1.content = p1.messages[1].content
	var1.repliesTo = t_1.fromChannelsApi(p1.messages[1].replies_to, nil, nil, true)
	
	if p1.visibility and (p1.visibility == t_1.VisibilityTypes.Visible or p1.visibility == t_1.VisibilityTypes.Hidden) then
		var1.visibility = p1.visibility
		
		return var1
	end
	var1.visibility = t_1.VisibilityTypes.Visible
	loggerModule:debug("Message visibility type is invalid for message id: " .. var11.id)
	
	return var1
end

function t_1.DoRequiredFieldsPresentForSentFromChannelsApi(p1)
	return p1 and (p1.messages and (#p1.messages > 0 and (p1.messages[1].id and p1.messages[1].created_at)))
end

return t_1