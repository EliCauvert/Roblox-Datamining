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
local fetchConfigModule = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.fetchConfig)
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
local fFlagAbuseReportConfigProfileUseAttributesPayload = require(parent.SharedFlags).FFlagAbuseReportConfigProfileUseAttributesPayload
local fFlagEnableInlineSurveyOnUserReport = require(parent.SharedFlags).FFlagEnableInlineSurveyOnUserReport
local fFlagSurvBloxEventTypeEnabled = require(parent.SharedFlags).FFlagSurvBloxEventTypeEnabled
local fFlagEnableReportingFlowForMomentsFeed = require(parent.SharedFlags).FFlagEnableReportingFlowForMomentsFeed

return reactModule.memo(if fFlagAbuseReportMenuV2 then function(p6) --[[ line: 237 | named "DynamicReportV2ContainerV2" ]]
	-- upvalues: useRoactService (ref), roactNetworking (ref), reactModule (ref), fFlagEnableInlineSurveyOnUserReport (ref), fFlagAbuseReportConfigProfileUseAttributesPayload (ref), fetchConfigWithAttributesModule (ref), fetchConfigModule (ref), sendAnalyticsEvent (ref), telemetryEventType (ref), fFlagFixAnalyticsForDynamicReportV2 (ref), dashModule (ref), getNewRunId (ref), fFlagEnableReportingFlowForMomentsFeed (ref), fFlagSurvBloxEventTypeEnabled (ref), surveyEventPublisherModule (ref), webViewEventTypeModule (ref), abuseVectorModule (ref), sendBoundaryErrorTelemetryModule (ref), useFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), coreGuiService (ref), useIsSpatial (ref), fixDynamicReportV2VRAsync (ref), useVrOverlayModule (ref), sheet (ref), dialogSize (ref), abuseReportErrorBoundaryModule (ref), abuseReportContentModule (ref), dynamicReportV2LoadingModule (ref), dynamicReportV2ErrorModule (ref), overlayProvider (ref), inlineSurveyModule (ref), inlineEventTypeModule (ref)
	local var44 = useRoactService(roactNetworking)
	local var45, var46 = reactModule.useState(nil)
	local var47, var48 = reactModule.useState(false)
	local var49, var50 = reactModule.useState(true)
	local var51 = nil
	local var52 = nil
	local var53 = nil
	
	if fFlagEnableInlineSurveyOnUserReport then
		local var54, var55 = reactModule.useState(false)
		var51 = var54
		var52 = var55
		var53 = reactModule.useRef(false)
	end
	reactModule.useEffect(function() --[[ line: 251 ]]
		-- upvalues: fFlagAbuseReportConfigProfileUseAttributesPayload (copy), fetchConfigWithAttributesModule (copy), var44 (ref), p6 (ref), fetchConfigModule (copy), var46 (ref), sendAnalyticsEvent (copy), telemetryEventType (copy), var48 (ref), fFlagFixAnalyticsForDynamicReportV2 (copy), dashModule (copy), getNewRunId (copy)
		local var75 = false
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis;
		(if fFlagAbuseReportConfigProfileUseAttributesPayload then fetchConfigWithAttributesModule(var44, p6.abuseVector, { targetId = p6.targetId }) else fetchConfigModule(var44, p6.abuseVector, p6.targetId)):andThen(function(p8) --[[ line: 259 ]]
			-- upvalues: var75 (write), unixTimestampMillis (ref), var46 (copy), sendAnalyticsEvent (copy), p6 (copy), telemetryEventType (copy)
			if var75 then
				return
			end
			local responseBody = p8.responseBody
			local var76 = DateTime.now().UnixTimestampMillis - unixTimestampMillis
			var46(responseBody)
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
					load_duration_ms = var76
				}
			})
		end):catch(function(p7) --[[ line: 284 ]]
			-- upvalues: var75 (write), var48 (copy), fFlagFixAnalyticsForDynamicReportV2 (copy), dashModule (copy), sendAnalyticsEvent (copy), p6 (copy), getNewRunId (copy), telemetryEventType (copy)
			if var75 then
				return
			end
			warn("Failed to fetch Dynamic Report V2 config:", p7)
			var48(true)
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
		
		return function() --[[ line: 309 ]]
			-- upvalues: var75 (write)
			var75 = true
		end
	end, { var44, p6.abuseVector, p6.targetId })
	local var56 = reactModule.useRef(nil)
	local var57 = reactModule.useRef(false)
	local var58 = nil
	local var59 = nil
	local var60 = nil
	local var61 = nil
	local var62 = nil
	
	if fFlagEnableInlineSurveyOnUserReport then
		var58 = reactModule.useRef(false)
		var59 = reactModule.useCallback(function(p9) --[[ line: 333 ]]
			-- upvalues: var58 (write), fFlagEnableReportingFlowForMomentsFeed (copy), p6 (ref)
			if p9.didSubmit then
				var58.current = true
				
				if fFlagEnableReportingFlowForMomentsFeed and p6.onSubmit then
					p6.onSubmit()
				end
			end
		end, { p6.onSubmit })
		var60 = reactModule.useCallback(function() --[[ line: 342 ]]
			-- upvalues: fFlagSurvBloxEventTypeEnabled (copy), surveyEventPublisherModule (copy), webViewEventTypeModule (copy)
			if fFlagSurvBloxEventTypeEnabled then
				surveyEventPublisherModule.publishSurveyEvent(webViewEventTypeModule.ReportSubmitted)
			end
		end, {})
		var61 = reactModule.useCallback(function() --[[ line: 348 ]]
			-- upvalues: var53 (write)
			var53.current = true
		end, {})
		var62 = reactModule.useCallback(function() --[[ line: 352 ]]
			-- upvalues: var53 (write), var60 (write), p6 (ref)
			if not var53.current then
				var60()
			end
			p6.onClose()
		end, { var60, p6.onClose })
	end
	local var63 = reactModule.useCallback(function() --[[ line: 360 ]]
		-- upvalues: var57 (ref), var50 (ref)
		var57.current = true
		var50(false)
	end, {})
	local var64 = reactModule.useCallback(function() --[[ line: 368 ]]
		-- upvalues: var57 (ref), var56 (ref), var50 (ref), fFlagEnableInlineSurveyOnUserReport (copy), var58 (write), p6 (ref), abuseVectorModule (copy), var52 (write), var60 (write)
		if not var57.current and var56.current then
			var56.current.requestClose()
		end
		var50(false)
		
		if fFlagEnableInlineSurveyOnUserReport then
			if not var58.current then
				p6.onClose()
				
				return
			elseif p6.abuseVector == abuseVectorModule.UserProfile then
				var52(true)
				
				return
			end
			var60()
		end
		p6.onClose()
	end, { p6.onClose, p6.abuseVector, var60 })
	local var65 = reactModule.useCallback(function() --[[ line: 392 ]]
		-- upvalues: var48 (ref)
		var48(true)
	end, {})
	local var66 = reactModule.useCallback(function(p10) --[[ line: 396 ]]
		-- upvalues: sendBoundaryErrorTelemetryModule (copy), p6 (ref), var48 (ref)
		warn("AbuseReportErrorBoundary caught:", p10)
		sendBoundaryErrorTelemetryModule(p10, { abuse_vector = p6.abuseVector, target_id = p6.targetId })
		var48(true)
	end, { p6.abuseVector, p6.targetId })
	local var67 = useFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, function() --[[ line: 405 ]]
		-- upvalues: var50 (ref)
		var50(false)
	end)
	local var68, var69 = reactModule.useState(true)
	local var70 = reactModule.useCallback(function(p11) --[[ line: 409 ]]
		-- upvalues: var69 (ref)
		var69(not p11)
	end, {})
	local var71 = reactModule.useCallback(function(p12) --[[ line: 412 ]]
		-- upvalues: var68 (ref), var67 (ref)
		local var77 = if var68 then p12 else nil
		
		if typeof(var67) == "function" then
			var67(var77)
			
			return
		elseif var67 and typeof(var67) == "table" then
			var67.current = var77
		end
	end, { var68, var67 })
	local VRCentralOverlay = coreGuiService:FindFirstChild("VRCentralOverlay")
	local var73 = useIsSpatial()
	local var74 = if fixDynamicReportV2VRAsync then useVrOverlayModule() elseif VRCentralOverlay then VRCentralOverlay:FindFirstChild("CentralOverlay_SurfaceGui") else nil
	local createElement = reactModule.createElement
	createElement = createElement(sheet.Root, {
		centerSheetHeight = 1,
		preferCenterSheet = true,
		isOpen = var49,
		onClose = var64,
		snapPoints = { 0.9 },
		size = dialogSize.Medium,
		ref = var71
	}, {
		AbuseReportDialog = if var45 and not var47 then reactModule.createElement(abuseReportErrorBoundaryModule, { onError = var66 }, {
			AbuseReportContent = reactModule.createElement(abuseReportContentModule, {
				ref = var56,
				rawConfig = var45,
				abuseVector = p6.abuseVector,
				targetId = p6.targetId,
				onClose = var63,
				open = var49,
				takeoverFocus = var70,
				onResolveError = var65,
				onCustomSubmit = p6.onCustomSubmit,
				onFinish = var59
			})
		}) else nil,
		LoadingDialog = if var45 or var47 then nil else reactModule.createElement(dynamicReportV2LoadingModule, nil),
		ErrorDialog = if var47 then reactModule.createElement(dynamicReportV2ErrorModule, nil) else nil
	})
	
	return if fixDynamicReportV2VRAsync and var73 and not var74 then nil elseif fFlagEnableInlineSurveyOnUserReport and var51 then reactModule.createElement(overlayProvider, { gui = var74 }, {
		Survey = reactModule.createElement(inlineSurveyModule, {
			eventType = inlineEventTypeModule.UserReportButtonClicked,
			onEligible = var61,
			onClose = var62
		})
	}) else reactModule.createElement(overlayProvider, { gui = var74 }, { Sheet = createElement })
