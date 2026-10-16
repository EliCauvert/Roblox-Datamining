local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local coreGuiService = game:GetService("CoreGui")
local dashModule = require(parent.Dash)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local inlineEventTypeModule = require(parent.OnPlatformSurveys.InlineEventType)
local inlineSurveyModule = require(parent.OnPlatformSurveys.InlineSurvey)
local surveyEventPublisherModule = require(parent.OnPlatformSurveys.SurveyEventPublisher)
local webViewEventTypeModule = require(parent.OnPlatformSurveys.WebViewEventType)
local dialogSize = foundationModule.Enums.DialogSize
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local overlayProvider = foundationModule.OverlayProvider
local sheet = foundationModule.Sheet
local useIsSpatial = responsiveModule.useIsSpatial
local abuseReportErrorBoundaryModule = require(genericAbuseReporting.BeduiV2.Components.AbuseReportErrorBoundary)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local abuseVectorModule = require(genericAbuseReporting.Enums.AbuseVector)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local dynamicReportV2ErrorModule = require(script.Parent.DynamicReportV2Error)
local dynamicReportV2LoadingModule = require(script.Parent.DynamicReportV2Loading)
local fetchConfigWithAttributesModule = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.fetchConfigWithAttributes)
local getNewRunId = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.reducer).getNewRunId
local abuseReportContentModule = require(script.Parent.AbuseReportContent)
local sendBoundaryErrorTelemetryModule = require(genericAbuseReporting.BeduiV2.Analytics.sendBoundaryErrorTelemetry)
local useFocusNavigationRefsModule = require(genericAbuseReporting.BeduiV2.Hooks.FocusNavigation.useFocusNavigationRefs)
local useVrOverlayModule = require(genericAbuseReporting.BeduiV2.Hooks.useVrOverlay)
local formatErrorDetailForAnalytics = analyticsServiceModule.formatErrorDetailForAnalytics
local sendAnalyticsEvent = analyticsServiceModule.sendAnalyticsEvent
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local fixDynamicReportV2VRAsync = game:DefineFastFlag("FixDynamicReportV2VRAsync", false)
local fFlagEnableInlineSurveyOnUserReport = require(parent.SharedFlags).FFlagEnableInlineSurveyOnUserReport
local fFlagSurvBloxEventTypeEnabled = require(parent.SharedFlags).FFlagSurvBloxEventTypeEnabled
local fFlagEnableReportingFlowForMomentsFeed = require(parent.SharedFlags).FFlagEnableReportingFlowForMomentsFeed
local fFlagAbuseReportAttributes = require(parent.SharedFlags).FFlagAbuseReportAttributes
local fFlagAbuseReportImproveErrorEventsModule = require(genericAbuseReporting.Flags.FFlagAbuseReportImproveErrorEvents)

