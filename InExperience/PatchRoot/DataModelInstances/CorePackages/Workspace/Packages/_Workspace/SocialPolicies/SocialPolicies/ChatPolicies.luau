return function(p0)
	return {
		getChatConversationHeaderGroupDetails = function()
			-- upvalues: p0 (ref)
			return p0.ChatConversationHeaderGroupDetails or false
		end,
		getChatHeaderSearch = function()
			-- upvalues: p0 (ref)
			return p0.ChatHeaderSearch or false
		end,
		getChatHeaderCreateChatGroup = function()
			-- upvalues: p0 (ref)
			return p0.ChatHeaderCreateChatGroup or false
		end,
		getChatHeaderHomeButton = function()
			-- upvalues: p0 (ref)
			return p0.ChatHeaderHomeButton or false
		end,
		getChatHeaderNotifications = function()
			-- upvalues: p0 (ref)
			return p0.ChatHeaderNotifications or false
		end,
		getChatPlayTogether = function()
			-- upvalues: p0 (ref)
			return p0.ChatPlayTogether or false
		end,
		getChatShareGameToChatFromChat = function()
			-- upvalues: p0 (ref)
			return p0.ChatShareGameToChatFromChat or false
		end,
		getChatTapConversationThumbnail = function()
			-- upvalues: p0 (ref)
			return p0.ChatTapConversationThumbnail or false
		end,
		getChatReportingDisabled = function()
			-- upvalues: p0 (ref)
			return p0.ChatReportingDisabled or false
		end,
		getChatViewProfileOption = function()
			-- upvalues: p0 (ref)
			return p0.ChatViewProfileOption or false
		end,
		getContactImporterEnabled = function()
			-- upvalues: p0 (ref)
			return p0.ContactImporterEnabled or false
		end
	}
end