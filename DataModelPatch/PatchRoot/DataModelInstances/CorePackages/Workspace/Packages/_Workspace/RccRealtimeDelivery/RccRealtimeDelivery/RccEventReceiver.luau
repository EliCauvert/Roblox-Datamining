local _ = require(script.Parent.RccRealtimeTypes)
local Signal = require(script:FindFirstAncestor("RccRealtimeDelivery").Parent.AppCommonLib).Signal
local HttpService = game:GetService("HttpService")
local RccEventReceiverModule = {}
RccEventReceiverModule.__index = RccEventReceiverModule

function RccEventReceiverModule.new(NotificationService)
	-- upvalues: Signal (copy), RccEventReceiverModule (copy), HttpService (copy)
	assert(NotificationService, "Expected notificationService to be provided")
	assert(NotificationService.RccEventReceived, "Expected notificationService to have RccEventReceived signal")
	assert(NotificationService.RccConnectionChanged, "Expected notificationService to have RccConnectionChanged signal")
	assert(NotificationService.SubscribeToRccEventNamespace, "Expected notificationService to have SubscribeToRccEventNamespace")
	local config = {
		namespaceTable = {},
		notificationService = NotificationService,
		connectionStateSignal = Signal.new(),
		connections = {}
	}
	setmetatable(config, RccEventReceiverModule)
	config.connections = {
		NotificationService.RccEventReceived:Connect(function(EventData, UserId)
			-- upvalues: config (copy), HttpService (upval)
			local Namespace = config.namespaceTable[EventData.namespace]
			
			if Namespace == nil then return end
			local Detail = nil
			if EventData.detail and EventData.detail ~= "" then
				local Success, Result = pcall(function()
					-- upvalues: HttpService (upval), EventData (copy)
					return HttpService:JSONDecode(EventData.detail)
				end)
				Detail = if Success then Result else EventData.detail
			else
				Detail = {}
			end
			Namespace:fire(Detail, EventData.detailType, UserId)
		end),
		NotificationService.RccConnectionChanged:Connect(function(ConnectionName, ConnectionState, RccSequenceNumber, UserIdToNamespaceSequenceNumbers)
			-- upvalues: config (copy)
			local Namespace = config.namespaceTable[ConnectionName]
			
			if Namespace ~= nil then
				Namespace:fire(ConnectionState, RccSequenceNumber, UserIdToNamespaceSequenceNumbers)
				
				return
			end
		end)
	}
	
	return config
end

function RccEventReceiverModule:observeEvent(EventNamespace, Callback)
	-- upvalues: Signal (copy)
	assert(type(EventNamespace) == "string", "Expected namespace to be a string")
	assert(type(Callback) == "function", "Expected callback to be a function")
	local Namespace = self.namespaceTable[EventNamespace]
	
	if Namespace == nil then
		Namespace = Signal.new()
		self.namespaceTable[EventNamespace] = Namespace
		self.notificationService:SubscribeToRccEventNamespace(EventNamespace)
	end
	return Namespace:connect(Callback)
end

return RccEventReceiverModule