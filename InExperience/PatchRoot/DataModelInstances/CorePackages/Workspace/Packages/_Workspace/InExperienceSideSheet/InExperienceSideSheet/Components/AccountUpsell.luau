local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local _ = require(parent.Chrome)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = localizationModule.Hooks.useLocalization
local analyticsConstantsModule = require(inExperienceSideSheet.Analytics.AnalyticsConstants)
local sidesheetAnalyticsModule = require(inExperienceSideSheet.Analytics.SidesheetAnalytics)
local toggleSideSheetModule = require(inExperienceSideSheet.Utils.toggleSideSheet)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), toggleSideSheetModule (ref), sidesheetAnalyticsModule (ref), analyticsConstantsModule (ref), view (ref), icon (ref), iconName (ref), iconVariant (ref), text (ref)
	local var1 = useTokens()
	local var2 = useLocalization({
		title = "CoreScripts.InGameMenu.UnlockMore.Title",
		description = "CoreScripts.InGameMenu.UnlockMore.Description"
	})
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-bottom-medium",
		testId = "account-upsell-container",
		LayoutOrder = p1.layoutOrder
	}, {
		Card = reactModule.createElement(view, {
			tag = "row align-y-center size-full-0 auto-y padding-medium radius-medium bg-shift-200",
			testId = "account-upsell-card",
			onActivated = reactModule.useCallback(function()
				-- upvalues: p1 (ref), toggleSideSheetModule (copy), sidesheetAnalyticsModule (copy), analyticsConstantsModule (copy)
				p1.onActivated()
				toggleSideSheetModule(false)
				sidesheetAnalyticsModule.logSidesheetClosed(analyticsConstantsModule.Source.AccountUpsell)
			end, { p1.onActivated })
		}, {
			LeadingAccessory = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "row align-x-center align-y-center size-1200-1200 radius-medium clip bg-system-emphasis"
			}, {
				Logo = reactModule.createElement(icon, {
					testId = "account-upsell-logo",
					name = iconName.Tilt,
					size = var1.Size.Size_1000,
					style = var1.DarkMode.Content.Emphasis,
					variant = iconVariant.Filled
				})
			}),
			Content = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "col fill auto-y padding-left-medium"
			}, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis",
					Text = var2.title
				}),
				Description = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-small text-align-x-left text-truncate-end content-emphasis",
					Text = var2.description
				})
			})
		})
	})
end)