local getPlayersFromStringModule = require(script.Parent.getPlayersFromString)
local expChatShared = script:FindFirstAncestor("ExpChatShared")
local userUnmutedModule = require(expChatShared.Actions.UserUnmuted)
local fFlagExpChatUseMessagesStore = require(expChatShared.Parent.SharedFlags).FFlagExpChatUseMessagesStore
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/unmute", "/um" },
	clientRun = function(p0, p1, p2, p3) --[[ line: 15 ]]
		-- upvalues: getPlayersFromStringModule (ref), fFlagExpChatUseMessagesStore (ref), userUnmutedModule (ref)
		local var3 = string.split(p2, " ")[2]
		
		if not var3 then
			return {
				key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
				metadata = "Roblox.Unmute.Error.PlayerNotFound",
				args = { RBX_NAME = "" }
			}
		end
		local var4 = getPlayersFromStringModule(p0:getState().Players, var3)
		
		if #var4 == 0 then
			return {
				key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
				metadata = "Roblox.Unmute.Error.PlayerNotFound",
				args = { RBX_NAME = var3 }
			}
		elseif #var4 > 1 then
			return {
				key = "InGame.Chat.Response.DisplayNameMultipleMatches",
				metadata = "Roblox.Unmute.Error.MultipleMatches",
				args = {}
			}
		end
		local var5 = var4[1]
		
		if var5.userId == tostring(p1) then
			return {
				key = "CoreScripts.TextChat.Mute.Error.CannotMuteSelf",
				metadata = "Roblox.Unmute.Error.CannotMuteSelf",
				args = {}
			}
		elseif fFlagExpChatUseMessagesStore then
			if not p3 or not p3.messagesStore then
				return {
					key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
					metadata = "Roblox.Unmute.Error.ContextNotAvailable",
					args = {}
				}
			end
			p3.messagesStore.unmuteUser(var5.userId)
		else
			p0:dispatch(userUnmutedModule(var5.userId))
		end
		return {
			key = "CoreScripts.TextChat.Unmute.Success",
			metadata = "Roblox.Unmute.Info.Success",
			args = { RBX_NAME = var5.nameToDisplay }
		}
	end
}