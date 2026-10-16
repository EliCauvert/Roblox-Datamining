local ReactModule = require(script.Parent.Parent.React)
local FocusControllerModule = require(script.Parent.FocusController)

return function() --[[ Line: 19 | Named "useRootFocusController" ]]
	-- upvalues: ReactModule (copy), FocusControllerModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = FocusControllerModule.createPublicApiWrapper()
	end
	return UseRefResult.current
end