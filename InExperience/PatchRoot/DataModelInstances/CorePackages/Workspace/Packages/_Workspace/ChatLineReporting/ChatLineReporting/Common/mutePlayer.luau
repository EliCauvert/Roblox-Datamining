local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local parent = chatLineReporting.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local RBXMuteCommand = require(parent.ExpChatShared).Commands.RBXMuteCommand
local userMuted = require(parent.ExpChatShared).Actions.UserMuted
local constantsModule = require(chatLineReporting.Common.Constants)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagChatLineReportingGlobalMuteEnabled = sharedFlagsModule.FFlagChatLineReportingGlobalMuteEnabled

function mutePlayer(p0, p1, p2) --[[ line: 15 ]]
	-- upvalues: expChatSharedModule (ref), fFlagChatLineReportingGlobalMuteEnabled (ref), constantsModule (ref), fFlagExpChatUseMessagesStore (ref), userMuted (ref), RBXMuteCommand (ref)
	local context = expChatSharedModule.context
	local t = nil
	
	if fFlagChatLineReportingGlobalMuteEnabled and p2 then
		if not tonumber(p0.userId) then
			return t
		end
		if context.globalMutedUsersStore then
			context.globalMutedUsersStore.muteGlobalUserId(p0.userId)
			
			return {
				metadata = "Roblox.GlobalMute.Info.Success",
				key = constantsModule.SuccessfulMuteKey,
				args = { RBX_NAME = p0.displayName }
			}
		end
		t = {
			key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
			metadata = "Roblox.GlobalMute.Error.ContextNotAvailable",
			args = { RBX_NAME = p0.displayName }
		}
		
		return t
	elseif p0.username == "" then
		t = {
			metadata = "Roblox.Mute.Error.PlayerNotFound",
			key = constantsModule.ErrorDoesNotExistKey,
			args = { RBX_NAME = p0.displayName }
		}
		
		return t
	elseif tonumber(p0.userId) == p1.UserId then
		t = {
			metadata = "Roblox.Mute.Error.CannotMuteSelf",
			key = constantsModule.ErrorSelfMuteKey,
			args = { RBX_NAME = p0.displayName }
		}
		
		return t
	elseif not tonumber(p0.userId) then
		return RBXMuteCommand.clientRun(context.store, p1.UserId, "/mute " .. p0.displayName, context)
	elseif not context.store then
	end
	if fFlagExpChatUseMessagesStore then
		if context and context.messagesStore then
			context.messagesStore.muteUser(p0.userId)
			
			return t
		end
		return {
			key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
			metadata = "Roblox.Mute.Error.ContextNotAvailable",
			args = { RBX_NAME = p0.displayName }
		}
	else
		context.store:dispatch(userMuted(p0.userId))
		t = {
			metadata = "Roblox.Mute.Info.Success",
			key = constantsModule.SuccessfulMuteKey,
			args = { RBX_NAME = p0.displayName }
		}
		
		return t
	end
end

return mutePlayer