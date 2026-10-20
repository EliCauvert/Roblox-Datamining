local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local ReactModule = require(Parent.React)
local LayerCollectorProvider = require(Parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local ThemeContext = require(Parent.Style).ThemeContext
local AbuseReportAnalyticsProviderModule = require(GenericAbuseReporting.Bedui.Provider.AbuseReportAnalyticsProvider)
local AbuseReportBeduiProviderModule = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiProvider)
local AbuseReportFormDataProviderModule = require(GenericAbuseReporting.Bedui.Provider.AbuseReportFormDataProvider)
local _ = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local AbuseVectorModule = require(GenericAbuseReporting.Enums.AbuseVector)
local DynamicReportModule = require(GenericAbuseReporting.UXFlow.DynamicReport.DynamicReport)
local DynamicReportV2ContainerModule = require(GenericAbuseReporting.UXFlow.DynamicReportV2.DynamicReportV2Container)
local FFlagAddThumbnailSelectorReport = require(Parent.SharedFlags).FFlagAddThumbnailSelectorReport
local EnableDynamicReportV2ForUserProfileReports3 = game:DefineFastFlag("EnableDynamicReportV2ForUserProfileReports3", false)
local FixKidsBlueOnReportDropdown = game:DefineFastFlag("FixKidsBlueOnReportDropdown", false)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), ThemeContext (copy), EnableDynamicReportV2ForUserProfileReports3 (copy), AbuseVectorModule (copy), DynamicReportV2ContainerModule (copy), FixKidsBlueOnReportDropdown (copy), LayerCollectorProvider (copy), AbuseReportBeduiProviderModule (copy), AbuseReportFormDataProviderModule (copy), FFlagAddThumbnailSelectorReport (copy), AbuseReportAnalyticsProviderModule (copy), DynamicReportModule (copy), FoundationProvider (copy), FoundationModule (copy)
	local UseContextResult = ReactModule.useContext(ThemeContext)
	
	return if EnableDynamicReportV2ForUserProfileReports3 and p1.abuseVector == AbuseVectorModule.UserProfile then ReactModule.createElement(DynamicReportV2ContainerModule, {
		abuseVector = p1.abuseVector,
		targetId = p1.targetId,
		onClose = p1.onClose,
		onSubmit = p1.onSubmit,
		custom = p1.custom
	}) elseif FixKidsBlueOnReportDropdown then ReactModule.createElement(LayerCollectorProvider, {}, {
		AbuseReportBeduiProvider = ReactModule.createElement(AbuseReportBeduiProviderModule, { abuseVector = p1.abuseVector }, {
			AbuseReportFormDataProvider = ReactModule.createElement(AbuseReportFormDataProviderModule, {
				custom = if FFlagAddThumbnailSelectorReport then p1.custom else nil
			}, {
				AbuseReportAnalyticsProvider = ReactModule.createElement(AbuseReportAnalyticsProviderModule, { abuseVector = p1.abuseVector }, {
					DynamicReport = ReactModule.createElement(DynamicReportModule, p1)
				})
			})
		})
	}) else ReactModule.createElement(LayerCollectorProvider, {}, {
		FoundationProvider = ReactModule.createElement(FoundationProvider, {
			theme = if UseContextResult.theme == "light" then FoundationModule.Enums.Theme.Light else FoundationModule.Enums.Theme.Dark
		}, {
			AbuseReportBeduiProvider = ReactModule.createElement(AbuseReportBeduiProviderModule, { abuseVector = p1.abuseVector }, {
				AbuseReportFormDataProvider = ReactModule.createElement(AbuseReportFormDataProviderModule, {
					custom = if FFlagAddThumbnailSelectorReport then p1.custom else nil
				}, {
					AbuseReportAnalyticsProvider = ReactModule.createElement(AbuseReportAnalyticsProviderModule, { abuseVector = p1.abuseVector }, {
						DynamicReport = ReactModule.createElement(DynamicReportModule, p1)
					})
				})
			})
		})
	})
end)