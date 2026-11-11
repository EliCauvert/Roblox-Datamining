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
local AbuseReportAnalyticsProvider = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).AbuseReportAnalyticsProvider
local AbuseReportErrorBoundaryModule = require(GenericAbuseReporting.BeduiV2.Components.AbuseReportErrorBoundary)
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local AbuseReportDialogModule = require(GenericAbuseReporting.BeduiV2.Components.AbuseReportDialog)
local AbuseVectorModule = require(GenericAbuseReporting.Enums.AbuseVector)
local AnalyticsServiceModule = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService)
local ArTranslationProvider = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).ArTranslationProvider
local DynamicReportV2ErrorModule = require(script.Parent.DynamicReportV2Error)
local DynamicReportV2LoadingModule = require(script.Parent.DynamicReportV2Loading)
local FetchConfigModule = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.fetchConfig)
local FetchConfigWithAttributesModule = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.fetchConfigWithAttributes)
local GetNewRunIdFunction = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.reducer).getNewRunId
local LayoutSlotsModule = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots)
local AbuseReportContentModule = require(script.Parent.AbuseReportContent)
local SendBoundaryErrorTelemetryModule = require(GenericAbuseReporting.BeduiV2.Analytics.sendBoundaryErrorTelemetry)
local UseAbuseSheetFlowModule = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.useAbuseSheetFlow)
local UseFocusNavigationRefsModule = require(GenericAbuseReporting.BeduiV2.Hooks.FocusNavigation.useFocusNavigationRefs)
local UseVrOverlayModule = require(GenericAbuseReporting.BeduiV2.Hooks.useVrOverlay)
local LayoutSlotsProvider = LayoutSlotsModule.LayoutSlotsProvider
local SheetSlots = LayoutSlotsModule.sheetSlots
local SendAnalyticsEventFunction = AnalyticsServiceModule.sendAnalyticsEvent
local TelemetryEventType = AnalyticsServiceModule.TelemetryEventType
local FixDynamicReportV2VRAsync = game:DefineFastFlag("FixDynamicReportV2VRAsync", false)
local FFlagFixAnalyticsForDynamicReportV2 = require(Parent.SharedFlags).FFlagFixAnalyticsForDynamicReportV2
local FFlagAbuseReportConfigProfileUseAttributesPayload = require(Parent.SharedFlags).FFlagAbuseReportConfigProfileUseAttributesPayload
local FFlagEnableInlineSurveyOnUserReport = require(Parent.SharedFlags).FFlagEnableInlineSurveyOnUserReport
local FFlagSurvBloxEventTypeEnabled = require(Parent.SharedFlags).FFlagSurvBloxEventTypeEnabled

