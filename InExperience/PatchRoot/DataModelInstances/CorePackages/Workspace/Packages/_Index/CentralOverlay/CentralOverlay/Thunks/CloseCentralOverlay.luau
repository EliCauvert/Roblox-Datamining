local setCentralOverlayModule = require(script:FindFirstAncestor("CentralOverlay").Actions.SetCentralOverlay)

return function()
	-- upvalues: setCentralOverlayModule (ref)
	return function(p0)
		-- upvalues: setCentralOverlayModule (copy)
		if p0:getState().CentralOverlay.Configs.DisableBackButtonClose then
			return
		end
		p0:dispatch(setCentralOverlayModule())
	end
end