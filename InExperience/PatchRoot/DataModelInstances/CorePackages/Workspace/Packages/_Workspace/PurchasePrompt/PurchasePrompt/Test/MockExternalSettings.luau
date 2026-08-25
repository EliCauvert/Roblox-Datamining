local _ = script.Parent.Parent
local cryo = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).Cryo
local t = { RestrictSales2 = false, Order66 = false }

return {
	new = function(p0, p1, p2, p3)
		-- upvalues: cryo (ref), t (ref)
		local t_1 = {
			getPlatform = function()
				-- upvalues: p3 (ref)
				return p3 or Enum.Platform.Windows
			end,
			isStudio = function()
				-- upvalues: p0 (ref)
				return p0 or false
			end,
			isThirdPartyPurchaseAllowed = function()
				-- upvalues: p2 (write)
				return p2.PermissionsServiceIsThirdPartyPurchaseAllowed
			end,
			getLuaUseThirdPartyPermissions = function()
				-- upvalues: p2 (write)
				local luaUseThirdPartyPermissions = p2.LuaUseThirdPartyPermissions
				
				return luaUseThirdPartyPermissions == nil or luaUseThirdPartyPermissions
			end,
			getFlagBypassThirdPartySettingForRobloxPurchase = function()
				-- upvalues: p2 (write)
				return p2.BypassThirdPartySettingForRobloxPurchase
			end,
			getFlagRestrictSales2 = function()
				-- upvalues: p2 (write)
				return p2.RestrictSales2
			end,
			getFlagOrder66 = function()
				-- upvalues: p2 (write)
				return p2.Order66
			end,
			isTenFootInterface = function()
				-- upvalues: p1 (ref)
				return p1
			end,
			getFFlagDisableRobuxUpsell = function()
				-- upvalues: p2 (write)
				return p2.DisableRobuxUpsell
			end
		}
		p2 = cryo.Dictionary.join(t, p2 or {})
		
		local function _(p4, p5)
			return if p4 == nil then p5 else p4
		end
		
		return t_1
	end
}