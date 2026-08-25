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
local abuseReportAnalyticsProvider = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).AbuseReportAnalyticsProvider
local abuseReportErrorBoundaryModule = require(genericAbuseReporting.BeduiV2.Components.AbuseReportErrorBoundary)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local abuseReportDialogModule = require(genericAbuseReporting.BeduiV2.Components.AbuseReportDialog)
local abuseVectorModule = require(genericAbuseReporting.Enums.AbuseVector)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local arTranslationProvider = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).ArTranslationProvider
local dynamicReportV2ErrorModule = require(script.Parent.DynamicReportV2Error)
local dynamicReportV2LoadingModule = require(script.Parent.DynamicReportV2Loading)
local fetchConfigWithAttributesModule = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.fetchConfigWithAttributes)
local getNewRunId = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.reducer).getNewRunId
local layoutSlotsModule = require(genericAbuseReporting.BeduiV2.Components.LayoutSlots)
local abuseReportContentModule = require(script.Parent.AbuseReportContent)
local sendBoundaryErrorTelemetryModule = require(genericAbuseReporting.BeduiV2.Analytics.sendBoundaryErrorTelemetry)
local useAbuseSheetFlowModule = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.useAbuseSheetFlow)
local useFocusNavigationRefsModule = require(genericAbuseReporting.BeduiV2.Hooks.FocusNavigation.useFocusNavigationRefs)
local useVrOverlayModule = require(genericAbuseReporting.BeduiV2.Hooks.useVrOverlay)
local layoutSlotsProvider = layoutSlotsModule.LayoutSlotsProvider
local sheetSlots = layoutSlotsModule.sheetSlots
local sendAnalyticsEvent = analyticsServiceModule.sendAnalyticsEvent
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local fixDynamicReportV2VRAsync = game:DefineFastFlag("FixDynamicReportV2VRAsync", false)
local fFlagFixAnalyticsForDynamicReportV2 = require(parent.SharedFlags).FFlagFixAnalyticsForDynamicReportV2
local fFlagAbuseReportMenuV2 = require(parent.SharedFlags).FFlagAbuseReportMenuV2
local fFlagEnableInlineSurveyOnUserReport = require(parent.SharedFlags).FFlagEnableInlineSurveyOnUserReport
local fFlagSurvBloxEventTypeEnabled = require(parent.SharedFlags).FFlagSurvBloxEventTypeEnabled
local fFlagEnableReportingFlowForMomentsFeed = require(parent.SharedFlags).FFlagEnableReportingFlowForMomentsFeed

