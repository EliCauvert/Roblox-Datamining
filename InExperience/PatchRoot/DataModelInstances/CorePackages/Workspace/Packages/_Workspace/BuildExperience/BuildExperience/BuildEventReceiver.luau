local HttpService = game:GetService("HttpService")
local MessageBusService = game:GetService("MessageBusService")
local NotificationService = game:GetService("NotificationService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local ToastNotificationsProtocolModule = require(Parent.ToastNotificationsProtocol)
local GetCreatorAgentResumeStoreModule = require(BuildExperience.Stores.GetCreatorAgentResumeStore)
local GetPlayButtonStoreModule = require(BuildExperience.Stores.GetPlayButtonStore)
local GetCurrentExperienceProjectModule = require(BuildExperience.utils.getCurrentExperienceProject)
local AdsCampaignNotificationModule = require(BuildExperience.utils.AdsCampaignNotification)
local OpenDeepLinkModule = require(Parent.BuildExperiencePlaytestLaunch.openDeepLink)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local FFlagBuildExperienceHomeTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceHomeTelemetry)
local FFlagBuildAdUpsell = require(Parent.SharedFlags).FFlagBuildAdUpsell
local FFlagConnectionRelaunchBuildPlaytest = require(Parent.SharedFlags).FFlagConnectionRelaunchBuildPlaytest
local PlaytestRejoinModule = if require(Parent.SharedFlags).FFlagBuildExperienceLibrary or FFlagConnectionRelaunchBuildPlaytest then require(Parent.BuildExperiencePlaytestLaunch.PlaytestRejoin) else nil
local ResumeNotification = require(Parent.DataHydration.CreatorAgentChat).ResumeNotification
local LifecycleEvents = require(Parent.ToastNotification).LifecycleEvents
local Default = ToastNotificationsProtocolModule.ToastNotificationProtocol.default
local ToastNotificationProtocolConstants = ToastNotificationsProtocolModule.ToastNotificationProtocolConstants

local function _(Connection)
	if Connection == nil then return end
	if typeof(Connection.Disconnect) == "function" then
		Connection:Disconnect()
		
		return
	end
	if typeof(Connection.disconnect) == "function" then
		Connection:disconnect()
	end
end

local function decodeActionParams(p1)
	-- upvalues: HttpService (copy)
	local VisualItem = if typeof(p1) == "table" then p1.visualItem else nil
	local ActionEventParams = if typeof(VisualItem) == "table" then VisualItem.actionEventParams else nil
	
	if typeof(ActionEventParams) ~= "string" or ActionEventParams == "" then
		return nil
	end
	local Success, Result = pcall(HttpService.JSONDecode, HttpService, ActionEventParams)
	
	if not Success or typeof(Result) ~= "table" then
		return nil
	end
	local SessionId = Result.sessionId
	
	if typeof(SessionId) ~= "string" or SessionId == "" then
		return nil
	end
	local Kind = Result.kind
	
	if Kind == "turn_end" or Kind == "local_tool_call" then
		local UniverseId = Result.universeId
		
		return {
			kind = Kind,
			sessionId = SessionId,
			universeId = if typeof(UniverseId) == "number" then UniverseId else nil
		}
	else
		return nil
	end
end

local _ = function(p1)
	-- upvalues: MessageBusService (copy), ToastNotificationProtocolConstants (copy), ResumeNotification (copy)
	MessageBusService:Publish(ToastNotificationProtocolConstants.MESSAGE_DISPLAY_TOAST_NOTIF, ResumeNotification.buildToastNotification(p1))
end

local function sendResumeNotificationClick(p1, p2, Destination, PlaceId)
	-- upvalues: SendBuildExperienceEventModule (copy)
	SendBuildExperienceEventModule("NOTIFICATION_CLICK", {
		universeId = p1.universeId,
		placeId = PlaceId,
		conversationId = p1.sessionId
	}, {
		type = "creator_agent_resume",
		kind = p1.kind,
		destination = Destination,
		isInExperience = if p2 then "true" else "false"
	})
end

local function routeToBuildChat(p1, IsIsInExperience, IsIsBuildModeActive)
	-- upvalues: GetCurrentExperienceProjectModule (copy), FFlagBuildExperienceHomeTelemetryModule (copy), sendResumeNotificationClick (copy), GetPlayButtonStoreModule (copy), OpenDeepLinkModule (copy), ResumeNotification (copy)
	if IsIsInExperience and IsIsBuildModeActive then
		local CurrentExperienceProjectModule = GetCurrentExperienceProjectModule()
		
		if p1.universeId ~= nil and CurrentExperienceProjectModule.universeId == p1.universeId then
			if FFlagBuildExperienceHomeTelemetryModule then
				sendResumeNotificationClick(p1, IsIsInExperience, "build_sheet", CurrentExperienceProjectModule.placeId)
			end
			local PlayButtonStoreModule = GetPlayButtonStoreModule()
			PlayButtonStoreModule.setResumeTarget({
				universeId = p1.universeId,
				placeId = CurrentExperienceProjectModule.placeId,
				sessionId = p1.sessionId
			})
			PlayButtonStoreModule.setIsActive(true)
			
			return
		end
	end
	if FFlagBuildExperienceHomeTelemetryModule then
		sendResumeNotificationClick(p1, IsIsInExperience, "deep_link", nil)
	end
	OpenDeepLinkModule(ResumeNotification.getResumeDeepLink(p1), IsIsInExperience)
