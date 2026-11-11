return require(script.Parent.Parent.Action)("SetTabList", function(TabList, InitIndex, IsDeveloperView)
	return {
		tabList = TabList,
		initIndex = InitIndex,
		isDeveloperView = IsDeveloperView
	}
end)