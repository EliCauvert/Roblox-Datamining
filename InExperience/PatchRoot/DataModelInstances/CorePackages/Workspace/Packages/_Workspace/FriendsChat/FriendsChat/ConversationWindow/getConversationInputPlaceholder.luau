return function(p0, p1, p2, p3)
	return if p0.isTouch then p2("CoreScripts.TextChat.InputBar.Hint.Touch") else p2("CoreScripts.TextChat.InputBar.Hint.MouseKeyboard", { KEY = p3:GetStringForKeyCode(p1) })
end