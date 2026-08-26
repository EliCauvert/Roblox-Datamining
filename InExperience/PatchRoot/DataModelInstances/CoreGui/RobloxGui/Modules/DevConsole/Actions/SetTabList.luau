return require(script.Parent.Parent.Action)("SetTabList", function(p1, p2, p3)
	return { tabList = p1, initIndex = p2, isDeveloperView = p3 }
end)