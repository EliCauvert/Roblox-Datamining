return require(script:FindFirstAncestor("CentralOverlay").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return { overlayType = p1, arguments = p2, configs = p3 }
end)