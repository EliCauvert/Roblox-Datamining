return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { userId = p0, hasRobloxSubscription = p1 }
end)