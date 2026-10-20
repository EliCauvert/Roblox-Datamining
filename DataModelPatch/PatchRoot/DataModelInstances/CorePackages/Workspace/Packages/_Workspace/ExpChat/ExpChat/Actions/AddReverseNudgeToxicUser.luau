return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, ReverseNudgeType)
	return {
		toxicUserId = tostring(p1),
		reverseNudgeType = ReverseNudgeType
	}
end)