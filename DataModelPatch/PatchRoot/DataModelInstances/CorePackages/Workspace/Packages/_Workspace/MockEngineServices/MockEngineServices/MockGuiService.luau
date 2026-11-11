local MockGuiService = {}
MockGuiService.__index = MockGuiService

function MockGuiService.new()
	-- upvalues: MockGuiService (copy)
	local BindableEvent = Instance.new("BindableEvent")
	local config = {
		broadcasts = {},
		ShowLeaveConfirmation = {
			Connect = function(_, Callback)
				-- upvalues: BindableEvent (copy)
				return BindableEvent.Event:Connect(Callback)
			end,
			Fire = function(_, ...)
				-- upvalues: BindableEvent (copy)
				BindableEvent:Fire(...)
			end
		}
	}
	setmetatable(config, { __index = MockGuiService })
	
	return config
end

function MockGuiService:BroadcastNotification(Data, Notification)
	self.broadcasts[#self.broadcasts + 1] = { data = Data, notification = Notification }
end

function MockGuiService:SetGlobalGuiInset(_, _, _, _) end

function MockGuiService:SafeZoneOffsetsChanged() end

return MockGuiService