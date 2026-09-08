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
local sendAnalyticsEvent = analyticsServiceModule.sendAnalyticsEvent
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local fixDynamicReportV2VRAsync = game:DefineFastFlag("FixDynamicReportV2VRAsync", false)
local fFlagEnableInlineSurveyOnUserReport = require(parent.SharedFlags).FFlagEnableInlineSurveyOnUserReport
local fFlagSurvBloxEventTypeEnabled = require(parent.SharedFlags).FFlagSurvBloxEventTypeEnabled
local fFlagEnableReportingFlowForMomentsFeed = require(parent.SharedFlags).FFlagEnableReportingFlowForMomentsFeed

return reactModule.memo(function(p1)
	-- upvalues: useRoactService (ref), roactNetworking (ref), reactModule (ref), fFlagEnableInlineSurveyOnUserReport (ref), fetchConfigWithAttributesModule (ref), sendAnalyticsEvent (ref), telemetryEventType (ref), dashModule (ref), getNewRunId (ref), fFlagEnableReportingFlowForMomentsFeed (ref), fFlagSurvBloxEventTypeEnabled (ref), surveyEventPublisherModule (ref), webViewEventTypeModule (ref), abuseVectorModule (ref), sendBoundaryErrorTelemetryModule (ref), useFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), coreGuiService (ref), useIsSpatial (ref), fixDynamicReportV2VRAsync (ref), useVrOverlayModule (ref), sheet (ref), dialogSize (ref), abuseReportErrorBoundaryModule (ref), abuseReportContentModule (ref), dynamicReportV2LoadingModule (ref), dynamicReportV2ErrorModule (ref), overlayProvider (ref), inlineSurveyModule (ref), inlineEventTypeModule (ref)
	local var1 = useRoactService(roactNetworking)
	local var2, var3 = reactModule.useState(nil)
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState(true)
	local var8 = nil
	local var9 = nil
	local var10 = nil
	
	if fFlagEnableInlineSurveyOnUserReport then
		local var11, var12 = reactModule.useState(false)
		var8 = var11
		var9 = var12
		var10 = reactModule.useRef(false)
	end
	reactModule.useEffect(function()
		-- upvalues: fetchConfigWithAttributesModule (copy), var1 (ref), p1 (ref), var3 (ref), sendAnalyticsEvent (copy), telemetryEventType (copy), var5 (ref), dashModule (copy), getNewRunId (copy)
		local var13 = false
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		fetchConfigWithAttributesModule(var1, p1.abuseVector, { targetId = p1.targetId }):andThen(function(p2)
			-- upvalues: var13 (write), unixTimestampMillis (ref), var3 (copy), sendAnalyticsEvent (copy), p1 (copy), telemetryEventType (copy)
			if var13 then
				return
			end
			local responseBody = p2.responseBody
			local var14 = DateTime.now().UnixTimestampMillis - unixTimestampMillis
			var3(responseBody)
			sendAnalyticsEvent({
				run_id = "unknown",
				total_duration = 0,
				abuse_vector = p1.abuseVector,
				target_id = p1.targetId,
				path = {},
				config_name = responseBody.name
			}, {
				sub_event_type = telemetryEventType.ConfigLoaded,
				config_load_detail = {
					cache_hit = false,
					retry_count = 0,
					load_duration_ms = var14
				}
			})
		end):catch(function(p2)
			-- upvalues: var13 (write), var5 (copy), dashModule (copy), sendAnalyticsEvent (copy), p1 (copy), getNewRunId (copy), telemetryEventType (copy)
			if var13 then
				return
			end
			warn("Failed to fetch Dynamic Report V2 config:", p2)
			var5(true)
			sendAnalyticsEvent({
				total_duration = 0,
				abuse_vector = p1.abuseVector,
				target_id = p1.targetId,
				run_id = getNewRunId(),
				path = {}
			}, {
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = `Failed to fetch config: {dashModule.pretty(p2, { depth = 10, multiline = true })}`
				}
			})
		end)
		
		return function()
			-- upvalues: var13 (write)
			var13 = true
		end
	end, { var1, p1.abuseVector, p1.targetId })
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useRef(false)
	local var15 = nil
	local var16 = nil
	local var17 = nil
	local var18 = nil
	local var19 = nil
	
	if fFlagEnableInlineSurveyOnUserReport then
		var15 = reactModule.useRef(false)
		var16 = reactModule.useCallback(function(p2)
			-- upvalues: var15 (write), fFlagEnableReportingFlowForMomentsFeed (copy), p1 (ref)
			if p2.didSubmit then
				var15.current = true
				
				if fFlagEnableReportingFlowForMomentsFeed and p1.onSubmit then
					p1.onSubmit()
				end
			end
		end, { p1.onSubmit })
		var17 = reactModule.useCallback(function()
			-- upvalues: fFlagSurvBloxEventTypeEnabled (copy), surveyEventPublisherModule (copy), webViewEventTypeModule (copy)
			if fFlagSurvBloxEventTypeEnabled then
				surveyEventPublisherModule.publishSurveyEvent(webViewEventTypeModule.ReportSubmitted)
			end
		end, {})
		var18 = reactModule.useCallback(function()
			-- upvalues: var10 (write)
			var10.current = true
		end, {})
		var19 = reactModule.useCallback(function()
			-- upvalues: var10 (write), var17 (write), p1 (ref)
			if not var10.current then
				var17()
			end
			p1.onClose()
		end, { var17, p1.onClose })
	end
	local var20 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), var7 (ref)
		var14.current = true
		var7(false)
	end, {})
	local var21 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), var13 (ref), var7 (ref), fFlagEnableInlineSurveyOnUserReport (copy), var15 (write), p1 (ref), abuseVectorModule (copy), var9 (write), var17 (write)
		if not var14.current and var13.current then
			var13.current.requestClose()
		end
		var7(false)
		
		if fFlagEnableInlineSurveyOnUserReport then
			if not var15.current then
				p1.onClose()
				
				return
			elseif p1.abuseVector == abuseVectorModule.UserProfile then
				var9(true)
				
				return
			end
			var17()
		end
		p1.onClose()
	end, { p1.onClose, p1.abuseVector, var17 })
	local var22 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5(true)
	end, {})
	local var23 = reactModule.useCallback(function(p2)
		-- upvalues: sendBoundaryErrorTelemetryModule (copy), p1 (ref), var5 (ref)
		warn("AbuseReportErrorBoundary caught:", p2)
		sendBoundaryErrorTelemetryModule(p2, { abuse_vector = p1.abuseVector, target_id = p1.targetId })
		var5(true)
	end, { p1.abuseVector, p1.targetId })
	local var24 = useFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, function()
		-- upvalues: var7 (ref)
		var7(false)
	end)
	local var25, var26 = reactModule.useState(true)
	local var27 = reactModule.useCallback(function(p2)
		-- upvalues: var26 (ref)
		var26(not p2)
	end, {})
	local var28 = reactModule.useCallback(function(p2)
		-- upvalues: var25 (ref), var24 (ref)
		local var29 = if var25 then p2 else nil
		
		if typeof(var24) == "function" then
			var24(var29)
			
			return
		elseif var24 and typeof(var24) == "table" then
			var24.current = var29
		end
	end, { var25, var24 })
	local VRCentralOverlay = coreGuiService:FindFirstChild("VRCentralOverlay")
	local var29 = useIsSpatial()
	local var30 = if fixDynamicReportV2VRAsync then useVrOverlayModule() elseif VRCentralOverlay then VRCentralOverlay:FindFirstChild("CentralOverlay_SurfaceGui") else nil
	local createElement = reactModule.createElement
	createElement = createElement(sheet.Root, {
		centerSheetHeight = 1,
		preferCenterSheet = true,
		isOpen = var6,
		onClose = var21,
		snapPoints = { 0.9 },
		size = dialogSize.Medium,
		ref = var28
	}, {
		AbuseReportDialog = if var2 and not var4 then reactModule.createElement(abuseReportErrorBoundaryModule, { onError = var23 }, {
			AbuseReportContent = reactModule.createElement(abuseReportContentModule, {
				ref = var13,
				rawConfig = var2,
				abuseVector = p1.abuseVector,
				targetId = p1.targetId,
				onClose = var20,
				open = var6,
				takeoverFocus = var27,
				onResolveError = var22,
				onCustomSubmit = p1.onCustomSubmit,
				clientActionHandlers = p1.clientActionHandlers,
				onFinish = var16
			})
		}) else nil,
		LoadingDialog = if var2 or var4 then nil else reactModule.createElement(dynamicReportV2LoadingModule, nil),
		ErrorDialog = if var4 then reactModule.createElement(dynamicReportV2ErrorModule, nil) else nil
	})
	
	return if fixDynamicReportV2VRAsync and var29 and not var30 then nil elseif fFlagEnableInlineSurveyOnUserReport and var8 then reactModule.createElement(overlayProvider, { gui = var30 }, {
		Survey = reactModule.createElement(inlineSurveyModule, {
			eventType = inlineEventTypeModule.UserReportButtonClicked,
			onEligible = var18,
			onClose = var19
		})
	}) else reactModule.createElement(overlayProvider, { gui = var30 }, { Sheet = createElement })
end)