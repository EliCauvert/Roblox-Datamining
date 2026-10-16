local _ = script.Parent.Parent
local Cryo = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).Cryo
local config = { RestrictSales2 = false, Order66 = false }

return {
	new = function(p1, p2, p3, p4) --[[ Line: 23 ]]
		-- upvalues: Cryo (copy), config (copy)
		local JoinResult = Cryo.Dictionary.join(config, p3 or {})
		
		local function _(p5, p6) --[[ Line: 34 | Named "getMockFlag" ]]
			return if p5 == nil then p6 else p5
		end
		
		return {
			getPlatform = function() --[[ Line: 41 ]]
				-- upvalues: p4 (copy)
				return p4 or Enum.Platform.Windows
			end,
			isStudio = function() --[[ Line: 45 ]]
				-- upvalues: p1 (copy)
				return p1 or false
			end,
			isThirdPartyPurchaseAllowed = function() --[[ Line: 49 ]]
				-- upvalues: JoinResult (ref)
				return JoinResult.PermissionsServiceIsThirdPartyPurchaseAllowed
			end,
			getLuaUseThirdPartyPermissions = function() --[[ Line: 53 ]]
				-- upvalues: JoinResult (ref)
				local LuaUseThirdPartyPermissions = JoinResult.LuaUseThirdPartyPermissions
				
				return LuaUseThirdPartyPermissions == nil or LuaUseThirdPartyPermissions
			end,
			getFlagBypassThirdPartySettingForRobloxPurchase = function() --[[ Line: 57 ]]
				-- upvalues: JoinResult (ref)
				return JoinResult.BypassThirdPartySettingForRobloxPurchase
			end,
			getFlagRestrictSales2 = function() --[[ Line: 62 ]]
				-- upvalues: JoinResult (ref)
				return JoinResult.RestrictSales2
			end,
			getFlagOrder66 = function() --[[ Line: 66 ]]
				-- upvalues: JoinResult (ref)
				return JoinResult.Order66
			end,
			isTenFootInterface = function() --[[ Line: 70 ]]
				-- upvalues: p2 (copy)
				return p2
			end,
			getFFlagDisableRobuxUpsell = function() --[[ Line: 74 ]]
				-- upvalues: JoinResult (ref)
				return JoinResult.DisableRobuxUpsell
			end
		}
	end
}