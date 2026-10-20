local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local OverlayContextModule = require(script.Parent.OverlayContext)

return function()
	-- upvalues: ReactModule (copy), OverlayContextModule (copy)
	local UseContextResult = ReactModule.useContext(OverlayContextModule)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseContextResult (copy)
		UseContextResult.requestOverlay()
	end, { UseContextResult.requestOverlay })
	
	return UseContextResult.instance
end