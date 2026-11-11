local MockUserGameSettingsModule = {}
MockUserGameSettingsModule.__index = MockUserGameSettingsModule

function MockUserGameSettingsModule.new()
	-- upvalues: MockUserGameSettingsModule (copy)
	local BindableEvent = Instance.new("BindableEvent")
	local config = {
		FullscreenChanged = {
			Connect = function(_, Callback)
				-- upvalues: BindableEvent (copy)
				return BindableEvent.Event:Connect(Callback)
			end,
			GoFullscreen = function()
				-- upvalues: BindableEvent (copy)
				BindableEvent:Fire(true)
			end
		}
	}
	setmetatable(config, { __index = MockUserGameSettingsModule })
	
	return config
end

function MockUserGameSettingsModule:InFullScreen(): boolean
	return false
end

return MockUserGameSettingsModule