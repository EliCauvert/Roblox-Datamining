local localizationService = game:GetService("LocalizationService")
local signalsModule = require(script:FindFirstAncestor("Localization").Parent.Signals)

return function() --[[ line: 12 ]]
	-- upvalues: signalsModule (ref), localizationService (ref)
	local t = {}
	local var3, var4 = signalsModule.createSignal(localizationService.RobloxLocaleId)
	t.robloxLocaleId = localizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ line: 16 ]]
		-- upvalues: var4 (ref), localizationService (copy)
		var4(localizationService.RobloxLocaleId)
	end)
	
	return {
		getRobloxLocaleId = var3,
		cleanUp = function() --[[ line: 23 ]]
			-- upvalues: t (write)
			for i, v in t do
				v:Disconnect()
			end
			t = {}
		end
	}
end