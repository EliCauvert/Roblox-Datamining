local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local Parent = FriendsCalling.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local NewResult = require(Parent.Loggers).Logger:new(script.Name)
local ToastNotificationModule = require(Parent.ToastNotification)
local ToastNotificationsProtocolModule = require(Parent.ToastNotificationsProtocol)
local CallingStatusModule = require(FriendsCalling.Enums.CallingStatus)
local LifecycleEvents = ToastNotificationModule.LifecycleEvents
local NotificationTypeEnum = ToastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum
local UseEventConnectionFunction = ReactUtilsModule.useEventConnection
local Default = ToastNotificationsProtocolModule.ToastNotificationProtocol.default

return function(p1)
	-- upvalues: ReactModule (copy), Default (copy), NotificationTypeEnum (copy), HttpService (copy), CallingStatusModule (copy), UseEventConnectionFunction (copy), LifecycleEvents (copy), NewResult (copy)
	local CallingService = p1.callingService or game:GetService("CallingService")
	local FriendsCallingService = p1.friendsCallingService or game:GetService("FriendsCallingService")
	local UseRefResult = ReactModule.useRef({})
	
	local function _(p2)
		-- upvalues: UseRefResult (copy)
		for i, value in UseRefResult.current do
			if value == p2 then
				UseRefResult.current[i] = nil
				break
			end
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: Default (upval), NotificationTypeEnum (upval), HttpService (upval), CallingService (copy), UseRefResult (copy), FriendsCallingService (copy), CallingStatusModule (upval)
		local ListenToDisplayNotificationResult = Default:listenToDisplayNotification(function(p3)
			-- upvalues: NotificationTypeEnum (upval), HttpService (upval), CallingService (upval), UseRefResult (upval), FriendsCallingService (upval), CallingStatusModule (upval), Default (upval)
			if p3 == nil or p3.notificationType ~= NotificationTypeEnum.VoiceCallReceived then return end
			local CallData = HttpService:JSONDecode(p3.lifecycleData).callData
			local CallId = HttpService:JSONDecode(CallData).callId
			local Status = CallingService:GetCallingState(CallId).status
			local IsMissed: boolean = p3.content ~= nil and p3.content.currentState == "missed"
			
			if Status == nil then
				UseRefResult.current[CallId] = p3.notificationId
				FriendsCallingService:ReceiveCall(CallData)
				
				return
			end
			if Status == CallingStatusModule.Ringing then
				UseRefResult.current[CallId] = p3.notificationId
				
				return
			end
			if Status ~= CallingStatusModule.Missed then
				Default:dismissNotification(p3.notificationId)
			elseif not IsMissed then
				Default:updateNotification(p3.notificationId, "missed")
				
				return
			end
		end)
		local ListenToDismissNotificationResult = Default:listenToDismissNotification(function(p3)
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
		
		return function()
			-- upvalues: ListenToDisplayNotificationResult (copy), ListenToDismissNotificationResult (copy)
			ListenToDisplayNotificationResult:Disconnect()
			ListenToDismissNotificationResult:Disconnect()
		end
	end, { CallingService, FriendsCallingService })
	UseEventConnectionFunction(CallingService.OnCallingStateChange, (ReactModule.useCallback(function(p3)
		-- upvalues: UseRefResult (copy), CallingStatusModule (upval), Default (upval)
		local CurrentEntry = UseRefResult.current[p3.callId]
		
		if CurrentEntry == nil then return end
		if p3.status == CallingStatusModule.Ringing then return end
		if p3.status == CallingStatusModule.Missed then
			UseRefResult.current[p3.callId] = nil
			Default:updateNotification(CurrentEntry, "missed")
			
			return
		else
			UseRefResult.current[p3.callId] = nil
			Default:dismissNotification(CurrentEntry)
		end
	end, {})))
	ReactModule.useEffect(function()
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), HttpService (upval), FriendsCallingService (copy), NewResult (upval)
		return LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, NotificationTypeEnum.VoiceCallReceived, function(p3)
			-- upvalues: HttpService (upval), FriendsCallingService (upval), NewResult (upval)
			local VisualItem = p3 and p3.visualItem
			
			if p3 == nil or p3.userActionType ~= "click" or VisualItem == nil then return end
			local CallId = HttpService:JSONDecode(HttpService:JSONDecode(VisualItem.actionEventParams).callData).callId
			
			if VisualItem.visualItemName == "AnswerCall" then
				for _, FriendsCallingInstance in FriendsCallingService:GetChildren() do
					if FriendsCallingInstance.ClassName == "FriendsCallingInstance" and FriendsCallingInstance.CallId ~= "" and FriendsCallingInstance.CallId ~= CallId then
						NewResult:warning("Answering {} while {} is still up", CallId, FriendsCallingInstance.CallId)
						break
					end
				end
				FriendsCallingService:AnswerCall(CallId)
				
				return
			elseif VisualItem.visualItemName == "DeclineCall" then
				FriendsCallingService:EndCall(CallId, "ToastEndAction")
			end
		end)
	end, { CallingService, FriendsCallingService })
	
	return nil
end