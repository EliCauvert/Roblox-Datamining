return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, ReverseNudgeType) --[[ Line: 11 ]]
	return {
		toxicUserId = tostring(p1),
		reverseNudgeType = ReverseNudgeType
	}
end)