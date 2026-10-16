local LocalizationService = game:GetService("LocalizationService")
local SignalsModule = require(script:FindFirstAncestor("Localization").Parent.Signals)

return function() --[[ Line: 12 ]]
	-- upvalues: SignalsModule (copy), LocalizationService (copy)
	local Signal, Signal2 = SignalsModule.createSignal(LocalizationService.RobloxLocaleId)
	local config = {
		robloxLocaleId = LocalizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ Line: 16 ]]
			-- upvalues: Signal2 (copy), LocalizationService (upval)
			Signal2(LocalizationService.RobloxLocaleId)
		end)
	}
	
	return {
		getRobloxLocaleId = Signal,
		cleanUp = function() --[[ Line: 23 ]]
			-- upvalues: config (ref)
			for _, Connection in config do
				Connection:Disconnect()
			end
			config = {}
		end
	}
end