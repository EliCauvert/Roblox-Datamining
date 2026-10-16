return function(p1, KeyCode, Callback, UserInputService) --[[ Line: 21 | Named "getConversationInputPlaceholder" ]]
	return if p1.isTouch then Callback("CoreScripts.TextChat.InputBar.Hint.Touch") else Callback("CoreScripts.TextChat.InputBar.Hint.MouseKeyboard", { KEY = UserInputService:GetStringForKeyCode(KeyCode) })
end