return function(value)
	return if value.isTabBarVisible and value.tabCount > 1 then value.isChatFocused else false
end