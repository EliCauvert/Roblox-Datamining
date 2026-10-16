return function(p1) --[[ Line: 21 | Named "shouldNavigateTabs" ]]
	return if p1.isTabBarVisible and p1.tabCount > 1 then p1.isChatFocused else false
end