local responsive = script:FindFirstAncestor("Responsive")
local reactModule = require(responsive.Parent.React)
local inputModeModule = require(responsive.InputMode)

return function() --[[ line: 6 | named "useLastInput" ]]
	-- upvalues: reactModule (ref), inputModeModule (ref)
	local var3, var4 = reactModule.useState(inputModeModule.last)
	reactModule.useEffect(function() --[[ line: 8 ]]
		-- upvalues: var4 (ref), inputModeModule (copy)
		var4(inputModeModule.last)
		local var5 = inputModeModule.connect(function() --[[ line: 10 ]]
			-- upvalues: var4 (copy), inputModeModule (copy)
			var4(inputModeModule.last)
		end)
		
		return function() --[[ line: 13 ]]
			-- upvalues: var5 (ref)
			var5:disconnect()
		end
	end, {})
	
	return var3 or ""
end