local roduxModule = require(game:GetService("CorePackages").Packages.Rodux)

if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateChatRodux) then
	return nil
end
local actions = script.Parent.Parent.Actions

return roduxModule.createReducer({
	canChat = false,
	visible = true,
	lastReadMessages = 0,
	unreadMessages = 0
}, {
	[require(actions.UpdateUnreadMessagesBadge).name] = function(p1, p2)
		return if p1.visible then {
			visible = true,
			lastReadMessages = 0,
			unreadMessages = 0,
			canChat = p1.canChat
		} else {
			visible = false,
			lastReadMessages = 0,
			canChat = p1.canChat,
			unreadMessages = p2.messages
		}
	end,
	[require(actions.UpdateChatMessages).name] = function(p1, p2)
		return if p1.visible then {
			visible = true,
			unreadMessages = 0,
			canChat = p1.canChat,
			lastReadMessages = p2.messages
		} else {
			visible = false,
			canChat = p1.canChat,
			lastReadMessages = p1.lastReadMessages,
			unreadMessages = p2.messages - p1.lastReadMessages
		}
	end,
	[require(actions.UpdateChatVisible).name] = function(p1, p2)
		return if p2.visible then {
			visible = true,
			unreadMessages = 0,
			canChat = p1.canChat,
			lastReadMessages = p1.lastReadMessages + p1.unreadMessages
		} else {
			visible = false,
			canChat = p1.canChat,
			lastReadMessages = p1.lastReadMessages,
			unreadMessages = p1.unreadMessages
		}
	end,
	[require(actions.SetCanChat).name] = function(p1, p2)
		return {
			canChat = p2.canChat,
			visible = p1.visible,
			lastReadMessages = p1.lastReadMessages,
			unreadMessages = p1.unreadMessages
		}
	end
})