return require(script:FindFirstAncestor("CentralOverlay").Parent.Rodux).makeActionCreator(script.Name, function(OverlayType, Arguments, Configs) --[[ Line: 5 ]]
	return {
		overlayType = OverlayType,
		arguments = Arguments,
		configs = Configs
	}
end)