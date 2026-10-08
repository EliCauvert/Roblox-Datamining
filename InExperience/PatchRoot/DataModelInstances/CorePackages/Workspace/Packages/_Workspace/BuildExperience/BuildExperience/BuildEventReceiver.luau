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
local adsCampaignNotificationModule = require(buildExperience.utils.AdsCampaignNotification)
local fFlagBuildAdUpsell = require(parent.SharedFlags).FFlagBuildAdUpsell
local var1 = if require(parent.SharedFlags).FFlagBuildExperienceLibrary then require(parent.BuildExperiencePlaytestLaunch.PlaytestRejoin) else nil
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
	local var2 = if typeof(p1) == "table" then p1.visualItem else nil
	local var3 = if typeof(var2) == "table" then var2.actionEventParams else nil
	
	if typeof(var3) ~= "string" or var3 == "" then
		return nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, var3)
	
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

local _ = function(p1, p2)
	-- upvalues: leaveExperienceModule (ref), default (ref)
	if p2 then
		leaveExperienceModule(function()
			-- upvalues: default (copy), p1 (ref)
			default:detectURL(p1)
		end)
		
		return
	end
	default:detectURL(p1)
end

local function routeToBuildChat(p1, p2, p3)
	-- upvalues: getCurrentExperienceProjectModule (ref), getPlayButtonStoreModule (ref), resumeNotification (ref), leaveExperienceModule (ref), default (ref)
	if p2 and p3 then
		local var2 = getCurrentExperienceProjectModule()
		
		if p1.universeId ~= nil and var2.universeId == p1.universeId then
			local var3 = getPlayButtonStoreModule()
			var3.setResumeTarget({
				universeId = p1.universeId,
				placeId = var2.placeId,
				sessionId = p1.sessionId
			})
			var3.setIsActive(true)
			
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
	-- upvalues: getCreatorAgentResumeStoreModule (ref), reactModule (ref), realtimeDeliveryModule (ref), notificationService (ref), var1 (ref), fFlagBuildAdUpsell (ref), adsCampaignNotificationModule (ref), lifecycleEvents (ref), leaveExperienceModule (ref), default (ref), default_1 (ref), resumeNotification (ref), messageBusService (ref), toastNotificationProtocolConstants (ref), decodeActionParams (ref), routeToBuildChat (ref)
	local var2 = getCreatorAgentResumeStoreModule()
	local var3 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), realtimeDeliveryModule (copy), notificationService (copy)
		return p1.RobloxEventReceiver or realtimeDeliveryModule.RobloxEventReceiver.new(notificationService)
	end, { p1.RobloxEventReceiver })
	local var4 = p1.isInExperience == true
	local var5 = p1.isBuildModeActive == true
	reactModule.useEffect(function()
		-- upvalues: var1 (copy), var4 (ref)
		return if var1 == nil or var4 then nil else var1.listen()
	end, { var4 })
	
	if fFlagBuildAdUpsell then
		reactModule.useEffect(function()
			-- upvalues: adsCampaignNotificationModule (copy), lifecycleEvents (copy), var4 (ref), leaveExperienceModule (copy), default (copy), default_1 (copy)
			return adsCampaignNotificationModule.connect(lifecycleEvents, function(p2)
				-- upvalues: var4 (copy), leaveExperienceModule (copy), default (copy)
				if var4 then
					leaveExperienceModule(function()
						-- upvalues: default (copy), p2 (ref)
						default:detectURL(p2)
					end)
					
					return
				end
				default:detectURL(p2)
			end, function(p2)
				-- upvalues: default_1 (copy)
				default_1:dismissNotification(p2)
			end)
		end, { var4 })
	end
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), resumeNotification (copy), var2 (ref), messageBusService (copy), toastNotificationProtocolConstants (copy)
		local capRtnNamespace = var3:observeEvent(resumeNotification.CapRtnNamespace, function(p2)
			-- upvalues: resumeNotification (copy), var2 (copy), messageBusService (copy), toastNotificationProtocolConstants (copy)
			local var6 = resumeNotification.classifyRtnDetail(p2)
			
			if var6 == nil then return end
			if resumeNotification.targetMatchesNotification(var2.getActiveTarget(false), var6) then
				return
			end
			messageBusService:Publish(toastNotificationProtocolConstants.MESSAGE_DISPLAY_TOAST_NOTIF, resumeNotification.buildToastNotification(var6))
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
	end, { var3, var2 })
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), resumeNotification (copy), decodeActionParams (copy), default_1 (copy), routeToBuildChat (copy), var4 (ref), var5 (ref)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, resumeNotification.NotificationType, function(p2)
			-- upvalues: resumeNotification (copy), decodeActionParams (copy), default_1 (copy), routeToBuildChat (copy), var4 (copy), var5 (copy)
			if typeof(p2) ~= "table" or p2.userActionType ~= "click" or (typeof(p2.visualItem) ~= "table" or p2.visualItem.eventName ~= resumeNotification.ResumeEventName) or typeof(p2.notificationData) ~= "table" then return end
			local var6 = decodeActionParams(p2)
			
			if var6 == nil then
				return
			end
			default_1:dismissNotification(p2.notificationData.id)
			routeToBuildChat(var6, var4, var5)
		end)
		
		return function()
			-- upvalues: userAction (ref)
			userAction()
		end
	end, { var4, var5 })
	
	return nil
end