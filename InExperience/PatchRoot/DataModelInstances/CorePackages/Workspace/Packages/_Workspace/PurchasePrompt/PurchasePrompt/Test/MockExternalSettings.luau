local _ = script.Parent.Parent
local cryo = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).Cryo
local t = { RestrictSales2 = false, Order66 = false }

return {
	new = function(p0, p1, p2, p3) --[[ line: 23 ]]
		-- upvalues: cryo (ref), t (ref)
		local t_1 = {
			getPlatform = function() --[[ line: 41 ]]
				-- upvalues: p3 (ref)
				return p3 or Enum.Platform.Windows
			end,
			isStudio = function() --[[ line: 45 ]]
				-- upvalues: p0 (ref)
				return p0 or false
			end,
			isThirdPartyPurchaseAllowed = function() --[[ line: 49 ]]
				-- upvalues: p2 (write)
				return p2.PermissionsServiceIsThirdPartyPurchaseAllowed
			end,
			getLuaUseThirdPartyPermissions = function() --[[ line: 53 ]]
				-- upvalues: p2 (write)
				local luaUseThirdPartyPermissions = p2.LuaUseThirdPartyPermissions
				
				return luaUseThirdPartyPermissions == nil or luaUseThirdPartyPermissions
			end,
			getFlagBypassThirdPartySettingForRobloxPurchase = function() --[[ line: 57 ]]
				-- upvalues: p2 (write)
				return p2.BypassThirdPartySettingForRobloxPurchase
			end,
			getFlagRestrictSales2 = function() --[[ line: 62 ]]
				-- upvalues: p2 (write)
				return p2.RestrictSales2
			end,
			getFlagOrder66 = function() --[[ line: 66 ]]
				-- upvalues: p2 (write)
				return p2.Order66
			end,
			isTenFootInterface = function() --[[ line: 70 ]]
				-- upvalues: p1 (ref)
				return p1
			end,
			getFFlagDisableRobuxUpsell = function() --[[ line: 74 ]]
				-- upvalues: p2 (write)
				return p2.DisableRobuxUpsell
			end
		}
		p2 = cryo.Dictionary.join(t, p2 or {})
		
		local function _(p4, p5) --[[ line: 34 | named "getMockFlag" ]]
			return if p4 == nil then p5 else p4
		end
		
		return t_1
	end
}