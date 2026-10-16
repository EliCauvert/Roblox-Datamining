local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local CoreGui = game:GetService("CoreGui")
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local InlineEventTypeModule = require(Parent.OnPlatformSurveys.InlineEventType)
local InlineSurveyModule = require(Parent.OnPlatformSurveys.InlineSurvey)
local SurveyEventPublisherModule = require(Parent.OnPlatformSurveys.SurveyEventPublisher)
local WebViewEventTypeModule = require(Parent.OnPlatformSurveys.WebViewEventType)
local DialogSize = FoundationModule.Enums.DialogSize
local FocusNavigableSurfaceIdentifierEnum = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local OverlayProvider = FoundationModule.OverlayProvider
local Sheet = FoundationModule.Sheet
local UseIsSpatialFunction = require(Parent.Responsive).useIsSpatial
local AbuseReportErrorBoundaryModule = require(GenericAbuseReporting.BeduiV2.Components.AbuseReportErrorBoundary)
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local AbuseVectorModule = require(GenericAbuseReporting.Enums.AbuseVector)
local AnalyticsServiceModule = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService)
local DynamicReportV2ErrorModule = require(script.Parent.DynamicReportV2Error)
local DynamicReportV2LoadingModule = require(script.Parent.DynamicReportV2Loading)
local FetchConfigWithAttributesModule = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.fetchConfigWithAttributes)
local GetNewRunIdFunction = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.reducer).getNewRunId
local AbuseReportContentModule = require(script.Parent.AbuseReportContent)
local SendBoundaryErrorTelemetryModule = require(GenericAbuseReporting.BeduiV2.Analytics.sendBoundaryErrorTelemetry)
local UseFocusNavigationRefsModule = require(GenericAbuseReporting.BeduiV2.Hooks.FocusNavigation.useFocusNavigationRefs)
local UseVrOverlayModule = require(GenericAbuseReporting.BeduiV2.Hooks.useVrOverlay)
local FormatErrorDetailForAnalyticsFunction = AnalyticsServiceModule.formatErrorDetailForAnalytics
local SendAnalyticsEventFunction = AnalyticsServiceModule.sendAnalyticsEvent
local TelemetryEventType = AnalyticsServiceModule.TelemetryEventType
local FixDynamicReportV2VRAsync = game:DefineFastFlag("FixDynamicReportV2VRAsync", false)
local FFlagEnableInlineSurveyOnUserReport = require(Parent.SharedFlags).FFlagEnableInlineSurveyOnUserReport
local FFlagSurvBloxEventTypeEnabled = require(Parent.SharedFlags).FFlagSurvBloxEventTypeEnabled
local FFlagAbuseReportAttributes = require(Parent.SharedFlags).FFlagAbuseReportAttributes
local FFlagAbuseReportImproveErrorEventsModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportImproveErrorEvents)

