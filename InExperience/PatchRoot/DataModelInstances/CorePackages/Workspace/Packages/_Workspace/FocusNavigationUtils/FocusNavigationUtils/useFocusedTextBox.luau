local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("FocusNavigationUtils").Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref), userInputService (ref)
	local var1, var2 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var2 (ref), p1 (ref), p2 (ref)
		local textBoxFocusedConnection = userInputService.TextBoxFocused:Connect(function(p3)
			-- upvalues: var2 (copy), p1 (copy)
			var2(p3)
			
			if p1 then
				p1(p3)
			end
		end)
		local textBoxFocusReleasedConnection = userInputService.TextBoxFocusReleased:Connect(function(p3)
			-- upvalues: var2 (copy), p2 (copy)
			var2(nil)
			
			if p2 then
				p2(p3)
			end
		end)
		
		return function()
			-- upvalues: textBoxFocusedConnection (ref), textBoxFocusReleasedConnection (ref)
			textBoxFocusedConnection:Disconnect()
			textBoxFocusReleasedConnection:Disconnect()
		end
	end, { var2 })
	
	return var1
end