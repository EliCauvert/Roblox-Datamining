local setCentralOverlayModule = require(script:FindFirstAncestor("CentralOverlay").Actions.SetCentralOverlay)

return function()
	-- upvalues: setCentralOverlayModule (ref)
	return function(p1)
		-- upvalues: setCentralOverlayModule (copy)
		if p1:getState().CentralOverlay.Configs.DisableBackButtonClose then
			return
		end
		p1:dispatch(setCentralOverlayModule())
	end
end