local MockGuiService = {}
MockGuiService.__index = MockGuiService

function MockGuiService.new() --[[ Line: 4 ]]
	-- upvalues: MockGuiService (copy)
	local BindableEvent = Instance.new("BindableEvent")
	local config = {
		MenuIsOpen = false,
		broadcasts = {},
		NativeClose = {
			Connect = function(_, Callback) --[[ Line: 10 ]]
				-- upvalues: BindableEvent (copy)
				return BindableEvent.Event:Connect(Callback)
			end
		},
		openedMenus = {}
	}
	setmetatable(config, { __index = MockGuiService })
	
	return config
end

function MockGuiService:SetMenuIsOpen(p1, Value) --[[ Line: 23 ]]
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

function MockGuiService:BroadcastNotification(Data, Notification) --[[ Line: 36 ]]
	table.insert(self.broadcasts, { data = Data, notification = Notification })
end

function MockGuiService:GetNotificationTypeList() --[[ Line: 45 ]]
	return { NATIVE_EXIT = 35, RESTART_APP = 41 }
end

return MockGuiService