end else function(p0) --[[ line: 79 | named "DynamicReportV2Container" ]]
	-- upvalues: useRoactService (ref), roactNetworking (ref), reactModule (ref), fFlagAbuseReportConfigProfileUseAttributesPayload (ref), fetchConfigWithAttributesModule (ref), fetchConfigModule (ref), fFlagFixAnalyticsForDynamicReportV2 (ref), dashModule (ref), sendAnalyticsEvent (ref), getNewRunId (ref), telemetryEventType (ref), useAbuseSheetFlowModule (ref), fFlagEnableReportingFlowForMomentsFeed (ref), useFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), coreGuiService (ref), useIsSpatial (ref), fixDynamicReportV2VRAsync (ref), useVrOverlayModule (ref), sheet (ref), dialogSize (ref), arTranslationProvider (ref), abuseReportAnalyticsProvider (ref), layoutSlotsProvider (ref), sheetSlots (ref), abuseReportDialogModule (ref), dynamicReportV2LoadingModule (ref), dynamicReportV2ErrorModule (ref), overlayProvider (ref)
	local var26 = useRoactService(roactNetworking)
	local var27, var28 = reactModule.useState(nil)
	local var29, var30 = reactModule.useState(false)
	local var31, var32 = reactModule.useState(true)
	reactModule.useEffect(function() --[[ line: 85 ]]
		-- upvalues: fFlagAbuseReportConfigProfileUseAttributesPayload (copy), fetchConfigWithAttributesModule (copy), var26 (ref), p0 (ref), fetchConfigModule (copy), var28 (ref), var30 (ref), fFlagFixAnalyticsForDynamicReportV2 (copy), dashModule (copy), sendAnalyticsEvent (copy), getNewRunId (copy), telemetryEventType (copy)
		;(if fFlagAbuseReportConfigProfileUseAttributesPayload then fetchConfigWithAttributesModule(var26, p0.abuseVector, { targetId = p0.targetId }) else fetchConfigModule(var26, p0.abuseVector, p0.targetId)):andThen(function(p2) --[[ line: 90 ]]
			-- upvalues: var28 (copy)
			var28(p2.responseBody)
		end):catch(function(p1) --[[ line: 93 ]]
			-- upvalues: var30 (copy), fFlagFixAnalyticsForDynamicReportV2 (copy), dashModule (copy), sendAnalyticsEvent (copy), p0 (copy), getNewRunId (copy), telemetryEventType (copy)
			warn("Failed to fetch Dynamic Report V2 config:", p1)
			var30(true)
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
	end, { var26, p0.abuseVector, p0.targetId })
	local var33 = useAbuseSheetFlowModule(var27, {
		abuseVector = p0.abuseVector,
		targetId = p0.targetId,
		onClose = p0.onClose,
		onCustomSubmit = p0.onCustomSubmit,
		onFinish = if fFlagEnableReportingFlowForMomentsFeed and p0.onSubmit then reactModule.useCallback(function(p3) --[[ line: 117 ]]
			-- upvalues: p0 (ref)
			if p3.didSubmit and p0.onSubmit then
				p0.onSubmit()
			end
		end, { p0.onSubmit }) else nil,
		open = var31
	})
	
	if not var33 and var27 then
		var29 = true
	end
	local var34 = reactModule.useCallback(function() --[[ line: 136 ]]
		-- upvalues: var33 (ref), var32 (ref), p0 (ref)
		if var33 then
			var33.onClose()
		end
		var32(false)
		p0.onClose()
	end, { var33, p0.onClose })
	local var35 = useFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, function() --[[ line: 150 ]]
		-- upvalues: var34 (ref)
		var34()
	end)
	local var36, var37 = reactModule.useState(true)
	local var38 = reactModule.useCallback(function(p4) --[[ line: 155 ]]
		-- upvalues: var37 (ref)
		var37(not p4)
	end, {})
	local var39 = reactModule.useCallback(function(p5) --[[ line: 159 ]]
		-- upvalues: var36 (ref), var35 (ref)
		local var43 = if var36 then p5 else nil
		
		if typeof(var35) == "function" then
			var35(var43)
			
			return
		elseif var35 and typeof(var35) == "table" then
			var35.current = var43
		end
	end, { var36, var35 })
	local VRCentralOverlay = coreGuiService:FindFirstChild("VRCentralOverlay")
	local var41 = useIsSpatial()
	local var42 = if fixDynamicReportV2VRAsync then useVrOverlayModule() elseif VRCentralOverlay then VRCentralOverlay:FindFirstChild("CentralOverlay_SurfaceGui") else nil
	local createElement = reactModule.createElement
	createElement = createElement(sheet.Root, {
		centerSheetHeight = 1,
		preferCenterSheet = true,
		isOpen = var31,
		onClose = var34,
		snapPoints = { 0.9 },
		size = dialogSize.Medium,
		ref = var39
	}, {
		AbuseReportDialog = if var27 and not var29 and var33 then reactModule.createElement(arTranslationProvider, { translations = var33.config.translations }, reactModule.createElement(abuseReportAnalyticsProvider, { analytics = var33.analytics }, reactModule.createElement(layoutSlotsProvider, { slots = sheetSlots }, reactModule.createElement(abuseReportDialogModule, {
			abuseVector = p0.abuseVector,
			targetId = p0.targetId,
			onClose = var34,
			abuseReportFlow = var33,
			takeoverFocus = var38
		})))) else nil,
		LoadingDialog = if var27 or var29 then nil else reactModule.createElement(dynamicReportV2LoadingModule, nil),
		ErrorDialog = if var29 then reactModule.createElement(dynamicReportV2ErrorModule, nil) else nil
	})
	
	return if fixDynamicReportV2VRAsync and var41 and not var42 then nil else reactModule.createElement(overlayProvider, { gui = var42 }, { Sheet = createElement })
end)