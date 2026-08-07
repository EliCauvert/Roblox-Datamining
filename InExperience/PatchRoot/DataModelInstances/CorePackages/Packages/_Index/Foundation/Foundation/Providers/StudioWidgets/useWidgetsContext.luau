local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local _ = require(script.Parent.Types)
local widgetsContextModule = require(script.Parent.WidgetsContext)

return function() --[[ line: 11 | named "useWidgetsContext" ]]
	-- upvalues: reactModule (ref), widgetsContextModule (ref)
	local var2 = reactModule.useContext(widgetsContextModule)
	
	if var2 == nil then
		error("useWidgetsContext must be used within a WidgetsProvider")
	end
	return var2
end