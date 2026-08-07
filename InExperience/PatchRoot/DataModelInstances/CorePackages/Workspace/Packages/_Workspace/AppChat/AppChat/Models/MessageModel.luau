local playersService = game:GetService("Players")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dateTime = require(parent.Time).DateTime
local generateStringId = require(parent.AppCommonLib).GenerateStringId
local loggerModule = require(script.Parent.Logger)
local getFFlagEnableSocialCards = require(parent.SharedFlags).GetFFlagEnableSocialCards
local fFlagAppChatEnableAutotranslationModule = require(appChat.Flags.FFlagAppChatEnableAutotranslation)
local t = {
	new = function(p0) --[[ line: 18 ]]
		return { universeId = tostring(p0) }
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

function t_1.new(p1) --[[ line: 51 ]]
	-- upvalues: t_1 (ref)
	t_1.__index = t_1
	p1 = p1 or {}
	setmetatable(p1, t_1)
	
	return p1
end

function t_1.fromWeb(p2, p3, p4) --[[ line: 61 ]]
	-- upvalues: t_1 (ref), dateTime (ref)
	if t_1.DoRequiredFieldsPresent(p2) then
		local var7 = t_1.new()
		var7.id = p2.id
		var7.senderTargetId = tostring(p2.senderTargetId)
		var7.senderType = p2.senderType
		var7.read = p2.read
		var7.sent = dateTime.fromIsoDate(p2.sent)
		var7.conversationId = tostring(p3)
		var7.previousMessageId = p4
		var7.filteredForReceivers = false
		var7:parseContentWeb(p2)
		
		return var7
	end
	return nil
end

function t_1.fromSentWeb(p5, p6) --[[ line: 81 ]]
	-- upvalues: t_1 (ref), playersService (ref), dateTime (ref)
	if t_1.DoRequiredFieldsPresentForSent(p5) then
		local var8 = t_1.new()
		var8.id = p5.messageId
		var8.senderTargetId = tostring(playersService.LocalPlayer.UserId)
		var8.senderType = "User"
		var8.read = true
		var8.sent = dateTime.fromIsoDate(p5.sent)
		var8.conversationId = tostring(p6)
		var8.previousMessageId = ""
		var8.filteredForReceivers = p5.filteredForReceivers
		var8:parseContentSentWeb(p5)
		
		return var8
	end
	return nil
end

function t_1.newSendingId() --[[ line: 102 ]]
	-- upvalues: generateStringId (ref)
	return "sending-message-" .. generateStringId()
end

function t_1.newSending(p7) --[[ line: 106 ]]
	-- upvalues: t_1 (ref), playersService (ref)
	assert(p7, "props argument is missing")
	assert(p7.id, "props.id argument is missing")
	assert(p7.messageType, "props.messageType argument is missing")
	assert(p7.order, "props.order argument is missing")
	assert(p7.conversationId, "props.conversationId argument is missing")
	assert(p7.sent, "props.sent argument is missing")
	local var9 = t_1.new(p7)
	var9.senderTargetId = tostring(playersService.LocalPlayer.UserId)
	var9.senderType = t_1.SenderTypes.User
	var9.moderated = false
	var9.failed = false
	var9.stableKey = var9.id
	
	return var9
end

function t_1.DoRequiredFieldsPresent(p8) --[[ line: 126 ]]
	return p8 and (p8.id and (p8.messageType and (p8.senderTargetId and p8.sent)))
end

function t_1.DoRequiredFieldsPresentForSent(p9) --[[ line: 129 ]]
	return p9 and (p9.messageId and (p9.messageType and p9.sent))
end

function t_1.parseContentWeb(p10, p11) --[[ line: 133 ]]
	-- upvalues: t_1 (ref), t (ref)
	p10:parseContent(p11)
	
	if p11.messageType == t_1.MessageTypes.Link and p11.link and (p11.link.type == t_1.LinkTypes.Game and p11.link.game) then
		p10.gameLink = t.new(p11.link.game.universeId)
	end
end

function t_1.parseContentSentWeb(p12, p13) --[[ line: 142 ]]
	-- upvalues: t_1 (ref), t (ref)
	p12:parseContent(p13)
	
	if p13.messageType == t_1.MessageTypes.Link and p13.chatMessageLinkType == t_1.LinkTypes.Game then
		p12.gameLink = t.new(p13.universeId)
	end
end

function t_1.parseContent(p14, p15) --[[ line: 151 ]]
	-- upvalues: t_1 (ref)
	p14.messageType = p15.messageType
	
	if p15.messageType == t_1.MessageTypes.PlainText then
		p14.content = p15.content
		
		return
	end
	p14.content = nil
end

function t_1.fromChannelsApi(p16, p17, p18, _) --[[ line: 164 ]]
	-- upvalues: t_1 (ref), dateTime (ref), getFFlagEnableSocialCards (ref), fFlagAppChatEnableAutotranslationModule (ref)
	if not t_1.DoRequiredFieldsPresentFromChannelsApi(p16) then
		return nil
	end
	local var10 = t_1.new()
	var10.id = p16.id
	var10.read = true
	var10.sent = dateTime.fromIsoDate(p16.created_at)
	var10.conversationId = tostring(p17)
	var10.previousMessageId = p18
	var10.filteredForReceivers = false
	var10.content = p16.content
	var10.previewContent = p16.preview_content
	
	if p16.type == t_1.SenderTypes.User then
		var10:serializeForUserMessage(p16)
	elseif p16.type == t_1.SenderTypes.System then
		var10:serializeForSystemMessage(p16)
	end
	var10.cards = if getFFlagEnableSocialCards() then p16.cards else nil
	
	if getFFlagEnableSocialCards() then
		var10.senderTargetId = tostring(p16.sender_user_id)
	end
	var10.stableKey = var10.id
	var10.isBadgeable = p16.is_badgeable
	var10.isPreviewable = p16.is_previewable
	
	if fFlagAppChatEnableAutotranslationModule then
		var10.contentToDisplay = p16.content_to_display
	end
	return var10
end

function t_1.serializeForUserMessage(p19, p20) --[[ line: 201 ]]
	-- upvalues: t_1 (ref), loggerModule (ref)
	p19.senderTargetId = tostring(p20.sender_user_id)
	p19.senderType = t_1.SenderTypes.User
	p19.moderationType = p20.moderation_type
	p19.repliesTo = t_1.fromChannelsApi(p20.replies_to, nil, nil, true)
	
	if p20.visibility and (p20.visibility == t_1.VisibilityTypes.Visible or p20.visibility == t_1.VisibilityTypes.Hidden) then
		p19.visibility = p20.visibility
	else
		p19.visibility = t_1.VisibilityTypes.Invalid
		loggerModule:debug("Message visibility type is invalid for message id: " .. p19.id)
	end
	p19.messageType = t_1.MessageTypes.PlainText
end

function t_1.serializeForSystemMessage(p21, _) --[[ line: 219 ]]
	-- upvalues: t_1 (ref)
	p21.senderType = t_1.SenderTypes.System
	p21.messageType = t_1.MessageTypes.System
end

function t_1.DoRequiredFieldsPresentFromChannelsApi(p22) --[[ line: 225 ]]
	-- upvalues: t_1 (ref)
	return if p22 then if p22.type == t_1.SenderTypes.User then p22.id and (p22.sender_user_id and p22.created_at) else p22.type == t_1.SenderTypes.System and (p22.id and p22.created_at) else false
end

function t_1.parseContentFromChannelsApi(p23, p24) --[[ line: 239 ]]
	-- upvalues: t_1 (ref)
	p23.messageType = t_1.MessageTypes.PlainText
	p23.content = p24.content
end

function t_1.fromSentChannelsApi(p25, p26, p27) --[[ line: 245 ]]
	-- upvalues: t_1 (ref), dateTime (ref), loggerModule (ref)
	if not t_1.DoRequiredFieldsPresentForSentFromChannelsApi(p25) then
		return nil
	end
	local var11 = t_1.new()
	var11.id = p25.messages[1].id
	var11.senderTargetId = tostring(p25.messages[1].sender_user_id)
	var11.senderType = t_1.SenderTypes.User
	var11.read = true
	var11.sent = dateTime.fromIsoDate(p25.messages[1].created_at)
	var11.conversationId = tostring(p26)
	var11.previousMessageId = ""
	var11.moderationType = p25.messages[1].moderation_type
	var11.stableKey = p27 or var11.id
	var11.isBadgeable = p25.messages[1].is_badgeable
	var11.isPreviewable = p25.messages[1].is_previewable
	var11.filteredForReceivers = false
	var11.messageType = t_1.MessageTypes.PlainText
	var11.content = p25.messages[1].content
	var11.repliesTo = t_1.fromChannelsApi(p25.messages[1].replies_to, nil, nil, true)
	
	if p25.visibility and (p25.visibility == t_1.VisibilityTypes.Visible or p25.visibility == t_1.VisibilityTypes.Hidden) then
		var11.visibility = p25.visibility
		
		return var11
	end
	var11.visibility = t_1.VisibilityTypes.Visible
	loggerModule:debug("Message visibility type is invalid for message id: " .. var11.id)
	
	return var11
end

function t_1.DoRequiredFieldsPresentForSentFromChannelsApi(p28) --[[ line: 283 ]]
	return p28 and (p28.messages and (#p28.messages > 0 and (p28.messages[1].id and p28.messages[1].created_at)))
end

return t_1