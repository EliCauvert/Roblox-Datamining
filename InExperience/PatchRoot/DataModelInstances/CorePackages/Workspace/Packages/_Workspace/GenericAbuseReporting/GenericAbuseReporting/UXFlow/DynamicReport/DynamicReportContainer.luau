local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(parent.React)
local layerCollectorProvider = require(parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local themeContext = require(parent.Style).ThemeContext
local abuseReportAnalyticsProviderModule = require(genericAbuseReporting.Bedui.Provider.AbuseReportAnalyticsProvider)
local abuseReportBeduiProviderModule = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiProvider)
local abuseReportFormDataProviderModule = require(genericAbuseReporting.Bedui.Provider.AbuseReportFormDataProvider)
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local abuseVectorModule = require(genericAbuseReporting.Enums.AbuseVector)
local dynamicReportModule = require(genericAbuseReporting.UXFlow.DynamicReport.DynamicReport)
local dynamicReportV2ContainerModule = require(genericAbuseReporting.UXFlow.DynamicReportV2.DynamicReportV2Container)
local fFlagAddThumbnailSelectorReport = require(parent.SharedFlags).FFlagAddThumbnailSelectorReport
local enableDynamicReportV2ForUserProfileReports3 = game:DefineFastFlag("EnableDynamicReportV2ForUserProfileReports3", false)
local fixKidsBlueOnReportDropdown = game:DefineFastFlag("FixKidsBlueOnReportDropdown", false)

return reactModule.memo(function(p0) --[[ line: 38 | named "DynamicReportContainer" ]]
	-- upvalues: reactModule (ref), themeContext (ref), enableDynamicReportV2ForUserProfileReports3 (ref), abuseVectorModule (ref), dynamicReportV2ContainerModule (ref), fixKidsBlueOnReportDropdown (ref), layerCollectorProvider (ref), abuseReportBeduiProviderModule (ref), abuseReportFormDataProviderModule (ref), fFlagAddThumbnailSelectorReport (ref), abuseReportAnalyticsProviderModule (ref), dynamicReportModule (ref), foundationProvider (ref), foundationModule (ref)
	return if enableDynamicReportV2ForUserProfileReports3 and p0.abuseVector == abuseVectorModule.UserProfile then reactModule.createElement(dynamicReportV2ContainerModule, {
		abuseVector = p0.abuseVector,
		targetId = p0.targetId,
		onClose = p0.onClose,
		onSubmit = p0.onSubmit,
		custom = p0.custom
	}) elseif fixKidsBlueOnReportDropdown then reactModule.createElement(layerCollectorProvider, {}, {
		AbuseReportBeduiProvider = reactModule.createElement(abuseReportBeduiProviderModule, { abuseVector = p0.abuseVector }, {
			AbuseReportFormDataProvider = reactModule.createElement(abuseReportFormDataProviderModule, {
				custom = if fFlagAddThumbnailSelectorReport then p0.custom else nil
			}, {
				AbuseReportAnalyticsProvider = reactModule.createElement(abuseReportAnalyticsProviderModule, { abuseVector = p0.abuseVector }, {
					DynamicReport = reactModule.createElement(dynamicReportModule, p0)
				})
			})
		})
	}) else reactModule.createElement(layerCollectorProvider, {}, {
		FoundationProvider = reactModule.createElement(foundationProvider, {
			theme = if reactModule.useContext(themeContext).theme == "light" then foundationModule.Enums.Theme.Light else foundationModule.Enums.Theme.Dark
		}, {
			AbuseReportBeduiProvider = reactModule.createElement(abuseReportBeduiProviderModule, { abuseVector = p0.abuseVector }, {
				AbuseReportFormDataProvider = reactModule.createElement(abuseReportFormDataProviderModule, {
					custom = if fFlagAddThumbnailSelectorReport then p0.custom else nil
				}, {
					AbuseReportAnalyticsProvider = reactModule.createElement(abuseReportAnalyticsProviderModule, { abuseVector = p0.abuseVector }, {
						DynamicReport = reactModule.createElement(dynamicReportModule, p0)
					})
				})
			})
		})
	})
end)