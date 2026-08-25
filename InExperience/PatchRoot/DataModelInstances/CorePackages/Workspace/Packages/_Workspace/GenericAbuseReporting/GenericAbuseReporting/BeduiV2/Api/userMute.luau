local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local chatMuteModule = require(parent.ChatMute)
local expChatSharedModule = require(parent.ExpChatShared)
local userMuted = require(parent.ExpChatShared).Actions.UserMuted
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatUseChatMuteStore = sharedFlagsModule.FFlagExpChatUseChatMuteStore
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagAbuseReportVoiceMute = sharedFlagsModule.FFlagAbuseReportVoiceMute

local function _(p0, p1)
	-- upvalues: fFlagAbuseReportVoiceMute (ref)
	if not fFlagAbuseReportVoiceMute or not p1 then return end
	local participants = p1.participants
	
	if not participants then return end
	local var3 = participants[tostring(p0)]
	
	if var3 and not var3.isMutedLocally then
		p1:ToggleMutePlayer(p0, "igm-report-v2")
	end
end

function muteUser(p2, p3, p4)
	-- upvalues: fFlagExpChatUseChatMuteStore (ref), chatMuteModule (ref), fFlagAbuseReportVoiceMute (ref), expChatSharedModule (ref), fFlagExpChatUseMessagesStore (ref), userMuted (ref)
	if not p2 or not p3 then
		return false
	elseif p2 == p3.UserId then
		return false
	elseif fFlagExpChatUseChatMuteStore then
		chatMuteModule.mutePlayer({ userId = tostring(p2) })
		
		if fFlagAbuseReportVoiceMute and fFlagAbuseReportVoiceMute and p4 then
			local participants = p4.participants
			
			if participants then
				local var4 = participants[tostring(p2)]
				
				if var4 and not var4.isMutedLocally then
					p4:ToggleMutePlayer(p2, "igm-report-v2")
				end
			end
		end
		return true
	else
		local context = expChatSharedModule.context
		
		if not context.store then
			return false
		elseif fFlagExpChatUseMessagesStore then
			if context.messagesStore then
				context.messagesStore.muteUser(p2)
				
				if fFlagAbuseReportVoiceMute and fFlagAbuseReportVoiceMute and p4 then
					local participants = p4.participants
					
					if participants then
						local var5 = participants[tostring(p2)]
						
						if var5 and not var5.isMutedLocally then
							p4:ToggleMutePlayer(p2, "igm-report-v2")
						end
					end
				end
				return true
			else
				return false
			end
		else
			context.store:dispatch(userMuted(p2))
			
			if fFlagAbuseReportVoiceMute and fFlagAbuseReportVoiceMute and p4 then
				local participants = p4.participants
				
				if participants then
					local var6 = participants[tostring(p2)]
					
					if var6 and not var6.isMutedLocally then
						p4:ToggleMutePlayer(p2, "igm-report-v2")
					end
				end
			end
			return true
		end
	end
end

function isUserMuted(p5)
	-- upvalues: fFlagExpChatUseChatMuteStore (ref), chatMuteModule (ref), expChatSharedModule (ref), fFlagExpChatUseMessagesStore (ref)
	if not p5 then
		return false
	elseif fFlagExpChatUseChatMuteStore then
		return chatMuteModule.isUserIdMuted(tostring(p5))
	end
	local context = expChatSharedModule.context
	
	return if context.store then if fFlagExpChatUseMessagesStore then if context.messagesStore then context.messagesStore.getMutedUserIds(false)[tostring(p5)] == true else false else context.store:getState().MutedUsers[tostring(p5)] == true else false
end

return { isUserMuted = isUserMuted, muteUser = muteUser }