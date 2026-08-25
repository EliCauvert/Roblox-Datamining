local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local signalsModule = require(parent.Signals)

if require(expChat.Flags.FFlagExpChatUseChatMuteStore) then
	local chatMuteModule = require(parent.ChatMute)
	
	return signalsModule.createComputed(function()
		-- upvalues: chatMuteModule (ref)
		return {
			getMutedGlobalUsernames = chatMuteModule.getMutedUsernames(),
			getMutedGlobalDisplayNames = chatMuteModule.getMutedDisplayNames(),
			getMutedGlobalUserIds = chatMuteModule.getMutedUserIds(),
			muteGlobalUsername = function(p0)
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.mutePlayer({ username = p0 })
			end,
			unmuteGlobalUsername = function(p1)
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.unmutePlayer({ username = p1 })
			end,
			muteGlobalDisplayName = function(p2)
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.mutePlayer({ displayName = p2 })
			end,
			unmuteGlobalDisplayName = function(p3)
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.unmutePlayer({ displayName = p3 })
			end,
			isUsernameMuted = chatMuteModule.isUsernameMuted,
			isDisplayNameMuted = chatMuteModule.isDisplayNameMuted,
			muteGlobalUserId = function(p4)
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.mutePlayer({ userId = tostring(p4) })
			end,
			unmuteGlobalUserId = function(p5)
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.unmutePlayer({ userId = tostring(p5) })
			end,
			isUserIdMuted = chatMuteModule.isUserIdMuted
		}
	end)
end
return signalsModule.createComputed(require(script.createGlobalMutedUsersStore))