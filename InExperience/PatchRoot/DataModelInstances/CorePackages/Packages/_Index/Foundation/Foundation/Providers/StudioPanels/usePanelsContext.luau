local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local panelsContextModule = require(script.Parent.PanelsContext)
local _ = require(script.Parent.Types)

return function()
	-- upvalues: reactModule (ref), panelsContextModule (ref)
	local var1 = reactModule.useContext(panelsContextModule)
	
	if var1 == nil then
		error("usePanelsContext must be used within a PanelsContext")
	end
	return var1
end