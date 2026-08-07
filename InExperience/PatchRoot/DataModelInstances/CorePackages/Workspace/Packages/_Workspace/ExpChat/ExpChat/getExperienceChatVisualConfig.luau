return function() --[[ line: 10 ]]
	local _ = 20
	local _ = { on = "icons/menu/chat_on", off = "icons/menu/chat_off" }
	
	return {
		label = "CoreScripts.TopBar.Chat",
		icon = {
			on = "icons/menu/platformChatOn",
			off = "icons/menu/platformChatOff"
		},
		iconSize = 30
	}
end