local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local Parent = FriendsCalling.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local ToastNotificationModule = require(Parent.ToastNotification)
local CallingStatusModule = require(FriendsCalling.Enums.CallingStatus)
local LifecycleEvents = ToastNotificationModule.LifecycleEvents
local NotificationTypeEnum = ToastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local Default = require(Parent.ToastNotificationsProtocol).ToastNotificationProtocol.default

local function _(p1) --[[ Line: 26 | Named "decodeObject" ]]
	-- upvalues: HttpService (copy)
	if type(p1) == "string" then
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, p1)
		
		return if Success and type(Result) == "table" then Result else nil
	else
		return nil
	end
end

local _ = function(p1) --[[ Line: 35 | Named "decodeCallId" ]]
	-- upvalues: HttpService (copy)
	local v1 = nil
	if type(p1) == "string" then
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, p1)
		v1 = if Success and type(Result) == "table" then Result else nil
	else
		v1 = nil
	end
	local v2 = v1
	
	if v2 then
		local CallData = v1.callData
		
		if type(CallData) == "string" then
			local Success1, Result1 = pcall(HttpService.JSONDecode, HttpService, CallData)
			v2 = if Success1 and type(Result1) == "table" then Result1 else nil
		else
			v2 = nil
		end
	end
	local CallId = v2 and v2.callId
	
	return if type(CallId) == "string" and CallId ~= "" then CallId else nil
end

return function(p1) --[[ Line: 42 | Named "VoiceCallReceivedEventReceiver" ]]
	-- upvalues: ReactModule (copy), Default (copy), NotificationTypeEnum (copy), HttpService (copy), CallingStatusModule (copy), UseEventConnectionFunction (copy), LifecycleEvents (copy)
	local CallingService = p1.callingService or game:GetService("CallingService")
	local UseRefResult = ReactModule.useRef({})
	
	local function _(p2) --[[ Line: 47 | Named "forgetToast" ]]
		-- upvalues: UseRefResult (copy)
		for i, value in UseRefResult.current do
			if value == p2 then
				UseRefResult.current[i] = nil
				break
			end
		end
	end
	
	ReactModule.useEffect(function() --[[ Line: 56 ]]
		-- upvalues: Default (upval), NotificationTypeEnum (upval), HttpService (upval), UseRefResult (copy)
		local ListenToDisplayNotificationResult = Default:listenToDisplayNotification(function(p3) --[[ Line: 57 ]]
			-- upvalues: NotificationTypeEnum (upval), HttpService (upval), UseRefResult (upval)
			if p3 == nil or p3.notificationType ~= NotificationTypeEnum.VoiceCallReceived then return end
			local LifecycleData = p3.lifecycleData
			local v1 = nil
			
			if type(LifecycleData) == "string" then
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, LifecycleData)
				v1 = if Success and type(Result) == "table" then Result else nil
			else
				v1 = nil
			end
			local v2 = v1
			
			if v2 then
				local CallData = v1.callData
				
				if type(CallData) == "string" then
					local Success1, Result1 = pcall(HttpService.JSONDecode, HttpService, CallData)
					v2 = if Success1 and type(Result1) == "table" then Result1 else nil
				else
					v2 = nil
				end
			end
			local CallId = v2 and v2.callId
			local CallId1 = if type(CallId) == "string" and CallId ~= "" then CallId else nil
			
			if CallId1 ~= nil then
				UseRefResult.current[CallId1] = p3.notificationId
				
				return
			end
		end)
		local ListenToDismissNotificationResult = Default:listenToDismissNotification(function(p3) --[[ Line: 70 ]]
			-- upvalues: UseRefResult (upval)
			if p3 ~= nil then
				local NotificationId = p3.notificationId
				
				for i, value in UseRefResult.current do
					if value == NotificationId then
						UseRefResult.current[i] = nil
						break
					end
				end
			end
		end)
		
		return function() --[[ Line: 76 ]]
			-- upvalues: ListenToDisplayNotificationResult (copy), ListenToDismissNotificationResult (copy)
			ListenToDisplayNotificationResult:Disconnect()
			ListenToDismissNotificationResult:Disconnect()
		end
	end, {})
	UseEventConnectionFunction(CallingService.OnCallingStateChange, (ReactModule.useCallback(function(p3) --[[ Line: 82 ]]
		-- upvalues: UseRefResult (copy), CallingStatusModule (upval), Default (upval)
		local CurrentEntry = UseRefResult.current[p3.callId]
		
		if CurrentEntry == nil or p3.status == CallingStatusModule.Ringing then return end
		UseRefResult.current[p3.callId] = nil
		
		if p3.status == CallingStatusModule.Missed then
			Default:updateNotification(CurrentEntry, "missed")
			
			return
		else
			Default:dismissNotification(CurrentEntry)
		end
	end, {})))
	ReactModule.useEffect(function() --[[ Line: 99 ]]
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), HttpService (upval), CallingService (copy)
		return LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, NotificationTypeEnum.VoiceCallReceived, function(p3) --[[ Line: 103 ]]
			-- upvalues: HttpService (upval), CallingService (upval)
			local VisualItem = p3 and p3.visualItem
			
			if p3 == nil or p3.userActionType ~= "click" or VisualItem == nil then return end
			local ActionEventParams = VisualItem.actionEventParams
			local v1 = nil
			
			if type(ActionEventParams) == "string" then
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, ActionEventParams)
				v1 = if Success and type(Result) == "table" then Result else nil
			else
				v1 = nil
			end
			local v2 = v1
			
			if v2 then
				local CallData = v1.callData
				
				if type(CallData) == "string" then
					local Success1, Result1 = pcall(HttpService.JSONDecode, HttpService, CallData)
					v2 = if Success1 and type(Result1) == "table" then Result1 else nil
				else
					v2 = nil
				end
			end
			local CallId = v2 and v2.callId
			local CallId1 = if type(CallId) == "string" and CallId ~= "" then CallId else nil
			
			if CallId1 == nil then return end
			if VisualItem.visualItemName == "AnswerCall" then
				CallingService:AnswerIncomingCall(CallId1)
				
				return
			end
			if VisualItem.visualItemName == "DeclineCall" then
				CallingService:EndCall(CallId1, "ToastEndAction")
			end
		end)
	end, { CallingService })
	
	return nil
end