return reactModule.memo(if fFlagAbuseReportMenuV2 then function(p6)
	-- upvalues: useRoactService (ref), roactNetworking (ref), reactModule (ref), fFlagEnableInlineSurveyOnUserReport (ref), fetchConfigWithAttributesModule (ref), sendAnalyticsEvent (ref), telemetryEventType (ref), fFlagFixAnalyticsForDynamicReportV2 (ref), dashModule (ref), getNewRunId (ref), fFlagEnableReportingFlowForMomentsFeed (ref), fFlagSurvBloxEventTypeEnabled (ref), surveyEventPublisherModule (ref), webViewEventTypeModule (ref), abuseVectorModule (ref), sendBoundaryErrorTelemetryModule (ref), useFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), coreGuiService (ref), useIsSpatial (ref), fixDynamicReportV2VRAsync (ref), useVrOverlayModule (ref), sheet (ref), dialogSize (ref), abuseReportErrorBoundaryModule (ref), abuseReportContentModule (ref), dynamicReportV2LoadingModule (ref), dynamicReportV2ErrorModule (ref), overlayProvider (ref), inlineSurveyModule (ref), inlineEventTypeModule (ref)
	local var43 = useRoactService(roactNetworking)
	local var44, var45 = reactModule.useState(nil)
	local var46, var47 = reactModule.useState(false)
	local var48, var49 = reactModule.useState(true)
	local var50 = nil
	local var51 = nil
	local var52 = nil
	
	if fFlagEnableInlineSurveyOnUserReport then
		local var53, var54 = reactModule.useState(false)
		var50 = var53
		var51 = var54
		var52 = reactModule.useRef(false)
	end
	reactModule.useEffect(function()
		-- upvalues: fetchConfigWithAttributesModule (copy), var43 (ref), p6 (ref), var45 (ref), sendAnalyticsEvent (copy), telemetryEventType (copy), var47 (ref), fFlagFixAnalyticsForDynamicReportV2 (copy), dashModule (copy), getNewRunId (copy)
		local var74 = false
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		fetchConfigWithAttributesModule(var43, p6.abuseVector, { targetId = p6.targetId }):andThen(function(p8)
			-- upvalues: var74 (write), unixTimestampMillis (ref), var45 (copy), sendAnalyticsEvent (copy), p6 (copy), telemetryEventType (copy)
			if var74 then
				return
			end
			local responseBody = p8.responseBody
			local var75 = DateTime.now().UnixTimestampMillis - unixTimestampMillis
			var45(responseBody)
			sendAnalyticsEvent({
				run_id = "unknown",
				total_duration = 0,
				abuse_vector = p6.abuseVector,
				target_id = p6.targetId,
				path = {},
				config_name = responseBody.name
			}, {
				sub_event_type = telemetryEventType.ConfigLoaded,
				config_load_detail = {
					cache_hit = false,
					retry_count = 0,
					load_duration_ms = var75
				}
			})
		end):catch(function(p7)
			-- upvalues: var74 (write), var47 (copy), fFlagFixAnalyticsForDynamicReportV2 (copy), dashModule (copy), sendAnalyticsEvent (copy), p6 (copy), getNewRunId (copy), telemetryEventType (copy)
			if var74 then
				return
			end
			warn("Failed to fetch Dynamic Report V2 config:", p7)
			var47(true)
			sendAnalyticsEvent({
				total_duration = 0,
				abuse_vector = p6.abuseVector,
				target_id = p6.targetId,
				run_id = getNewRunId(),
				path = {}
			}, {
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = if fFlagFixAnalyticsForDynamicReportV2 then `Failed to fetch config: {if fFlagFixAnalyticsForDynamicReportV2 then dashModule.pretty(p7, { depth = 10, multiline = true }) else nil}` else `Failed to fetch config: {tostring(p7)}`
				}
			})
		end)
		
		return function()
			-- upvalues: var74 (write)
			var74 = true
		end
	end, { var43, p6.abuseVector, p6.targetId })
	local var55 = reactModule.useRef(nil)
	local var56 = reactModule.useRef(false)
	local var57 = nil
	local var58 = nil
	local var59 = nil
	local var60 = nil
	local var61 = nil
	
	if fFlagEnableInlineSurveyOnUserReport then
		var57 = reactModule.useRef(false)
		var58 = reactModule.useCallback(function(p9)
			-- upvalues: var57 (write), fFlagEnableReportingFlowForMomentsFeed (copy), p6 (ref)
			if p9.didSubmit then
				var57.current = true
				
				if fFlagEnableReportingFlowForMomentsFeed and p6.onSubmit then
					p6.onSubmit()
				end
			end
		end, { p6.onSubmit })
		var59 = reactModule.useCallback(function()
			-- upvalues: fFlagSurvBloxEventTypeEnabled (copy), surveyEventPublisherModule (copy), webViewEventTypeModule (copy)
			if fFlagSurvBloxEventTypeEnabled then
				surveyEventPublisherModule.publishSurveyEvent(webViewEventTypeModule.ReportSubmitted)
			end
		end, {})
		var60 = reactModule.useCallback(function()
			-- upvalues: var52 (write)
			var52.current = true
		end, {})
		var61 = reactModule.useCallback(function()
			-- upvalues: var52 (write), var59 (write), p6 (ref)
			if not var52.current then
				var59()
			end
			p6.onClose()
		end, { var59, p6.onClose })
	end
	local var62 = reactModule.useCallback(function()
		-- upvalues: var56 (ref), var49 (ref)
		var56.current = true
		var49(false)
	end, {})
	local var63 = reactModule.useCallback(function()
		-- upvalues: var56 (ref), var55 (ref), var49 (ref), fFlagEnableInlineSurveyOnUserReport (copy), var57 (write), p6 (ref), abuseVectorModule (copy), var51 (write), var59 (write)
		if not var56.current and var55.current then
			var55.current.requestClose()
		end
		var49(false)
		
		if fFlagEnableInlineSurveyOnUserReport then
			if not var57.current then
				p6.onClose()
				
				return
			elseif p6.abuseVector == abuseVectorModule.UserProfile then
				var51(true)
				
				return
			end
			var59()
		end
		p6.onClose()
	end, { p6.onClose, p6.abuseVector, var59 })
	local var64 = reactModule.useCallback(function()
		-- upvalues: var47 (ref)
		var47(true)
	end, {})
	local var65 = reactModule.useCallback(function(p10)
		-- upvalues: sendBoundaryErrorTelemetryModule (copy), p6 (ref), var47 (ref)
		warn("AbuseReportErrorBoundary caught:", p10)
		sendBoundaryErrorTelemetryModule(p10, { abuse_vector = p6.abuseVector, target_id = p6.targetId })
		var47(true)
	end, { p6.abuseVector, p6.targetId })
	local var66 = useFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, function()
		-- upvalues: var49 (ref)
		var49(false)
	end)
	local var67, var68 = reactModule.useState(true)
	local var69 = reactModule.useCallback(function(p11)
		-- upvalues: var68 (ref)
		var68(not p11)
	end, {})
	local var70 = reactModule.useCallback(function(p12)
		-- upvalues: var67 (ref), var66 (ref)
		local var76 = if var67 then p12 else nil
		
		if typeof(var66) == "function" then
			var66(var76)
			
			return
		elseif var66 and typeof(var66) == "table" then
			var66.current = var76
		end
	end, { var67, var66 })
	local VRCentralOverlay = coreGuiService:FindFirstChild("VRCentralOverlay")
	local var72 = useIsSpatial()
	local var73 = if fixDynamicReportV2VRAsync then useVrOverlayModule() elseif VRCentralOverlay then VRCentralOverlay:FindFirstChild("CentralOverlay_SurfaceGui") else nil
	local createElement = reactModule.createElement
	createElement = createElement(sheet.Root, {
		centerSheetHeight = 1,
		preferCenterSheet = true,
		isOpen = var48,
		onClose = var63,
		snapPoints = { 0.9 },
		size = dialogSize.Medium,
		ref = var70
	}, {
		AbuseReportDialog = if var44 and not var46 then reactModule.createElement(abuseReportErrorBoundaryModule, { onError = var65 }, {
			AbuseReportContent = reactModule.createElement(abuseReportContentModule, {
				ref = var55,
				rawConfig = var44,
				abuseVector = p6.abuseVector,
				targetId = p6.targetId,
				onClose = var62,
				open = var48,
				takeoverFocus = var69,
				onResolveError = var64,
				onCustomSubmit = p6.onCustomSubmit,
				clientActionHandlers = p6.clientActionHandlers,
				onFinish = var58
			})
		}) else nil,
		LoadingDialog = if var44 or var46 then nil else reactModule.createElement(dynamicReportV2LoadingModule, nil),
		ErrorDialog = if var46 then reactModule.createElement(dynamicReportV2ErrorModule, nil) else nil
	})
	
	return if fixDynamicReportV2VRAsync and var72 and not var73 then nil elseif fFlagEnableInlineSurveyOnUserReport and var50 then reactModule.createElement(overlayProvider, { gui = var73 }, {
		Survey = reactModule.createElement(inlineSurveyModule, {
			eventType = inlineEventTypeModule.UserReportButtonClicked,
			onEligible = var60,
			onClose = var61
		})
	}) else reactModule.createElement(overlayProvider, { gui = var73 }, { Sheet = createElement })
