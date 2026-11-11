local Parent = script.Parent.Parent
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local GetFFlagDisableRobuxUpsellModule = require(Parent.Flags.GetFFlagDisableRobuxUpsell)
local GetFFlagEnableRestrictedAssetSaleLocationPurchasePromptModule = require(Parent.Flags.GetFFlagEnableRestrictedAssetSaleLocationPurchasePrompt)

return {
	new = function()
		-- upvalues: UserInputService (copy), RunService (copy), GuiService (copy), GetFFlagDisableRobuxUpsellModule (copy), GetFFlagEnableRestrictedAssetSaleLocationPurchasePromptModule (copy)
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
			-- upvalues: GuiService (upval)
			return GuiService:IsTenFootInterface()
		end
		
		function t.getFFlagDisableRobuxUpsell()
			-- upvalues: GetFFlagDisableRobuxUpsellModule (upval)
			return GetFFlagDisableRobuxUpsellModule()
		end
		
		function t.GetFFlagEnableRestrictedAssetSaleLocationPurchasePrompt()
			-- upvalues: GetFFlagEnableRestrictedAssetSaleLocationPurchasePromptModule (upval)
			return GetFFlagEnableRestrictedAssetSaleLocationPurchasePromptModule()
		end
		
		return t
	end
}