return ReactModule.memo(function(p1) --[[ Line: 73 | Named "DynamicReportV2Container" ]]
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), ReactModule (copy), FFlagAbuseReportAttributes (copy), FFlagEnableInlineSurveyOnUserReport (copy), DashModule (copy), FetchConfigWithAttributesModule (copy), SendAnalyticsEventFunction (copy), TelemetryEventType (copy), GetNewRunIdFunction (copy), FFlagAbuseReportImproveErrorEventsModule (copy), FormatErrorDetailForAnalyticsFunction (copy), FFlagSurvBloxEventTypeEnabled (copy), SurveyEventPublisherModule (copy), WebViewEventTypeModule (copy), AbuseVectorModule (copy), SendBoundaryErrorTelemetryModule (copy), UseFocusNavigationRefsModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), CoreGui (copy), UseIsSpatialFunction (copy), FixDynamicReportV2VRAsync (copy), UseVrOverlayModule (copy), Sheet (copy), DialogSize (copy), AbuseReportErrorBoundaryModule (copy), AbuseReportContentModule (copy), DynamicReportV2LoadingModule (copy), DynamicReportV2ErrorModule (copy), OverlayProvider (copy), InlineSurveyModule (copy), InlineEventTypeModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local AnalyticsTargetId = if FFlagAbuseReportAttributes then p1.analyticsTargetId else p1.targetId
	local UseRefResult = nil
	
	if FFlagAbuseReportAttributes then
		UseRefResult = ReactModule.useRef(AnalyticsTargetId)
		UseRefResult.current = AnalyticsTargetId
	end
	local v1 = nil
	local Callback1 = nil
	local UseRefResult1 = nil
	
	if FFlagEnableInlineSurveyOnUserReport then
		v1, Callback1 = ReactModule.useState(false)
		UseRefResult1 = ReactModule.useRef(false)
	end
	local Attributes = if FFlagAbuseReportAttributes then p1.attributes else p1.targetId
	
	if FFlagAbuseReportAttributes then
		local UseRefResult2 = ReactModule.useRef(p1.attributes)
		
		if not DashModule.shallowEqual(UseRefResult2.current, p1.attributes) then
			UseRefResult2.current = p1.attributes
		end
		Attributes = UseRefResult2.current or false
	end
	ReactModule.useEffect(function() --[[ Line: 106 ]]
		-- upvalues: FetchConfigWithAttributesModule (upval), UseRoactServiceResult (copy), p1 (copy), FFlagAbuseReportAttributes (upval), UseStateResult2 (copy), SendAnalyticsEventFunction (upval), UseRefResult (ref), TelemetryEventType (upval), UseStateResult2_1 (copy), GetNewRunIdFunction (upval), FFlagAbuseReportImproveErrorEventsModule (upval), FormatErrorDetailForAnalyticsFunction (upval), DashModule (upval)
		local Flag = false
		local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
		FetchConfigWithAttributesModule(UseRoactServiceResult, p1.abuseVector, if FFlagAbuseReportAttributes then p1.attributes else { targetId = p1.targetId }):andThen(function(Result) --[[ Line: 118 ]]
			-- upvalues: Flag (ref), UnixTimestampMillis (copy), UseStateResult2 (upval), SendAnalyticsEventFunction (upval), p1 (upval), FFlagAbuseReportAttributes (upval), UseRefResult (upval), TelemetryEventType (upval)
			if not Flag then
				local ResponseBody = Result.responseBody
				local UnixTimestampMillisDelta = DateTime.now().UnixTimestampMillis - UnixTimestampMillis
				UseStateResult2(ResponseBody)
				SendAnalyticsEventFunction({
					run_id = "unknown",
					total_duration = 0,
					abuse_vector = p1.abuseVector,
					target_id = if FFlagAbuseReportAttributes then UseRefResult.current else p1.targetId,
					path = {},
					config_name = ResponseBody.name
				}, {
					sub_event_type = TelemetryEventType.ConfigLoaded,
					config_load_detail = {
						cache_hit = false,
						retry_count = 0,
						load_duration_ms = UnixTimestampMillisDelta
					}
				})
				
				return
			end
		end):catch(function(Err) --[[ Line: 143 ]]
			-- upvalues: Flag (ref), UseStateResult2_1 (upval), SendAnalyticsEventFunction (upval), p1 (upval), FFlagAbuseReportAttributes (upval), UseRefResult (upval), GetNewRunIdFunction (upval), TelemetryEventType (upval), FFlagAbuseReportImproveErrorEventsModule (upval), FormatErrorDetailForAnalyticsFunction (upval), DashModule (upval)
			if not Flag then
				warn("Failed to fetch Dynamic Report V2 config:", Err)
				UseStateResult2_1(true)
				SendAnalyticsEventFunction({
					total_duration = 0,
					abuse_vector = p1.abuseVector,
					target_id = if FFlagAbuseReportAttributes then UseRefResult.current else p1.targetId,
					run_id = GetNewRunIdFunction(),
					path = {}
				}, {
					sub_event_type = TelemetryEventType.Error,
					error_detail = if FFlagAbuseReportImproveErrorEventsModule then FormatErrorDetailForAnalyticsFunction("Failed to fetch config", Err) else {
						error_message = "Failed to fetch config: " .. DashModule.pretty(Err, { depth = 10, multiline = true })
					}
				})
				
				return
			end
		end)
		
		return function() --[[ Line: 165 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { UseRoactServiceResult, p1.abuseVector, Attributes })
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(false)
	local UseRefResult5 = nil
	local UseResult = nil
	local Callback = nil
	local UseResult1 = nil
	local UseResult2 = nil
	
	if FFlagEnableInlineSurveyOnUserReport then
		UseRefResult5 = ReactModule.useRef(false)
		UseResult = ReactModule.useCallback(function(p2) --[[ Line: 189 ]]
			-- upvalues: UseRefResult5 (ref), p1 (copy)
			if p2.didSubmit then
				UseRefResult5.current = true
				
				if p1.onSubmit then
					p1.onSubmit()
				end
			end
		end, { p1.onSubmit })
		Callback = ReactModule.useCallback(function() --[[ Line: 198 ]]
			-- upvalues: FFlagSurvBloxEventTypeEnabled (upval), SurveyEventPublisherModule (upval), WebViewEventTypeModule (upval)
			if FFlagSurvBloxEventTypeEnabled then
				SurveyEventPublisherModule.publishSurveyEvent(WebViewEventTypeModule.ReportSubmitted)
			end
		end, {})
		UseResult1 = ReactModule.useCallback(function() --[[ Line: 204 ]]
			-- upvalues: UseRefResult1 (ref)
			UseRefResult1.current = true
		end, {})
		UseResult2 = ReactModule.useCallback(function() --[[ Line: 208 ]]
			-- upvalues: UseRefResult1 (ref), Callback (ref), p1 (copy)
			if not UseRefResult1.current then
				Callback()
			end
			p1.onClose()
		end, { Callback, p1.onClose })
	end
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 216 ]]
		-- upvalues: UseRefResult4 (copy), UseStateResult2_2 (copy)
		UseRefResult4.current = true
		UseStateResult2_2(false)
	end, {})
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 224 ]]
		-- upvalues: UseRefResult4 (copy), UseRefResult3 (copy), UseStateResult2_2 (copy), FFlagEnableInlineSurveyOnUserReport (upval), UseRefResult5 (ref), p1 (copy), AbuseVectorModule (upval), Callback1 (ref), Callback (ref)
		if not UseRefResult4.current and UseRefResult3.current then
			UseRefResult3.current.requestClose()
		end
		UseStateResult2_2(false)
		
		if FFlagEnableInlineSurveyOnUserReport then
			if not UseRefResult5.current then
				p1.onClose()
				
				return
			end
			if p1.abuseVector == AbuseVectorModule.UserProfile then
				Callback1(true)
				
				return
			end
			Callback()
		end
		p1.onClose()
	end, { p1.onClose, p1.abuseVector, Callback })
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 248 ]]
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(true)
	end, {})
	local UseResult6 = ReactModule.useCallback(function(p2) --[[ Line: 252 ]]
		-- upvalues: SendBoundaryErrorTelemetryModule (upval), p1 (copy), AnalyticsTargetId (copy), UseStateResult2_1 (copy)
		warn("AbuseReportErrorBoundary caught:", p2)
		SendBoundaryErrorTelemetryModule(p2, {
			abuse_vector = p1.abuseVector,
			target_id = AnalyticsTargetId
		})
		UseStateResult2_1(true)
	end, { p1.abuseVector, AnalyticsTargetId })
	local UseFocusNavigationRefsModuleResult = UseFocusNavigationRefsModule(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, function() --[[ Line: 261 ]]
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(false)
	end)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(true)
	local UseResult7 = ReactModule.useCallback(function(p2) --[[ Line: 265 ]]
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(not p2)
	end, {})
	local UseResult8 = ReactModule.useCallback(function(p2) --[[ Line: 268 ]]
		-- upvalues: UseStateResult4 (copy), UseFocusNavigationRefsModuleResult (copy)
		local Current = if UseStateResult4 then p2 else nil
		
		if typeof(UseFocusNavigationRefsModuleResult) == "function" then
			UseFocusNavigationRefsModuleResult(Current)
			
			return
		end
		if UseFocusNavigationRefsModuleResult and typeof(UseFocusNavigationRefsModuleResult) == "table" then
			UseFocusNavigationRefsModuleResult.current = Current
		end
	end, { UseStateResult4, UseFocusNavigationRefsModuleResult })
	local VRCentralOverlay = CoreGui:FindFirstChild("VRCentralOverlay")
	local CentralOverlaySurfaceGui = if VRCentralOverlay then VRCentralOverlay:FindFirstChild("CentralOverlay_SurfaceGui") else nil
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseVrOverlayModuleResult = if FixDynamicReportV2VRAsync then UseVrOverlayModule() else CentralOverlaySurfaceGui
	local Element = ReactModule.createElement(Sheet.Root, {
		centerSheetHeight = 1,
		preferCenterSheet = true,
		isOpen = UseStateResult3,
		onClose = UseResult4,
		snapPoints = { 0.9 },
		size = DialogSize.Medium,
		ref = UseResult8
	}, {
		AbuseReportDialog = if UseStateResult and not UseStateResult1 then ReactModule.createElement(AbuseReportErrorBoundaryModule, { onError = UseResult6 }, {
			AbuseReportContent = ReactModule.createElement(AbuseReportContentModule, {
				ref = UseRefResult3,
				rawConfig = UseStateResult,
				abuseVector = p1.abuseVector,
				analyticsTargetId = AnalyticsTargetId,
				onClose = UseResult3,
				open = UseStateResult3,
				takeoverFocus = UseResult7,
				onResolveError = UseResult5,
				onCustomSubmit = p1.onCustomSubmit,
				clientActionHandlers = p1.clientActionHandlers,
				onFinish = UseResult
			})
		}) else nil,
		LoadingDialog = if UseStateResult or UseStateResult1 then nil else ReactModule.createElement(DynamicReportV2LoadingModule, nil),
		ErrorDialog = if UseStateResult1 then ReactModule.createElement(DynamicReportV2ErrorModule, nil) else nil
	})
	
	return if FixDynamicReportV2VRAsync and (UseIsSpatialResult and not UseVrOverlayModuleResult) then nil elseif FFlagEnableInlineSurveyOnUserReport and v1 then ReactModule.createElement(OverlayProvider, { gui = UseVrOverlayModuleResult }, {
		Survey = ReactModule.createElement(InlineSurveyModule, {
			eventType = InlineEventTypeModule.UserReportButtonClicked,
			onEligible = UseResult1,
			onClose = UseResult2
		})
	}) else ReactModule.createElement(OverlayProvider, { gui = UseVrOverlayModuleResult }, { Sheet = Element })
end)