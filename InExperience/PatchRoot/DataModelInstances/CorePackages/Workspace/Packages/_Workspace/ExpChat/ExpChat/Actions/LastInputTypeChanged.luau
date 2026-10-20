return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(LastInputTypeUsed)
	return { lastInputTypeUsed = LastInputTypeUsed }
end)