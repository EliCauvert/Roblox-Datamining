local HttpService = game:GetService("HttpService")
local MessageBusService = game:GetService("MessageBusService")
local NotificationService = game:GetService("NotificationService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local Default = require(Parent.LinkingProtocol).LinkingProtocol.default
local ReactModule = require(Parent.React)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local ToastNotificationsProtocolModule = require(Parent.ToastNotificationsProtocol)
local GetCreatorAgentResumeStoreModule = require(BuildExperience.Stores.GetCreatorAgentResumeStore)
local GetPlayButtonStoreModule = require(BuildExperience.Stores.GetPlayButtonStore)
local GetCurrentExperienceProjectModule = require(BuildExperience.utils.getCurrentExperienceProject)
local LeaveExperienceModule = require(BuildExperience.utils.leaveExperience)
local AdsCampaignNotificationModule = require(BuildExperience.utils.AdsCampaignNotification)
local FFlagBuildAdUpsell = require(Parent.SharedFlags).FFlagBuildAdUpsell
local FFlagConnectionRelaunchBuildPlaytest = require(Parent.SharedFlags).FFlagConnectionRelaunchBuildPlaytest
local PlaytestRejoinModule = if require(Parent.SharedFlags).FFlagBuildExperienceLibrary or FFlagConnectionRelaunchBuildPlaytest then require(Parent.BuildExperiencePlaytestLaunch.PlaytestRejoin) else nil
local ResumeNotification = require(Parent.DataHydration.CreatorAgentChat).ResumeNotification
local LifecycleEvents = require(Parent.ToastNotification).LifecycleEvents
local Default1 = ToastNotificationsProtocolModule.ToastNotificationProtocol.default
local ToastNotificationProtocolConstants = ToastNotificationsProtocolModule.ToastNotificationProtocolConstants

local function _(Connection) --[[ Line: 47 | Named "disconnect" ]]
	if Connection == nil then return end
	if typeof(Connection.Disconnect) == "function" then
		Connection:Disconnect()
		
		return
	end
	if typeof(Connection.disconnect) == "function" then
		Connection:disconnect()
	end
end

local function decodeActionParams(p1) --[[ Line: 58 ]]
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

local _ = function(p1) --[[ Line: 88 | Named "publishToast" ]]
	-- upvalues: MessageBusService (copy), ToastNotificationProtocolConstants (copy), ResumeNotification (copy)
	MessageBusService:Publish(ToastNotificationProtocolConstants.MESSAGE_DISPLAY_TOAST_NOTIF, ResumeNotification.buildToastNotification(p1))
end

local _ = function(p1, p2) --[[ Line: 95 | Named "openDeepLink" ]]
	-- upvalues: LeaveExperienceModule (copy), Default (copy)
	if p2 then
		LeaveExperienceModule(function() --[[ Line: 97 ]]
			-- upvalues: Default (upval), p1 (copy)
			Default:detectURL(p1)
		end)
		
		return
	else
		Default:detectURL(p1)
	end
end

local function routeToBuildChat(p1, IsIsInExperience, IsIsBuildModeActive) --[[ Line: 105 ]]
	-- upvalues: GetCurrentExperienceProjectModule (copy), GetPlayButtonStoreModule (copy), ResumeNotification (copy), LeaveExperienceModule (copy), Default (copy)
	if IsIsInExperience and IsIsBuildModeActive then
		local CurrentExperienceProjectModule = GetCurrentExperienceProjectModule()
		
		if p1.universeId ~= nil and CurrentExperienceProjectModule.universeId == p1.universeId then
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
	local ResumeDeepLink = ResumeNotification.getResumeDeepLink(p1)
	
	if IsIsInExperience then
		LeaveExperienceModule(function() --[[ Line: 97 ]]
			-- upvalues: Default (upval), ResumeDeepLink (copy)
			Default:detectURL(ResumeDeepLink)
		end)
		
		return
	else
		Default:detectURL(ResumeDeepLink)
	end
end

return function(p1) --[[ Line: 123 | Named "BuildEventReceiver" ]]
	-- upvalues: GetCreatorAgentResumeStoreModule (copy), ReactModule (copy), RealtimeDeliveryModule (copy), NotificationService (copy), PlaytestRejoinModule (copy), FFlagBuildAdUpsell (copy), AdsCampaignNotificationModule (copy), LifecycleEvents (copy), LeaveExperienceModule (copy), Default (copy), Default1 (copy), ResumeNotification (copy), MessageBusService (copy), ToastNotificationProtocolConstants (copy), decodeActionParams (copy), routeToBuildChat (copy)
	local CreatorAgentResumeStoreModule = GetCreatorAgentResumeStoreModule()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 125 ]]
		-- upvalues: p1 (copy), RealtimeDeliveryModule (upval), NotificationService (upval)
		return p1.RobloxEventReceiver or RealtimeDeliveryModule.RobloxEventReceiver.new(NotificationService)
	end, { p1.RobloxEventReceiver })
	local IsIsInExperience = p1.isInExperience == true
	local IsIsBuildModeActive = p1.isBuildModeActive == true
	ReactModule.useEffect(function() --[[ Line: 132 ]]
		-- upvalues: PlaytestRejoinModule (upval), IsIsInExperience (copy)
		return if PlaytestRejoinModule == nil or IsIsInExperience then nil else PlaytestRejoinModule.listen()
	end, { IsIsInExperience })
	
	if FFlagBuildAdUpsell then
		ReactModule.useEffect(function() --[[ Line: 137 ]]
			-- upvalues: AdsCampaignNotificationModule (upval), LifecycleEvents (upval), IsIsInExperience (copy), LeaveExperienceModule (upval), Default (upval), Default1 (upval)
			return AdsCampaignNotificationModule.connect(LifecycleEvents, function(p2) --[[ Line: 138 ]]
				-- upvalues: IsIsInExperience (upval), LeaveExperienceModule (upval), Default (upval)
				if IsIsInExperience then
					LeaveExperienceModule(function() --[[ Line: 97 ]]
						-- upvalues: Default (upval), p2 (copy)
						Default:detectURL(p2)
					end)
					
					return
				else
					Default:detectURL(p2)
				end
			end, function(p2) --[[ Line: 140 ]]
				-- upvalues: Default1 (upval)
				Default1:dismissNotification(p2)
			end)
		end, { IsIsInExperience })
	end
	ReactModule.useEffect(function() --[[ Line: 146 ]]
		-- upvalues: UseMemoResult (copy), ResumeNotification (upval), CreatorAgentResumeStoreModule (copy), MessageBusService (upval), ToastNotificationProtocolConstants (upval)
		local ObserveEventResult = UseMemoResult:observeEvent(ResumeNotification.CapRtnNamespace, function(p2) --[[ Line: 147 ]]
			-- upvalues: ResumeNotification (upval), CreatorAgentResumeStoreModule (upval), MessageBusService (upval), ToastNotificationProtocolConstants (upval)
			local ClassifyRtnDetailResult = ResumeNotification.classifyRtnDetail(p2)
			
			if ClassifyRtnDetailResult == nil then return end
			if not ResumeNotification.targetMatchesNotification(CreatorAgentResumeStoreModule.getActiveTarget(false), ClassifyRtnDetailResult) then
				MessageBusService:Publish(ToastNotificationProtocolConstants.MESSAGE_DISPLAY_TOAST_NOTIF, ResumeNotification.buildToastNotification(ClassifyRtnDetailResult))
				
				return
			end
		end)
		
		return function() --[[ Line: 161 ]]
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
	ReactModule.useEffect(function() --[[ Line: 166 ]]
		-- upvalues: LifecycleEvents (upval), ResumeNotification (upval), decodeActionParams (upval), Default1 (upval), routeToBuildChat (upval), IsIsInExperience (copy), IsIsBuildModeActive (copy)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, ResumeNotification.NotificationType, function(p2) --[[ Line: 170 ]]
			-- upvalues: ResumeNotification (upval), decodeActionParams (upval), Default1 (upval), routeToBuildChat (upval), IsIsInExperience (upval), IsIsBuildModeActive (upval)
			if typeof(p2) ~= "table" or p2.userActionType ~= "click" or typeof(p2.visualItem) ~= "table" or p2.visualItem.eventName ~= ResumeNotification.ResumeEventName or typeof(p2.notificationData) ~= "table" then return end
			local DecodeActionParamsResult = decodeActionParams(p2)
			
			if DecodeActionParamsResult ~= nil then
				Default1:dismissNotification(p2.notificationData.id)
				routeToBuildChat(DecodeActionParamsResult, IsIsInExperience, IsIsBuildModeActive)
				
				return
			end
		end)
		
		return function() --[[ Line: 191 ]]
			-- upvalues: RegisterResult (copy)
			RegisterResult()
		end
	end, { IsIsInExperience, IsIsBuildModeActive })
	
	return nil
end