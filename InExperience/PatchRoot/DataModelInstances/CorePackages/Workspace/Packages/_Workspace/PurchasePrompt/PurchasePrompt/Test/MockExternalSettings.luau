local _ = script.Parent.Parent
local cryo = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).Cryo
local t = { RestrictSales2 = false, Order66 = false }

return {
	new = function(p1, p2, p3, p4)
		-- upvalues: cryo (ref), t (ref)
		local t_1 = {
			getPlatform = function()
				-- upvalues: p4 (ref)
				return p4 or Enum.Platform.Windows
			end,
			isStudio = function()
				-- upvalues: p1 (ref)
				return p1 or false
			end,
			isThirdPartyPurchaseAllowed = function()
				-- upvalues: p3 (write)
				return p3.PermissionsServiceIsThirdPartyPurchaseAllowed
			end,
			getLuaUseThirdPartyPermissions = function()
				-- upvalues: p3 (write)
				local luaUseThirdPartyPermissions = p3.LuaUseThirdPartyPermissions
				
				return luaUseThirdPartyPermissions == nil or luaUseThirdPartyPermissions
			end,
			getFlagBypassThirdPartySettingForRobloxPurchase = function()
				-- upvalues: p3 (write)
				return p3.BypassThirdPartySettingForRobloxPurchase
			end,
			getFlagRestrictSales2 = function()
				-- upvalues: p3 (write)
				return p3.RestrictSales2
			end,
			getFlagOrder66 = function()
				-- upvalues: p3 (write)
				return p3.Order66
			end,
			isTenFootInterface = function()
				-- upvalues: p2 (ref)
				return p2
			end,
			getFFlagDisableRobuxUpsell = function()
				-- upvalues: p3 (write)
				return p3.DisableRobuxUpsell
			end
		}
		p3 = cryo.Dictionary.join(t, p3 or {})
		
		local function _(p5, p6)
			return if p5 == nil then p6 else p5
		end
		
		return t_1
	end
}