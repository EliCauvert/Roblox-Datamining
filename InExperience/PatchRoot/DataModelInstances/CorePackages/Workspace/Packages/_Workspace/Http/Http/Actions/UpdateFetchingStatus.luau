return require(script:FindFirstAncestor("Http").Parent.Rodux).makeActionCreator(script.Name, function(Key, Status) --[[ Line: 6 ]]
	return { key = Key, status = Status }
end)