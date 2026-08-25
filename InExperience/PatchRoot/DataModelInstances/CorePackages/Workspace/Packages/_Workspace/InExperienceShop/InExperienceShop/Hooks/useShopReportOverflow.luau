local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local _ = require(parent.GenericAbuseReporting.AbuseVector)
local shopOverflowConstantsModule = require(inExperienceShop.Components.Shared.shopOverflowConstants)

return {
	useShopReportOverflow = function(p0)
		-- upvalues: reactModule (ref), shopOverflowConstantsModule (ref)
		local var3, var4 = reactModule.useState(false)
		local var5, var6 = reactModule.useState(nil)
		
		return {
			isOverflowMenuOpen = var3,
			reportSession = var5,
			isReportingEnabled = p0.isReportingEnabled,
			onOverflowActivated = reactModule.useCallback(function()
				-- upvalues: var4 (ref)
				var4(function(p1)
					return not p1
				end)
			end, {}),
			onOverflowMenuClosed = reactModule.useCallback(function()
				-- upvalues: var4 (ref)
				var4(false)
			end, {}),
			onMenuItemActivated = reactModule.useCallback(function(p2)
				-- upvalues: var4 (ref), shopOverflowConstantsModule (copy), p0 (ref), var6 (ref)
				var4(false)
				
				if tostring(p2) ~= shopOverflowConstantsModule.REPORT_MENU_ITEM_ID then return end
				if p0.isReportingEnabled then
					var6(p0.buildReportSession())
					
					return
				end
			end, { p0.isReportingEnabled, p0.buildReportSession }),
			onReportClose = reactModule.useCallback(function()
				-- upvalues: var6 (ref)
				var6(nil)
			end, {})
		}
	end
}