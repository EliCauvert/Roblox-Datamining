local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local parent = chatLineReporting.Parent
local chatMuteModule = require(parent.ChatMute)
local expChatSharedModule = require(parent.ExpChatShared)
local RBXMuteCommand = require(parent.ExpChatShared).Commands.RBXMuteCommand
local userMuted = require(parent.ExpChatShared).Actions.UserMuted
local constantsModule = require(chatLineReporting.Common.Constants)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatUseChatMuteStore = sharedFlagsModule.FFlagExpChatUseChatMuteStore
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagChatLineReportingGlobalMuteEnabled = sharedFlagsModule.FFlagChatLineReportingGlobalMuteEnabled
local expChatMuteByUserIdBeforeUsernameCheck = game:DefineFastFlag("ExpChatMuteByUserIdBeforeUsernameCheck", false)

function mutePlayer(p0, p1, p2) --[[ line: 26 ]]
	-- upvalues: fFlagExpChatUseChatMuteStore (ref), expChatMuteByUserIdBeforeUsernameCheck (ref), constantsModule (ref), chatMuteModule (ref), fFlagChatLineReportingGlobalMuteEnabled (ref), expChatSharedModule (ref), fFlagExpChatUseMessagesStore (ref), userMuted (ref), RBXMuteCommand (ref)
	if fFlagExpChatUseChatMuteStore then
		if p0.username == "" and (not expChatMuteByUserIdBeforeUsernameCheck or not tonumber(p0.userId)) then
			return {
				metadata = "Roblox.Mute.Error.PlayerNotFound",
				key = constantsModule.ErrorDoesNotExistKey,
				args = { RBX_NAME = p0.displayName }
			}
		elseif tonumber(p0.userId) == p1.UserId then
			return {
				metadata = "Roblox.Mute.Error.CannotMuteSelf",
				key = constantsModule.ErrorSelfMuteKey,
				args = { RBX_NAME = p0.displayName }
			}
		elseif tonumber(p0.userId) then
			chatMuteModule.mutePlayer({ userId = p0.userId })
			
			return {
				key = constantsModule.SuccessfulMuteKey,
				args = { RBX_NAME = p0.displayName },
				metadata = if fFlagChatLineReportingGlobalMuteEnabled and p2 then "Roblox.GlobalMute.Info.Success" else "Roblox.Mute.Info.Success"
			}
		end
		local var6 = chatMuteModule.resolveMuteTarget(p0.displayName, tostring(p1.UserId))
		
		if var6.playerInfo then
			chatMuteModule.mutePlayer(var6.playerInfo)
		end
		return {
			key = var6.key,
			args = var6.args,
			metadata = if var6.playerInfo then "Roblox.Mute.Info.Success" else "Roblox.Mute.Error.Unknown"
		}
	else
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
end

return mutePlayer