local Parent = script.Parent.Parent
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local IsTenFootInterfaceFunction = require(Parent.Parent.AppCommonLib).isTenFootInterface
local GetFFlagDisableRobuxUpsellModule = require(Parent.Flags.GetFFlagDisableRobuxUpsell)

return {
	new = function()
		-- upvalues: UserInputService (copy), RunService (copy), IsTenFootInterfaceFunction (copy), GetFFlagDisableRobuxUpsellModule (copy)
		local t = {}
		setmetatable(t, {
			__tostring = function(): string
				return "Service(ExternalSettings)"
			end
		})
		
		function t.getPlatform()
			-- upvalues: UserInputService (upval)
			return UserInputService:GetPlatform()
		end
		
		function t.isStudio()
			-- upvalues: RunService (upval)
			return RunService:IsStudio()
		end
		
		function t.isThirdPartyPurchaseAllowed(): boolean
			local IsThirdPartyPurchaseAllowed = true
			pcall(function()
				-- upvalues: IsThirdPartyPurchaseAllowed (ref)
				IsThirdPartyPurchaseAllowed = game:GetService("PermissionsService"):GetIsThirdPartyPurchaseAllowed()
			end)
			
			return IsThirdPartyPurchaseAllowed
		end
		
		function t.getLuaUseThirdPartyPermissions(): boolean
			return true
		end
		
		function t.getFlagBypassThirdPartySettingForRobloxPurchase(): boolean
			return true
		end
		
		function t.getFlagRestrictSales2()
			return settings():GetFFlag("RestrictSales2")
		end
		
		function t.getFlagOrder66()
			return settings():GetFFlag("Order66")
		end
		
		function t.isTenFootInterface()
			-- upvalues: IsTenFootInterfaceFunction (upval)
			return IsTenFootInterfaceFunction()
		end
		
		function t.getFFlagDisableRobuxUpsell()
			-- upvalues: GetFFlagDisableRobuxUpsellModule (upval)
			return GetFFlagDisableRobuxUpsellModule()
		end
		
		return t
	end
}