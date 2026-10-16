local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local ChatMessageModule = require(AppChat.Components.ChatConversation.ChatMessage)
local CustomMessageEntryContainerModule = require(AppChat.Components.ChatConversation.CustomMessageEntryContainer)
local EnumMessageTypesModule = require(AppChat.Components.ChatConversation.EnumMessageTypes)
local MessageListContextModule = require(script.Parent.MessageListContext)
local MessageModelModule = require(AppChat.Models.MessageModel)
local SystemMessageModule = require(AppChat.Components.ChatConversation.SystemMessage)
local SystemMessageContainerModule = require(AppChat.Components.ChatConversation.SystemMessageContainer)
local GetFFlagEnableSocialCardsFunction = require(Parent.SharedFlags).GetFFlagEnableSocialCards

local function _(Custom, System): boolean --[[ Line: 22 | Named "isValidMessageAndSenderType" ]]
	-- upvalues: MessageModelModule (copy), EnumMessageTypesModule (copy)
	return if System == MessageModelModule.SenderTypes.System then Custom == EnumMessageTypesModule.System elseif System == MessageModelModule.SenderTypes.User then Custom == EnumMessageTypesModule.PlainText or Custom == EnumMessageTypesModule.Link else Custom == EnumMessageTypesModule.Custom
end

return function(p1) --[[ Line: 35 | Named "MessageRow" ]]
	-- upvalues: ReactModule (copy), MessageListContextModule (copy), MessageModelModule (copy), EnumMessageTypesModule (copy), SystemMessageModule (copy), CustomMessageEntryContainerModule (copy), SystemMessageContainerModule (copy), GetFFlagEnableSocialCardsFunction (copy), CryoModule (copy), ChatMessageModule (copy)
	local UseContextResult = ReactModule.useContext(MessageListContextModule)
	assert(UseContextResult ~= nil, "MessageRow must be rendered inside a MessageListContext provider")
	local Item = p1.item
	local MessageType = Item.messageType
	local SenderType = Item.senderType
	
	if if SenderType == MessageModelModule.SenderTypes.System then MessageType == EnumMessageTypesModule.System elseif SenderType == MessageModelModule.SenderTypes.User then MessageType == EnumMessageTypesModule.PlainText or MessageType == EnumMessageTypesModule.Link else MessageType == EnumMessageTypesModule.Custom then
		local StringValue = if UseContextResult.isDebugEnabled then ReactModule.createElement("StringValue", { Value = tostring(Item.messageId) }) else nil
		
		return if Item.messageType == EnumMessageTypesModule.Custom then ReactModule.createElement(CustomMessageEntryContainerModule, {
			openViewProfile = UseContextResult.openViewProfile,
			customEntryType = Item.customEntryType,
			conversationId = UseContextResult.conversationId
		}) elseif Item.messageType == EnumMessageTypesModule.System then ReactModule.createElement(SystemMessageContainerModule, {
			cards = if GetFFlagEnableSocialCardsFunction() then Item.cards else nil,
			text = Item.content,
			parentWidth = UseContextResult.width,
			sent = Item.sent,
			showDateTime = Item.showDateTime,
			messageId = Item.messageId,
			senderTargetId = if GetFFlagEnableSocialCardsFunction() then Item.senderTargetId else nil,
			debugElement = StringValue
		}) else ReactModule.createElement(ChatMessageModule, {
			additionalProps = CryoModule.Dictionary.join(Item.additionalProps or {}, {
				onDetailsOpened = if Item.additionalProps == nil then nil else UseContextResult.onDetailsOpened,
				openGameDetailsPage = UseContextResult.openGameDetailsPage,
				openMomentsDeepLink = UseContextResult.openMomentsDeepLink,
				shareLink = Item.shareLink
			}),
			content = Item.content,
			debugElement = StringValue,
			failed = Item.failed,
			filteredForReceivers = Item.filteredForReceivers,
			isIncoming = Item.isIncoming,
			isNewSender = Item.isNewSender,
			isSending = Item.isSending,
			isUnfiltered = Item.moderationType == MessageModelModule.ModerationTypes.TrustedComms,
			isLastMessageInMessageGroup = Item.isLastMessageInMessageGroup,
			isLastIncomingChatMessage = Item.messageId == UseContextResult.lastIncomingChatMessageId,
			messageDefaultNoticeText = UseContextResult.messageDefaultNoticeText,
			conversationId = UseContextResult.conversationId,
			messageId = Item.messageId,
			messageModeratedNoticeText = UseContextResult.messageModeratedNoticeText,
			messageHiddenNoticeText = UseContextResult.messageHiddenNoticeText,
			messageType = Item.messageType,
			moderated = Item.moderated,
			openViewProfile = UseContextResult.openViewProfile,
			parentWidth = UseContextResult.width,
			readingMessagesIsEnabled = true,
			senderUserId = Item.senderTargetId,
			sent = Item.sent,
			showDateTime = Item.showDateTime,
			showDisplayName = Item.showDisplayName,
			shouldShowName = Item.sender.shouldShowName,
			thumbnail = Item.sender.thumbnail,
			wideMode = UseContextResult.wideMode,
			unknownUserText = UseContextResult.unknownUserText,
			viewProfileOnAvatarPressed = UseContextResult.viewProfileOnAvatarPressed,
			closeKeyboard = UseContextResult.closeKeyboard,
			inputBoxRef = UseContextResult.inputBoxRef,
			repliesTo = Item.repliesTo,
			visibility = Item.visibility
		})
	else
		return ReactModule.createElement(SystemMessageModule, { Text = UseContextResult.invalidMessageTypeText })
	end
end