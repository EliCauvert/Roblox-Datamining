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

local function _(p0) --[[ line: 40 | named "disconnect" ]]
	if p0 == nil then return end
	if typeof(p0.Disconnect) == "function" then
		p0:Disconnect()
		
		return
	elseif typeof(p0.disconnect) == "function" then
		p0:disconnect()
	end
end

local function decodeActionParams(p1) --[[ line: 51 ]]
	-- upvalues: httpService (ref)
	local var15 = if typeof(p1) == "table" then p1.visualItem else nil
	local var16 = if typeof(var15) == "table" then var15.actionEventParams else nil
	
	if typeof(var16) ~= "string" or var16 == "" then
		return nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, var16)
	
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

local _ = function(p2) --[[ line: 81 | named "publishToast" ]]
	-- upvalues: messageBusService (ref), toastNotificationProtocolConstants (ref), resumeNotification (ref)
	messageBusService:Publish(toastNotificationProtocolConstants.MESSAGE_DISPLAY_TOAST_NOTIF, resumeNotification.buildToastNotification(p2))
end

local function routeToBuildChat(p3, p4, p5) --[[ line: 88 ]]
	-- upvalues: getCurrentExperienceProjectModule (ref), getPlayButtonStoreModule (ref), resumeNotification (ref), leaveExperienceModule (ref), default (ref)
	if p4 and p5 then
		local var17 = getCurrentExperienceProjectModule()
		
		if p3.universeId ~= nil and var17.universeId == p3.universeId then
			local var18 = getPlayButtonStoreModule()
			var18.setResumeTarget({
				universeId = p3.universeId,
				placeId = var17.placeId,
				sessionId = p3.sessionId
			})
			var18.setIsActive(true)
			
			return
		end
	end
	local resumeDeepLink = resumeNotification.getResumeDeepLink(p3)
	
	if p4 then
		leaveExperienceModule(function() --[[ line: 105 ]]
			-- upvalues: default (copy), resumeDeepLink (ref)
			default:detectURL(resumeDeepLink)
		end)
		
		return
	end
	default:detectURL(resumeDeepLink)
end

return function(p6) --[[ line: 113 | named "BuildEventReceiver" ]]
	-- upvalues: getCreatorAgentResumeStoreModule (ref), reactModule (ref), realtimeDeliveryModule (ref), notificationService (ref), resumeNotification (ref), messageBusService (ref), toastNotificationProtocolConstants (ref), lifecycleEvents (ref), decodeActionParams (ref), default_1 (ref), routeToBuildChat (ref)
	local var20 = getCreatorAgentResumeStoreModule()
	local var21 = reactModule.useMemo(function() --[[ line: 115 ]]
		-- upvalues: p6 (ref), realtimeDeliveryModule (copy), notificationService (copy)
		return p6.RobloxEventReceiver or realtimeDeliveryModule.RobloxEventReceiver.new(notificationService)
	end, { p6.RobloxEventReceiver })
	local var22 = p6.isInExperience == true
	local var23 = p6.isBuildModeActive == true
	reactModule.useEffect(function() --[[ line: 122 ]]
		-- upvalues: var21 (ref), resumeNotification (copy), var20 (ref), messageBusService (copy), toastNotificationProtocolConstants (copy)
		local capRtnNamespace = var21:observeEvent(resumeNotification.CapRtnNamespace, function(p7) --[[ line: 123 ]]
			-- upvalues: resumeNotification (copy), var20 (copy), messageBusService (copy), toastNotificationProtocolConstants (copy)
			local var25 = resumeNotification.classifyRtnDetail(p7)
			
			if var25 == nil then return end
			if resumeNotification.targetMatchesNotification(var20.getActiveTarget(false), var25) then
				return
			end
			messageBusService:Publish(toastNotificationProtocolConstants.MESSAGE_DISPLAY_TOAST_NOTIF, resumeNotification.buildToastNotification(var25))
		end)
		
		return function() --[[ line: 137 ]]
			-- upvalues: capRtnNamespace (ref)
			if capRtnNamespace == nil then return end
			if typeof(capRtnNamespace.Disconnect) == "function" then
				capRtnNamespace:Disconnect()
				
				return
			elseif typeof(capRtnNamespace.disconnect) == "function" then
				capRtnNamespace:disconnect()
			end
		end
	end, { var21, var20 })
	reactModule.useEffect(function() --[[ line: 142 ]]
		-- upvalues: lifecycleEvents (copy), resumeNotification (copy), decodeActionParams (copy), default_1 (copy), routeToBuildChat (copy), var22 (ref), var23 (ref)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, resumeNotification.NotificationType, function(p8) --[[ line: 146 ]]
			-- upvalues: resumeNotification (copy), decodeActionParams (copy), default_1 (copy), routeToBuildChat (copy), var22 (copy), var23 (copy)
			if typeof(p8) ~= "table" or p8.userActionType ~= "click" or (typeof(p8.visualItem) ~= "table" or p8.visualItem.eventName ~= resumeNotification.ResumeEventName) or typeof(p8.notificationData) ~= "table" then return end
			local var27 = decodeActionParams(p8)
			
			if var27 == nil then
				return
			end
			default_1:dismissNotification(p8.notificationData.id)
			routeToBuildChat(var27, var22, var23)
		end)
		
		return function() --[[ line: 167 ]]
			-- upvalues: userAction (ref)
			userAction()
		end
	end, { var22, var23 })
	
	return nil
end