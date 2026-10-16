return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1) --[[ Line: 10 ]]
	return {
		value = { preferredTransparency = p1.preferredTransparency or 1 }
	}
end)