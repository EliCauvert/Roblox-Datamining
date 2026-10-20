local UserGameSettings = UserSettings():GetService("UserGameSettings")
local ReactModule = require(script.Parent.Parent.Parent.React)

return function()
	-- upvalues: ReactModule (copy), UserGameSettings (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UserGameSettings.PreferredTransparency)
	ReactModule.useEffect(function()
		-- upvalues: UseBindingResult2 (copy), UserGameSettings (upval)
		UseBindingResult2(UserGameSettings.PreferredTransparency)
		local Connection = UserGameSettings:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
			-- upvalues: UseBindingResult2 (upval), UserGameSettings (upval)
			UseBindingResult2(UserGameSettings.PreferredTransparency)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseBindingResult
end