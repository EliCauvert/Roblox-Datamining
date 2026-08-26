local httpService = game:GetService("HttpService")
local messageBusService = game:GetService("MessageBusService")
local notificationService = game:GetService("NotificationService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local toastNotificationModule = require(parent.ToastNotification)
local toastNotificationsProtocolModule = require(parent.ToastNotificationsProtocol)
local getCreatorAgentResumeStoreModule = require(buildExperience.Stores.GetCreatorAgentResumeStore)
local getPlayButtonStoreModule = require(buildExperience.Stores.GetPlayButtonStore)
local getCurrentExperienceProjectModule = require(buildExperience.utils.getCurrentExperienceProject)
local leaveExperienceModule = require(buildExperience.utils.leaveExperience)
local resumeNotification = creatorAgentChatModule.ResumeNotification
local lifecycleEvents = toastNotificationModule.LifecycleEvents
local default_1 = toastNotificationsProtocolModule.ToastNotificationProtocol.default
local toastNotificationProtocolConstants = toastNotificationsProtocolModule.ToastNotificationProtocolConstants

local function _(p1)
	if p1 == nil then return end
	if typeof(p1.Disconnect) == "function" then
		p1:Disconnect()
		
		return
	elseif typeof(p1.disconnect) == "function" then
		p1:disconnect()
	end
end

local function decodeActionParams(p1)
	-- upvalues: httpService (ref)
	local var1 = if typeof(p1) == "table" then p1.visualItem else nil
	local var2 = if typeof(var1) == "table" then var1.actionEventParams else nil
	
	if typeof(var2) ~= "string" or var2 == "" then
		return nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, var2)
	
	if not ok or typeof(status) ~= "table" then
		return nil
	end
	local sessionId = status.sessionId
	
	if typeof(sessionId) ~= "string" or sessionId == "" then
		return nil
	end
	local kind = status.kind
	
	if kind == "turn_end" or kind == "local_tool_call" then
		local universeId = status.universeId
		
		return {
			kind = kind,
			sessionId = sessionId,
			universeId = if typeof(universeId) == "number" then universeId else nil
		}
	end
	return nil
end

local _ = function(p1)
	-- upvalues: messageBusService (ref), toastNotificationProtocolConstants (ref), resumeNotification (ref)
	messageBusService:Publish(toastNotificationProtocolConstants.MESSAGE_DISPLAY_TOAST_NOTIF, resumeNotification.buildToastNotification(p1))
end

local function routeToBuildChat(p1, p2, p3)
	-- upvalues: getCurrentExperienceProjectModule (ref), getPlayButtonStoreModule (ref), resumeNotification (ref), leaveExperienceModule (ref), default (ref)
	if p2 and p3 then
		local var1 = getCurrentExperienceProjectModule()
		
		if p1.universeId ~= nil and var1.universeId == p1.universeId then
			local var2 = getPlayButtonStoreModule()
			var2.setResumeTarget({
				universeId = p1.universeId,
				placeId = var1.placeId,
				sessionId = p1.sessionId
			})
			var2.setIsActive(true)
			
			return
		end
	end
	local resumeDeepLink = resumeNotification.getResumeDeepLink(p1)
	
	if p2 then
		leaveExperienceModule(function()
			-- upvalues: default (copy), resumeDeepLink (ref)
			default:detectURL(resumeDeepLink)
		end)
		
		return
	end
	default:detectURL(resumeDeepLink)
end

return function(p1)
	-- upvalues: getCreatorAgentResumeStoreModule (ref), reactModule (ref), realtimeDeliveryModule (ref), notificationService (ref), resumeNotification (ref), messageBusService (ref), toastNotificationProtocolConstants (ref), lifecycleEvents (ref), decodeActionParams (ref), default_1 (ref), routeToBuildChat (ref)
	local var1 = getCreatorAgentResumeStoreModule()
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), realtimeDeliveryModule (copy), notificationService (copy)
		return p1.RobloxEventReceiver or realtimeDeliveryModule.RobloxEventReceiver.new(notificationService)
	end, { p1.RobloxEventReceiver })
	local var3 = p1.isInExperience == true
	local var4 = p1.isBuildModeActive == true
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), resumeNotification (copy), var1 (ref), messageBusService (copy), toastNotificationProtocolConstants (copy)
		local capRtnNamespace = var2:observeEvent(resumeNotification.CapRtnNamespace, function(p2)
			-- upvalues: resumeNotification (copy), var1 (copy), messageBusService (copy), toastNotificationProtocolConstants (copy)
			local var5 = resumeNotification.classifyRtnDetail(p2)
			
			if var5 == nil then return end
			if resumeNotification.targetMatchesNotification(var1.getActiveTarget(false), var5) then
				return
			end
			messageBusService:Publish(toastNotificationProtocolConstants.MESSAGE_DISPLAY_TOAST_NOTIF, resumeNotification.buildToastNotification(var5))
		end)
		
		return function()
			-- upvalues: capRtnNamespace (ref)
			if capRtnNamespace == nil then return end
			if typeof(capRtnNamespace.Disconnect) == "function" then
				capRtnNamespace:Disconnect()
				
				return
			elseif typeof(capRtnNamespace.disconnect) == "function" then
				capRtnNamespace:disconnect()
			end
		end
	end, { var2, var1 })
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), resumeNotification (copy), decodeActionParams (copy), default_1 (copy), routeToBuildChat (copy), var3 (ref), var4 (ref)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, resumeNotification.NotificationType, function(p2)
			-- upvalues: resumeNotification (copy), decodeActionParams (copy), default_1 (copy), routeToBuildChat (copy), var3 (copy), var4 (copy)
			if typeof(p2) ~= "table" or p2.userActionType ~= "click" or (typeof(p2.visualItem) ~= "table" or p2.visualItem.eventName ~= resumeNotification.ResumeEventName) or typeof(p2.notificationData) ~= "table" then return end
			local var5 = decodeActionParams(p2)
			
			if var5 == nil then
				return
			end
			default_1:dismissNotification(p2.notificationData.id)
			routeToBuildChat(var5, var3, var4)
		end)
		
		return function()
			-- upvalues: userAction (ref)
			userAction()
		end
	end, { var3, var4 })
	
	return nil
end