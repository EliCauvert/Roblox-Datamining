local reactModule = require(script.Parent.Parent.React)
local focusControllerModule = require(script.Parent.FocusController)

return function()
	-- upvalues: reactModule (ref), focusControllerModule (ref)
	local var1 = reactModule.useRef(nil)
	
	if var1.current == nil then
		var1.current = focusControllerModule.createPublicApiWrapper()
	end
	return var1.current
end