local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local OverlayContextModule = require(script.Parent.OverlayContext)

return function() --[[ Line: 8 | Named "useScreen" ]]
	-- upvalues: ReactModule (copy), OverlayContextModule (copy)
	local UseContextResult = ReactModule.useContext(OverlayContextModule)
	ReactModule.useLayoutEffect(function() --[[ Line: 11 ]]
		-- upvalues: UseContextResult (copy)
		UseContextResult.requestOverlay()
	end, { UseContextResult.requestOverlay })
	
	return UseContextResult.screen
end