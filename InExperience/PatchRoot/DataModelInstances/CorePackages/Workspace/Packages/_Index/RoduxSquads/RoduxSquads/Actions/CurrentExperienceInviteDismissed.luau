return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(NotificationId) --[[ Line: 5 ]]
	return { payload = { notificationId = NotificationId } }
end)