return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { toxicUserId = tostring(p1), reverseNudgeType = p2 }
end)