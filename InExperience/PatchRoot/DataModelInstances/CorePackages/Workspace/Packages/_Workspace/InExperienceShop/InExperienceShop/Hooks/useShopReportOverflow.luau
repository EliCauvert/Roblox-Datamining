local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local _ = require(parent.GenericAbuseReporting.AbuseVector)
local shopOverflowConstantsModule = require(inExperienceShop.Components.Shared.shopOverflowConstants)

return {
	useShopReportOverflow = function(p1)
		-- upvalues: reactModule (ref), shopOverflowConstantsModule (ref)
		local var1, var2 = reactModule.useState(false)
		local var3, var4 = reactModule.useState(nil)
		
		return {
			isOverflowMenuOpen = var1,
			reportSession = var3,
			isReportingEnabled = p1.isReportingEnabled,
			onOverflowActivated = reactModule.useCallback(function()
				-- upvalues: var2 (ref)
				var2(function(p2)
					return not p2
				end)
			end, {}),
			onOverflowMenuClosed = reactModule.useCallback(function()
				-- upvalues: var2 (ref)
				var2(false)
			end, {}),
			onMenuItemActivated = reactModule.useCallback(function(p2)
				-- upvalues: var2 (ref), shopOverflowConstantsModule (copy), p1 (ref), var4 (ref)
				var2(false)
				
				if tostring(p2) ~= shopOverflowConstantsModule.REPORT_MENU_ITEM_ID then return end
				if p1.isReportingEnabled then
					var4(p1.buildReportSession())
					
					return
				end
			end, { p1.isReportingEnabled, p1.buildReportSession }),
			onReportClose = reactModule.useCallback(function()
				-- upvalues: var4 (ref)
				var4(nil)
			end, {})
		}
	end
}