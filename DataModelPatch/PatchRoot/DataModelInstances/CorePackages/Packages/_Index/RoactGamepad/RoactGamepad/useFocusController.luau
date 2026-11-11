local ReactModule = require(script.Parent.Parent.React)
local FocusContextModule = require(script.Parent.FocusContext)

return function()
	-- upvalues: ReactModule (copy), FocusContextModule (copy)
	local UseContextResult = ReactModule.useContext(FocusContextModule)
	
	return if UseContextResult then UseContextResult.focusNode.focusController else nil
end