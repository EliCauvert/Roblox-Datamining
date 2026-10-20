return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(p1, Presence, LastLocation)
	return {
		userId = tostring(p1),
		presence = Presence,
		lastLocation = LastLocation
	}
end)