return reactModule.memo(function(p1)
	-- upvalues: useRoactService (ref), roactNetworking (ref), reactModule (ref), fFlagAbuseReportAttributes (ref), fFlagEnableInlineSurveyOnUserReport (ref), dashModule (ref), fetchConfigWithAttributesModule (ref), sendAnalyticsEvent (ref), telemetryEventType (ref), getNewRunId (ref), fFlagAbuseReportImproveErrorEventsModule (ref), formatErrorDetailForAnalytics (ref), fFlagEnableReportingFlowForMomentsFeed (ref), fFlagSurvBloxEventTypeEnabled (ref), surveyEventPublisherModule (ref), webViewEventTypeModule (ref), abuseVectorModule (ref), sendBoundaryErrorTelemetryModule (ref), useFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), coreGuiService (ref), useIsSpatial (ref), fixDynamicReportV2VRAsync (ref), useVrOverlayModule (ref), sheet (ref), dialogSize (ref), abuseReportErrorBoundaryModule (ref), abuseReportContentModule (ref), dynamicReportV2LoadingModule (ref), dynamicReportV2ErrorModule (ref), overlayProvider (ref), inlineSurveyModule (ref), inlineEventTypeModule (ref)
	local var1 = useRoactService(roactNetworking)
	local var2, var3 = reactModule.useState(nil)
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState(true)
	local var8 = if fFlagAbuseReportAttributes then p1.analyticsTargetId else p1.targetId
	local var9 = nil
	
	if fFlagAbuseReportAttributes then
		var9 = reactModule.useRef(var8)
		var9.current = var8
	end
	local var10 = nil
	local var11 = nil
	local var12 = nil
	
	if fFlagEnableInlineSurveyOnUserReport then
		local var13, var14 = reactModule.useState(false)
		var10 = var13
		var11 = var14
		var12 = reactModule.useRef(false)
	end
	local var15 = if fFlagAbuseReportAttributes then p1.attributes else p1.targetId
	
	if fFlagAbuseReportAttributes then
		local var16 = reactModule.useRef(p1.attributes)
		
		if not dashModule.shallowEqual(var16.current, p1.attributes) then
			var16.current = p1.attributes
		end
		var15 = var16.current or false
	end
	reactModule.useEffect(function()
		-- upvalues: fetchConfigWithAttributesModule (copy), var1 (ref), p1 (ref), fFlagAbuseReportAttributes (copy), var3 (ref), sendAnalyticsEvent (copy), var9 (write), telemetryEventType (copy), var5 (ref), getNewRunId (copy), fFlagAbuseReportImproveErrorEventsModule (copy), formatErrorDetailForAnalytics (copy), dashModule (copy)
		local var17 = false
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		fetchConfigWithAttributesModule(var1, p1.abuseVector, if fFlagAbuseReportAttributes then p1.attributes else { targetId = p1.targetId }):andThen(function(p2)
			-- upvalues: var17 (write), unixTimestampMillis (ref), var3 (copy), sendAnalyticsEvent (copy), p1 (copy), fFlagAbuseReportAttributes (copy), var9 (copy), telemetryEventType (copy)
			if var17 then
				return
			end
			local responseBody = p2.responseBody
			local var18 = DateTime.now().UnixTimestampMillis - unixTimestampMillis
			var3(responseBody)
			sendAnalyticsEvent({
				run_id = "unknown",
				total_duration = 0,
				abuse_vector = p1.abuseVector,
				target_id = if fFlagAbuseReportAttributes then var9.current else p1.targetId,
				path = {},
				config_name = responseBody.name
			}, {
				sub_event_type = telemetryEventType.ConfigLoaded,
				config_load_detail = {
					cache_hit = false,
					retry_count = 0,
					load_duration_ms = var18
				}
			})
		end):catch(function(p2)
			-- upvalues: var17 (write), var5 (copy), sendAnalyticsEvent (copy), p1 (copy), fFlagAbuseReportAttributes (copy), var9 (copy), getNewRunId (copy), telemetryEventType (copy), fFlagAbuseReportImproveErrorEventsModule (copy), formatErrorDetailForAnalytics (copy), dashModule (copy)
			if var17 then
				return
			end
			warn("Failed to fetch Dynamic Report V2 config:", p2)
			var5(true)
			sendAnalyticsEvent({
				total_duration = 0,
				abuse_vector = p1.abuseVector,
				target_id = if fFlagAbuseReportAttributes then var9.current else p1.targetId,
				run_id = getNewRunId(),
				path = {}
			}, {
				sub_event_type = telemetryEventType.Error,
				error_detail = if fFlagAbuseReportImproveErrorEventsModule then formatErrorDetailForAnalytics("Failed to fetch config", p2) else {
					error_message = "Failed to fetch config: " .. dashModule.pretty(p2, { depth = 10, multiline = true })
				}
			})
		end)
		
		return function()
			-- upvalues: var17 (write)
			var17 = true
		end
	end, { var1, p1.abuseVector, var15 })
	local var17 = reactModule.useRef(nil)
	local var18 = reactModule.useRef(false)
	local var19 = nil
	local var20 = nil
	local var21 = nil
	local var22 = nil
	local var23 = nil
	
	if fFlagEnableInlineSurveyOnUserReport then
		var19 = reactModule.useRef(false)
		var20 = reactModule.useCallback(function(p2)
			-- upvalues: var19 (write), fFlagEnableReportingFlowForMomentsFeed (copy), p1 (ref)
			if p2.didSubmit then
				var19.current = true
				
				if fFlagEnableReportingFlowForMomentsFeed and p1.onSubmit then
					p1.onSubmit()
				end
			end
		end, { p1.onSubmit })
		var21 = reactModule.useCallback(function()
			-- upvalues: fFlagSurvBloxEventTypeEnabled (copy), surveyEventPublisherModule (copy), webViewEventTypeModule (copy)
			if fFlagSurvBloxEventTypeEnabled then
				surveyEventPublisherModule.publishSurveyEvent(webViewEventTypeModule.ReportSubmitted)
			end
		end, {})
		var22 = reactModule.useCallback(function()
			-- upvalues: var12 (write)
			var12.current = true
		end, {})
		var23 = reactModule.useCallback(function()
			-- upvalues: var12 (write), var21 (write), p1 (ref)
			if not var12.current then
				var21()
			end
			p1.onClose()
		end, { var21, p1.onClose })
	end
	local var24 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var7 (ref)
		var18.current = true
		var7(false)
	end, {})
	local var25 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var17 (ref), var7 (ref), fFlagEnableInlineSurveyOnUserReport (copy), var19 (write), p1 (ref), abuseVectorModule (copy), var11 (write), var21 (write)
		if not var18.current and var17.current then
			var17.current.requestClose()
		end
		var7(false)
		
		if fFlagEnableInlineSurveyOnUserReport then
			if not var19.current then
				p1.onClose()
				
				return
			elseif p1.abuseVector == abuseVectorModule.UserProfile then
				var11(true)
				
				return
			end
			var21()
		end
		p1.onClose()
	end, { p1.onClose, p1.abuseVector, var21 })
	local var26 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5(true)
	end, {})
	local var27 = reactModule.useCallback(function(p2)
		-- upvalues: sendBoundaryErrorTelemetryModule (copy), p1 (ref), var8 (ref), var5 (ref)
		warn("AbuseReportErrorBoundary caught:", p2)
		sendBoundaryErrorTelemetryModule(p2, { abuse_vector = p1.abuseVector, target_id = var8 })
		var5(true)
	end, { p1.abuseVector, var8 })
	local var28 = useFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, function()
		-- upvalues: var7 (ref)
		var7(false)
	end)
	local var29, var30 = reactModule.useState(true)
	local var31 = reactModule.useCallback(function(p2)
		-- upvalues: var30 (ref)
		var30(not p2)
	end, {})
	local var32 = reactModule.useCallback(function(p2)
		-- upvalues: var29 (ref), var28 (ref)
		local var33 = if var29 then p2 else nil
		
		if typeof(var28) == "function" then
			var28(var33)
			
			return
		elseif var28 and typeof(var28) == "table" then
			var28.current = var33
		end
	end, { var29, var28 })
	local VRCentralOverlay = coreGuiService:FindFirstChild("VRCentralOverlay")
	local var33 = useIsSpatial()
	local var34 = if fixDynamicReportV2VRAsync then useVrOverlayModule() elseif VRCentralOverlay then VRCentralOverlay:FindFirstChild("CentralOverlay_SurfaceGui") else nil
	local createElement = reactModule.createElement
	createElement = createElement(sheet.Root, {
		centerSheetHeight = 1,
		preferCenterSheet = true,
		isOpen = var6,
		onClose = var25,
		snapPoints = { 0.9 },
		size = dialogSize.Medium,
		ref = var32
	}, {
		AbuseReportDialog = if var2 and not var4 then reactModule.createElement(abuseReportErrorBoundaryModule, { onError = var27 }, {
			AbuseReportContent = reactModule.createElement(abuseReportContentModule, {
				ref = var17,
				rawConfig = var2,
				abuseVector = p1.abuseVector,
				analyticsTargetId = var8,
				onClose = var24,
				open = var6,
				takeoverFocus = var31,
				onResolveError = var26,
				onCustomSubmit = p1.onCustomSubmit,
				clientActionHandlers = p1.clientActionHandlers,
				onFinish = var20
			})
		}) else nil,
		LoadingDialog = if var2 or var4 then nil else reactModule.createElement(dynamicReportV2LoadingModule, nil),
		ErrorDialog = if var4 then reactModule.createElement(dynamicReportV2ErrorModule, nil) else nil
	})
	
	return if fixDynamicReportV2VRAsync and var33 and not var34 then nil elseif fFlagEnableInlineSurveyOnUserReport and var10 then reactModule.createElement(overlayProvider, { gui = var34 }, {
		Survey = reactModule.createElement(inlineSurveyModule, {
			eventType = inlineEventTypeModule.UserReportButtonClicked,
			onEligible = var22,
			onClose = var23
		})
	}) else reactModule.createElement(overlayProvider, { gui = var34 }, { Sheet = createElement })
end)