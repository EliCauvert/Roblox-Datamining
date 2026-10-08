local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local chatMessageModule = require(appChat.Components.ChatConversation.ChatMessage)
local customMessageEntryContainerModule = require(appChat.Components.ChatConversation.CustomMessageEntryContainer)
local enumMessageTypesModule = require(appChat.Components.ChatConversation.EnumMessageTypes)
local messageListContextModule = require(script.Parent.MessageListContext)
local messageModelModule = require(appChat.Models.MessageModel)
local systemMessageModule = require(appChat.Components.ChatConversation.SystemMessage)
local systemMessageContainerModule = require(appChat.Components.ChatConversation.SystemMessageContainer)
local getFFlagEnableSocialCards = require(parent.SharedFlags).GetFFlagEnableSocialCards

local function _(p1, p2)
	-- upvalues: messageModelModule (ref), enumMessageTypesModule (ref)
	return if p2 == messageModelModule.SenderTypes.System then p1 == enumMessageTypesModule.System elseif p2 == messageModelModule.SenderTypes.User then if p1 ~= enumMessageTypesModule.PlainText then p1 == enumMessageTypesModule.Link else true else p1 == enumMessageTypesModule.Custom
end

return function(p1)
	-- upvalues: reactModule (ref), messageListContextModule (ref), messageModelModule (ref), enumMessageTypesModule (ref), systemMessageModule (ref), customMessageEntryContainerModule (ref), systemMessageContainerModule (ref), getFFlagEnableSocialCards (ref), cryoModule (ref), chatMessageModule (ref)
	local var1
	local var2 = reactModule.useContext(messageListContextModule)
	assert(var2 ~= nil, "MessageRow must be rendered inside a MessageListContext provider")
	local item = p1.item
	local messageType = item.messageType
	local senderType = item.senderType
	
	if senderType == messageModelModule.SenderTypes.System then
		local _ = messageType == enumMessageTypesModule.System
	elseif senderType == messageModelModule.SenderTypes.User then
		var1 = true
		
		if messageType ~= enumMessageTypesModule.PlainText then
			local _ = messageType == enumMessageTypesModule.Link
		end
	else
		var1 = messageType ~= enumMessageTypesModule.Custom
	end
	if not var1 then
		return reactModule.createElement(systemMessageModule, { Text = var2.invalidMessageTypeText })
	end
	local var3 = if var2.isDebugEnabled then reactModule.createElement("StringValue", { Value = tostring(item.messageId) }) else nil
	
	return if item.messageType == enumMessageTypesModule.Custom then reactModule.createElement(customMessageEntryContainerModule, {
		openViewProfile = var2.openViewProfile,
		customEntryType = item.customEntryType,
		conversationId = var2.conversationId
	}) elseif item.messageType == enumMessageTypesModule.System then reactModule.createElement(systemMessageContainerModule, {
		cards = if getFFlagEnableSocialCards() then item.cards else nil,
		text = item.content,
		parentWidth = var2.width,
		sent = item.sent,
		showDateTime = item.showDateTime,
		messageId = item.messageId,
		senderTargetId = if getFFlagEnableSocialCards() then item.senderTargetId else nil,
		debugElement = var3
	}) else reactModule.createElement(chatMessageModule, {
		additionalProps = cryoModule.Dictionary.join(item.additionalProps or {}, {
			onDetailsOpened = if item.additionalProps ~= nil then nil else var2.onDetailsOpened,
			openGameDetailsPage = var2.openGameDetailsPage,
			openMomentsDeepLink = var2.openMomentsDeepLink,
			shareLink = item.shareLink
		}),
		content = item.content,
		debugElement = var3,
		failed = item.failed,
		filteredForReceivers = item.filteredForReceivers,
		isIncoming = item.isIncoming,
		isNewSender = item.isNewSender,
		isSending = item.isSending,
		isUnfiltered = item.moderationType == messageModelModule.ModerationTypes.TrustedComms,
		isLastMessageInMessageGroup = item.isLastMessageInMessageGroup,
		isLastIncomingChatMessage = item.messageId == var2.lastIncomingChatMessageId,
		messageDefaultNoticeText = var2.messageDefaultNoticeText,
		conversationId = var2.conversationId,
		messageId = item.messageId,
		messageModeratedNoticeText = var2.messageModeratedNoticeText,
		messageHiddenNoticeText = var2.messageHiddenNoticeText,
		messageType = item.messageType,
		moderated = item.moderated,
		openViewProfile = var2.openViewProfile,
		parentWidth = var2.width,
		readingMessagesIsEnabled = true,
		senderUserId = item.senderTargetId,
		sent = item.sent,
		showDateTime = item.showDateTime,
		showDisplayName = item.showDisplayName,
		shouldShowName = item.sender.shouldShowName,
		thumbnail = item.sender.thumbnail,
		wideMode = var2.wideMode,
		unknownUserText = var2.unknownUserText,
		viewProfileOnAvatarPressed = var2.viewProfileOnAvatarPressed,
		closeKeyboard = var2.closeKeyboard,
		inputBoxRef = var2.inputBoxRef,
		repliesTo = item.repliesTo,
		visibility = item.visibility
	})
end