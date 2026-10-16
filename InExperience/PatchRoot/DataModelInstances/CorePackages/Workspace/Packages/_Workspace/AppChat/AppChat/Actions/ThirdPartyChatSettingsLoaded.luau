return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(Status) --[[ Line: 6 ]]
	return { status = Status }
end)