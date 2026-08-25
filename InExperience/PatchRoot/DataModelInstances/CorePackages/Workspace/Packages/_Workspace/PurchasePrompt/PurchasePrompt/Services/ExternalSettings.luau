local parent = script.Parent.Parent
local runService = game:GetService("RunService")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local getFFlagDisableRobuxUpsellModule = require(parent.Flags.GetFFlagDisableRobuxUpsell)

return {
	new = function()
		-- upvalues: userInputService (ref), runService (ref), guiService (ref), getFFlagDisableRobuxUpsellModule (ref)
		local t = {}
		setmetatable(t, {
			__tostring = function()
				return "Service(ExternalSettings)"
			end
		})
		
		function t.getPlatform()
			-- upvalues: userInputService (copy)
			return userInputService:GetPlatform()
		end
		
		function t.isStudio()
			-- upvalues: runService (copy)
			return runService:IsStudio()
		end
		
		function t.isThirdPartyPurchaseAllowed()
			local var5 = true
			pcall(function()
				-- upvalues: var5 (write)
				var5 = game:GetService("PermissionsService"):GetIsThirdPartyPurchaseAllowed()
			end)
			
			return var5
		end
		
		function t.getLuaUseThirdPartyPermissions()
			return true
		end
		
		function t.getFlagBypassThirdPartySettingForRobloxPurchase()
			return true
		end
		
		function t.getFlagRestrictSales2()
			return settings():GetFFlag("RestrictSales2")
		end
		
		function t.getFlagOrder66()
			return settings():GetFFlag("Order66")
		end
		
		function t.isTenFootInterface()
			-- upvalues: guiService (copy)
			return guiService:IsTenFootInterface()
		end
		
		function t.getFFlagDisableRobuxUpsell()
			-- upvalues: getFFlagDisableRobuxUpsellModule (copy)
			return getFFlagDisableRobuxUpsellModule()
		end
		
		return t
	end
}