local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local _ = require(Parent.Chrome)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AnalyticsConstantsModule = require(InExperienceSideSheet.Analytics.AnalyticsConstants)
local SidesheetAnalyticsModule = require(InExperienceSideSheet.Analytics.SidesheetAnalytics)
local ClosePeoplePageOpenedWithSideSheetModule = require(InExperienceSideSheet.Utils.closePeoplePageOpenedWithSideSheet)
local ToggleSideSheetModule = require(InExperienceSideSheet.Utils.toggleSideSheet)
local FFlagSideSheetOpenPeoplePage = require(InExperienceSideSheet.Flags).FFlagSideSheetOpenPeoplePage

return ReactModule.memo(function(p1) --[[ Line: 31 | Named "AccountUpsell" ]]
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), FFlagSideSheetOpenPeoplePage (copy), ClosePeoplePageOpenedWithSideSheetModule (copy), ToggleSideSheetModule (copy), SidesheetAnalyticsModule (copy), AnalyticsConstantsModule (copy), View (copy), Icon (copy), IconName (copy), IconVariant (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		title = "CoreScripts.InGameMenu.UnlockMore.Title",
		description = "CoreScripts.InGameMenu.UnlockMore.Description"
	})
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y padding-bottom-medium padding-top-small",
		testId = "account-upsell-container",
		LayoutOrder = p1.layoutOrder
	}, {
		Card = ReactModule.createElement(View, {
			tag = "row align-y-center size-full-0 auto-y padding-medium radius-medium bg-shift-200",
			testId = "account-upsell-card",
			onActivated = ReactModule.useCallback(function() --[[ Line: 37 ]]
				-- upvalues: p1 (copy), FFlagSideSheetOpenPeoplePage (upval), ClosePeoplePageOpenedWithSideSheetModule (upval), ToggleSideSheetModule (upval), SidesheetAnalyticsModule (upval), AnalyticsConstantsModule (upval)
				p1.onActivated()
				
				if FFlagSideSheetOpenPeoplePage then
					ClosePeoplePageOpenedWithSideSheetModule()
				end
				ToggleSideSheetModule(false)
				SidesheetAnalyticsModule.logSidesheetClosed(AnalyticsConstantsModule.Source.AccountUpsell)
			end, { p1.onActivated })
		}, {
			LeadingAccessory = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row align-x-center align-y-center size-1200-1200 radius-medium clip bg-system-emphasis"
			}, {
				Logo = ReactModule.createElement(Icon, {
					testId = "account-upsell-logo",
					name = IconName.Tilt,
					size = UseTokensResult.Size.Size_1000,
					style = UseTokensResult.DarkMode.Content.Emphasis,
					variant = IconVariant.Filled
				})
			}),
			Content = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "col fill auto-y padding-left-medium"
			}, {
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis",
					Text = UseLocalizationResult.title
				}),
				Description = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-small text-align-x-left text-truncate-end content-emphasis",
					Text = UseLocalizationResult.description
				})
			})
		})
	})
end)