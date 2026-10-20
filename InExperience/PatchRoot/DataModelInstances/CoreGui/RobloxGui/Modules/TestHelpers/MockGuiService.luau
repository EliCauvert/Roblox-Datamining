local MockGuiService = {}
MockGuiService.__index = MockGuiService

function MockGuiService.new()
	-- upvalues: MockGuiService (copy)
	local BindableEvent = Instance.new("BindableEvent")
	local config = {
		MenuIsOpen = false,
		broadcasts = {},
		NativeClose = {
			Connect = function(_, Callback)
				-- upvalues: BindableEvent (copy)
				return BindableEvent.Event:Connect(Callback)
			end
		},
		openedMenus = {}
	}
	setmetatable(config, { __index = MockGuiService })
	
	return config
end

function MockGuiService:SetMenuIsOpen(p1, Value)
	if p1 then
		table.insert(self.openedMenus, Value)
	else
		local FoundIndex: number? = table.find(self.openedMenus, Value)
		
		if FoundIndex then
			table.remove(self.openedMenus, FoundIndex)
		end
	end
	self.MenuIsOpen = #self.openedMenus > 0
end

function MockGuiService:BroadcastNotification(Data, Notification)
	table.insert(self.broadcasts, { data = Data, notification = Notification })
end

function MockGuiService:GetNotificationTypeList()
	return { NATIVE_EXIT = 35, RESTART_APP = 41 }
end

return MockGuiService