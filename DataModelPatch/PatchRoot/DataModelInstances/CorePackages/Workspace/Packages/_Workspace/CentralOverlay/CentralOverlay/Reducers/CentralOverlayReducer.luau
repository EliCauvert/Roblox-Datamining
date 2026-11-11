local SetCentralOverlayModule = require(script:FindFirstAncestor("CentralOverlay").Actions.SetCentralOverlay)

return function(p1, p2)
	-- upvalues: SetCentralOverlayModule (copy)
	return if p2.type == SetCentralOverlayModule.name then {
		OverlayType = p2.overlayType,
		Arguments = p2.arguments and p2.arguments or {},
		Configs = p2.configs and p2.configs or {}
	} else p1 or { OverlayType = nil, Arguments = {}, Configs = {} }
end