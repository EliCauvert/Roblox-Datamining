local MockRunService = {}
MockRunService.__index = MockRunService

function MockRunService:new()
	-- upvalues: MockRunService (copy)
	local config = {
		RenderStepped = {
			callCallbacksWith = function(p1, p2)
				for _, callback in p1.callbacks do
					callback(p2)
				end
			end,
			callbacks = {},
			Connect = function(p3, p4)
				local Callbacks = p3.callbacks
				table.insert(Callbacks, p4)
				
				return {
					Disconnect = function()
						-- upvalues: Callbacks (copy), p4 (copy)
						for i, callback in Callbacks do
							if callback == p4 then
								table.remove(Callbacks, i)
							end
						end
					end
				}
			end
		},
		Heartbeat = game:GetService("RunService").Heartbeat
	}
	setmetatable(config, { __index = MockRunService })
	
	return config
end

return MockRunService