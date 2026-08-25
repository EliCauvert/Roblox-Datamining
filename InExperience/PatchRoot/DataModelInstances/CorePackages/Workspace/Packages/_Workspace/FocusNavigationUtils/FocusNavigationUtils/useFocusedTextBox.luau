local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("FocusNavigationUtils").Parent.React)

return function(p0, p1)
	-- upvalues: reactModule (ref), userInputService (ref)
	local var2, var3 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var3 (ref), p0 (ref), p1 (ref)
		local textBoxFocusedConnection = userInputService.TextBoxFocused:Connect(function(p2)
			-- upvalues: var3 (copy), p0 (copy)
			var3(p2)
			
			if p0 then
				p0(p2)
			end
		end)
		local textBoxFocusReleasedConnection = userInputService.TextBoxFocusReleased:Connect(function(p3)
			-- upvalues: var3 (copy), p1 (copy)
			var3(nil)
			
			if p1 then
				p1(p3)
			end
		end)
		
		return function()
			-- upvalues: textBoxFocusedConnection (ref), textBoxFocusReleasedConnection (ref)
			textBoxFocusedConnection:Disconnect()
			textBoxFocusReleasedConnection:Disconnect()
		end
	end, { var3 })
	
	return var2
end