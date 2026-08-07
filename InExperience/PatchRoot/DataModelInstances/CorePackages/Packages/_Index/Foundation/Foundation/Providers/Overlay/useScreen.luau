local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local overlayContextModule = require(script.Parent.OverlayContext)

return function() --[[ line: 8 | named "useScreen" ]]
	-- upvalues: reactModule (ref), overlayContextModule (ref)
	local var2 = reactModule.useContext(overlayContextModule)
	reactModule.useLayoutEffect(function() --[[ line: 11 ]]
		-- upvalues: var2 (ref)
		var2.requestOverlay()
	end, { var2.requestOverlay })
	
	return var2.screen
end