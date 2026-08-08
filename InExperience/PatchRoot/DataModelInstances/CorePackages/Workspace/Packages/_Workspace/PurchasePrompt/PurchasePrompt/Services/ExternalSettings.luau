local parent = script.Parent.Parent
local runService = game:GetService("RunService")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local getFFlagDisableRobuxUpsellModule = require(parent.Flags.GetFFlagDisableRobuxUpsell)

return {
	new = function() --[[ line: 10 ]]
		-- upvalues: userInputService (ref), runService (ref), guiService (ref), getFFlagDisableRobuxUpsellModule (ref)
		local t = {}
		setmetatable(t, {
			__tostring = function() --[[ line: 14 ]]
				return "Service(ExternalSettings)"
			end
		})
		
		function t.getPlatform() --[[ line: 19 ]]
			-- upvalues: userInputService (copy)
			return userInputService:GetPlatform()
		end
		
		function t.isStudio() --[[ line: 23 ]]
			-- upvalues: runService (copy)
			return runService:IsStudio()
		end
		
		function t.isThirdPartyPurchaseAllowed() --[[ line: 27 ]]
			local var5 = true
			pcall(function() --[[ line: 30 ]]
				-- upvalues: var5 (write)
				var5 = game:GetService("PermissionsService"):GetIsThirdPartyPurchaseAllowed()
			end)
			
			return var5
		end
		
		function t.getLuaUseThirdPartyPermissions() --[[ line: 36 ]]
			return true
		end
		
		function t.getFlagBypassThirdPartySettingForRobloxPurchase() --[[ line: 40 ]]
			return true
		end
		
		function t.getFlagRestrictSales2() --[[ line: 45 ]]
			return settings():GetFFlag("RestrictSales2")
		end
		
		function t.getFlagOrder66() --[[ line: 49 ]]
			return settings():GetFFlag("Order66")
		end
		
		function t.isTenFootInterface() --[[ line: 53 ]]
			-- upvalues: guiService (copy)
			return guiService:IsTenFootInterface()
		end
		
		function t.getFFlagDisableRobuxUpsell() --[[ line: 57 ]]
			-- upvalues: getFFlagDisableRobuxUpsellModule (copy)
			return getFFlagDisableRobuxUpsellModule()
		end
		
		return t
	end
}