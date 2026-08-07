local setCentralOverlayModule = require(script:FindFirstAncestor("CentralOverlay").Actions.SetCentralOverlay)

return function() --[[ line: 4 ]]
	-- upvalues: setCentralOverlayModule (ref)
	return function(p0) --[[ line: 5 ]]
		-- upvalues: setCentralOverlayModule (copy)
		if p0:getState().CentralOverlay.Configs.DisableBackButtonClose then
			return
		end
		p0:dispatch(setCentralOverlayModule())
	end
end