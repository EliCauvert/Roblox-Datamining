return function(p1, p2, p3, p4)
	return if p1.isTouch then p3("CoreScripts.TextChat.InputBar.Hint.Touch") else p3("CoreScripts.TextChat.InputBar.Hint.MouseKeyboard", { KEY = p4:GetStringForKeyCode(p2) })
end