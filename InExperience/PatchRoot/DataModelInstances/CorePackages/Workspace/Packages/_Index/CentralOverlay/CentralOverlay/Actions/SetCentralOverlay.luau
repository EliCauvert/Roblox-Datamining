return require(script:FindFirstAncestor("CentralOverlay").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2)
	return { overlayType = p0, arguments = p1, configs = p2 }
end)