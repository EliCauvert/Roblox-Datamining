local Parent = script.Parent.Parent
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local IsTenFootInterfaceFunction = require(Parent.Parent.AppCommonLib).isTenFootInterface
local GetFFlagDisableRobuxUpsellModule = require(Parent.Flags.GetFFlagDisableRobuxUpsell)

return {
	new = function() --[[ Line: 10 ]]
		-- upvalues: UserInputService (copy), RunService (copy), IsTenFootInterfaceFunction (copy), GetFFlagDisableRobuxUpsellModule (copy)
		local t = {}
		setmetatable(t, {
			__tostring = function(): string --[[ Line: 14 ]]
				return "Service(ExternalSettings)"
			end
		})
		
		function t.getPlatform() --[[ Line: 19 ]]
			-- upvalues: UserInputService (upval)
			return UserInputService:GetPlatform()
		end
		
		function t.isStudio() --[[ Line: 23 ]]
			-- upvalues: RunService (upval)
			return RunService:IsStudio()
		end
		
		function t.isThirdPartyPurchaseAllowed(): boolean --[[ Line: 27 ]]
			local IsThirdPartyPurchaseAllowed = true
			pcall(function() --[[ Line: 30 ]]
				-- upvalues: IsThirdPartyPurchaseAllowed (ref)
				IsThirdPartyPurchaseAllowed = game:GetService("PermissionsService"):GetIsThirdPartyPurchaseAllowed()
			end)
			
			return IsThirdPartyPurchaseAllowed
		end
		
		function t.getLuaUseThirdPartyPermissions(): boolean --[[ Line: 36 ]]
			return true
		end
		
		function t.getFlagBypassThirdPartySettingForRobloxPurchase(): boolean --[[ Line: 40 ]]
			return true
		end
		
		function t.getFlagRestrictSales2() --[[ Line: 45 ]]
			return settings():GetFFlag("RestrictSales2")
		end
		
		function t.getFlagOrder66() --[[ Line: 49 ]]
			return settings():GetFFlag("Order66")
		end
		
		function t.isTenFootInterface() --[[ Line: 53 ]]
			-- upvalues: IsTenFootInterfaceFunction (upval)
			return IsTenFootInterfaceFunction()
		end
		
		function t.getFFlagDisableRobuxUpsell() --[[ Line: 57 ]]
			-- upvalues: GetFFlagDisableRobuxUpsellModule (upval)
			return GetFFlagDisableRobuxUpsellModule()
		end
		
		return t
	end
}