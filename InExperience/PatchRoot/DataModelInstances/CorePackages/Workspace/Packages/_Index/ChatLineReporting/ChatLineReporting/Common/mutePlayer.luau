local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local Parent = ChatLineReporting.Parent
local ChatMuteModule = require(Parent.ChatMute)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local RBXMuteCommand = require(Parent.ExpChatShared).Commands.RBXMuteCommand
local ConstantsModule = require(ChatLineReporting.Common.Constants)
local FFlagExpChatUseChatMuteStore = require(Parent.SharedFlags).FFlagExpChatUseChatMuteStore
local ExpChatMuteByUserIdBeforeUsernameCheck = game:DefineFastFlag("ExpChatMuteByUserIdBeforeUsernameCheck", false)

function mutePlayer(p1, Player: Player, p2) --[[ Line: 23 ]]
	-- upvalues: FFlagExpChatUseChatMuteStore (copy), ExpChatMuteByUserIdBeforeUsernameCheck (copy), ConstantsModule (copy), ChatMuteModule (copy), ExpChatSharedModule (copy), RBXMuteCommand (copy)
	if FFlagExpChatUseChatMuteStore then
		if p1.username == "" and (not ExpChatMuteByUserIdBeforeUsernameCheck or not tonumber(p1.userId)) then
			return {
				metadata = "Roblox.Mute.Error.PlayerNotFound",
				key = ConstantsModule.ErrorDoesNotExistKey,
				args = { RBX_NAME = p1.displayName }
			}
		end
		if tonumber(p1.userId) == Player.UserId then
			return {
				metadata = "Roblox.Mute.Error.CannotMuteSelf",
				key = ConstantsModule.ErrorSelfMuteKey,
				args = { RBX_NAME = p1.displayName }
			}
		end
		if tonumber(p1.userId) then
			ChatMuteModule.mutePlayer({ userId = p1.userId })
			
			return {
				key = ConstantsModule.SuccessfulMuteKey,
				args = { RBX_NAME = p1.displayName },
				metadata = if p2 then "Roblox.GlobalMute.Info.Success" else "Roblox.Mute.Info.Success"
			}
		end
		local ResolveMuteTargetResult = ChatMuteModule.resolveMuteTarget(p1.displayName, (tostring(Player.UserId)))
		
		if ResolveMuteTargetResult.playerInfo then
			ChatMuteModule.mutePlayer(ResolveMuteTargetResult.playerInfo)
		end
		return {
			key = ResolveMuteTargetResult.key,
			args = ResolveMuteTargetResult.args,
			metadata = if ResolveMuteTargetResult.playerInfo then "Roblox.Mute.Info.Success" else "Roblox.Mute.Error.Unknown"
		}
	else
		local Context = ExpChatSharedModule.context
		local Config = nil
		
		if p2 then
			if tonumber(p1.userId) then
				if Context.globalMutedUsersStore then
					Context.globalMutedUsersStore.muteGlobalUserId(p1.userId)
					
					return {
						metadata = "Roblox.GlobalMute.Info.Success",
						key = ConstantsModule.SuccessfulMuteKey,
						args = { RBX_NAME = p1.displayName }
					}
				else
					Config = {
						key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
						metadata = "Roblox.GlobalMute.Error.ContextNotAvailable",
						args = { RBX_NAME = p1.displayName }
					}
					
					return Config
				end
			end
		elseif p1.username == "" then
			Config = {
				metadata = "Roblox.Mute.Error.PlayerNotFound",
				key = ConstantsModule.ErrorDoesNotExistKey,
				args = { RBX_NAME = p1.displayName }
			}
			
			return Config
		elseif tonumber(p1.userId) == Player.UserId then
			Config = {
				metadata = "Roblox.Mute.Error.CannotMuteSelf",
				key = ConstantsModule.ErrorSelfMuteKey,
				args = { RBX_NAME = p1.displayName }
			}
			
			return Config
		elseif not tonumber(p1.userId) then
			return RBXMuteCommand.clientRun(Context.store, Player.UserId, "/mute " .. p1.displayName, Context)
		elseif Context.store then
			if Context and Context.messagesStore then
				Context.messagesStore.muteUser(p1.userId)
				
				return Config
			else
				Config = {
					key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
					metadata = "Roblox.Mute.Error.ContextNotAvailable",
					args = { RBX_NAME = p1.displayName }
				}
				
				return Config
			end
		end
		return Config
	end
end

return mutePlayer