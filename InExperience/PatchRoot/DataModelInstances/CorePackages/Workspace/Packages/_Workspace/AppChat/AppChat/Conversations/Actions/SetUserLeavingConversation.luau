return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(Id, IsLeaving) --[[ Line: 6 ]]
	return { id = Id, isLeaving = IsLeaving }
end)