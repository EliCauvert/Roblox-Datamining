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

return reactModule.memo(if fFlagAbuseReportMenuV2 then function(p1)
	-- upvalues: useRoactService (ref), roactNetworking (ref), reactModule (ref), fFlagEnableInlineSurveyOnUserReport (ref), fetchConfigWithAttributesModule (ref), sendAnalyticsEvent (ref), telemetryEventType (ref), fFlagFixAnalyticsForDynamicReportV2 (ref), dashModule (ref), getNewRunId (ref), fFlagEnableReportingFlowForMomentsFeed (ref), fFlagSurvBloxEventTypeEnabled (ref), surveyEventPublisherModule (ref), webViewEventTypeModule (ref), abuseVectorModule (ref), sendBoundaryErrorTelemetryModule (ref), useFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), coreGuiService (ref), useIsSpatial (ref), fixDynamicReportV2VRAsync (ref), useVrOverlayModule (ref), sheet (ref), dialogSize (ref), abuseReportErrorBoundaryModule (ref), abuseReportContentModule (ref), dynamicReportV2LoadingModule (ref), dynamicReportV2ErrorModule (ref), overlayProvider (ref), inlineSurveyModule (ref), inlineEventTypeModule (ref)
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
		-- upvalues: fetchConfigWithAttributesModule (copy), var1 (ref), p1 (ref), var3 (ref), sendAnalyticsEvent (copy), telemetryEventType (copy), var5 (ref), fFlagFixAnalyticsForDynamicReportV2 (copy), dashModule (copy), getNewRunId (copy)
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
			-- upvalues: var13 (write), var5 (copy), fFlagFixAnalyticsForDynamicReportV2 (copy), dashModule (copy), sendAnalyticsEvent (copy), p1 (copy), getNewRunId (copy), telemetryEventType (copy)
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
					error_message = if fFlagFixAnalyticsForDynamicReportV2 then `Failed to fetch config: {if fFlagFixAnalyticsForDynamicReportV2 then dashModule.pretty(p2, { depth = 10, multiline = true }) else nil}` else `Failed to fetch config: {tostring(p2)}`
				}
			})
		end)
		
		return function()
			-- upvalues: var13 (write)
			var13 = true
		end
	end, { var1, p1.abuseVector, p1.targetId })
	local var14 = reactModule.useRef(nil)
	local var15 = reactModule.useRef(false)
	local var16 = nil
	local var17 = nil
	local var18 = nil
	local var19 = nil
	local var20 = nil
	
	if fFlagEnableInlineSurveyOnUserReport then
		var16 = reactModule.useRef(false)
		var17 = reactModule.useCallback(function(p2)
			-- upvalues: var16 (write), fFlagEnableReportingFlowForMomentsFeed (copy), p1 (ref)
			if p2.didSubmit then
				var16.current = true
				
				if fFlagEnableReportingFlowForMomentsFeed and p1.onSubmit then
					p1.onSubmit()
				end
			end
		end, { p1.onSubmit })
		var18 = reactModule.useCallback(function()
			-- upvalues: fFlagSurvBloxEventTypeEnabled (copy), surveyEventPublisherModule (copy), webViewEventTypeModule (copy)
			if fFlagSurvBloxEventTypeEnabled then
				surveyEventPublisherModule.publishSurveyEvent(webViewEventTypeModule.ReportSubmitted)
			end
		end, {})
		var19 = reactModule.useCallback(function()
			-- upvalues: var10 (write)
			var10.current = true
		end, {})
		var20 = reactModule.useCallback(function()
			-- upvalues: var10 (write), var18 (write), p1 (ref)
			if not var10.current then
				var18()
			end
			p1.onClose()
		end, { var18, p1.onClose })
	end
	local var21 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), var7 (ref)
		var15.current = true
		var7(false)
	end, {})
	local var22 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), var14 (ref), var7 (ref), fFlagEnableInlineSurveyOnUserReport (copy), var16 (write), p1 (ref), abuseVectorModule (copy), var9 (write), var18 (write)
		if not var15.current and var14.current then
			var14.current.requestClose()
		end
		var7(false)
		
		if fFlagEnableInlineSurveyOnUserReport then
			if not var16.current then
				p1.onClose()
				
				return
			elseif p1.abuseVector == abuseVectorModule.UserProfile then
				var9(true)
				
				return
			end
			var18()
		end
		p1.onClose()
	end, { p1.onClose, p1.abuseVector, var18 })
	local var23 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5(true)
	end, {})
	local var24 = reactModule.useCallback(function(p2)
		-- upvalues: sendBoundaryErrorTelemetryModule (copy), p1 (ref), var5 (ref)
		warn("AbuseReportErrorBoundary caught:", p2)
		sendBoundaryErrorTelemetryModule(p2, { abuse_vector = p1.abuseVector, target_id = p1.targetId })
		var5(true)
	end, { p1.abuseVector, p1.targetId })
	local var25 = useFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, function()
		-- upvalues: var7 (ref)
		var7(false)
	end)
	local var26, var27 = reactModule.useState(true)
	local var28 = reactModule.useCallback(function(p2)
		-- upvalues: var27 (ref)
		var27(not p2)
	end, {})
	local var29 = reactModule.useCallback(function(p2)
		-- upvalues: var26 (ref), var25 (ref)
		local var30 = if var26 then p2 else nil
		
		if typeof(var25) == "function" then
			var25(var30)
			
			return
		elseif var25 and typeof(var25) == "table" then
			var25.current = var30
		end
	end, { var26, var25 })
	local VRCentralOverlay = coreGuiService:FindFirstChild("VRCentralOverlay")
	local var30 = useIsSpatial()
	local var31 = if fixDynamicReportV2VRAsync then useVrOverlayModule() elseif VRCentralOverlay then VRCentralOverlay:FindFirstChild("CentralOverlay_SurfaceGui") else nil
	local createElement = reactModule.createElement
	createElement = createElement(sheet.Root, {
		centerSheetHeight = 1,
		preferCenterSheet = true,
		isOpen = var6,
		onClose = var22,
		snapPoints = { 0.9 },
		size = dialogSize.Medium,
		ref = var29
	}, {
		AbuseReportDialog = if var2 and not var4 then reactModule.createElement(abuseReportErrorBoundaryModule, { onError = var24 }, {
			AbuseReportContent = reactModule.createElement(abuseReportContentModule, {
				ref = var14,
				rawConfig = var2,
				abuseVector = p1.abuseVector,
				targetId = p1.targetId,
				onClose = var21,
				open = var6,
				takeoverFocus = var28,
				onResolveError = var23,
				onCustomSubmit = p1.onCustomSubmit,
				clientActionHandlers = p1.clientActionHandlers,
				onFinish = var17
			})
		}) else nil,
		LoadingDialog = if var2 or var4 then nil else reactModule.createElement(dynamicReportV2LoadingModule, nil),
		ErrorDialog = if var4 then reactModule.createElement(dynamicReportV2ErrorModule, nil) else nil
	})
	
	return if fixDynamicReportV2VRAsync and var30 and not var31 then nil elseif fFlagEnableInlineSurveyOnUserReport and var8 then reactModule.createElement(overlayProvider, { gui = var31 }, {
		Survey = reactModule.createElement(inlineSurveyModule, {
			eventType = inlineEventTypeModule.UserReportButtonClicked,
			onEligible = var19,
			onClose = var20
		})
	}) else reactModule.createElement(overlayProvider, { gui = var31 }, { Sheet = createElement })
