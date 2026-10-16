local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local SignalsModule = require(Parent.Signals)

if require(ExpChat.Flags.FFlagExpChatUseChatMuteStore) then
	local ChatMuteModule = require(Parent.ChatMute)
	
	return SignalsModule.createComputed(function() --[[ Line: 11 ]]
		-- upvalues: ChatMuteModule (copy)
		return {
			getMutedGlobalUsernames = ChatMuteModule.getMutedUsernames(),
			getMutedGlobalDisplayNames = ChatMuteModule.getMutedDisplayNames(),
			getMutedGlobalUserIds = ChatMuteModule.getMutedUserIds(),
			muteGlobalUsername = function(Username) --[[ Line: 16 ]]
				-- upvalues: ChatMuteModule (upval)
				ChatMuteModule.mutePlayer({ username = Username })
			end,
			unmuteGlobalUsername = function(Username) --[[ Line: 19 ]]
				-- upvalues: ChatMuteModule (upval)
				ChatMuteModule.unmutePlayer({ username = Username })
			end,
			muteGlobalDisplayName = function(DisplayName) --[[ Line: 22 ]]
				-- upvalues: ChatMuteModule (upval)
				ChatMuteModule.mutePlayer({ displayName = DisplayName })
			end,
			unmuteGlobalDisplayName = function(DisplayName) --[[ Line: 25 ]]
				-- upvalues: ChatMuteModule (upval)
				ChatMuteModule.unmutePlayer({ displayName = DisplayName })
			end,
			isUsernameMuted = ChatMuteModule.isUsernameMuted,
			isDisplayNameMuted = ChatMuteModule.isDisplayNameMuted,
			muteGlobalUserId = function(p1) --[[ Line: 30 ]]
				-- upvalues: ChatMuteModule (upval)
				ChatMuteModule.mutePlayer({ userId = tostring(p1) })
			end,
			unmuteGlobalUserId = function(p1) --[[ Line: 33 ]]
				-- upvalues: ChatMuteModule (upval)
				ChatMuteModule.unmutePlayer({ userId = tostring(p1) })
			end,
			isUserIdMuted = ChatMuteModule.isUserIdMuted
		}
	end)
else
	return SignalsModule.createComputed((require(script.createGlobalMutedUsersStore)))
end