end else function(p0)
	-- upvalues: useRoactService (ref), roactNetworking (ref), reactModule (ref), fetchConfigWithAttributesModule (ref), fFlagFixAnalyticsForDynamicReportV2 (ref), dashModule (ref), sendAnalyticsEvent (ref), getNewRunId (ref), telemetryEventType (ref), useAbuseSheetFlowModule (ref), fFlagEnableReportingFlowForMomentsFeed (ref), useFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), coreGuiService (ref), useIsSpatial (ref), fixDynamicReportV2VRAsync (ref), useVrOverlayModule (ref), sheet (ref), dialogSize (ref), arTranslationProvider (ref), abuseReportAnalyticsProvider (ref), layoutSlotsProvider (ref), sheetSlots (ref), abuseReportDialogModule (ref), dynamicReportV2LoadingModule (ref), dynamicReportV2ErrorModule (ref), overlayProvider (ref)
	local var25 = useRoactService(roactNetworking)
	local var26, var27 = reactModule.useState(nil)
	local var28, var29 = reactModule.useState(false)
	local var30, var31 = reactModule.useState(true)
	reactModule.useEffect(function()
		-- upvalues: fetchConfigWithAttributesModule (copy), var25 (ref), p0 (ref), var27 (ref), var29 (ref), fFlagFixAnalyticsForDynamicReportV2 (copy), dashModule (copy), sendAnalyticsEvent (copy), getNewRunId (copy), telemetryEventType (copy)
		fetchConfigWithAttributesModule(var25, p0.abuseVector, { targetId = p0.targetId }):andThen(function(p2)
			-- upvalues: var27 (copy)
			var27(p2.responseBody)
		end):catch(function(p1)
			-- upvalues: var29 (copy), fFlagFixAnalyticsForDynamicReportV2 (copy), dashModule (copy), sendAnalyticsEvent (copy), p0 (copy), getNewRunId (copy), telemetryEventType (copy)
			warn("Failed to fetch Dynamic Report V2 config:", p1)
			var29(true)
			sendAnalyticsEvent({
				total_duration = 0,
				abuse_vector = p0.abuseVector,
				target_id = p0.targetId,
				run_id = getNewRunId(),
				path = {}
			}, {
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = if fFlagFixAnalyticsForDynamicReportV2 then `Failed to fetch config: ${if fFlagFixAnalyticsForDynamicReportV2 then dashModule.pretty(p1, { depth = 10, multiline = true }) else nil}` else `Failed to fetch config: ${tostring(p1)}`
				}
			})
		end)
	end, { var25, p0.abuseVector, p0.targetId })
	local var32 = useAbuseSheetFlowModule(var26, {
		abuseVector = p0.abuseVector,
		targetId = p0.targetId,
		onClose = p0.onClose,
		onCustomSubmit = p0.onCustomSubmit,
		clientActionHandlers = p0.clientActionHandlers,
		onFinish = if fFlagEnableReportingFlowForMomentsFeed and p0.onSubmit then reactModule.useCallback(function(p3)
			-- upvalues: p0 (ref)
			if p3.didSubmit and p0.onSubmit then
				p0.onSubmit()
			end
		end, { p0.onSubmit }) else nil,
		open = var30
	})
	
	if not var32 and var26 then
		var28 = true
	end
	local var33 = reactModule.useCallback(function()
		-- upvalues: var32 (ref), var31 (ref), p0 (ref)
		if var32 then
			var32.onClose()
		end
		var31(false)
		p0.onClose()
	end, { var32, p0.onClose })
	local var34 = useFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, function()
		-- upvalues: var33 (ref)
		var33()
	end)
	local var35, var36 = reactModule.useState(true)
	local var37 = reactModule.useCallback(function(p4)
		-- upvalues: var36 (ref)
		var36(not p4)
	end, {})
	local var38 = reactModule.useCallback(function(p5)
		-- upvalues: var35 (ref), var34 (ref)
		local var42 = if var35 then p5 else nil
		
		if typeof(var34) == "function" then
			var34(var42)
			
			return
		elseif var34 and typeof(var34) == "table" then
			var34.current = var42
		end
	end, { var35, var34 })
	local VRCentralOverlay = coreGuiService:FindFirstChild("VRCentralOverlay")
	local var40 = useIsSpatial()
	local var41 = if fixDynamicReportV2VRAsync then useVrOverlayModule() elseif VRCentralOverlay then VRCentralOverlay:FindFirstChild("CentralOverlay_SurfaceGui") else nil
	local createElement = reactModule.createElement
	createElement = createElement(sheet.Root, {
		centerSheetHeight = 1,
		preferCenterSheet = true,
		isOpen = var30,
		onClose = var33,
		snapPoints = { 0.9 },
		size = dialogSize.Medium,
		ref = var38
	}, {
		AbuseReportDialog = if var26 and not var28 and var32 then reactModule.createElement(arTranslationProvider, { translations = var32.config.translations }, reactModule.createElement(abuseReportAnalyticsProvider, { analytics = var32.analytics }, reactModule.createElement(layoutSlotsProvider, { slots = sheetSlots }, reactModule.createElement(abuseReportDialogModule, {
			abuseVector = p0.abuseVector,
			targetId = p0.targetId,
			onClose = var33,
			abuseReportFlow = var32,
			takeoverFocus = var37
		})))) else nil,
		LoadingDialog = if var26 or var28 then nil else reactModule.createElement(dynamicReportV2LoadingModule, nil),
		ErrorDialog = if var28 then reactModule.createElement(dynamicReportV2ErrorModule, nil) else nil
	})
	
	return if fixDynamicReportV2VRAsync and var40 and not var41 then nil else reactModule.createElement(overlayProvider, { gui = var41 }, { Sheet = createElement })
end)