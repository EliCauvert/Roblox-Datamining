local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local getThumbnailsForUserIdsModule = require(appChat.Users.getThumbnailsForUserIds)
local conversationModule = require(appChat.Models.Conversation)
local messageModelModule = require(appChat.Models.MessageModel)
local cryoModule = require(parent.Cryo)
local name = require(appChat.Logger):new(script.Name)

return function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 31 ]]
	-- upvalues: messageModelModule (ref), getThumbnailsForUserIdsModule (ref), conversationModule (ref), name (ref), cryoModule (ref)
	local var6 = p1.senderTargetId ~= tostring(p0.LocalUserId)
	local var7 = p1.repliesTo ~= nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	local function _(p7, p8, p9) --[[ line: 37 | named "timeDiffExceeds" ]]
		return if p7 and p8 and (p7.sent and p8.sent) then p9 < math.abs(p7.sent:GetUnixTimestamp() - p8.sent:GetUnixTimestamp()) else false
	end
	
	local _ = function(p10) --[[ line: 43 | named "isSystemMessage" ]]
		return p10 and p10.messageType == "System"
	end
	
	local _ = function(p11) --[[ line: 47 | named "isModerated" ]]
		return p11 and p11.moderated == true
	end
	
	local _ = function(p12) --[[ line: 51 | named "isHiddenMessage" ]]
		-- upvalues: messageModelModule (copy)
		return p12 and p12.visibility == messageModelModule.VisibilityTypes.Hidden
	end
	
	local _ = function(p13) --[[ line: 55 | named "isReplyMessage" ]]
		return p13 and p13.repliesTo ~= nil
	end
	
	local _ = function(p14, p15) --[[ line: 59 | named "hasSenderChange" ]]
		return p14 and (p15 and p14.senderTargetId ~= p15.senderTargetId)
	end
	
	local _ = function(p16, p17) --[[ line: 63 | named "hasModeratedBreak" ]]
		return p16 and p16.moderated == true or p17 and p17.moderated == true
	end
	
	local var8 = if not p4 and p3.fetchedOldestMessage then if p1 and p4 and (p1.sent and p4.sent) then math.abs(p1.sent:GetUnixTimestamp() - p4.sent:GetUnixTimestamp()) > 300 else false else true
	local var8_1 = var8 or (not p4 or (p4 and (p1 and p4.senderTargetId ~= p1.senderTargetId) or (p4 and p4.messageType == "System" or (p1 and p1.repliesTo ~= nil or (p4 and p4.visibility == messageModelModule.VisibilityTypes.Hidden or (p4 and p4.moderated == true or p1 and p1.moderated == true))))))
	local var10 = not p6
	
	if not var10 then
		var10 = p6 and p6.messageType == "System"
		
		if not var10 then
			var10 = p6 and (p1 and p6.senderTargetId ~= p1.senderTargetId)
			
			if not var10 then
				var10 = if p6 and p1 and (p6.sent and p1.sent) then math.abs(p6.sent:GetUnixTimestamp() - p1.sent:GetUnixTimestamp()) > 300 else false
				var10 = var10 or (p6 and p6.repliesTo ~= nil or (p6 and p6.visibility == messageModelModule.VisibilityTypes.Hidden or (p1 and p1.moderated == true or p6 and p6.moderated == true)))
			end
		end
	end
	local senderTargetId
	local users = p0.Users
	
	if not var6 or not var8_1 then
		senderTargetId = var7 and p1.senderTargetId
	end
	local t = {}
	
	if senderTargetId or var10 then
		t = {
			id = if senderTargetId or var6 and var10 then p1.senderTargetId else nil,
			thumbnail = if not var6 or not var10 then if var6 and users[p1.senderTargetId] then getThumbnailsForUserIdsModule({ p1.senderTargetId })[1] else nil else nil,
			shouldShowName = if senderTargetId then if p3.conversationType ~= conversationModule.Type.MULTI_USER_CONVERSATION then var7 else true else nil
		}
	elseif p1.senderType == messageModelModule.SenderTypes.User and not p1.senderTargetId then
		name:warning(`User message with no senderTargetId: {p1.id}`)
	end
	return cryoModule.Dictionary.join(p1, {
		conversationId = p3.id,
		messageId = p2,
		position = if p4 then p4.position + 1 else 1,
		isIncoming = var6,
		isLastMessageInMessageGroup = var10,
		isNewSender = var8_1,
		sender = t,
		isSending = p5 or false,
		showDateTime = var8,
		additionalProps = {
			placeId = p1.placeId,
			universeId = p1.gameLink and p1.gameLink.universeId,
			senderUserId = if var6 then p1.senderTargetId else nil
		}
	})
end