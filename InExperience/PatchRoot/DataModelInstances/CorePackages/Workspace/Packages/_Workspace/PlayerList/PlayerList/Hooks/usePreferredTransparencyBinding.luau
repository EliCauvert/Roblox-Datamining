local UserGameSettings = UserSettings():GetService("UserGameSettings")
local ReactModule = require(script.Parent.Parent.Parent.React)

return function() --[[ Line: 13 | Named "usePreferredTransparencyBinding" ]]
	-- upvalues: ReactModule (copy), UserGameSettings (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UserGameSettings.PreferredTransparency)
	ReactModule.useEffect(function() --[[ Line: 16 ]]
		-- upvalues: UseBindingResult2 (copy), UserGameSettings (upval)
		UseBindingResult2(UserGameSettings.PreferredTransparency)
		local Connection = UserGameSettings:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ Line: 18 ]]
			-- upvalues: UseBindingResult2 (upval), UserGameSettings (upval)
			UseBindingResult2(UserGameSettings.PreferredTransparency)
		end)
		
		return function() --[[ Line: 21 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseBindingResult
end