local Parent = script:FindFirstAncestor("FriendsChat").Parent
local GetModeratedMaskTextModule = require(Parent.AppChat.getModeratedMaskText)
local GetReplyLabelDescriptorModule = require(Parent.AppChat.getReplyLabelDescriptor)
local NameInfoModule = require(script.Parent.NameInfo)
local _ = require(script.Parent.classifyMessage)
local _ = require(script.Parent.Parent.Parent.Utils.useLocalize)
local IconName = require(Parent.Foundation).Enums.IconName

return {
	MODERATED_ICON = IconName.TriangleExclamation,
	HIDDEN_ICON = IconName.LockClosed,
	REPLY_ICON = IconName.ArrowCurlToLeft,
	systemIcon = function(p1)
		-- upvalues: IconName (copy)
		return if p1 == "party" then IconName.TwoPeopleSpeechBubble else IconName.CircleI
	end,
	moderatedNoticeText = function(Callback)
		return if Callback then Callback("Feature.Chat.Message.MessageContentModerated") else ""
	end,
	hiddenNoticeText = function(DisplayName, Callback)
		return if Callback then Callback({
			"Feature.Chat.Message.CannotBeDisplayedThirdPerson",
			displayName = DisplayName
		}) else ""
	end,
	maskedBody = function(p1)
		-- upvalues: GetModeratedMaskTextModule (copy)
		return GetModeratedMaskTextModule(p1.messageId or p1.body)
	end,
	replyLabelText = function(p1)
		-- upvalues: NameInfoModule (copy), GetReplyLabelDescriptorModule (copy)
		local LocalUserId = p1.localUserId
		local NamesByUserId = p1.namesByUserId
		local IsSenderUserIdMatch: boolean = LocalUserId ~= nil and p1.senderUserId == LocalUserId
		local IsRepliedToUserIdMatch: boolean = LocalUserId ~= nil and p1.repliedToUserId == LocalUserId
		
		if NameInfoModule.isNameLoading(NamesByUserId[p1.senderUserId]) and not IsSenderUserIdMatch or NameInfoModule.isNameLoading(NamesByUserId[p1.repliedToUserId]) and not IsRepliedToUserIdMatch then
			return nil
		else
			local NamesByUserIdEntry = NamesByUserId[p1.senderUserId]
			local NamesByUserIdEntry1 = NamesByUserId[p1.repliedToUserId]
			local ReplyLabelDescriptorModule = GetReplyLabelDescriptorModule({
				senderIsLocalUser = IsSenderUserIdMatch,
				senderRepliedToSelf = p1.senderUserId == p1.repliedToUserId,
				senderRepliedToLocalUser = IsRepliedToUserIdMatch,
				isGroup = p1.isGroup,
				senderName = if NamesByUserIdEntry and NamesByUserIdEntry.name then NamesByUserIdEntry.name else "",
				repliedToName = if NamesByUserIdEntry1 and NamesByUserIdEntry1.name then NamesByUserIdEntry1.name else ""
			})
			
			return if p1.localize then p1.localize(ReplyLabelDescriptorModule) else ""
		end
	end
}