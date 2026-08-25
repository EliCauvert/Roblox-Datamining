local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local reactModule = require(script.Parent.Parent.Parent.React)

return function()
	-- upvalues: reactModule (ref), userGameSettingsService (ref)
	local var2, var3 = reactModule.useBinding(userGameSettingsService.PreferredTransparency)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), userGameSettingsService (copy)
		var3(userGameSettingsService.PreferredTransparency)
		local var4 = userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
			-- upvalues: var3 (copy), userGameSettingsService (copy)
			var3(userGameSettingsService.PreferredTransparency)
		end)
		
		return function()
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, {})
	
	return var2
end