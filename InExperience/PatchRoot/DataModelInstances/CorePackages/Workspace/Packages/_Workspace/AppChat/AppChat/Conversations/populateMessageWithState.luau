local AppChat = script:FindFirstAncestor("AppChat")
local GetThumbnailsForUserIdsModule = require(AppChat.Users.getThumbnailsForUserIds)
local ConversationModule = require(AppChat.Models.Conversation)
local MessageModelModule = require(AppChat.Models.MessageModel)
local CryoModule = require(AppChat.Parent.Cryo)
local NewResult = require(AppChat.Logger):new(script.Name)

return function(p1, p2, MessageId, p3, p4, p5, p6) --[[ Line: 31 ]]
	-- upvalues: MessageModelModule (copy), GetThumbnailsForUserIdsModule (copy), ConversationModule (copy), NewResult (copy), CryoModule (copy)
	local IsNotSenderTargetIdMatch = p2.senderTargetId ~= tostring(p1.LocalUserId)
	local HasRepliesTo = p2.repliesTo ~= nil
	
	local function _(p7, p8, p9): boolean --[[ Line: 37 | Named "timeDiffExceeds" ]]
		return if p7 and p8 and p7.sent and p8.sent then p9 < math.abs(p7.sent:GetUnixTimestamp() - p8.sent:GetUnixTimestamp()) else false
	end
	
	local _ = function(p7): boolean --[[ Line: 43 | Named "isSystemMessage" ]]
		return p7 and p7.messageType == "System"
	end
	
	local _ = function(p7): boolean --[[ Line: 47 | Named "isModerated" ]]
		return p7 and p7.moderated == true
	end
	
	local _ = function(p7): boolean --[[ Line: 51 | Named "isHiddenMessage" ]]
		-- upvalues: MessageModelModule (upval)
		return p7 and p7.visibility == MessageModelModule.VisibilityTypes.Hidden
	end
	
	local _ = function(p7): boolean --[[ Line: 55 | Named "isReplyMessage" ]]
		return p7 and p7.repliesTo ~= nil
	end
	
	local _ = function(p7, p8): boolean --[[ Line: 59 | Named "hasSenderChange" ]]
		return p7 and (p8 and p7.senderTargetId ~= p8.senderTargetId)
	end
	
	local _ = function(p7, p8) --[[ Line: 63 | Named "hasModeratedBreak" ]]
		return (if p7 then p7.moderated == true else p7) or p8 and p8.moderated == true
	end
	
	local FetchedOldestMessage = not p4 and p3.fetchedOldestMessage or (if p2 and p4 and p2.sent and p4.sent then math.abs(p2.sent:GetUnixTimestamp() - p4.sent:GetUnixTimestamp()) > 300 else false)
	local FetchedOldestMessage1 = FetchedOldestMessage or (not p4 or ((if p4 then p2 and p4.senderTargetId ~= p2.senderTargetId else p4) or ((if p4 then p4.messageType == "System" else p4) or ((if p2 then p2.repliesTo ~= nil else p2) or ((if p4 then p4.visibility == MessageModelModule.VisibilityTypes.Hidden else p4) or ((if p4 then p4.moderated == true else p4) or p2 and p2.moderated == true))))))
	local NoP6 = not p6 or ((if p6 then p6.messageType == "System" else p6) or ((if p6 then p2 and p6.senderTargetId ~= p2.senderTargetId else p6) or ((if p6 and p2 and p6.sent and p2.sent then math.abs(p6.sent:GetUnixTimestamp() - p2.sent:GetUnixTimestamp()) > 300 else false) or ((if p6 then p6.repliesTo ~= nil else p6) or ((if p6 then p6.visibility == MessageModelModule.VisibilityTypes.Hidden else p6) or ((if p2 then p2.moderated == true else p2) or p6 and p6.moderated == true))))))
	local Users = p1.Users
	local SenderTargetId = if IsNotSenderTargetIdMatch and FetchedOldestMessage1 then p2.senderTargetId else HasRepliesTo and p2.senderTargetId
	local Sender = {}
	
	if SenderTargetId or NoP6 then
		local User = Users[p2.senderTargetId]
		Sender = {
			id = if SenderTargetId or IsNotSenderTargetIdMatch and NoP6 then p2.senderTargetId else nil,
			thumbnail = if IsNotSenderTargetIdMatch and NoP6 and (IsNotSenderTargetIdMatch and User) then GetThumbnailsForUserIdsModule({ p2.senderTargetId })[1] else nil,
			shouldShowName = if SenderTargetId then p3.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION or HasRepliesTo else nil
		}
	elseif p2.senderType == MessageModelModule.SenderTypes.User and not p2.senderTargetId then
		NewResult:warning(`User message with no senderTargetId: {p2.id}`)
	end
	return CryoModule.Dictionary.join(p2, {
		conversationId = p3.id,
		messageId = MessageId,
		position = p4 and p4.position + 1 or 1,
		isIncoming = IsNotSenderTargetIdMatch,
		isLastMessageInMessageGroup = NoP6,
		isNewSender = FetchedOldestMessage1,
		sender = Sender,
		isSending = p5 or false,
		showDateTime = FetchedOldestMessage,
		additionalProps = {
			placeId = p2.placeId,
			universeId = p2.gameLink and p2.gameLink.universeId,
			senderUserId = IsNotSenderTargetIdMatch and p2.senderTargetId or nil
		}
	})
end