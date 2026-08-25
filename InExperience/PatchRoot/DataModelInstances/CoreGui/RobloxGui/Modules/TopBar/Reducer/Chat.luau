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
	[require(actions.UpdateUnreadMessagesBadge).name] = function(p0, p1)
		return if p0.visible then {
			visible = true,
			lastReadMessages = 0,
			unreadMessages = 0,
			canChat = p0.canChat
		} else {
			visible = false,
			lastReadMessages = 0,
			canChat = p0.canChat,
			unreadMessages = p1.messages
		}
	end,
	[require(actions.UpdateChatMessages).name] = function(p2, p3)
		return if p2.visible then {
			visible = true,
			unreadMessages = 0,
			canChat = p2.canChat,
			lastReadMessages = p3.messages
		} else {
			visible = false,
			canChat = p2.canChat,
			lastReadMessages = p2.lastReadMessages,
			unreadMessages = p3.messages - p2.lastReadMessages
		}
	end,
	[require(actions.UpdateChatVisible).name] = function(p4, p5)
		return if p5.visible then {
			visible = true,
			unreadMessages = 0,
			canChat = p4.canChat,
			lastReadMessages = p4.lastReadMessages + p4.unreadMessages
		} else {
			visible = false,
			canChat = p4.canChat,
			lastReadMessages = p4.lastReadMessages,
			unreadMessages = p4.unreadMessages
		}
	end,
	[require(actions.SetCanChat).name] = function(p6, p7)
		return {
			canChat = p7.canChat,
			visible = p6.visible,
			lastReadMessages = p6.lastReadMessages,
			unreadMessages = p6.unreadMessages
		}
	end
})