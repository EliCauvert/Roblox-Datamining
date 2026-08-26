local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local chatMuteModule = require(parent.ChatMute)
local expChatSharedModule = require(parent.ExpChatShared)
local userMuted = require(parent.ExpChatShared).Actions.UserMuted
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatUseChatMuteStore = sharedFlagsModule.FFlagExpChatUseChatMuteStore
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagAbuseReportVoiceMute = sharedFlagsModule.FFlagAbuseReportVoiceMute

local function _(p1, p2)
	-- upvalues: fFlagAbuseReportVoiceMute (ref)
	if not fFlagAbuseReportVoiceMute or not p2 then return end
	local participants = p2.participants
	
	if not participants then return end
	local var1 = participants[tostring(p1)]
	
	if var1 and not var1.isMutedLocally then
		p2:ToggleMutePlayer(p1, "igm-report-v2")
	end
end

function muteUser(p1, p2, p3)
	-- upvalues: fFlagExpChatUseChatMuteStore (ref), chatMuteModule (ref), fFlagAbuseReportVoiceMute (ref), expChatSharedModule (ref), fFlagExpChatUseMessagesStore (ref), userMuted (ref)
	if not p1 or not p2 then
		return false
	elseif p1 == p2.UserId then
		return false
	elseif fFlagExpChatUseChatMuteStore then
		chatMuteModule.mutePlayer({ userId = tostring(p1) })
		
		if fFlagAbuseReportVoiceMute and fFlagAbuseReportVoiceMute and p3 then
			local participants = p3.participants
			
			if participants then
				local var1 = participants[tostring(p1)]
				
				if var1 and not var1.isMutedLocally then
					p3:ToggleMutePlayer(p1, "igm-report-v2")
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
				context.messagesStore.muteUser(p1)
				
				if fFlagAbuseReportVoiceMute and fFlagAbuseReportVoiceMute and p3 then
					local participants = p3.participants
					
					if participants then
						local var2 = participants[tostring(p1)]
						
						if var2 and not var2.isMutedLocally then
							p3:ToggleMutePlayer(p1, "igm-report-v2")
						end
					end
				end
				return true
			else
				return false
			end
		else
			context.store:dispatch(userMuted(p1))
			
			if fFlagAbuseReportVoiceMute and fFlagAbuseReportVoiceMute and p3 then
				local participants = p3.participants
				
				if participants then
					local var3 = participants[tostring(p1)]
					
					if var3 and not var3.isMutedLocally then
						p3:ToggleMutePlayer(p1, "igm-report-v2")
					end
				end
			end
			return true
		end
	end
end

function isUserMuted(p1)
	-- upvalues: fFlagExpChatUseChatMuteStore (ref), chatMuteModule (ref), expChatSharedModule (ref), fFlagExpChatUseMessagesStore (ref)
	if not p1 then
		return false
	elseif fFlagExpChatUseChatMuteStore then
		return chatMuteModule.isUserIdMuted(tostring(p1))
	end
	local context = expChatSharedModule.context
	
	return if context.store then if fFlagExpChatUseMessagesStore then if context.messagesStore then context.messagesStore.getMutedUserIds(false)[tostring(p1)] == true else false else context.store:getState().MutedUsers[tostring(p1)] == true else false
end

return { isUserMuted = isUserMuted, muteUser = muteUser }