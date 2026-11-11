local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local PanelsContextModule = require(script.Parent.PanelsContext)
local _ = require(script.Parent.Types)

return function()
	-- upvalues: ReactModule (copy), PanelsContextModule (copy)
	local UseContextResult = ReactModule.useContext(PanelsContextModule)
	
	if UseContextResult == nil then
		error("usePanelsContext must be used within a PanelsContext")
	end
	return UseContextResult
end