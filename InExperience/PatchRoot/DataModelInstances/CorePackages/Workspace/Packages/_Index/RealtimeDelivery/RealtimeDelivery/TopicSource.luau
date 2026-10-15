local t = {}
t.__index = t

local function pcallOrWarn(p1, p2, ...)
	local ok, status = pcall(p2, ...)
	
	if not ok then
		warn(`TopicSource: {p1} failed: {status}`)
	end
end

local function _(p1, p2, p3, p4)
	local ok, status = pcall(function()
		-- upvalues: p2 (ref), p3 (ref)
		return p2[p3]
	end)
	
	if ok and status then
		table.insert(p1, status:Connect(p4))
	end
end

local _ = function(p1)
	return type(p1) == "table" and (type(p1.token) == "string" and (type(p1.shouldExchange) == "boolean" and type(p1.isSubscribable) == "boolean"))
end

local _ = function(p1)
	return type(p1) == "table" and (type(p1.token) == "string" and (type(p1.errorCode) == "string" and type(p1.shouldRetry) == "boolean"))
end

function t.new(p1)
	-- upvalues: t (ref)
	return setmetatable({ _connections = nil, _notificationService = p1 }, t)
end

function t:subscribe(p1, p2)
	-- upvalues: pcallOrWarn (ref)
	local notificationService = self._notificationService
	pcallOrWarn("SubscribeToTopic", function()
		-- upvalues: notificationService (ref), p1 (ref), p2 (ref)
		notificationService:SubscribeToTopic(p1, p2 or "")
	end)
end

function t:unsubscribe(p1)
	-- upvalues: pcallOrWarn (ref)
	local notificationService = self._notificationService
	pcallOrWarn("UnsubscribeFromTopic", function()
		-- upvalues: notificationService (ref), p1 (ref)
		notificationService:UnsubscribeFromTopic(p1)
	end)
end

function t:startListening(p1)
	-- upvalues: pcallOrWarn (ref)
	if self._connections then return end
	local onNotification = p1.onNotification
	local onConnected = p1.onConnected
	local onTokenExpiry = p1.onTokenExpiry
	local onSubscriptionError = p1.onSubscriptionError
	local notificationService = self._notificationService
	local list = {
		notificationService.TopicNotificationReceived:Connect(function(p2)
			-- upvalues: pcallOrWarn (copy), onNotification (ref)
			if type(p2) == "table" and type(p2.topicId) == "string" then
				pcallOrWarn("onNotification", onNotification, p2.topicId, if type(p2.detail) == "string" then p2.detail else "")
			end
		end),
		notificationService.RobloxConnectionChanged:Connect(function(p2, p3)
			-- upvalues: pcallOrWarn (copy), onConnected (ref)
			if p2 == "signalR" and p3 == Enum.ConnectionState.Connected then
				pcallOrWarn("onConnected", onConnected)
			end
		end)
	}
	self._connections = list
	
	if onTokenExpiry then
		local var1 = function(p2)
			-- upvalues: pcallOrWarn (copy), onTokenExpiry (ref)
			if type(p2) == "table" and (type(p2.token) == "string" and (type(p2.shouldExchange) == "boolean" and type(p2.isSubscribable) == "boolean")) then
				pcallOrWarn("onTokenExpiry", onTokenExpiry, p2.token, p2.shouldExchange, p2.isSubscribable)
			end
		end
		
		local var2 = "TopicTokenExpiry"
		local ok, status = pcall(function()
			-- upvalues: notificationService (ref), var2 (ref)
			return notificationService[var2]
		end)
		
		if ok and status then
			table.insert(list, status:Connect(var1))
		end
	end
	if onSubscriptionError then
		local var3 = function(p2)
			-- upvalues: pcallOrWarn (copy), onSubscriptionError (ref)
			if type(p2) == "table" and (type(p2.token) == "string" and (type(p2.errorCode) == "string" and type(p2.shouldRetry) == "boolean")) then
				pcallOrWarn("onSubscriptionError", onSubscriptionError, p2.token, p2.errorCode, p2.shouldRetry)
			end
		end
		
		local var4 = "TopicSubscriptionError"
		local ok, status = pcall(function()
			-- upvalues: notificationService (ref), var4 (ref)
			return notificationService[var4]
		end)
		
		if ok and status then
			table.insert(list, status:Connect(var3))
		end
	end
end

function t:stopListening()
	local connections = self._connections
	
	if connections == nil then return end
	self._connections = nil
	
	for i, v in connections do
		v:Disconnect()
	end
end

return t