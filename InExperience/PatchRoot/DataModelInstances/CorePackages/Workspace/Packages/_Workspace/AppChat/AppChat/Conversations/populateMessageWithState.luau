local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local getThumbnailsForUserIdsModule = require(appChat.Users.getThumbnailsForUserIds)
local conversationModule = require(appChat.Models.Conversation)
local messageModelModule = require(appChat.Models.MessageModel)
local cryoModule = require(parent.Cryo)
local name = require(appChat.Logger):new(script.Name)

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: messageModelModule (ref), getThumbnailsForUserIdsModule (ref), conversationModule (ref), name (ref), cryoModule (ref)
	local var1 = p2.senderTargetId ~= tostring(p1.LocalUserId)
	local var2 = p2.repliesTo ~= nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	local function _(p8, p9, p10)
		return if p8 and p9 and (p8.sent and p9.sent) then p10 < math.abs(p8.sent:GetUnixTimestamp() - p9.sent:GetUnixTimestamp()) else false
	end
	
	local _ = function(p8)
		return p8 and p8.messageType == "System"
	end
	
	local _ = function(p8)
		return p8 and p8.moderated == true
	end
	
	local _ = function(p8)
		-- upvalues: messageModelModule (copy)
		return p8 and p8.visibility == messageModelModule.VisibilityTypes.Hidden
	end
	
	local _ = function(p8)
		return p8 and p8.repliesTo ~= nil
	end
	
	local _ = function(p8, p9)
		return p8 and (p9 and p8.senderTargetId ~= p9.senderTargetId)
	end
	
	local _ = function(p8, p9)
		return p8 and p8.moderated == true or p9 and p9.moderated == true
	end
	
	local var3 = if not p5 and p4.fetchedOldestMessage then if p2 and p5 and (p2.sent and p5.sent) then math.abs(p2.sent:GetUnixTimestamp() - p5.sent:GetUnixTimestamp()) > 300 else false else true
	local var4 = var3 or (not p5 or (p5 and (p2 and p5.senderTargetId ~= p2.senderTargetId) or (p5 and p5.messageType == "System" or (p2 and p2.repliesTo ~= nil or (p5 and p5.visibility == messageModelModule.VisibilityTypes.Hidden or (p5 and p5.moderated == true or p2 and p2.moderated == true))))))
	local var5 = not p7
	
	if not var5 then
		var5 = p7 and p7.messageType == "System"
		
		if not var5 then
			var5 = p7 and (p2 and p7.senderTargetId ~= p2.senderTargetId)
			
			if not var5 then
				var5 = if p7 and p2 and (p7.sent and p2.sent) then math.abs(p7.sent:GetUnixTimestamp() - p2.sent:GetUnixTimestamp()) > 300 else false
				var5 = var5 or (p7 and p7.repliesTo ~= nil or (p7 and p7.visibility == messageModelModule.VisibilityTypes.Hidden or (p2 and p2.moderated == true or p7 and p7.moderated == true)))
			end
		end
	end
	local senderTargetId
	local users = p1.Users
	
	if not var1 or not var4 then
		senderTargetId = var2 and p2.senderTargetId
	end
	local t = {}
	
	if senderTargetId or var5 then
		t = {
			id = if senderTargetId or var1 and var5 then p2.senderTargetId else nil,
			thumbnail = if not var1 or not var5 then if var1 and users[p2.senderTargetId] then getThumbnailsForUserIdsModule({ p2.senderTargetId })[1] else nil else nil,
			shouldShowName = if senderTargetId then if p4.conversationType ~= conversationModule.Type.MULTI_USER_CONVERSATION then var2 else true else nil
		}
	elseif p2.senderType == messageModelModule.SenderTypes.User and not p2.senderTargetId then
		name:warning(`User message with no senderTargetId: {p2.id}`)
	end
	return cryoModule.Dictionary.join(p2, {
		conversationId = p4.id,
		messageId = p3,
		position = if p5 then p5.position + 1 else 1,
		isIncoming = var1,
		isLastMessageInMessageGroup = var5,
		isNewSender = var4,
		sender = t,
		isSending = p6 or false,
		showDateTime = var3,
		additionalProps = {
			placeId = p2.placeId,
			universeId = p2.gameLink and p2.gameLink.universeId,
			senderUserId = if var1 then p2.senderTargetId else nil
		}
	})
end