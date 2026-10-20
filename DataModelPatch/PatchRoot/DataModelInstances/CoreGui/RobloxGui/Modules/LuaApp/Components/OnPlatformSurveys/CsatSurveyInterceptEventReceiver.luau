local Players = game:GetService("Players")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local MessageBus = require(CorePackages.Workspace.Packages.MessageBus).MessageBus
local TModule = require(CorePackages.Packages.t)
local OpenWebviewModule = require(Modules.LuaApp.Thunks.OpenWebview)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local GetSurveyModule = require(Modules.LuaApp.Http.Requests.GetSurvey)
local OpenCentralOverlayForSurveyPromptModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForSurveyPrompt)
local OpenCentralOverlayForSurveyPromptWithSurvBloxModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForSurveyPromptWithSurvBlox)
local CsatSurveyConstantsModule = require(script.Parent.CsatSurveyConstants)
local CsatSurveyInterceptUtilsModule = require(script.Parent.CsatSurveyInterceptUtils)
local CsatSurveyTelemetryConfigModule = require(script.Parent.CsatSurveyTelemetryConfig)
local GetFFlagSurvBloxEnabledModule = require(script.Parent.GetFFlagSurvBloxEnabled)
local GetFFlagSurvBloxLocalStorageEnabledModule = require(script.Parent.GetFFlagSurvBloxLocalStorageEnabled)
local GetFFlagSurvBloxAddSurveyLinkParamsEnabledModule = require(script.Parent.GetFFlagSurvBloxAddSurveyLinkParamsEnabled)
local GetFIntSurvBloxRequiredCooldownMsModule = require(script.Parent.GetFIntSurvBloxRequiredCooldownMs)
local GetFFlagSurvBloxTrackingFixesModule = require(script.Parent.GetFFlagSurvBloxTrackingFixes)
local OPENSURVEYEVENTDESCRIPTOR = require(CorePackages.Workspace.Packages.OnPlatformSurveys.SurveyEventPublisher).OPEN_SURVEY_EVENT_DESCRIPTOR
local ValueOfResult = TModule.valueOf((require(CorePackages.Workspace.Packages.OnPlatformSurveys.WebViewEventType)))
local FFlagSurvBloxEventTypeEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSurvBloxEventTypeEnabled
local CsatSurveyInterceptEventReceiver = require(CorePackages.Packages.Roact).PureComponent:extend("CsatSurveyInterceptEventReceiver")
CsatSurveyInterceptEventReceiver.validateProps = TModule.strictInterface({
	RobloxEventReceiver = TModule.table,
	baseUrlFormat = TModule.optional(TModule.string),
	surveyId = TModule.optional(TModule.string),
	isQualified = TModule.optional(TModule.boolean),
	restrictTextInput = TModule.boolean,
	openWebView = TModule.callback,
	openSurveyPrompt = TModule.optional(TModule.callback),
	openSurveyPromptWithSurvBlox = TModule.optional(TModule.callback),
	eventType = TModule.optional(TModule.string),
	showPrompt = TModule.optional(TModule.boolean),
	analyticsService = TModule.optional(TModule.union(TModule.Instance, TModule.table)),
	titleText = TModule.optional(TModule.string),
	bodyText = TModule.optional(TModule.string),
	cancelButtonText = TModule.optional(TModule.string),
	confirmButtonText = TModule.optional(TModule.string),
	sessionService = TModule.optional(TModule.union(TModule.Instance, TModule.table)),
	localization = TModule.optional(TModule.table),
	surveyName = TModule.optional(TModule.string),
	menuVersion = TModule.optional(TModule.string),
	networking = TModule.callback
})
CsatSurveyInterceptEventReceiver.defaultProps = {
	baseUrlFormat = "",
	surveyId = "",
	isQualified = false,
	restrictTextInput = false,
	eventType = "",
	showPrompt = false,
	titleText = "",
	bodyText = "",
	cancelButtonText = "",
	confirmButtonText = "",
	surveyName = "",
	menuVersion = "",
	analyticsService = RbxAnalyticsService
}

