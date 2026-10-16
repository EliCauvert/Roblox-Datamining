local MockUserGameSettingsModule = {}
MockUserGameSettingsModule.__index = MockUserGameSettingsModule

function MockUserGameSettingsModule.new() --[[ Line: 8 ]]
	-- upvalues: MockUserGameSettingsModule (copy)
	local BindableEvent = Instance.new("BindableEvent")
	local config = {
		FullscreenChanged = {
			Connect = function(_, Callback) --[[ Line: 13 ]]
				-- upvalues: BindableEvent (copy)
				return BindableEvent.Event:Connect(Callback)
			end,
			GoFullscreen = function() --[[ Line: 16 ]]
				-- upvalues: BindableEvent (copy)
				BindableEvent:Fire(true)
			end
		}
	}
	setmetatable(config, { __index = MockUserGameSettingsModule })
	
	return config
end

function MockUserGameSettingsModule:InFullScreen(): boolean --[[ Line: 28 ]]
	return false
end

return MockUserGameSettingsModule