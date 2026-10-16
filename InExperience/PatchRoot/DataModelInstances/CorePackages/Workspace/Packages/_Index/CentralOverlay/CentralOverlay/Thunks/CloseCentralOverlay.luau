local SetCentralOverlayModule = require(script:FindFirstAncestor("CentralOverlay").Actions.SetCentralOverlay)

return function() --[[ Line: 4 ]]
	-- upvalues: SetCentralOverlayModule (copy)
	return function(p1) --[[ Line: 5 ]]
		-- upvalues: SetCentralOverlayModule (upval)
		if not p1:getState().CentralOverlay.Configs.DisableBackButtonClose then
			p1:dispatch(SetCentralOverlayModule())
			
			return
		end
	end
end