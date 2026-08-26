local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local _ = require(script.Parent.Types)
local widgetsContextModule = require(script.Parent.WidgetsContext)

return function()
	-- upvalues: reactModule (ref), widgetsContextModule (ref)
	local var1 = reactModule.useContext(widgetsContextModule)
	
	if var1 == nil then
		error("useWidgetsContext must be used within a WidgetsProvider")
	end
	return var1
end