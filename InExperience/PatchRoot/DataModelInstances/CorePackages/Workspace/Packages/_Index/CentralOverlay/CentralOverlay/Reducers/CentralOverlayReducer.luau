local setCentralOverlayModule = require(script:FindFirstAncestor("CentralOverlay").Actions.SetCentralOverlay)

return function(p1, p2)
	-- upvalues: setCentralOverlayModule (ref)
	return if p2.type == setCentralOverlayModule.name then {
		OverlayType = p2.overlayType,
		Arguments = if p2.arguments then p2.arguments else {},
		Configs = if p2.configs then p2.configs else {}
	} else p1 or { OverlayType = nil, Arguments = {}, Configs = {} }
end