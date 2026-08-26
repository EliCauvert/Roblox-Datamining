local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local reactModule = require(script.Parent.Parent.Parent.React)

return function()
	-- upvalues: reactModule (ref), userGameSettingsService (ref)
	local var1, var2 = reactModule.useBinding(userGameSettingsService.PreferredTransparency)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), userGameSettingsService (copy)
		var2(userGameSettingsService.PreferredTransparency)
		local var3 = userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
			-- upvalues: var2 (copy), userGameSettingsService (copy)
			var2(userGameSettingsService.PreferredTransparency)
		end)
		
		return function()
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end
	end, {})
	
	return var1
end