local reactModule = require(script.Parent.Parent.React)
local focusContextModule = require(script.Parent.FocusContext)

return function()
	-- upvalues: reactModule (ref), focusContextModule (ref)
	local var1 = reactModule.useContext(focusContextModule)
	
	return if var1 then var1.focusNode.focusController else nil
end