local userInputService = game:GetService("UserInputService")
local reactModule = require(script.Parent.Parent.React)
local getInputMethodModule = require(script.Parent.getInputMethod)

return function()
	-- upvalues: getInputMethodModule (ref), userInputService (ref), reactModule (ref)
	local var1, var2 = reactModule.useState(getInputMethodModule(userInputService:GetLastInputType()) or "None")
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), getInputMethodModule (copy), var2 (ref)
		local lastInputTypeChangedConnection = userInputService.LastInputTypeChanged:Connect(function(p1)
			-- upvalues: getInputMethodModule (copy), var2 (copy)
			local var3 = getInputMethodModule(p1)
			
			if var3 then
				var2(var3)
			end
		end)
		
		return function()
			-- upvalues: lastInputTypeChangedConnection (ref)
			lastInputTypeChangedConnection:Disconnect()
		end
	end, {})
	
	return var1
end