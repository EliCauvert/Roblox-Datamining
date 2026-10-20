return function(p1)
	return if p1.isTabBarVisible and p1.tabCount > 1 then p1.isChatFocused else false
end