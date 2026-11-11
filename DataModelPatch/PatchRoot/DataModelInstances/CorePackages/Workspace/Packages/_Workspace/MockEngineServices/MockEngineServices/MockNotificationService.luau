local MockNotificationService = {}
MockNotificationService.__index = MockNotificationService

function MockNotificationService:ScheduleNotification(_, _, _) end

function MockNotificationService:CancelNotification(_) end

function MockNotificationService:CancelAllNotification() end

function MockNotificationService:GetScheduledNotifications() end

function MockNotificationService:ActionEnabled() end

function MockNotificationService:ActionTaken() end

function MockNotificationService:GetPropertyChangedSignal(p1)
	if p1 == "SelectedTheme" then
		return self._selectedThemeChanged.Event
	else
		error(("%s is not a valid property name"):format((tostring(p1))))
	end
end

function MockNotificationService.new()
	-- upvalues: MockNotificationService (copy)
	local config = {
		SelectedTheme = "",
		_selectedThemeChanged = Instance.new("BindableEvent")
	}
	setmetatable(config, MockNotificationService)
	config.RobloxEventReceived = { BindableEvent = Instance.new("BindableEvent") }
	config.RobloxConnectionChanged = { BindableEvent = Instance.new("BindableEvent") }
	config.RccEventReceived = { BindableEvent = Instance.new("BindableEvent") }
	config.RccConnectionChanged = { BindableEvent = Instance.new("BindableEvent") }
	
	function config.RobloxEventReceived:Connect(Callback)
		-- upvalues: config (copy)
		return config.RobloxEventReceived.BindableEvent.Event:Connect(Callback)
	end
	
	function config.RobloxEventReceived:Fire(p1)
		-- upvalues: config (copy)
		config.RobloxEventReceived.BindableEvent:Fire(p1)
	end
	
	function config.RobloxConnectionChanged:Connect(Callback)
		-- upvalues: config (copy)
		return config.RobloxConnectionChanged.BindableEvent.Event:Connect(Callback)
	end
	
	function config.RobloxConnectionChanged:Fire(p1, p2, p3, p4)
		-- upvalues: config (copy)
		config.RobloxConnectionChanged.BindableEvent:Fire(p1, p2, p3, p4)
	end
	
	function config.RccEventReceived:Connect(Callback)
		-- upvalues: config (copy)
		return config.RccEventReceived.BindableEvent.Event:Connect(Callback)
	end
	
	function config.RccEventReceived:Fire(p1, p2)
		-- upvalues: config (copy)
		config.RccEventReceived.BindableEvent:Fire(p1, p2)
	end
	
	function config.RccConnectionChanged:Connect(Callback)
		-- upvalues: config (copy)
		return config.RccConnectionChanged.BindableEvent.Event:Connect(Callback)
	end
	
	function config.RccConnectionChanged:Fire(p1, p2, p3, p4)
		-- upvalues: config (copy)
		config.RccConnectionChanged.BindableEvent:Fire(p1, p2, p3, p4)
	end
	
	config._subscribeToRccEventNamespaceCalls = {}
	
	function config.SubscribeToRccEventNamespace(p1, p2)
		table.insert(p1._subscribeToRccEventNamespaceCalls, p2)
	end
	
	return config
end

return MockNotificationService