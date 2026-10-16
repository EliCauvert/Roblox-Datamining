local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script.Parent.Parent.React)
local GetInputMethodModule = require(script.Parent.getInputMethod)

return function() --[[ Line: 11 | Named "useLastInputMethod" ]]
	-- upvalues: GetInputMethodModule (copy), UserInputService (copy), ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(GetInputMethodModule(UserInputService:GetLastInputType()) or "None")
	ReactModule.useEffect(function() --[[ Line: 14 ]]
		-- upvalues: UserInputService (upval), GetInputMethodModule (upval), UseStateResult2 (copy)
		local LastInputTypeChangedConnection = UserInputService.LastInputTypeChanged:Connect(function(LastInputType) --[[ Line: 15 ]]
			-- upvalues: GetInputMethodModule (upval), UseStateResult2 (upval)
			local InputMethodModule = GetInputMethodModule(LastInputType)
			
			if InputMethodModule then
				UseStateResult2(InputMethodModule)
			end
		end)
		
		return function() --[[ Line: 22 ]]
			-- upvalues: LastInputTypeChangedConnection (copy)
			LastInputTypeChangedConnection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end