local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(CorePackages.Packages.React)
local ReportComingSoonPromptModule = require(Modules.LuaApp.Components.AbuseReporting.ReportComingSoonPrompt)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local ReportDialogControllerModule = require(Modules.LuaApp.Components.AbuseReporting.ReportDialogController)
local ConstantsModule = require(Modules.LuaApp.Components.AbuseReporting.Constants)
local _ = require(Modules.LuaApp.Components.AbuseReporting.ReportTypes)
local ReportAnalyticsModule = require(Modules.LuaApp.Components.AbuseReporting.ReportAnalytics)
local GetFFlagLuafiedReportFullFlowFunction = SharedFlagsModule.GetFFlagLuafiedReportFullFlow
local GetFFlagVRAbuseReportLocalesFunction = SharedFlagsModule.GetFFlagVRAbuseReportLocales
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)

return (require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)(function()
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), ReportAnalyticsModule (copy), NavigationUtilsModule (copy), ConstantsModule (copy), GetFFlagLuafiedReportFullFlowFunction (copy), ReportDialogControllerModule (copy), GetFFlagVRAbuseReportLocalesFunction (copy), LocalizationService (copy), ReportComingSoonPromptModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(ReportAnalyticsModule.reportAnalyticsReducer, ReportAnalyticsModule.EMPTY_LOGGING_STATE)
	
	local function OnClose()
		-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy)
		NavigationUtilsModule.closeOverlay(UseNavigationResult)
	end
	
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: ReportAnalyticsModule (upval), UseReducerResult (copy), ConstantsModule (upval)
		ReportAnalyticsModule.sendEventData(UseReducerResult, ConstantsModule.ANALYTICS_EVENT_NAMES.ABANDONED)
	end, { UseReducerResult2, UseReducerResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseReducerResult2 (copy), ReportAnalyticsModule (upval)
		UseReducerResult2({
			type = ReportAnalyticsModule.ActionTypes.SET_IS_SEEN_SUMMARY_PAGE
		})
	end, { UseReducerResult2, UseReducerResult })
	local ReportData = {
		reportEntryPoint = ConstantsModule.REPORT_ENTRYPOINT.Item,
		assetTypeName = UseNavigationResult.getParam("assetTypeName"),
		itemId = UseNavigationResult.getParam("itemId"),
		itemName = UseNavigationResult.getParam("itemName"),
		itemCreatorName = UseNavigationResult.getParam("itemCreatorName")
	}
	
	return if GetFFlagLuafiedReportFullFlowFunction() then ReactModule.createElement(ReportDialogControllerModule, {
		reportData = ReportData,
		reportSurface = ConstantsModule.BEDUI_SURFACES.VR,
		locale = if GetFFlagVRAbuseReportLocalesFunction() then LocalizationService.RobloxLocaleId else "en_us",
		submissionEntryPoint = ConstantsModule.SAFETY_EVENT_SUBMISSION_ENTRY_POINT.VR,
		analyticsState = UseReducerResult,
		analyticsDispatch = UseReducerResult2,
		onClose = OnClose,
		onSummaryPageMounted = UseResult1,
		onLogAbandon = UseResult
	}) else ReactModule.createElement(ReportComingSoonPromptModule, { onClose = OnClose })
end))