local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local OverlayContextModule = require(script.Parent.OverlayContext)
local FlagsModule = require(Foundation.Utility.Flags)

return function()
	-- upvalues: ReactModule (copy), OverlayContextModule (copy), FlagsModule (copy)
	local UseContextResult = ReactModule.useContext(OverlayContextModule)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseContextResult (copy)
		UseContextResult.requestOverlay()
	end, if FlagsModule.FoundationOverlayKeyboardAwarenessHardened then { UseContextResult.requestOverlay } else {})
	
	return UseContextResult.instance
end