end

return function(p1)
	-- upvalues: GetCreatorAgentResumeStoreModule (copy), ReactModule (copy), RealtimeDeliveryModule (copy), NotificationService (copy), PlaytestRejoinModule (copy), FFlagBuildAdUpsell (copy), AdsCampaignNotificationModule (copy), LifecycleEvents (copy), OpenDeepLinkModule (copy), Default (copy), ResumeNotification (copy), MessageBusService (copy), ToastNotificationProtocolConstants (copy), decodeActionParams (copy), routeToBuildChat (copy)
	local CreatorAgentResumeStoreModule = GetCreatorAgentResumeStoreModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), RealtimeDeliveryModule (upval), NotificationService (upval)
		return p1.RobloxEventReceiver or RealtimeDeliveryModule.RobloxEventReceiver.new(NotificationService)
	end, { p1.RobloxEventReceiver })
	local IsIsInExperience = p1.isInExperience == true
	local IsIsBuildModeActive = p1.isBuildModeActive == true
	ReactModule.useEffect(function()
		-- upvalues: PlaytestRejoinModule (upval), IsIsInExperience (copy)
		return if PlaytestRejoinModule == nil or IsIsInExperience then nil else PlaytestRejoinModule.listen()
	end, { IsIsInExperience })
	
	if FFlagBuildAdUpsell then
		ReactModule.useEffect(function()
			-- upvalues: AdsCampaignNotificationModule (upval), LifecycleEvents (upval), OpenDeepLinkModule (upval), IsIsInExperience (copy), Default (upval)
			return AdsCampaignNotificationModule.connect(LifecycleEvents, function(p2)
				-- upvalues: OpenDeepLinkModule (upval), IsIsInExperience (upval)
				OpenDeepLinkModule(p2, IsIsInExperience)
			end, function(p2)
				-- upvalues: Default (upval)
				Default:dismissNotification(p2)
			end)
		end, { IsIsInExperience })
	end
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), ResumeNotification (upval), CreatorAgentResumeStoreModule (copy), MessageBusService (upval), ToastNotificationProtocolConstants (upval)
		local ObserveEventResult = UseMemoResult:observeEvent(ResumeNotification.CapRtnNamespace, function(p2)
			-- upvalues: ResumeNotification (upval), CreatorAgentResumeStoreModule (upval), MessageBusService (upval), ToastNotificationProtocolConstants (upval)
			local ClassifyRtnDetailResult = ResumeNotification.classifyRtnDetail(p2)
			
			if ClassifyRtnDetailResult == nil then return end
			if not ResumeNotification.targetMatchesNotification(CreatorAgentResumeStoreModule.getActiveTarget(false), ClassifyRtnDetailResult) then
				MessageBusService:Publish(ToastNotificationProtocolConstants.MESSAGE_DISPLAY_TOAST_NOTIF, ResumeNotification.buildToastNotification(ClassifyRtnDetailResult))
				
				return
			end
		end)
		
		return function()
			-- upvalues: ObserveEventResult (copy)
			if ObserveEventResult == nil then return end
			if typeof(ObserveEventResult.Disconnect) == "function" then
				ObserveEventResult:Disconnect()
				
				return
			end
			if typeof(ObserveEventResult.disconnect) == "function" then
				ObserveEventResult:disconnect()
			end
		end
	end, { UseMemoResult, CreatorAgentResumeStoreModule })
	ReactModule.useEffect(function()
		-- upvalues: LifecycleEvents (upval), ResumeNotification (upval), decodeActionParams (upval), Default (upval), routeToBuildChat (upval), IsIsInExperience (copy), IsIsBuildModeActive (copy)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, ResumeNotification.NotificationType, function(p2)
			-- upvalues: ResumeNotification (upval), decodeActionParams (upval), Default (upval), routeToBuildChat (upval), IsIsInExperience (upval), IsIsBuildModeActive (upval)
			if typeof(p2) ~= "table" or p2.userActionType ~= "click" or typeof(p2.visualItem) ~= "table" or p2.visualItem.eventName ~= ResumeNotification.ResumeEventName or typeof(p2.notificationData) ~= "table" then return end
			local DecodeActionParamsResult = decodeActionParams(p2)
			
			if DecodeActionParamsResult ~= nil then
				Default:dismissNotification(p2.notificationData.id)
				routeToBuildChat(DecodeActionParamsResult, IsIsInExperience, IsIsBuildModeActive)
				
				return
			end
		end)
		
		return function()
			-- upvalues: RegisterResult (copy)
			RegisterResult()
		end
	end, { IsIsInExperience, IsIsBuildModeActive })
	
	return nil
end