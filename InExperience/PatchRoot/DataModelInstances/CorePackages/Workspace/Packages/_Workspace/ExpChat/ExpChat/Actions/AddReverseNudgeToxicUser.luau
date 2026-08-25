return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { toxicUserId = tostring(p0), reverseNudgeType = p1 }
end)