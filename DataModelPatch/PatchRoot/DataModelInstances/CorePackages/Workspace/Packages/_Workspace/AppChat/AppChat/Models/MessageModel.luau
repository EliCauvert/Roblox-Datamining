local Players = game:GetService("Players")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _DateTime = require(Parent.Time).DateTime
local GenerateStringIdFunction = require(Parent.AppCommonLib).GenerateStringId
local LoggerModule = require(script.Parent.Logger)
local GetFFlagEnableSocialCardsFunction = require(Parent.SharedFlags).GetFFlagEnableSocialCards
local FFlagAppChatEnableAutotranslationModule = require(AppChat.Flags.FFlagAppChatEnableAutotranslation)
local config = {
	new = function(p1)
		return { universeId = tostring(p1) }
	end
}
local MessageModelModule = {
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

function MessageModelModule.new(p1)
	-- upvalues: MessageModelModule (copy)
	MessageModelModule.__index = MessageModelModule
	local P1 = p1 or {}
	setmetatable(P1, MessageModelModule)
	
	return P1
end

function MessageModelModule.fromWeb(p1, p2, PreviousMessageId)
	-- upvalues: MessageModelModule (copy), _DateTime (copy)
	if MessageModelModule.DoRequiredFieldsPresent(p1) then
		local NewMessageModel = MessageModelModule.new()
		NewMessageModel.id = p1.id
		NewMessageModel.senderTargetId = tostring(p1.senderTargetId)
		NewMessageModel.senderType = p1.senderType
		NewMessageModel.read = p1.read
		NewMessageModel.sent = _DateTime.fromIsoDate(p1.sent)
		NewMessageModel.conversationId = tostring(p2)
		NewMessageModel.previousMessageId = PreviousMessageId
		NewMessageModel.filteredForReceivers = false
		NewMessageModel:parseContentWeb(p1)
		
		return NewMessageModel
	else
		return nil
	end
end

function MessageModelModule.fromSentWeb(p1, p2)
	-- upvalues: MessageModelModule (copy), Players (copy), _DateTime (copy)
	if MessageModelModule.DoRequiredFieldsPresentForSent(p1) then
		local NewMessageModel = MessageModelModule.new()
		NewMessageModel.id = p1.messageId
		NewMessageModel.senderTargetId = tostring(Players.LocalPlayer.UserId)
		NewMessageModel.senderType = "User"
		NewMessageModel.read = true
		NewMessageModel.sent = _DateTime.fromIsoDate(p1.sent)
		NewMessageModel.conversationId = tostring(p2)
		NewMessageModel.previousMessageId = ""
		NewMessageModel.filteredForReceivers = p1.filteredForReceivers
		NewMessageModel:parseContentSentWeb(p1)
		
		return NewMessageModel
	else
		return nil
	end
end

function MessageModelModule.newSendingId(): string
	-- upvalues: GenerateStringIdFunction (copy)
	return "sending-message-" .. GenerateStringIdFunction()
end

function MessageModelModule.newSending(p1)
	-- upvalues: MessageModelModule (copy), Players (copy)
	assert(p1, "props argument is missing")
	assert(p1.id, "props.id argument is missing")
	assert(p1.messageType, "props.messageType argument is missing")
	assert(p1.order, "props.order argument is missing")
	assert(p1.conversationId, "props.conversationId argument is missing")
	assert(p1.sent, "props.sent argument is missing")
	local NewMessageModel = MessageModelModule.new(p1)
	NewMessageModel.senderTargetId = tostring(Players.LocalPlayer.UserId)
	NewMessageModel.senderType = MessageModelModule.SenderTypes.User
	NewMessageModel.moderated = false
	NewMessageModel.failed = false
	NewMessageModel.stableKey = NewMessageModel.id
	
	return NewMessageModel
end

function MessageModelModule.DoRequiredFieldsPresent(p1)
	return p1 and (p1.id and (p1.messageType and (p1.senderTargetId and p1.sent)))
end

function MessageModelModule.DoRequiredFieldsPresentForSent(p1)
	return p1 and (p1.messageId and (p1.messageType and p1.sent))
end

function MessageModelModule.parseContentWeb(p1, p2)
	-- upvalues: MessageModelModule (copy), config (copy)
	p1:parseContent(p2)
	
	if p2.messageType == MessageModelModule.MessageTypes.Link and p2.link and p2.link.type == MessageModelModule.LinkTypes.Game and p2.link.game then
		p1.gameLink = config.new(p2.link.game.universeId)
	end
end

function MessageModelModule.parseContentSentWeb(p1, p2)
	-- upvalues: MessageModelModule (copy), config (copy)
	p1:parseContent(p2)
	
	if p2.messageType == MessageModelModule.MessageTypes.Link and p2.chatMessageLinkType == MessageModelModule.LinkTypes.Game then
		p1.gameLink = config.new(p2.universeId)
	end
end

function MessageModelModule.parseContent(p1, p2)
	-- upvalues: MessageModelModule (copy)
	p1.messageType = p2.messageType
	
	if p2.messageType == MessageModelModule.MessageTypes.PlainText then
		p1.content = p2.content
		
		return
	else
		p1.content = nil
	end
end

function MessageModelModule.fromChannelsApi(RepliesTo, p1, PreviousMessageId, _)
	-- upvalues: MessageModelModule (copy), _DateTime (copy), GetFFlagEnableSocialCardsFunction (copy), FFlagAppChatEnableAutotranslationModule (copy)
	if not MessageModelModule.DoRequiredFieldsPresentFromChannelsApi(RepliesTo) then
		return nil
	end
	local NewMessageModel = MessageModelModule.new()
	NewMessageModel.id = RepliesTo.id
	NewMessageModel.read = true
	NewMessageModel.sent = _DateTime.fromIsoDate(RepliesTo.created_at)
	NewMessageModel.conversationId = tostring(p1)
	NewMessageModel.previousMessageId = PreviousMessageId
	NewMessageModel.filteredForReceivers = false
	NewMessageModel.content = RepliesTo.content
	NewMessageModel.previewContent = RepliesTo.preview_content
	
	if RepliesTo.type == MessageModelModule.SenderTypes.User then
		NewMessageModel:serializeForUserMessage(RepliesTo)
	elseif RepliesTo.type == MessageModelModule.SenderTypes.System then
		NewMessageModel:serializeForSystemMessage(RepliesTo)
	end
	NewMessageModel.cards = if GetFFlagEnableSocialCardsFunction() then RepliesTo.cards else nil
	
	if GetFFlagEnableSocialCardsFunction() then
		NewMessageModel.senderTargetId = tostring(RepliesTo.sender_user_id)
	end
	NewMessageModel.stableKey = NewMessageModel.id
	NewMessageModel.isBadgeable = RepliesTo.is_badgeable
	NewMessageModel.isPreviewable = RepliesTo.is_previewable
	
	if FFlagAppChatEnableAutotranslationModule then
		NewMessageModel.contentToDisplay = RepliesTo.content_to_display
	end
	return NewMessageModel
end

function MessageModelModule.serializeForUserMessage(p1, p2)
	-- upvalues: MessageModelModule (copy), LoggerModule (copy)
	p1.senderTargetId = tostring(p2.sender_user_id)
	p1.senderType = MessageModelModule.SenderTypes.User
	p1.moderationType = p2.moderation_type
	p1.repliesTo = MessageModelModule.fromChannelsApi(p2.replies_to, nil, nil, true)
	
	if p2.visibility and (p2.visibility == MessageModelModule.VisibilityTypes.Visible or p2.visibility == MessageModelModule.VisibilityTypes.Hidden) then
		p1.visibility = p2.visibility
	else
		p1.visibility = MessageModelModule.VisibilityTypes.Invalid
		LoggerModule:debug("Message visibility type is invalid for message id: " .. p1.id)
	end
	p1.messageType = MessageModelModule.MessageTypes.PlainText
end

function MessageModelModule.serializeForSystemMessage(p1, _)
	-- upvalues: MessageModelModule (copy)
	p1.senderType = MessageModelModule.SenderTypes.System
	p1.messageType = MessageModelModule.MessageTypes.System
end

function MessageModelModule.DoRequiredFieldsPresentFromChannelsApi(p1)
	-- upvalues: MessageModelModule (copy)
	return if p1 then if p1.type == MessageModelModule.SenderTypes.User then p1.id and (p1.sender_user_id and p1.created_at) else p1.type == MessageModelModule.SenderTypes.System and (p1.id and p1.created_at) else false
end

function MessageModelModule.parseContentFromChannelsApi(p1, p2)
	-- upvalues: MessageModelModule (copy)
	p1.messageType = MessageModelModule.MessageTypes.PlainText
	p1.content = p2.content
end

function MessageModelModule.fromSentChannelsApi(p1, p2, p3)
	-- upvalues: MessageModelModule (copy), _DateTime (copy), LoggerModule (copy)
	if not MessageModelModule.DoRequiredFieldsPresentForSentFromChannelsApi(p1) then
		return nil
	end
	local NewMessageModel = MessageModelModule.new()
	NewMessageModel.id = p1.messages[1].id
	NewMessageModel.senderTargetId = tostring(p1.messages[1].sender_user_id)
	NewMessageModel.senderType = MessageModelModule.SenderTypes.User
	NewMessageModel.read = true
	NewMessageModel.sent = _DateTime.fromIsoDate(p1.messages[1].created_at)
	NewMessageModel.conversationId = tostring(p2)
	NewMessageModel.previousMessageId = ""
	NewMessageModel.moderationType = p1.messages[1].moderation_type
	NewMessageModel.stableKey = p3 or NewMessageModel.id
	NewMessageModel.isBadgeable = p1.messages[1].is_badgeable
	NewMessageModel.isPreviewable = p1.messages[1].is_previewable
	NewMessageModel.filteredForReceivers = false
	NewMessageModel.messageType = MessageModelModule.MessageTypes.PlainText
	NewMessageModel.content = p1.messages[1].content
	NewMessageModel.repliesTo = MessageModelModule.fromChannelsApi(p1.messages[1].replies_to, nil, nil, true)
	
	if p1.visibility and (p1.visibility == MessageModelModule.VisibilityTypes.Visible or p1.visibility == MessageModelModule.VisibilityTypes.Hidden) then
		NewMessageModel.visibility = p1.visibility
		
		return NewMessageModel
	else
		NewMessageModel.visibility = MessageModelModule.VisibilityTypes.Visible
		LoggerModule:debug("Message visibility type is invalid for message id: " .. NewMessageModel.id)
		
		return NewMessageModel
	end
end

function MessageModelModule.DoRequiredFieldsPresentForSentFromChannelsApi(p1)
	return p1 and (p1.messages and (#p1.messages > 0 and (p1.messages[1].id and p1.messages[1].created_at)))
end

return MessageModelModule