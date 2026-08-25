return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { toxicUserId = tostring(p0) }
end)