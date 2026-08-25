return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { payload = { notificationId = p0 } }
end)