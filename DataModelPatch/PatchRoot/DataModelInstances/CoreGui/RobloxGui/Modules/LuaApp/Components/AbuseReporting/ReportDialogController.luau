local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local TutilsModule = require(CorePackages.Packages.tutils)
local DsaIllegalContentReportingModule = require(CorePackages.Workspace.Packages.DsaIllegalContentReporting)
local ReportDialogBodyModule = require(Modules.LuaApp.Components.AbuseReporting.ReportDialogBody)
local SubmitAbuseReportModule = require(Modules.LuaApp.Components.AbuseReporting.submitAbuseReport)
local _ = require(Modules.LuaApp.Components.AbuseReporting.ReportTypes)
local ConstantsModule = require(Modules.LuaApp.Components.AbuseReporting.Constants)
local ReportAnalyticsModule = require(Modules.LuaApp.Components.AbuseReporting.ReportAnalytics)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local IsShowEUDSAIllegalContentReportingLinkFunction = DsaIllegalContentReportingModule.isShowEUDSAIllegalContentReportingLink
local IsInDSAFeaturesOverrideListFunction = DsaIllegalContentReportingModule.isInDSAFeaturesOverrideList
local GetFFlagLuafiedReportErrorStatesFunction = SharedFlagsModule.GetFFlagLuafiedReportErrorStates
local GetFFlagDSALuaGeoGateBEDUIDevModeFunction = SharedFlagsModule.GetFFlagDSALuaGeoGateBEDUIDevMode
local ActionTypes = ReportAnalyticsModule.ActionTypes

local function v14(ReportEntryPoint)
	-- upvalues: ConstantsModule (copy)
	return if ReportEntryPoint == ConstantsModule.REPORT_ENTRYPOINT.Profile or ReportEntryPoint == ConstantsModule.REPORT_ENTRYPOINT.Chat then ConstantsModule.BEDUI_FETCH_CONTEXT.Profile elseif ReportEntryPoint == ConstantsModule.REPORT_ENTRYPOINT.ExperienceDetails then ConstantsModule.BEDUI_FETCH_CONTEXT.Experience elseif ReportEntryPoint == ConstantsModule.REPORT_ENTRYPOINT.Item then ConstantsModule.BEDUI_FETCH_CONTEXT.Item elseif ReportEntryPoint == ConstantsModule.REPORT_ENTRYPOINT.Notification then ConstantsModule.BEDUI_FETCH_CONTEXT.Notification else ""
end

local NewResult = require(CorePackages.Workspace.Packages.ServerUI).UIConfiguration.new({
	enableLogging = false,
	maxRetryCount = 2,
	roduxKeyPath = "AbuseReporting"
})
local Tbl = {
	BEDUILoading = false,
	BEDUIError = false,
	submitLoading = false,
	submitError = false,
	statusPrimaryText = "",
	statusSecondaryText = ""
}

