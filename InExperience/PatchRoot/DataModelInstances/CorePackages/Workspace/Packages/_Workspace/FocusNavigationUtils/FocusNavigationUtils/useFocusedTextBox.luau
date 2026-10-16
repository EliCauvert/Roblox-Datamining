local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script:FindFirstAncestor("FocusNavigationUtils").Parent.React)

return function(Callback, Callback1) --[[ Line: 9 ]]
	-- upvalues: ReactModule (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function() --[[ Line: 11 ]]
		-- upvalues: UserInputService (upval), UseStateResult2 (copy), Callback (copy), Callback1 (copy)
		local TextBoxFocusedConnection = UserInputService.TextBoxFocused:Connect(function(TextboxFocused) --[[ Line: 12 ]]
			-- upvalues: UseStateResult2 (upval), Callback (upval)
			UseStateResult2(TextboxFocused)
			
			if Callback then
				Callback(TextboxFocused)
			end
		end)
		local TextBoxFocusReleasedConnection = UserInputService.TextBoxFocusReleased:Connect(function(TextboxReleased) --[[ Line: 20 ]]
			-- upvalues: UseStateResult2 (upval), Callback1 (upval)
			UseStateResult2(nil)
			
			if Callback1 then
				Callback1(TextboxReleased)
			end
		end)
		
		return function() --[[ Line: 28 ]]
			-- upvalues: TextBoxFocusedConnection (copy), TextBoxFocusReleasedConnection (copy)
			TextBoxFocusedConnection:Disconnect()
			TextBoxFocusReleasedConnection:Disconnect()
		end
	end, { UseStateResult2 })
	
	return UseStateResult
end