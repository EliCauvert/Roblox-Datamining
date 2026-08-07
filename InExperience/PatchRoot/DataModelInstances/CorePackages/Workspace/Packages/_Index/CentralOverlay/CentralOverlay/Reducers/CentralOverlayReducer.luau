local setCentralOverlayModule = require(script:FindFirstAncestor("CentralOverlay").Actions.SetCentralOverlay)

return function(p0, p1) --[[ line: 4 ]]
	-- upvalues: setCentralOverlayModule (ref)
	return if p1.type == setCentralOverlayModule.name then {
		OverlayType = p1.overlayType,
		Arguments = if p1.arguments then p1.arguments else {},
		Configs = if p1.configs then p1.configs else {}
	} else p0 or { OverlayType = nil, Arguments = {}, Configs = {} }
end