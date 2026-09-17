local parent = script:FindFirstAncestor("FriendsCalling").Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local toastNotificationModule = require(parent.ToastNotification)
local lifecycleEvents = toastNotificationModule.LifecycleEvents
local notificationTypeEnum = toastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum

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
	-- upvalues: reactModule (ref), lifecycleEvents (ref), notificationTypeEnum (ref), httpService (ref)
	local callingService = p1.callingService or game:GetService("CallingService")
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), httpService (copy), callingService (ref)
		return lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.VoiceCallReceived, function(p2)
			-- upvalues: httpService (copy), callingService (copy)
			local visualItem = p2 and p2.visualItem
			
			if p2 == nil or p2.userActionType ~= "click" or visualItem == nil then return end
			local var1, ok
			local actionEventParams = visualItem.actionEventParams
			
			if type(actionEventParams) == "string" then
				ok, status = pcall(httpService.JSONDecode, httpService, actionEventParams)
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
			local var2 = if type(callId) == "string" and callId ~= "" then callId else nil
			
			if var2 == nil then return end
			if visualItem.visualItemName == "AnswerCall" then
				callingService:AnswerIncomingCall(var2)
				
				return
			elseif visualItem.visualItemName == "DeclineCall" then
				callingService:EndCall(var2, "ToastEndAction")
			end
		end)
	end, { callingService })
	
	return nil
end