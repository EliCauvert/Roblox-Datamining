local TopicSourceModule = {}
TopicSourceModule.__index = TopicSourceModule

local function pcallOrWarn(p1, OnConnected, ...)
	local Success, Result = pcall(OnConnected, ...)
	
	if not Success then
		warn(`TopicSource: {p1} failed: {Result}`)
	end
end

local function _(List, p1, p2, Callback)
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy), p2 (copy)
		return p1[p2]
	end)
	
	if Success and Result then
		table.insert(List, Result:Connect(Callback))
	end
end

local _ = function(p1): boolean
	return type(p1) == "table" and (type(p1.token) == "string" and type(p1.shouldExchange) == "boolean") and type(p1.isSubscribable) == "boolean"
end

local _ = function(p1): boolean
	return type(p1) == "table" and (type(p1.token) == "string" and type(p1.errorCode) == "string") and type(p1.shouldRetry) == "boolean"
end

function TopicSourceModule.new(_notificationService)
	-- upvalues: TopicSourceModule (copy)
	return (setmetatable({
		_connections = nil,
		_notificationService = _notificationService
	}, TopicSourceModule))
end

function TopicSourceModule:subscribe(Token, p1)
	-- upvalues: pcallOrWarn (copy)
	local NotificationService = self._notificationService
	pcallOrWarn("SubscribeToTopic", function()
		-- upvalues: NotificationService (copy), Token (copy), p1 (copy)
		NotificationService:SubscribeToTopic(Token, p1 or "")
	end)
end

function TopicSourceModule:unsubscribe(Token)
	-- upvalues: pcallOrWarn (copy)
	local NotificationService = self._notificationService
	pcallOrWarn("UnsubscribeFromTopic", function()
		-- upvalues: NotificationService (copy), Token (copy)
		NotificationService:UnsubscribeFromTopic(Token)
	end)
end

function TopicSourceModule:startListening(p1)
	-- upvalues: pcallOrWarn (copy)
	if self._connections then return end
	local OnNotification = p1.onNotification
	local OnConnected = p1.onConnected
	local OnTokenExpiry = p1.onTokenExpiry
	local OnSubscriptionError = p1.onSubscriptionError
	local NotificationService = self._notificationService
	local List = {
		NotificationService.TopicNotificationReceived:Connect(function(EventData)
			-- upvalues: pcallOrWarn (upval), OnNotification (copy)
			if type(EventData) == "table" and type(EventData.topicId) == "string" then
				pcallOrWarn("onNotification", OnNotification, EventData.topicId, if type(EventData.detail) == "string" then EventData.detail else "")
			end
		end),
		NotificationService.RobloxConnectionChanged:Connect(function(ConnectionName, ConnectionState)
			-- upvalues: pcallOrWarn (upval), OnConnected (copy)
			if ConnectionName == "signalR" and ConnectionState == Enum.ConnectionState.Connected then
				pcallOrWarn("onConnected", OnConnected)
			end
		end)
	}
	self._connections = List
	
	if OnTokenExpiry then
		local function Callback(p2)
			-- upvalues: pcallOrWarn (upval), OnTokenExpiry (copy)
			if type(p2) == "table" and (type(p2.token) == "string" and (type(p2.shouldExchange) == "boolean" and type(p2.isSubscribable) == "boolean")) then
				pcallOrWarn("onTokenExpiry", OnTokenExpiry, p2.token, p2.shouldExchange, p2.isSubscribable, p2.subscriptionActive == true)
			end
		end
		
		local v1 = "TopicTokenExpiry"
		local Success, Result = pcall(function()
			-- upvalues: NotificationService (copy), v1 (copy)
			return NotificationService[v1]
		end)
		
		if Success and Result then
			table.insert(List, Result:Connect(Callback))
		end
	end
	if OnSubscriptionError then
		local function Callback(p2)
			-- upvalues: pcallOrWarn (upval), OnSubscriptionError (copy)
			if type(p2) == "table" and (type(p2.token) == "string" and (type(p2.errorCode) == "string" and type(p2.shouldRetry) == "boolean")) then
				pcallOrWarn("onSubscriptionError", OnSubscriptionError, p2.token, p2.errorCode, p2.shouldRetry)
			end
		end
		
		local v2 = "TopicSubscriptionError"
		local Success1, Result1 = pcall(function()
			-- upvalues: NotificationService (copy), v2 (copy)
			return NotificationService[v2]
		end)
		
		if Success1 and Result1 then
			table.insert(List, Result1:Connect(Callback))
		end
	end
end

function TopicSourceModule:stopListening()
	local Connections = self._connections
	
	if Connections == nil then return end
	self._connections = nil
	
	for _, connection in Connections do
		connection:Disconnect()
	end
end

return TopicSourceModule