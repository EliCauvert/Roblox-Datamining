return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(NotificationId)
	return { payload = { notificationId = NotificationId } }
end)