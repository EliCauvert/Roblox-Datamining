local t = {}
t.__index = t

local function pcallOrWarn(p1, p2, ...)
	local ok, status = pcall(p2, ...)
	
	if not ok then
		warn(`TopicSource: {p1} failed: {status}`)
	end
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

function t:startListening(p1, p2)
	-- upvalues: pcallOrWarn (ref)
	if self._connections then
		return
	end
	local notificationService = self._notificationService
	self._connections = {
		notificationService.TopicNotificationReceived:Connect(function(p3)
			-- upvalues: pcallOrWarn (copy), p1 (ref)
			if type(p3) == "table" and type(p3.topicId) == "string" then
				pcallOrWarn("onNotification", p1, p3.topicId, if type(p3.detail) == "string" then p3.detail else "")
			end
		end),
		notificationService.RobloxConnectionChanged:Connect(function(p3, p4)
			-- upvalues: pcallOrWarn (copy), p2 (ref)
			if p3 == "signalR" and p4 == Enum.ConnectionState.Connected then
				pcallOrWarn("onConnected", p2)
			end
		end)
	}
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