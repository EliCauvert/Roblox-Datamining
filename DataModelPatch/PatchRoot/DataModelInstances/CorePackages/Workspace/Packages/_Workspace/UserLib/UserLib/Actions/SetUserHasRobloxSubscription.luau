return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(UserId, HasRobloxSubscription)
	return {
		userId = UserId,
		hasRobloxSubscription = HasRobloxSubscription
	}
end)