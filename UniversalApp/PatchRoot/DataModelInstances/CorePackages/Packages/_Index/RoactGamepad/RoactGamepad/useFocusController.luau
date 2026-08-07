local reactModule = require(script.Parent.Parent.React)
local focusContextModule = require(script.Parent.FocusContext)

return function() --[[ line: 10 | named "useFocusController" ]]
	-- upvalues: reactModule (ref), focusContextModule (ref)
	local var2 = reactModule.useContext(focusContextModule)
	
	return if var2 then var2.focusNode.focusController else nil
end