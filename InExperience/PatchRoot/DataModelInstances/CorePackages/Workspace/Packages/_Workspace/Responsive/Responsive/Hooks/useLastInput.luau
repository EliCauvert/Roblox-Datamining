local responsive = script:FindFirstAncestor("Responsive")
local reactModule = require(responsive.Parent.React)
local inputModeModule = require(responsive.InputMode)

return function()
	-- upvalues: reactModule (ref), inputModeModule (ref)
	local var1, var2 = reactModule.useState(inputModeModule.last)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), inputModeModule (copy)
		var2(inputModeModule.last)
		local var3 = inputModeModule.connect(function()
			-- upvalues: var2 (copy), inputModeModule (copy)
			var2(inputModeModule.last)
		end)
		
		return function()
			-- upvalues: var3 (ref)
			var3:disconnect()
		end
	end, {})
	
	return var1 or ""
end