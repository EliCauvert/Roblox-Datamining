return require(script:FindFirstAncestor("Http").Parent.Rodux).makeActionCreator(script.Name, function(Key, Status)
	return { key = Key, status = Status }
end)