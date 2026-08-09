local parent = script.Parent.Parent
local runService = game:GetService("RunService")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local getFFlagDisableRobuxUpsellModule = require(parent.Flags.GetFFlagDisableRobuxUpsell)
local getFFlagEnableRestrictedAssetSaleLocationPurchasePromptModule = require(parent.Flags.GetFFlagEnableRestrictedAssetSaleLocationPurchasePrompt)

return {
	new = function() --[[ line: 12 ]]
		-- upvalues: userInputService (ref), runService (ref), guiService (ref), getFFlagDisableRobuxUpsellModule (ref), getFFlagEnableRestrictedAssetSaleLocationPurchasePromptModule (ref)
		local t = {}
		setmetatable(t, {
			__tostring = function() --[[ line: 16 ]]
				return "Service(ExternalSettings)"
			end
		})
		
		function t.getPlatform() --[[ line: 21 ]]
			-- upvalues: userInputService (copy)
			return userInputService:GetPlatform()
		end
		
		function t.isStudio() --[[ line: 25 ]]
			-- upvalues: runService (copy)
			return runService:IsStudio()
		end
		
		function t.isThirdPartyPurchaseAllowed() --[[ line: 29 ]]
			local var6 = true
			pcall(function() --[[ line: 32 ]]
				-- upvalues: var6 (write)
				var6 = game:GetService("PermissionsService"):GetIsThirdPartyPurchaseAllowed()
			end)
			
			return var6
		end
		
		function t.getLuaUseThirdPartyPermissions() --[[ line: 38 ]]
			return true
		end
		
		function t.getFlagBypassThirdPartySettingForRobloxPurchase() --[[ line: 42 ]]
			return true
		end
		
		function t.getFlagRestrictSales2() --[[ line: 47 ]]
			return settings():GetFFlag("RestrictSales2")
		end
		
		function t.getFlagOrder66() --[[ line: 51 ]]
			return settings():GetFFlag("Order66")
		end
		
		function t.isTenFootInterface() --[[ line: 55 ]]
			-- upvalues: guiService (copy)
			return guiService:IsTenFootInterface()
		end
		
		function t.getFFlagDisableRobuxUpsell() --[[ line: 59 ]]
			-- upvalues: getFFlagDisableRobuxUpsellModule (copy)
			return getFFlagDisableRobuxUpsellModule()
		end
		
		function t.GetFFlagEnableRestrictedAssetSaleLocationPurchasePrompt() --[[ line: 63 ]]
			-- upvalues: getFFlagEnableRestrictedAssetSaleLocationPurchasePromptModule (copy)
			return getFFlagEnableRestrictedAssetSaleLocationPurchasePromptModule()
		end
		
		return t
	end
}