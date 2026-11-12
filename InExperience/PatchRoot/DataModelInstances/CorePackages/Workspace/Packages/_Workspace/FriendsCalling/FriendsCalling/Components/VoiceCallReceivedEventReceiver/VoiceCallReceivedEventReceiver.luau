local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local Parent = FriendsCalling.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local NewResult = require(Parent.Loggers).Logger:new(script.Name)
local ToastNotificationModule = require(Parent.ToastNotification)
local CallingStatusModule = require(FriendsCalling.Enums.CallingStatus)
local FFlagFriendsCallingServiceLuaMigrationModule = require(Parent.SharedFlags.FFlagFriendsCallingServiceLuaMigration)
local LifecycleEvents = ToastNotificationModule.LifecycleEvents
local NotificationTypeEnum = ToastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local Default = require(Parent.ToastNotificationsProtocol).ToastNotificationProtocol.default

return function(p1)
	-- upvalues: FFlagFriendsCallingServiceLuaMigrationModule (copy), ReactModule (copy), Default (copy), NotificationTypeEnum (copy), HttpService (copy), CallingStatusModule (copy), UseEventConnectionFunction (copy), LifecycleEvents (copy), NewResult (copy)
	local CallingService = p1.callingService or game:GetService("CallingService")
	local FriendsCallingService = if FFlagFriendsCallingServiceLuaMigrationModule then p1.friendsCallingService or game:GetService("FriendsCallingService") else nil
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
		-- upvalues: Default (upval), NotificationTypeEnum (upval), HttpService (upval), CallingService (copy), UseRefResult (copy), FFlagFriendsCallingServiceLuaMigrationModule (upval), FriendsCallingService (ref), CallingStatusModule (upval)
		local ListenToDisplayNotificationResult = Default:listenToDisplayNotification(function(p3)
			-- upvalues: NotificationTypeEnum (upval), HttpService (upval), CallingService (upval), UseRefResult (upval), FFlagFriendsCallingServiceLuaMigrationModule (upval), FriendsCallingService (upval), CallingStatusModule (upval), Default (upval)
			if p3 == nil or p3.notificationType ~= NotificationTypeEnum.VoiceCallReceived then return end
			local CallData = HttpService:JSONDecode(p3.lifecycleData).callData
			local CallId = HttpService:JSONDecode(CallData).callId
			local Status = CallingService:GetCallingState(CallId).status
			local IsMissed: boolean = p3.content ~= nil and p3.content.currentState == "missed"
			
			if Status == nil then
				UseRefResult.current[CallId] = p3.notificationId
				
				if FFlagFriendsCallingServiceLuaMigrationModule then
					FriendsCallingService:ReceiveCall(CallData)
					
					return
				else
					CallingService:ReceiveIncomingCall(CallData)
					
					return
				end
			elseif Status == CallingStatusModule.Ringing then
				UseRefResult.current[CallId] = p3.notificationId
				
				return
			else
				if Status ~= CallingStatusModule.Missed then
					Default:dismissNotification(p3.notificationId)
				elseif not IsMissed then
					Default:updateNotification(p3.notificationId, "missed")
					
					return
				end
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
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), HttpService (upval), FFlagFriendsCallingServiceLuaMigrationModule (upval), FriendsCallingService (ref), NewResult (upval), CallingService (copy)
		return LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, NotificationTypeEnum.VoiceCallReceived, function(p3)
			-- upvalues: HttpService (upval), FFlagFriendsCallingServiceLuaMigrationModule (upval), FriendsCallingService (upval), NewResult (upval), CallingService (upval)
			local VisualItem = p3 and p3.visualItem
			
			if p3 == nil or p3.userActionType ~= "click" or VisualItem == nil then return end
			local CallId = HttpService:JSONDecode(HttpService:JSONDecode(VisualItem.actionEventParams).callData).callId
			
			if VisualItem.visualItemName == "AnswerCall" then
				if FFlagFriendsCallingServiceLuaMigrationModule then
					for _, FriendsCallingInstance in FriendsCallingService:GetChildren() do
						if FriendsCallingInstance.ClassName == "FriendsCallingInstance" and FriendsCallingInstance.CallId ~= "" and FriendsCallingInstance.CallId ~= CallId then
							NewResult:warning("Answering {} while {} is still up", CallId, FriendsCallingInstance.CallId)
							break
						end
					end
					FriendsCallingService:AnswerCall(CallId)
					
					return
				else
					local CallingState = CallingService:GetCallingState()
					
					if CallingState.callId ~= nil and CallingState.callId ~= CallId then
						NewResult:warning("Answering {} while {} is still up", CallId, CallingState.callId)
					end
					CallingService:AnswerIncomingCall(CallId)
					
					return
				end
			elseif VisualItem.visualItemName == "DeclineCall" then
				if FFlagFriendsCallingServiceLuaMigrationModule then
					FriendsCallingService:EndCall(CallId, "ToastEndAction")
					
					return
				end
				CallingService:EndCall(CallId, "ToastEndAction")
			end
		end)
	end, { CallingService, FriendsCallingService })
	
	return nil
end