local function DynamicReportV2Container(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), ReactModule (copy), FFlagAbuseReportConfigProfileUseAttributesPayload (copy), FetchConfigWithAttributesModule (copy), FetchConfigModule (copy), FFlagFixAnalyticsForDynamicReportV2 (copy), DashModule (copy), SendAnalyticsEventFunction (copy), GetNewRunIdFunction (copy), TelemetryEventType (copy), UseAbuseSheetFlowModule (copy), UseFocusNavigationRefsModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), CoreGui (copy), UseIsSpatialFunction (copy), FixDynamicReportV2VRAsync (copy), UseVrOverlayModule (copy), Sheet (copy), DialogSize (copy), ArTranslationProvider (copy), AbuseReportAnalyticsProvider (copy), LayoutSlotsProvider (copy), SheetSlots (copy), AbuseReportDialogModule (copy), DynamicReportV2LoadingModule (copy), DynamicReportV2ErrorModule (copy), OverlayProvider (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	ReactModule.useEffect(function()
		-- upvalues: FFlagAbuseReportConfigProfileUseAttributesPayload (upval), FetchConfigWithAttributesModule (upval), UseRoactServiceResult (copy), p1 (copy), FetchConfigModule (upval), UseStateResult2 (copy), UseStateResult2_1 (copy), FFlagFixAnalyticsForDynamicReportV2 (upval), DashModule (upval), SendAnalyticsEventFunction (upval), GetNewRunIdFunction (upval), TelemetryEventType (upval)
		(if FFlagAbuseReportConfigProfileUseAttributesPayload then FetchConfigWithAttributesModule(UseRoactServiceResult, p1.abuseVector, { targetId = p1.targetId }) else FetchConfigModule(UseRoactServiceResult, p1.abuseVector, p1.targetId)):andThen(function(Result)
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(Result.responseBody)
		end):catch(function(Err)
			-- upvalues: UseStateResult2_1 (upval), FFlagFixAnalyticsForDynamicReportV2 (upval), DashModule (upval), SendAnalyticsEventFunction (upval), p1 (upval), GetNewRunIdFunction (upval), TelemetryEventType (upval)
			warn("Failed to fetch Dynamic Report V2 config:", Err)
			UseStateResult2_1(true)
			local PrettyResult = if FFlagFixAnalyticsForDynamicReportV2 then DashModule.pretty(Err, { depth = 10, multiline = true }) else nil
			SendAnalyticsEventFunction({
				total_duration = 0,
				abuse_vector = p1.abuseVector,
				target_id = p1.targetId,
				run_id = GetNewRunIdFunction(),
				path = {}
			}, {
				sub_event_type = TelemetryEventType.Error,
				error_detail = {
					error_message = if FFlagFixAnalyticsForDynamicReportV2 then `Failed to fetch config: ${PrettyResult}` else `Failed to fetch config: ${tostring(Err)}`
				}
			})
		end)
	end, { UseRoactServiceResult, p1.abuseVector, p1.targetId })
	local UseAbuseSheetFlowModuleResult = UseAbuseSheetFlowModule(UseStateResult, {
		abuseVector = p1.abuseVector,
		targetId = p1.targetId,
		onClose = p1.onClose,
		open = UseStateResult3
	})
	
	if not UseAbuseSheetFlowModuleResult and UseStateResult then
		UseStateResult1 = true
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseAbuseSheetFlowModuleResult (copy), UseStateResult2_2 (copy), p1 (copy)
		if UseAbuseSheetFlowModuleResult then
			UseAbuseSheetFlowModuleResult.onClose()
		end
		UseStateResult2_2(false)
		p1.onClose()
	end, { UseAbuseSheetFlowModuleResult, p1.onClose })
	local UseFocusNavigationRefsModuleResult = UseFocusNavigationRefsModule(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, function()
		-- upvalues: UseResult (copy)
		UseResult()
	end)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(true)
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(not p2)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p2)
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
		onClose = UseResult,
		snapPoints = { 0.9 },
		size = DialogSize.Medium,
		ref = UseResult2
	}, {
		AbuseReportDialog = if UseStateResult and not UseStateResult1 and UseAbuseSheetFlowModuleResult then ReactModule.createElement(ArTranslationProvider, {
			translations = UseAbuseSheetFlowModuleResult.config.translations
		}, ReactModule.createElement(AbuseReportAnalyticsProvider, { analytics = UseAbuseSheetFlowModuleResult.analytics }, ReactModule.createElement(LayoutSlotsProvider, { slots = SheetSlots }, ReactModule.createElement(AbuseReportDialogModule, {
			abuseVector = p1.abuseVector,
			targetId = p1.targetId,
			onClose = UseResult,
			abuseReportFlow = UseAbuseSheetFlowModuleResult,
			takeoverFocus = UseResult1
		})))) else nil,
		LoadingDialog = if UseStateResult or UseStateResult1 then nil else ReactModule.createElement(DynamicReportV2LoadingModule, nil),
		ErrorDialog = if UseStateResult1 then ReactModule.createElement(DynamicReportV2ErrorModule, nil) else nil
	})
	
	return if FixDynamicReportV2VRAsync and UseIsSpatialResult and not UseVrOverlayModuleResult then nil else ReactModule.createElement(OverlayProvider, { gui = UseVrOverlayModuleResult }, { Sheet = Element })
end

