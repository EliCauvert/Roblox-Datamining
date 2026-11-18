local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.GenericAbuseReporting.AbuseVector)
local ShopOverflowConstantsModule = require(InExperienceShop.Components.Shared.shopOverflowConstants)
local FFlagEnableContentPersonalizationForExperienceShopModule = require(InExperienceShop.Flags.FFlagEnableContentPersonalizationForExperienceShop)

return {
	useShopReportOverflow = function(p1)
		-- upvalues: ReactModule (copy), FFlagEnableContentPersonalizationForExperienceShopModule (copy), ShopOverflowConstantsModule (copy), Parent (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
		local config = {
			isOverflowMenuOpen = UseStateResult,
			reportSession = UseStateResult1,
			isReportingEnabled = p1.isReportingEnabled,
			onOverflowActivated = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(function(p2): boolean
					return not p2
				end)
			end, {}),
			onOverflowMenuClosed = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end, {}),
			onMenuItemActivated = ReactModule.useCallback(function(p2)
				-- upvalues: UseStateResult2 (copy), FFlagEnableContentPersonalizationForExperienceShopModule (upval), p1 (copy), ShopOverflowConstantsModule (upval), Parent (upval), UseStateResult2_1 (copy)
				UseStateResult2(false)
				
				if FFlagEnableContentPersonalizationForExperienceShopModule and p1.isContentPersonalizationEnabled and tostring(p2) == ShopOverflowConstantsModule.CONTENT_PERSONALIZATION_MENU_ITEM_ID then
					local AccountSettingsEntryPointsModule = require(Parent.AccountSettingsEntryPoints)
					AccountSettingsEntryPointsModule.openAccountSettings(AccountSettingsEntryPointsModule.Page.PersonalizedRecommendations, { surfaceKey = "InExperience_Shop_RecommendedItems" })
					
					return
				end
				if tostring(p2) ~= ShopOverflowConstantsModule.REPORT_MENU_ITEM_ID then return end
				if p1.isReportingEnabled then
					UseStateResult2_1(p1.buildReportSession())
					
					return
				end
			end, {
				p1.isReportingEnabled,
				p1.buildReportSession,
				if FFlagEnableContentPersonalizationForExperienceShopModule then p1.isContentPersonalizationEnabled else nil
			}),
			onReportClose = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2_1 (copy)
				UseStateResult2_1(nil)
			end, {})
		}
		
		if FFlagEnableContentPersonalizationForExperienceShopModule then
			config.isContentPersonalizationEnabled = p1.isContentPersonalizationEnabled == true
		end
		return config
	end
}