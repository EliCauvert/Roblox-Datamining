local SetCentralOverlayModule = require(script:FindFirstAncestor("CentralOverlay").Actions.SetCentralOverlay)

return function()
	-- upvalues: SetCentralOverlayModule (copy)
	return function(p1)
		-- upvalues: SetCentralOverlayModule (upval)
		if not p1:getState().CentralOverlay.Configs.DisableBackButtonClose then
			p1:dispatch(SetCentralOverlayModule())
			
			return
		end
	end
end