local function DynamicReportV2ContainerV2(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), ReactModule (copy), FFlagEnableInlineSurveyOnUserReport (copy), FFlagAbuseReportConfigProfileUseAttributesPayload (copy), FetchConfigWithAttributesModule (copy), FetchConfigModule (copy), SendAnalyticsEventFunction (copy), TelemetryEventType (copy), FFlagFixAnalyticsForDynamicReportV2 (copy), DashModule (copy), GetNewRunIdFunction (copy), FFlagSurvBloxEventTypeEnabled (copy), SurveyEventPublisherModule (copy), WebViewEventTypeModule (copy), AbuseVectorModule (copy), SendBoundaryErrorTelemetryModule (copy), UseFocusNavigationRefsModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), CoreGui (copy), UseIsSpatialFunction (copy), FixDynamicReportV2VRAsync (copy), UseVrOverlayModule (copy), Sheet (copy), DialogSize (copy), AbuseReportErrorBoundaryModule (copy), AbuseReportContentModule (copy), DynamicReportV2LoadingModule (copy), DynamicReportV2ErrorModule (copy), OverlayProvider (copy), InlineSurveyModule (copy), InlineEventTypeModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local v1 = nil
	local Callback1 = nil
	local UseRefResult = nil
	
	if FFlagEnableInlineSurveyOnUserReport then
		v1, Callback1 = ReactModule.useState(false)
		UseRefResult = ReactModule.useRef(false)
	end
	ReactModule.useEffect(function()
		-- upvalues: FFlagAbuseReportConfigProfileUseAttributesPayload (upval), FetchConfigWithAttributesModule (upval), UseRoactServiceResult (copy), p1 (copy), FetchConfigModule (upval), UseStateResult2 (copy), SendAnalyticsEventFunction (upval), TelemetryEventType (upval), UseStateResult2_1 (copy), FFlagFixAnalyticsForDynamicReportV2 (upval), DashModule (upval), GetNewRunIdFunction (upval)
		local Flag = false
		local UnixTimestampMillis = DateTime.now().UnixTimestampMillis;
		(if FFlagAbuseReportConfigProfileUseAttributesPayload then FetchConfigWithAttributesModule(UseRoactServiceResult, p1.abuseVector, { targetId = p1.targetId }) else FetchConfigModule(UseRoactServiceResult, p1.abuseVector, p1.targetId)):andThen(function(Result)
			-- upvalues: Flag (ref), UnixTimestampMillis (copy), UseStateResult2 (upval), SendAnalyticsEventFunction (upval), p1 (upval), TelemetryEventType (upval)
			if not Flag then
				local ResponseBody = Result.responseBody
				local UnixTimestampMillisDelta = DateTime.now().UnixTimestampMillis - UnixTimestampMillis
				UseStateResult2(ResponseBody)
				SendAnalyticsEventFunction({
					run_id = "unknown",
					total_duration = 0,
					abuse_vector = p1.abuseVector,
					target_id = p1.targetId,
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
		end):catch(function(Err)
			-- upvalues: Flag (ref), UseStateResult2_1 (upval), FFlagFixAnalyticsForDynamicReportV2 (upval), DashModule (upval), SendAnalyticsEventFunction (upval), p1 (upval), GetNewRunIdFunction (upval), TelemetryEventType (upval)
			if not Flag then
				warn("Failed to fetch Dynamic Report V2 config:", Err)
				UseStateResult2_1(true)
				local PrettyResult = if FFlagFixAnalyticsForDynamicReportV2 then DashModule.pretty(Err, { depth = 10, multiline = true }) else nil
				SendAnalyticsEventFunction({
					total_duration = 0,
					abuse_vector = p1.abuseVector,
					target_id = p1.targetId,
					run_id = GetNewRunIdFunction(),
					path = {}
				}, {
					sub_event_type = TelemetryEventType.Error,
					error_detail = {
						error_message = if FFlagFixAnalyticsForDynamicReportV2 then `Failed to fetch config: {PrettyResult}` else `Failed to fetch config: {tostring(Err)}`
					}
				})
				
				return
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { UseRoactServiceResult, p1.abuseVector, p1.targetId })
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = nil
	local UseResult = nil
	local Callback = nil
	local UseResult1 = nil
	local UseResult2 = nil
	
	if FFlagEnableInlineSurveyOnUserReport then
		UseRefResult3 = ReactModule.useRef(false)
		UseResult = ReactModule.useCallback(function(p2)
			-- upvalues: UseRefResult3 (ref)
			if p2.didSubmit then
				UseRefResult3.current = true
			end
		end, {})
		Callback = ReactModule.useCallback(function()
			-- upvalues: FFlagSurvBloxEventTypeEnabled (upval), SurveyEventPublisherModule (upval), WebViewEventTypeModule (upval)
			if FFlagSurvBloxEventTypeEnabled then
				SurveyEventPublisherModule.publishSurveyEvent(WebViewEventTypeModule.ReportSubmitted)
			end
		end, {})
		UseResult1 = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (ref)
			UseRefResult.current = true
		end, {})
		UseResult2 = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (ref), Callback (ref), p1 (copy)
			if not UseRefResult.current then
				Callback()
			end
			p1.onClose()
		end, { Callback, p1.onClose })
	end
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), UseStateResult2_2 (copy)
		UseRefResult2.current = true
		UseStateResult2_2(false)
	end, {})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), UseStateResult2_2 (copy), FFlagEnableInlineSurveyOnUserReport (upval), UseRefResult3 (ref), p1 (copy), AbuseVectorModule (upval), Callback1 (ref), Callback (ref)
		if not UseRefResult2.current and UseRefResult1.current then
			UseRefResult1.current.requestClose()
		end
		UseStateResult2_2(false)
		
		if FFlagEnableInlineSurveyOnUserReport then
			if not UseRefResult3.current then
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
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(true)
	end, {})
	local UseResult6 = ReactModule.useCallback(function(p2)
		-- upvalues: SendBoundaryErrorTelemetryModule (upval), p1 (copy), UseStateResult2_1 (copy)
		warn("AbuseReportErrorBoundary caught:", p2)
		SendBoundaryErrorTelemetryModule(p2, { abuse_vector = p1.abuseVector, target_id = p1.targetId })
		UseStateResult2_1(true)
	end, { p1.abuseVector, p1.targetId })
	local UseFocusNavigationRefsModuleResult = UseFocusNavigationRefsModule(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, function()
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(false)
	end)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(true)
	local UseResult7 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(not p2)
	end, {})
	local UseResult8 = ReactModule.useCallback(function(p2)
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
				ref = UseRefResult1,
				rawConfig = UseStateResult,
				abuseVector = p1.abuseVector,
				targetId = p1.targetId,
				onClose = UseResult3,
				open = UseStateResult3,
				takeoverFocus = UseResult7,
				onResolveError = UseResult5,
				onFinish = UseResult
			})
		}) else nil,
		LoadingDialog = if UseStateResult or UseStateResult1 then nil else ReactModule.createElement(DynamicReportV2LoadingModule, nil),
		ErrorDialog = if UseStateResult1 then ReactModule.createElement(DynamicReportV2ErrorModule, nil) else nil
	})
	
	return if FixDynamicReportV2VRAsync and UseIsSpatialResult and not UseVrOverlayModuleResult then nil elseif FFlagEnableInlineSurveyOnUserReport and v1 then ReactModule.createElement(OverlayProvider, { gui = UseVrOverlayModuleResult }, {
		Survey = ReactModule.createElement(InlineSurveyModule, {
			eventType = InlineEventTypeModule.UserReportButtonClicked,
			onEligible = UseResult1,
			onClose = UseResult2
		})
	}) else ReactModule.createElement(OverlayProvider, { gui = UseVrOverlayModuleResult }, { Sheet = Element })
end

return ReactModule.memo(if require(Parent.SharedFlags).FFlagAbuseReportMenuV2 then DynamicReportV2ContainerV2 else DynamicReportV2Container)