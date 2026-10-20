local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local ChatMuteModule = require(Parent.ChatMute)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local UserMutedFunction = require(Parent.ExpChatShared).Actions.UserMuted
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatUseChatMuteStore = SharedFlagsModule.FFlagExpChatUseChatMuteStore
local FFlagExpChatUseMessagesStore = SharedFlagsModule.FFlagExpChatUseMessagesStore

function muteUser(UserId, Player): boolean
	-- upvalues: FFlagExpChatUseChatMuteStore (copy), ChatMuteModule (copy), ExpChatSharedModule (copy), FFlagExpChatUseMessagesStore (copy), UserMutedFunction (copy)
	if not UserId or not Player then
		return false
	elseif UserId == Player.UserId then
		return false
	elseif FFlagExpChatUseChatMuteStore then
		ChatMuteModule.mutePlayer({ userId = tostring(UserId) })
		
		return true
	else
		local Context = ExpChatSharedModule.context
		
		if not Context.store then
			return false
		elseif not FFlagExpChatUseMessagesStore then
			Context.store:dispatch(UserMutedFunction(UserId))
			
			return true
		elseif Context.messagesStore then
			Context.messagesStore.muteUser(UserId)
			
			return true
		else
			return false
		end
	end
end

function isUserMuted(p1)
	-- upvalues: FFlagExpChatUseChatMuteStore (copy), ChatMuteModule (copy), ExpChatSharedModule (copy), FFlagExpChatUseMessagesStore (copy)
	if not p1 then
		return false
	elseif FFlagExpChatUseChatMuteStore then
		return ChatMuteModule.isUserIdMuted((tostring(p1)))
	else
		local Context = ExpChatSharedModule.context
		
		return if Context.store then if FFlagExpChatUseMessagesStore then if Context.messagesStore then Context.messagesStore.getMutedUserIds(false)[tostring(p1)] == true else false else Context.store:getState().MutedUsers[tostring(p1)] == true else false
	end
end

return { isUserMuted = isUserMuted, muteUser = muteUser }