function CsatSurveyInterceptEventReceiver.getSurveyUrl(p1, p2, _, p3)
	-- upvalues: TModule (copy), Players (copy), GetFFlagSurvBloxEnabledModule (copy), FFlagSurvBloxEventTypeEnabled (copy), GetSurveyModule (copy), GetFFlagSurvBloxTrackingFixesModule (copy), GetFFlagSurvBloxAddSurveyLinkParamsEnabledModule (copy), UrlBuilderModule (copy), CsatSurveyConstantsModule (copy)
	assert(TModule.boolean(p1.props.restrictTextInput))
	local P1 = p2 or tostring(Players.LocalPlayer.UserId)
	assert(TModule.string(P1))
	local SessionInfoString = p1.props.sessionService:generateSessionInfoString(false, true, false, false)
	
	if not GetFFlagSurvBloxEnabledModule() then
		assert(TModule.string(p1.props.baseUrlFormat))
		assert(TModule.string(p1.props.surveyId))
		
		return (UrlBuilderModule.fromString(p1.props.baseUrlFormat)({
			surveyId = p1.props.surveyId or "",
			userId = P1 or "0",
			restrictTextInput = tostring(p1.props.restrictTextInput) or "true",
			sessionIds = SessionInfoString,
			menuVersion = p1.props.surveyName == CsatSurveyConstantsModule.CHROME_SURVEY_NAME and p1.props.menuVersion or ""
		}))
	end
	local v1, v2 = GetSurveyModule(p1.props.networking, if FFlagSurvBloxEventTypeEnabled then p3 else nil):await()
	
	if GetFFlagSurvBloxTrackingFixesModule() then
		if v1 and v2 then
			p1:trackSurveyIdLocally()
			
			if v2.shouldPromptSurvey then
				return if GetFFlagSurvBloxAddSurveyLinkParamsEnabledModule() then UrlBuilderModule.fromString(v2.surveyLink)({
					userId = P1 or "0",
					restrictTextInput = tostring(p1.props.restrictTextInput) or "true",
					sessionIds = SessionInfoString
				}) else v2.surveyLink
			end
		end
	elseif v1 and v2 and v2.shouldPromptSurvey then
		return if GetFFlagSurvBloxAddSurveyLinkParamsEnabledModule() then UrlBuilderModule.fromString(v2.surveyLink)({
			userId = P1 or "0",
			restrictTextInput = tostring(p1.props.restrictTextInput) or "true",
			sessionIds = SessionInfoString
		}) else v2.surveyLink
	end
	return ""
end

function CsatSurveyInterceptEventReceiver.getCompletedSurveyIds(p1)
	-- upvalues: AppStorageService (copy), CsatSurveyConstantsModule (copy), HttpService (copy)
	local Success, Result = pcall(function()
		-- upvalues: AppStorageService (upval), CsatSurveyConstantsModule (upval)
		return AppStorageService:GetItem(CsatSurveyConstantsModule.LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS)
	end)
	
	if Success and Result ~= "" then
		return HttpService:JSONDecode(Result)
	else
		warn("Unable to fetch completed survey ids from app storage ", Result)
		p1.props.analyticsService:SetRBXEventStream(CsatSurveyConstantsModule.ANALYTICS_CONTEXT_APP, CsatSurveyConstantsModule.ANALYTICS_SURVEY_EVENT, CsatSurveyConstantsModule.ANALYTICS_EXPERIMENT_MENU_GET_COMPLETED_SURVEY_IDS_FIELD, { error = Result })
		
		return {}
	end
end

function CsatSurveyInterceptEventReceiver.hasCompletedSurvey(p1): boolean
	-- upvalues: TModule (copy)
	assert(TModule.string(p1.props.surveyId))
	
	for _, completedSurveyId in ipairs(p1.completedSurveyIds) do
		if completedSurveyId == p1.props.surveyId then
			return true
		end
	end
	return false
