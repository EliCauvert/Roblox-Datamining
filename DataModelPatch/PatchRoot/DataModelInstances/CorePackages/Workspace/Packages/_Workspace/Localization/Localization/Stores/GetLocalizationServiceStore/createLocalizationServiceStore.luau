local LocalizationService = game:GetService("LocalizationService")
local SignalsModule = require(script:FindFirstAncestor("Localization").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy), LocalizationService (copy)
	local Signal, Signal2 = SignalsModule.createSignal(LocalizationService.RobloxLocaleId)
	local config = {
		robloxLocaleId = LocalizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
			-- upvalues: Signal2 (copy), LocalizationService (upval)
			Signal2(LocalizationService.RobloxLocaleId)
		end)
	}
	
	return {
		getRobloxLocaleId = Signal,
		cleanUp = function()
			-- upvalues: config (ref)
			for _, Connection in config do
				Connection:Disconnect()
			end
			config = {}
		end
	}
end