end else function(p2)
	-- upvalues: useRoactService (ref), roactNetworking (ref), reactModule (ref), fetchConfigWithAttributesModule (ref), fFlagFixAnalyticsForDynamicReportV2 (ref), dashModule (ref), sendAnalyticsEvent (ref), getNewRunId (ref), telemetryEventType (ref), useAbuseSheetFlowModule (ref), fFlagEnableReportingFlowForMomentsFeed (ref), useFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), coreGuiService (ref), useIsSpatial (ref), fixDynamicReportV2VRAsync (ref), useVrOverlayModule (ref), sheet (ref), dialogSize (ref), arTranslationProvider (ref), abuseReportAnalyticsProvider (ref), layoutSlotsProvider (ref), sheetSlots (ref), abuseReportDialogModule (ref), dynamicReportV2LoadingModule (ref), dynamicReportV2ErrorModule (ref), overlayProvider (ref)
	local var13 = useRoactService(roactNetworking)
	local var14, var15 = reactModule.useState(nil)
	local var16, var17 = reactModule.useState(false)
	local var18, var19 = reactModule.useState(true)
	reactModule.useEffect(function()
		-- upvalues: fetchConfigWithAttributesModule (copy), var13 (ref), p2 (ref), var15 (ref), var17 (ref), fFlagFixAnalyticsForDynamicReportV2 (copy), dashModule (copy), sendAnalyticsEvent (copy), getNewRunId (copy), telemetryEventType (copy)
		fetchConfigWithAttributesModule(var13, p2.abuseVector, { targetId = p2.targetId }):andThen(function(p3)
			-- upvalues: var15 (copy)
			var15(p3.responseBody)
		end):catch(function(p3)
			-- upvalues: var17 (copy), fFlagFixAnalyticsForDynamicReportV2 (copy), dashModule (copy), sendAnalyticsEvent (copy), p2 (copy), getNewRunId (copy), telemetryEventType (copy)
			warn("Failed to fetch Dynamic Report V2 config:", p3)
			var17(true)
			sendAnalyticsEvent({
				total_duration = 0,
				abuse_vector = p2.abuseVector,
				target_id = p2.targetId,
				run_id = getNewRunId(),
				path = {}
			}, {
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = if fFlagFixAnalyticsForDynamicReportV2 then `Failed to fetch config: ${if fFlagFixAnalyticsForDynamicReportV2 then dashModule.pretty(p3, { depth = 10, multiline = true }) else nil}` else `Failed to fetch config: ${tostring(p3)}`
				}
			})
		end)
	end, { var13, p2.abuseVector, p2.targetId })
	local var20 = useAbuseSheetFlowModule(var14, {
		abuseVector = p2.abuseVector,
		targetId = p2.targetId,
		onClose = p2.onClose,
		onCustomSubmit = p2.onCustomSubmit,
		clientActionHandlers = p2.clientActionHandlers,
		onFinish = if fFlagEnableReportingFlowForMomentsFeed and p2.onSubmit then reactModule.useCallback(function(p3)
			-- upvalues: p2 (ref)
			if p3.didSubmit and p2.onSubmit then
				p2.onSubmit()
			end
		end, { p2.onSubmit }) else nil,
		open = var18
	})
	
	if not var20 and var14 then
		var16 = true
	end
	local var21 = reactModule.useCallback(function()
		-- upvalues: var20 (ref), var19 (ref), p2 (ref)
		if var20 then
			var20.onClose()
		end
		var19(false)
		p2.onClose()
	end, { var20, p2.onClose })
	local var22 = useFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, function()
		-- upvalues: var21 (ref)
		var21()
	end)
	local var23, var24 = reactModule.useState(true)
	local var25 = reactModule.useCallback(function(p3)
		-- upvalues: var24 (ref)
		var24(not p3)
	end, {})
	local var26 = reactModule.useCallback(function(p3)
		-- upvalues: var23 (ref), var22 (ref)
		local var27 = if var23 then p3 else nil
		
		if typeof(var22) == "function" then
			var22(var27)
			
			return
		elseif var22 and typeof(var22) == "table" then
			var22.current = var27
		end
	end, { var23, var22 })
	local VRCentralOverlay = coreGuiService:FindFirstChild("VRCentralOverlay")
	local var27 = useIsSpatial()
	local var28 = if fixDynamicReportV2VRAsync then useVrOverlayModule() elseif VRCentralOverlay then VRCentralOverlay:FindFirstChild("CentralOverlay_SurfaceGui") else nil
	local createElement = reactModule.createElement
	createElement = createElement(sheet.Root, {
		centerSheetHeight = 1,
		preferCenterSheet = true,
		isOpen = var18,
		onClose = var21,
		snapPoints = { 0.9 },
		size = dialogSize.Medium,
		ref = var26
	}, {
		AbuseReportDialog = if var14 and not var16 and var20 then reactModule.createElement(arTranslationProvider, { translations = var20.config.translations }, reactModule.createElement(abuseReportAnalyticsProvider, { analytics = var20.analytics }, reactModule.createElement(layoutSlotsProvider, { slots = sheetSlots }, reactModule.createElement(abuseReportDialogModule, {
			abuseVector = p2.abuseVector,
			targetId = p2.targetId,
			onClose = var21,
			abuseReportFlow = var20,
			takeoverFocus = var25
		})))) else nil,
		LoadingDialog = if var14 or var16 then nil else reactModule.createElement(dynamicReportV2LoadingModule, nil),
		ErrorDialog = if var16 then reactModule.createElement(dynamicReportV2ErrorModule, nil) else nil
	})
	
	return if fixDynamicReportV2VRAsync and var27 and not var28 then nil else reactModule.createElement(overlayProvider, { gui = var28 }, { Sheet = createElement })
end)