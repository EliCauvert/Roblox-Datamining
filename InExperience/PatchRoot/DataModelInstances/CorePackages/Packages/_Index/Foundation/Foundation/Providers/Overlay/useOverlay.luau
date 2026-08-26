local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local overlayContextModule = require(script.Parent.OverlayContext)

return function()
	-- upvalues: reactModule (ref), overlayContextModule (ref)
	local var1 = reactModule.useContext(overlayContextModule)
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref)
		var1.requestOverlay()
	end, { var1.requestOverlay })
	
	return var1.instance
end