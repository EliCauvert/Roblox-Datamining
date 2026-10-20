return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, IsMuted)
	return { userId = tostring(p1), isMuted = IsMuted }
end)