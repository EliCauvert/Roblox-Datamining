local MockLinkingService = {}
MockLinkingService.__index = MockLinkingService

function MockLinkingService:new()
	-- upvalues: MockLinkingService (copy)
	local config = {
		emtpyUrlDataForStartDelivery = false,
		lastLuaUrl = nil,
		switchedToSettingsApp = false,
		settingsAppRoute = nil,
		OnLuaUrl = {
			CallCallbacksWith = function(p1, p2, p3, p4)
				for _, callback in p1.callbacks do
					callback(p2, p3, p4)
				end
			end,
			callbacks = {},
			Connect = function(p5, p6)
				local Callbacks = p5.callbacks
				table.insert(Callbacks, p6)
				
				return {
					Disconnect = function()
						-- upvalues: Callbacks (copy), p6 (copy)
						for i, callback in Callbacks do
							if callback == p6 then
								table.remove(Callbacks, i)
							end
						end
					end
				}
			end
		},
		SetEmptyUrlDataForStartDelivery = function(p7, EmtpyUrlDataForStartDelivery)
			p7.emtpyUrlDataForStartDelivery = EmtpyUrlDataForStartDelivery
		end,
		StartLuaUrlDelivery = function(p7)
			return if p7.emtpyUrlDataForStartDelivery then {} else nil
		end,
		StopLuaUrlDelivery = function(_) end,
		OpenUrl = function(_, _): boolean
			return true
		end,
		IsUrlRegistered = function(_, _): boolean
			return true
		end,
		GetLastLuaUrl = function(p7)
			return p7.lastLuaUrl
		end,
		SetLastLuaUrl = function(p7, LastLuaUrl)
			p7.lastLuaUrl = LastLuaUrl
		end,
		SwitchToSettingsApp = function(p7, SettingsAppRoute)
			p7.switchedToSettingsApp = true
			p7.settingsAppRoute = SettingsAppRoute
		end,
		SupportsSwitchToSettingsApp = function(_): boolean
			return true
		end
	}
	setmetatable(config, { __index = MockLinkingService })
	
	return config
end

return MockLinkingService