return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(p1, Presence, LastLocation) --[[ Line: 6 ]]
	return {
		userId = tostring(p1),
		presence = Presence,
		lastLocation = LastLocation
	}
end)