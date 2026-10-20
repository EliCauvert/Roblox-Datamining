return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(Id, IsLeaving)
	return { id = Id, isLeaving = IsLeaving }
end)