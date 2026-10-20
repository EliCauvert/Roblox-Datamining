local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(CorePackages.Packages.React)
local ReportComingSoonPromptModule = require(Modules.LuaApp.Components.AbuseReporting.ReportComingSoonPrompt)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local ReportDialogControllerModule = require(Modules.LuaApp.Components.AbuseReporting.ReportDialogController)
local _ = require(Modules.LuaApp.Components.AbuseReporting.ReportTypes)
local ConstantsModule = require(Modules.LuaApp.Components.AbuseReporting.Constants)
local ReportAnalyticsModule = require(Modules.LuaApp.Components.AbuseReporting.ReportAnalytics)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local GetFFlagLuafiedReportFullFlowFunction = SharedFlagsModule.GetFFlagLuafiedReportFullFlow
local GetFFlagVRAbuseReportLocalesFunction = SharedFlagsModule.GetFFlagVRAbuseReportLocales
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch

return function()
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), ReactModule (copy), ReportAnalyticsModule (copy), NavigateBackModule (copy), ConstantsModule (copy), GetFFlagLuafiedReportFullFlowFunction (copy), ReportDialogControllerModule (copy), GetFFlagVRAbuseReportLocalesFunction (copy), LocalizationService (copy), ReportComingSoonPromptModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(ReportAnalyticsModule.reportAnalyticsReducer, ReportAnalyticsModule.EMPTY_LOGGING_STATE)
	local ReportDataParam = UseNavigationResult.getParam("reportData")
	
	local function OnClose()
		-- upvalues: ReportDataParam (copy), UseDispatchResult (copy), NavigateBackModule (upval)
		if ReportDataParam and ReportDataParam.onCloseCallback then
			ReportDataParam.onCloseCallback()
		end
		UseDispatchResult(NavigateBackModule())
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
	
	return if GetFFlagLuafiedReportFullFlowFunction() or ReportDataParam and ReportDataParam.reportEntryPoint == "Notification" then ReactModule.createElement(ReportDialogControllerModule, {
		reportSurface = if ReportDataParam and ReportDataParam.reportSurface then ReportDataParam.reportSurface else ConstantsModule.BEDUI_SURFACES.VR,
		locale = if GetFFlagVRAbuseReportLocalesFunction() then LocalizationService.RobloxLocaleId else "en_us",
		reportData = ReportDataParam,
		submissionEntryPoint = if ReportDataParam and ReportDataParam.submissionEntryPoint then ReportDataParam.submissionEntryPoint else ConstantsModule.SAFETY_EVENT_SUBMISSION_ENTRY_POINT.VR,
		analyticsState = UseReducerResult,
		analyticsDispatch = UseReducerResult2,
		onClose = OnClose,
		onSummaryPageMounted = UseResult1,
		onLogAbandon = UseResult
	}) else ReactModule.createElement(ReportComingSoonPromptModule, { onClose = OnClose })
end