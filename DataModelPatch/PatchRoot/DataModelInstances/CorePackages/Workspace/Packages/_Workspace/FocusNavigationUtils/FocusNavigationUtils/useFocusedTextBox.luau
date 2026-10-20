local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script:FindFirstAncestor("FocusNavigationUtils").Parent.React)

return function(Callback, Callback1)
	-- upvalues: ReactModule (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), UseStateResult2 (copy), Callback (copy), Callback1 (copy)
		local TextBoxFocusedConnection = UserInputService.TextBoxFocused:Connect(function(TextboxFocused)
			-- upvalues: UseStateResult2 (upval), Callback (upval)
			UseStateResult2(TextboxFocused)
			
			if Callback then
				Callback(TextboxFocused)
			end
		end)
		local TextBoxFocusReleasedConnection = UserInputService.TextBoxFocusReleased:Connect(function(TextboxReleased)
			-- upvalues: UseStateResult2 (upval), Callback1 (upval)
			UseStateResult2(nil)
			
			if Callback1 then
				Callback1(TextboxReleased)
			end
		end)
		
		return function()
			-- upvalues: TextBoxFocusedConnection (copy), TextBoxFocusReleasedConnection (copy)
			TextBoxFocusedConnection:Disconnect()
			TextBoxFocusReleasedConnection:Disconnect()
		end
	end, { UseStateResult2 })
	
	return UseStateResult
end