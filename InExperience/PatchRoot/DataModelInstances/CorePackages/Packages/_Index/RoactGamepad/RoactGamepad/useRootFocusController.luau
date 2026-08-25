local reactModule = require(script.Parent.Parent.React)
local focusControllerModule = require(script.Parent.FocusController)

return function()
	-- upvalues: reactModule (ref), focusControllerModule (ref)
	local var2 = reactModule.useRef(nil)
	
	if var2.current == nil then
		var2.current = focusControllerModule.createPublicApiWrapper()
	end
	return var2.current
end