end

function CsatSurveyInterceptEventReceiver.trackSurveyIdLocally(p2)
	-- upvalues: GetFFlagSurvBloxEnabledModule (copy), GetFFlagSurvBloxLocalStorageEnabledModule (copy), AppStorageService (copy), CsatSurveyConstantsModule (copy), TModule (copy), CryoModule (copy), HttpService (copy)
	if not GetFFlagSurvBloxEnabledModule() then
		assert(TModule.string(p2.props.surveyId))
		
		if p2:hasCompletedSurvey() then return end
		if CsatSurveyConstantsModule.LOCAL_STORAGE_CSAT_SURVEY_IDS_LIMIT <= #p2.completedSurveyIds then
			p2.completedSurveyIds = CryoModule.List.getRange(p2.completedSurveyIds, 2, #p2.completedSurveyIds)
		end
		table.insert(p2.completedSurveyIds, p2.props.surveyId)
		local Success1, Result1 = pcall(function()
			-- upvalues: HttpService (upval), p2 (copy), AppStorageService (upval), CsatSurveyConstantsModule (upval)
			AppStorageService:SetItem(CsatSurveyConstantsModule.LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS, HttpService:JSONEncode(p2.completedSurveyIds) or "{}")
			AppStorageService:Flush()
		end)
		
		if not Success1 then
			warn("Uncaught exception for setting completed CSAT survey ids on app storage", Result1)
			p2.props.analyticsService:SetRBXEventStream(CsatSurveyConstantsModule.ANALYTICS_CONTEXT_APP, CsatSurveyConstantsModule.ANALYTICS_SURVEY_EVENT, CsatSurveyConstantsModule.ANALYTICS_EXPERIMENT_MENU_SET_COMPLETED_SURVEY_IDS_FIELD, { error = Result1 })
		end
	elseif GetFFlagSurvBloxLocalStorageEnabledModule() then
		local Success, Result = pcall(function()
			-- upvalues: AppStorageService (upval), CsatSurveyConstantsModule (upval)
			AppStorageService:SetItem(CsatSurveyConstantsModule.LOCAL_STORAGE_KEY_CSAT_LAST_SURVBLOX_CALL_TIMESTAMP, (tostring(DateTime.now().UnixTimestampMillis)))
			AppStorageService:Flush()
		end)
		
		if not Success then
			warn("Uncaught exception for setting last SurvBlox call timestamp on app storage", Result)
			
			return
		end
	end
end

function CsatSurveyInterceptEventReceiver.canShowSurvey(p2)
	-- upvalues: GetFFlagSurvBloxEnabledModule (copy), GetFFlagSurvBloxLocalStorageEnabledModule (copy), AppStorageService (copy), CsatSurveyConstantsModule (copy), CsatSurveyTelemetryConfigModule (copy), GetFIntSurvBloxRequiredCooldownMsModule (copy), TModule (copy), CsatSurveyInterceptUtilsModule (copy)
	if GetFFlagSurvBloxEnabledModule() then
		if not GetFFlagSurvBloxLocalStorageEnabledModule() then
			return true
		end
		local Success, Result = pcall(function()
			-- upvalues: AppStorageService (upval), CsatSurveyConstantsModule (upval)
			return AppStorageService:GetItem(CsatSurveyConstantsModule.LOCAL_STORAGE_KEY_CSAT_LAST_SURVBLOX_CALL_TIMESTAMP)
		end)
		
		if Success then
			local Number: number? = tonumber(Result)
			
			if Number == -1 then
				return true
			elseif GetFIntSurvBloxRequiredCooldownMsModule() <= DateTime.now().UnixTimestampMillis - Number then
				return true
			end
		else
			warn("Unable to fetch last time a call to SurvBlox was made ", Result)
			CsatSurveyTelemetryConfigModule.logGetLastSurvBloxCallTimestampError()
		end
		return false
	else
		assert(TModule.string(p2.props.surveyId))
		
		if p2.props.surveyId == "" or p2.props.surveyId == nil then
			return false
		elseif p2:hasCompletedSurvey() then
			return false
		elseif p2.props.surveyName == CsatSurveyConstantsModule.CHROME_SURVEY_NAME then
			local CanShowChromeSurvey = CsatSurveyInterceptUtilsModule.canShowChromeSurvey(p2.props.menuVersion)
			
			return p2.props.isQualified and CanShowChromeSurvey
		else
			return p2.props.isQualified
		end
	end
end

function CsatSurveyInterceptEventReceiver.openSurveyWebviewWithPrompt(p2, SurveyUrl, FormatResult)
	-- upvalues: GetFFlagSurvBloxTrackingFixesModule (copy)
	function p2.surveyPromptFunc()
		-- upvalues: p2 (copy), SurveyUrl (copy), FormatResult (copy)
		wait(0.2)
		p2.props.openWebView(SurveyUrl, FormatResult)
		p2:trackSurveyIdLocally()
	end
	
	function p2.surveyPromptClose()
		-- upvalues: p2 (copy)
		p2:trackSurveyIdLocally()
	end
	
	if GetFFlagSurvBloxTrackingFixesModule() then
		p2.props.openSurveyPromptWithSurvBlox(p2.surveyPromptFunc, p2.surveyPromptClose)
		
		return
	else
		p2.props.openSurveyPrompt(p2.surveyPromptFunc, p2.surveyPromptClose, p2.props.titleText, p2.props.bodyText, p2.props.cancelButtonText, p2.props.confirmButtonText)
	end
end

function CsatSurveyInterceptEventReceiver.openSurveyWebview(p2, UserId, CustomProps, EventType)
	-- upvalues: CsatSurveyConstantsModule (copy), GetFFlagSurvBloxEnabledModule (copy), GetFFlagSurvBloxTrackingFixesModule (copy)
	if p2:canShowSurvey() then
		local SurveyUrl = p2:getSurveyUrl(UserId, CustomProps, EventType)
		local FormatResult = p2.props.localization:Format(CsatSurveyConstantsModule.WEBVIEW_NAME_KEY)
		
		if GetFFlagSurvBloxEnabledModule() and SurveyUrl == "" then return end
		if GetFFlagSurvBloxTrackingFixesModule() then
			p2:openSurveyWebviewWithPrompt(SurveyUrl, FormatResult)
			
			return
		end
		if p2.props.showPrompt then
			p2:openSurveyWebviewWithPrompt(SurveyUrl, FormatResult)
			
			return
		end
		wait(0.2)
		p2.props.openWebView(SurveyUrl, FormatResult)
		p2:trackSurveyIdLocally()
	end
end

function CsatSurveyInterceptEventReceiver.triggerEventTypeIsAllowed(p2, EventType): boolean
	-- upvalues: FFlagSurvBloxEventTypeEnabled (copy), ValueOfResult (copy), GetFFlagSurvBloxTrackingFixesModule (copy), CsatSurveyConstantsModule (copy)
	if FFlagSurvBloxEventTypeEnabled then
		return ValueOfResult(EventType) == true
	elseif GetFFlagSurvBloxTrackingFixesModule() then
		if EventType == CsatSurveyConstantsModule.EVENT_TYPE_ENUM.ON_LEAVE_BUTTON_CLICK then
			return true
		end
	elseif p2.props.eventType == EventType and EventType == CsatSurveyConstantsModule.EVENT_TYPE_ENUM.ON_LEAVE_BUTTON_CLICK then
		return true
	end
	return false
end

function CsatSurveyInterceptEventReceiver.init(p2)
	-- upvalues: GetFFlagSurvBloxTrackingFixesModule (copy), MessageBus (copy), FFlagSurvBloxEventTypeEnabled (copy), OPENSURVEYEVENTDESCRIPTOR (copy), CsatSurveyConstantsModule (copy)
	if not GetFFlagSurvBloxTrackingFixesModule() then
		p2.completedSurveyIds = p2:getCompletedSurveyIds()
	end
	p2.subscriber = MessageBus.Subscriber.new()
	local OPENSURVEYEVENTDESCRIPTOR1 = if FFlagSurvBloxEventTypeEnabled then OPENSURVEYEVENTDESCRIPTOR else CsatSurveyConstantsModule.ON_SURVEY_EVENT_DESCRIPTOR
	p2.subscriber:subscribe(OPENSURVEYEVENTDESCRIPTOR1, function(p3)
		-- upvalues: p2 (copy), OPENSURVEYEVENTDESCRIPTOR1 (copy)
		if p2:triggerEventTypeIsAllowed(p3.eventType) then
			p2.subscriber:unsubscribe(OPENSURVEYEVENTDESCRIPTOR1)
			p2:openSurveyWebview(p3.userId, p3.customProps, p3.eventType)
		end
	end)
end

function CsatSurveyInterceptEventReceiver:render() end

local v1 = if GetFFlagSurvBloxTrackingFixesModule() then RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: OpenWebviewModule (copy), OpenCentralOverlayForSurveyPromptWithSurvBloxModule (copy)
	return {
		openWebView = function(p2, p3)
			-- upvalues: Callback (copy), OpenWebviewModule (upval)
			return Callback(OpenWebviewModule(p2, p3))
		end,
		openSurveyPromptWithSurvBlox = function(p2, p3)
			-- upvalues: Callback (copy), OpenCentralOverlayForSurveyPromptWithSurvBloxModule (upval)
			Callback(OpenCentralOverlayForSurveyPromptWithSurvBloxModule(p2, p3))
		end
	}
end)(CsatSurveyInterceptEventReceiver) else RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: OpenWebviewModule (copy), OpenCentralOverlayForSurveyPromptModule (copy)
	return {
		openWebView = function(p2, p3)
			-- upvalues: Callback (copy), OpenWebviewModule (upval)
			return Callback(OpenWebviewModule(p2, p3))
		end,
		openSurveyPrompt = function(p2, p3, p4, p5, p6, p7)
			-- upvalues: Callback (copy), OpenCentralOverlayForSurveyPromptModule (upval)
			Callback(OpenCentralOverlayForSurveyPromptModule(p2, p3, p4, p5, p6, p7))
		end
	}
