local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local _ = require(script.Parent.Types)
local WidgetsContextModule = require(script.Parent.WidgetsContext)

return function()
	-- upvalues: ReactModule (copy), WidgetsContextModule (copy)
	local UseContextResult = ReactModule.useContext(WidgetsContextModule)
	
	if UseContextResult == nil then
		error("useWidgetsContext must be used within a WidgetsProvider")
	end
	return UseContextResult
end