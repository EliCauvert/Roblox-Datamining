return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return {
		value = { preferredTransparency = p0.preferredTransparency or 1 }
	}
end)