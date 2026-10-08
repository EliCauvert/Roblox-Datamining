local friendsCalling = script:FindFirstAncestor("FriendsCalling")
local parent = friendsCalling.Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local toastNotificationModule = require(parent.ToastNotification)
local toastNotificationsProtocolModule = require(parent.ToastNotificationsProtocol)
local callingStatusModule = require(friendsCalling.Enums.CallingStatus)
local lifecycleEvents = toastNotificationModule.LifecycleEvents
local notificationTypeEnum = toastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum
local useEventConnection = reactUtilsModule.useEventConnection
local default = toastNotificationsProtocolModule.ToastNotificationProtocol.default

local function _(p1)
	-- upvalues: httpService (ref)
	if type(p1) ~= "string" then
		return nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, p1)
	
	return if ok and type(status) == "table" then status else nil
end

local _ = function(p1)
	-- upvalues: httpService (ref)
	local var1, ok
	if type(p1) == "string" then
		ok, status = pcall(httpService.JSONDecode, httpService, p1)
		var1 = if ok and type(status) == "table" then status else nil
	else
		var1 = nil
	end
	ok = var1
	
	if ok then
		local callData = var1.callData
		
		if type(callData) == "string" then
			local ok_1, status = pcall(httpService.JSONDecode, httpService, callData)
			ok = if ok_1 and type(status) == "table" then status else nil
		else
			ok = nil
		end
	end
	local callId = ok and ok.callId
	
	return if type(callId) == "string" and callId ~= "" then callId else nil
end

return function(p1)
	-- upvalues: reactModule (ref), default (ref), notificationTypeEnum (ref), httpService (ref), callingStatusModule (ref), useEventConnection (ref), lifecycleEvents (ref)
	local callingService = p1.callingService or game:GetService("CallingService")
	local var1 = reactModule.useRef({})
	
	local function _(p2)
		-- upvalues: var1 (ref)
		for i, v in var1.current do
			if v == p2 then
				var1.current[i] = nil
				
				return
			end
		end
	end
	
	reactModule.useEffect(function()
		-- upvalues: default (copy), notificationTypeEnum (copy), httpService (copy), var1 (ref)
		local var2 = default:listenToDisplayNotification(function(p3)
			-- upvalues: notificationTypeEnum (copy), httpService (copy), var1 (copy)
			if p3 == nil or p3.notificationType ~= notificationTypeEnum.VoiceCallReceived then return end
			local var3, ok
			local lifecycleData = p3.lifecycleData
			
			if type(lifecycleData) == "string" then
				ok, status = pcall(httpService.JSONDecode, httpService, lifecycleData)
				var3 = if ok and type(status) == "table" then status else nil
			else
				var3 = nil
			end
			ok = var3
			
			if ok then
				local callData = var3.callData
				
				if type(callData) == "string" then
					local ok_1, status = pcall(httpService.JSONDecode, httpService, callData)
					ok = if ok_1 and type(status) == "table" then status else nil
				else
					ok = nil
				end
			end
			local callId = ok and ok.callId
			local var4 = if type(callId) == "string" and callId ~= "" then callId else nil
			
			if var4 == nil then
				return
			end
			var1.current[var4] = p3.notificationId
		end)
		local var3 = default:listenToDismissNotification(function(p3)
			-- upvalues: var1 (copy)
			if p3 ~= nil then
				local notificationId = p3.notificationId
				
				for i, v in var1.current do
					if v == notificationId then
						var1.current[i] = nil
						
						return
					end
				end
			end
		end)
		
		return function()
			-- upvalues: var2 (ref), var3 (ref)
			var2:Disconnect()
			var3:Disconnect()
		end
	end, {})
	useEventConnection(callingService.OnCallingStateChange, reactModule.useCallback(function(p3)
		-- upvalues: var1 (ref), callingStatusModule (copy), default (copy)
		local callId = var1.current[p3.callId]
		
		if callId == nil or p3.status == callingStatusModule.Ringing then return end
		var1.current[p3.callId] = nil
		
		if p3.status == callingStatusModule.Missed then
			default:updateNotification(callId, "missed")
			
			return
		end
		default:dismissNotification(callId)
	end, {}))
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), httpService (copy), callingService (ref)
		return lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.VoiceCallReceived, function(p3)
			-- upvalues: httpService (copy), callingService (copy)
			local visualItem = p3 and p3.visualItem
			
			if p3 == nil or p3.userActionType ~= "click" or visualItem == nil then return end
			local var4, ok
			local actionEventParams = visualItem.actionEventParams
			
			if type(actionEventParams) == "string" then
				ok, status = pcall(httpService.JSONDecode, httpService, actionEventParams)
				var4 = if ok and type(status) == "table" then status else nil
			else
				var4 = nil
			end
			ok = var4
			
			if ok then
				local callData = var4.callData
				
				if type(callData) == "string" then
					local ok_1, status = pcall(httpService.JSONDecode, httpService, callData)
					ok = if ok_1 and type(status) == "table" then status else nil
				else
					ok = nil
				end
			end
			local callId = ok and ok.callId
			local var5 = if type(callId) == "string" and callId ~= "" then callId else nil
			
			if var5 == nil then return end
			if visualItem.visualItemName == "AnswerCall" then
				callingService:AnswerIncomingCall(var5)
				
				return
			elseif visualItem.visualItemName == "DeclineCall" then
				callingService:EndCall(var5, "ToastEndAction")
			end
		end)
	end, { callingService })
	
	return nil
end