return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1) --[[ line: 11 ]]
	return { userId = tostring(p0), isMuted = p1 }
end)