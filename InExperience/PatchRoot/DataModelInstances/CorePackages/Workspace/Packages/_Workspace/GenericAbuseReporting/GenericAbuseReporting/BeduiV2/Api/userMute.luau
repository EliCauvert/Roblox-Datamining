local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local expChatSharedModule = require(parent.ExpChatShared)
local userMuted = require(parent.ExpChatShared).Actions.UserMuted
local fFlagExpChatUseMessagesStore = require(parent.SharedFlags).FFlagExpChatUseMessagesStore

function muteUser(p0, p1) --[[ line: 11 ]]
	-- upvalues: expChatSharedModule (ref), fFlagExpChatUseMessagesStore (ref), userMuted (ref)
	local context = expChatSharedModule.context
	
	if not p0 or not p1 then
		return false
	elseif p0 == p1.UserId then
		return false
	elseif not p0 or not context.store then
		return false
	elseif not fFlagExpChatUseMessagesStore then
		context.store:dispatch(userMuted(p0))
		
		return true
	elseif context.messagesStore then
		context.messagesStore.muteUser(p0)
		
		return true
	end
	return false
end

function isUserMuted(p2) --[[ line: 36 ]]
	-- upvalues: expChatSharedModule (ref), fFlagExpChatUseMessagesStore (ref)
	local context = expChatSharedModule.context
	
	return if p2 then if context.store then if fFlagExpChatUseMessagesStore then if context.messagesStore then context.messagesStore.isUserMuted(p2) else false else context.store:getState().MutedUsers[tostring(p2)] == true else false else false
end

return { isUserMuted = isUserMuted, muteUser = muteUser }