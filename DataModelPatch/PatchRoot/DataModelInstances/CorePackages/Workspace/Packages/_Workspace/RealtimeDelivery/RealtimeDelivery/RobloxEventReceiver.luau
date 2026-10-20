local Signal = require(script:FindFirstAncestor("RealtimeDelivery").Parent.AppCommonLib).Signal
local HttpService = game:GetService("HttpService")
local RobloxEventReceiverModule = {}
RobloxEventReceiverModule.__index = RobloxEventReceiverModule

function RobloxEventReceiverModule:observeEvent(p1, Callback)
	-- upvalues: Signal (copy)
	assert(type(p1) == "string", "Expected namespace to be a string")
	assert(type(Callback) == "function", "Expected callback to be a function")
	local Namespace = self.namespaceTable[p1]
	
	if Namespace == nil then
		Namespace = Signal.new()
		self.namespaceTable[p1] = Namespace
	end
	return Namespace:connect(Callback)
end

function RobloxEventReceiverModule.new(NotificationService)
	-- upvalues: RobloxEventReceiverModule (copy), HttpService (copy)
	local config = { namespaceTable = {} }
	setmetatable(config, RobloxEventReceiverModule)
	config.connections = {
		NotificationService.RobloxEventReceived:Connect(function(EventData)
			-- upvalues: config (copy), HttpService (upval)
			local Namespace = config.namespaceTable[EventData.namespace]
			
			if Namespace == nil then return end
			local t = nil
			if EventData.detail and EventData.detail ~= "" then
				local Success, Result = pcall(function()
					-- upvalues: HttpService (upval), EventData (copy)
					return HttpService:JSONDecode(EventData.detail)
				end)
				t = Success and Result or EventData.detail
			else
				t = {}
			end
			Namespace:fire(t, EventData.detailType)
		end),
		NotificationService.RobloxConnectionChanged:Connect(function(ConnectionName, ConnectionState, SequenceNumber, NamespaceSequenceNumbers)
			-- upvalues: config (copy), HttpService (upval)
			local Namespace = config.namespaceTable[ConnectionName]
			
			if Namespace == nil then return end
			local v1 = nil
			
			if NamespaceSequenceNumbers then
				local Success, Result = pcall(function()
					-- upvalues: HttpService (upval), NamespaceSequenceNumbers (copy)
					return HttpService:JSONDecode(NamespaceSequenceNumbers)
				end)
				v1 = if Success then Result else {}
			end
			Namespace:fire(ConnectionState, SequenceNumber, v1)
		end)
	}
	
	return config
end

return RobloxEventReceiverModule