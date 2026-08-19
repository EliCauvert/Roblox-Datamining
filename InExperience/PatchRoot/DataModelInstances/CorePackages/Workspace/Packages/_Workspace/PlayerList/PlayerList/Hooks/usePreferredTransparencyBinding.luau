local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local reactModule = require(script.Parent.Parent.Parent.React)

return function() --[[ line: 13 | named "usePreferredTransparencyBinding" ]]
	-- upvalues: reactModule (ref), userGameSettingsService (ref)
	local var2, var3 = reactModule.useBinding(userGameSettingsService.PreferredTransparency)
	reactModule.useEffect(function() --[[ line: 16 ]]
		-- upvalues: var3 (ref), userGameSettingsService (copy)
		var3(userGameSettingsService.PreferredTransparency)
		local var4 = userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ line: 18 ]]
			-- upvalues: var3 (copy), userGameSettingsService (copy)
			var3(userGameSettingsService.PreferredTransparency)
		end)
		
		return function() --[[ line: 21 ]]
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, {})
	
	return var2
end