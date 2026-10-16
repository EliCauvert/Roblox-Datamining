return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(UserId, HasRobloxSubscription) --[[ Line: 6 ]]
	return {
		userId = UserId,
		hasRobloxSubscription = HasRobloxSubscription
	}
end)