local function v17(p1, p2)
	-- upvalues: GetFFlagLuafiedReportErrorStatesFunction (copy), Tbl (copy), ConstantsModule (copy)
	if not GetFFlagLuafiedReportErrorStatesFunction() then
		return p1
	end
	local Copy = table.clone(Tbl)
	
	if p2.type == "BEDUI_LOADING" then
		Copy.BEDUILoading = true
		
		return Copy
	elseif p2.type == "BEDUI_ERROR" then
		Copy.BEDUIError = true
		Copy.statusPrimaryText = ConstantsModule.BEDUI_FETCH_FAILURE_PRIMARY
		Copy.statusSecondaryText = ConstantsModule.BEDUI_FETCH_FAILURE_SECONDARY
		
		return Copy
	elseif p2.type == "SUBMIT_LOADING" then
		Copy.submitLoading = true
		
		return Copy
	elseif p2.type == "SUBMIT_ERROR" then
		Copy.submitError = true
		Copy.statusPrimaryText = ConstantsModule.REPORT_SUBMIT_FAILURE
		
		return Copy
	elseif p2.type == "SUCCESS" then
		return Copy
	else
		error("Unknown Action: " .. p2.type)
		
		return Copy
	end
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), v17 (copy), Tbl (copy), ActionTypes (copy), v14 (copy), ConstantsModule (copy), GetFFlagDSALuaGeoGateBEDUIDevModeFunction (copy), IsShowEUDSAIllegalContentReportingLinkFunction (copy), IsInDSAFeaturesOverrideListFunction (copy), NewResult (copy), MutedErrorModule (copy), TutilsModule (copy), SetCurrentToastMessageModule (copy), ReportAnalyticsModule (copy), SubmitAbuseReportModule (copy), GetFFlagLuafiedReportErrorStatesFunction (copy), ReportDialogBodyModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState({})
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState({})
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(v17, (table.clone(Tbl)))
	local ReportEntryPoint = p1.reportData.reportEntryPoint
	ReactModule.useEffect(function()
		-- upvalues: UseReducerResult2 (copy), p1 (copy), ActionTypes (upval), ReportEntryPoint (copy), v14 (upval), ConstantsModule (upval), GetFFlagDSALuaGeoGateBEDUIDevModeFunction (upval), IsShowEUDSAIllegalContentReportingLinkFunction (upval), IsInDSAFeaturesOverrideListFunction (upval), UseDispatchResult (copy), NewResult (upval), UseStateResult2 (copy), UseStateResult2_1 (copy), MutedErrorModule (upval), TutilsModule (upval)
		UseReducerResult2({ type = "BEDUI_LOADING" })
		p1.analyticsDispatch({
			type = ActionTypes.SET_BASIC_INFO,
			dialogEntryPoint = ReportEntryPoint,
			platform = p1.reportSurface
		})
		local Context = v14(ReportEntryPoint)
		
		if Context ~= "" then
			local V1 = ConstantsModule.BEDUI_VERSIONS.V1
			
			if GetFFlagDSALuaGeoGateBEDUIDevModeFunction() then
				if IsShowEUDSAIllegalContentReportingLinkFunction() then
					V1 = ConstantsModule.BEDUI_VERSIONS.DEV
				end
			elseif IsInDSAFeaturesOverrideListFunction() then
				V1 = ConstantsModule.BEDUI_VERSIONS.DEV
			end
			UseDispatchResult(NewResult:fetch(ConstantsModule.BEDUI_BASE_URL, {
				version = V1,
				surface = p1.reportSurface,
				context = Context,
				locale = p1.locale
			})):andThen(function(Result)
				-- upvalues: UseStateResult2 (upval), UseStateResult2_1 (upval), UseReducerResult2 (upval)
				local ResponseBody = Result.responseBody
				
				if ResponseBody then
					UseStateResult2(ResponseBody.components)
					UseStateResult2_1(ResponseBody.components.listSelection)
				end
				UseReducerResult2({ type = "SUCCESS" })
			end):catch(function(Err)
				-- upvalues: MutedErrorModule (upval), TutilsModule (upval), UseReducerResult2 (upval)
				MutedErrorModule("(Abuse Reporting [VR]) BEDUI fetch failed: " .. TutilsModule.toString(Err))
				UseReducerResult2({ type = "BEDUI_ERROR" })
			end)
		end
	end, {
		ReportEntryPoint,
		p1.reportSurface,
		p1.locale,
		UseDispatchResult
	})
	
	return ReactModule.createElement(ReportDialogBodyModule, {
		currentList = UseStateResult1,
		selectionData = UseStateResult3,
		BEDUIComponents = UseStateResult,
		reportData = p1.reportData,
		reportSurface = p1.reportSurface,
		prevListNodes = UseStateResult4,
		analyticsDispatch = p1.analyticsDispatch,
		onSelect = function(TagValues, Heading, HumanReadableText, p2)
			-- upvalues: UseStateResult2_3 (copy), UseStateResult1 (copy), UseStateResult2_2 (copy), UseStateResult2_1 (copy), p1 (copy), ActionTypes (upval)
			UseStateResult2_3(function(Tbl)
				-- upvalues: UseStateResult1 (upval)
				local Copy = table.clone(Tbl)
				table.insert(Copy, UseStateResult1)
				
				return Copy
			end)
			UseStateResult2_2(function(Tbl)
				-- upvalues: TagValues (copy), Heading (copy), HumanReadableText (copy)
				local Copy = table.clone(Tbl)
				table.insert(Copy, {
					tagValues = TagValues,
					heading = Heading,
					humanReadableText = HumanReadableText
				})
				
				return Copy
			end)
			UseStateResult2_1(p2)
			p1.analyticsDispatch({ type = ActionTypes.INCREMENT_SELECTION_ITEM })
		end,
		onSubmitReport = function()
			-- upvalues: UseDispatchResult (copy), SetCurrentToastMessageModule (upval), ConstantsModule (upval), ReportAnalyticsModule (upval), p1 (copy), UseReducerResult2 (copy), UseStateResult (copy), UseStateResult3 (copy), SubmitAbuseReportModule (upval), GetFFlagLuafiedReportErrorStatesFunction (upval), MutedErrorModule (upval), TutilsModule (upval)
			local function _()
				-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageModule (upval), ConstantsModule (upval), ReportAnalyticsModule (upval), p1 (upval)
				UseDispatchResult(SetCurrentToastMessageModule(ConstantsModule.SUCCESS_TOAST_DATA))
				ReportAnalyticsModule.sendEventData(p1.analyticsState, ConstantsModule.ANALYTICS_EVENT_NAMES.SUBMITTED)
				p1.onClose()
			end
			
			UseReducerResult2({ type = "SUBMIT_LOADING" })
			local Url = UseStateResult.submission.url
			
			if #UseStateResult3 > 0 and Url then
				UseDispatchResult(SubmitAbuseReportModule(UseStateResult3, Url, p1.reportData, p1.submissionEntryPoint)):andThen(function()
					-- upvalues: GetFFlagLuafiedReportErrorStatesFunction (upval), UseReducerResult2 (upval), UseDispatchResult (upval), SetCurrentToastMessageModule (upval), ConstantsModule (upval), ReportAnalyticsModule (upval), p1 (upval)
					if GetFFlagLuafiedReportErrorStatesFunction() then
						UseReducerResult2({ type = "SUCCESS" })
						UseDispatchResult(SetCurrentToastMessageModule(ConstantsModule.SUCCESS_TOAST_DATA))
						ReportAnalyticsModule.sendEventData(p1.analyticsState, ConstantsModule.ANALYTICS_EVENT_NAMES.SUBMITTED)
						p1.onClose()
					end
				end):catch(function(Err)
					-- upvalues: MutedErrorModule (upval), TutilsModule (upval), UseReducerResult2 (upval)
					MutedErrorModule("(Abuse Reporting [VR]) Report submission failed" .. TutilsModule.toString(Err))
					UseReducerResult2({ type = "SUBMIT_ERROR" })
				end):finally(function()
					-- upvalues: p1 (upval)
					if p1.reportData and p1.reportData.onSubmitReportCallback then
						p1.reportData.onSubmitReportCallback()
					end
				end)
				
				if not GetFFlagLuafiedReportErrorStatesFunction() then
					UseDispatchResult(SetCurrentToastMessageModule(ConstantsModule.SUCCESS_TOAST_DATA))
					ReportAnalyticsModule.sendEventData(p1.analyticsState, ConstantsModule.ANALYTICS_EVENT_NAMES.SUBMITTED)
					p1.onClose()
				end
			end
		end,
		onSummaryPageMounted = p1.onSummaryPageMounted,
		onLogAbandon = p1.onLogAbandon,
		onBack = function()
			-- upvalues: UseStateResult4 (copy), UseStateResult2_1 (copy), UseStateResult2_3 (copy), UseStateResult3 (copy), UseStateResult2_2 (copy), p1 (copy), ActionTypes (upval), UseReducerResult2 (copy)
			if #UseStateResult4 > 0 then
				UseStateResult2_1(UseStateResult4[#UseStateResult4])
				UseStateResult2_3(function(Tbl)
					local Copy = table.clone(Tbl)
					table.remove(Copy)
					
					return Copy
				end)
				table.remove(UseStateResult3)
				UseStateResult2_2(UseStateResult3)
				p1.analyticsDispatch({ type = ActionTypes.INCREMENT_BACK_BUTTON_CLICK })
				UseReducerResult2({ type = "SUCCESS" })
			end
		end,
		onClose = p1.onClose,
		loadingState = UseReducerResult
	})
end