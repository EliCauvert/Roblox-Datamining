local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	local bindableEvent = Instance.new("BindableEvent")
	local t_1 = {
		MenuIsOpen = false,
		broadcasts = {},
		NativeClose = {
			Connect = function(_, p0)
				-- upvalues: bindableEvent (ref)
				return bindableEvent.Event:Connect(p0)
			end
		},
		openedMenus = {}
	}
	setmetatable(t_1, { __index = t })
	
	return t_1
end

function t:SetMenuIsOpen(p1, p2)
	if p1 then
		table.insert(self.openedMenus, p2)
	else
		local index = table.find(self.openedMenus, p2)
		
		if index then
			table.remove(self.openedMenus, index)
		end
	end
	self.MenuIsOpen = #self.openedMenus > 0
end

function t:BroadcastNotification(p3, p4)
	table.insert(self.broadcasts, { data = p3, notification = p4 })
end

function t.GetNotificationTypeList(_)
	return { NATIVE_EXIT = 35, RESTART_APP = 41 }
end

return t