end)(CsatSurveyInterceptEventReceiver)

if not GetFFlagSurvBloxTrackingFixesModule() then
	v1 = RoactAppExperimentModule.connectUserLayer({
		AppUserLayers.GameLeaveLayer,
		AppUserLayers.ExperienceMenuLayer
	}, function(p2, _)
		-- upvalues: AppUserLayers (copy)
		local DefaultProps = p2[AppUserLayers.GameLeaveLayer] or {}
		
		return {
			baseUrlFormat = DefaultProps.baseUrlFormat,
			surveyId = DefaultProps.surveyId,
			isQualified = DefaultProps.isQualified,
			eventType = DefaultProps.eventType,
			showPrompt = DefaultProps.showPrompt,
			titleText = DefaultProps.titleText or "",
			bodyText = DefaultProps.bodyText or "",
			cancelButtonText = DefaultProps.cancelButtonText or "",
			confirmButtonText = DefaultProps.confirmButtonText or "",
			surveyName = DefaultProps.surveyName,
			menuVersion = (p2[AppUserLayers.ExperienceMenuLayer] or {}).menuVersion
		}
	end)(v1)
end
return (RoactServices.connect({
	sessionService = AppSessionService,
	localization = RoactLocalizationModule,
	networking = RoactNetworking
})((RoactAppPolicy.connect(function(p2, _)
	return {
		restrictTextInput = p2.getCsatSurveyRestrictTextInput() or false
	}
end)(v1))))