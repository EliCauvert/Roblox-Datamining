local MockLoggingProtocolModule = {}
MockLoggingProtocolModule.__index = MockLoggingProtocolModule

function MockLoggingProtocolModule.new()
	-- upvalues: MockLoggingProtocolModule (copy)
	local config = {
		StandardizedFields = {},
		sentEvents = {},
		sentCounters = {},
		sentStats = {},
		loggedEvents = {}
	}
	setmetatable(config, MockLoggingProtocolModule)
	
	return config
end

function MockLoggingProtocolModule:logEvent(Key)
	if self.loggedEvents[Key] == nil then
		self.loggedEvents[Key] = 0
	end
	local LoggedEvents = self.loggedEvents
	LoggedEvents[Key] += 1
end

function MockLoggingProtocolModule:logEventOnce(p1)
	self.loggedEvents[p1] = 1
end

function MockLoggingProtocolModule:logRobloxTelemetryEvent(EventConfig, _, CustomFields)
	table.insert(self.sentEvents, { eventConfig = EventConfig, customFields = CustomFields })
end

function MockLoggingProtocolModule:logRobloxTelemetryStat(EventConfig, StatValue, CustomFields)
	table.insert(self.sentStats, {
		eventConfig = EventConfig,
		statValue = StatValue,
		customFields = CustomFields
	})
end

function MockLoggingProtocolModule:logRobloxTelemetryCounter(EventConfig, Increment, CustomFields)
	table.insert(self.setCounters, {
		eventConfig = EventConfig,
		increment = Increment,
		customFields = CustomFields
	})
end

function MockLoggingProtocolModule:mockGetSentEvents()
	return self.sentEvents
end

function MockLoggingProtocolModule:mockGetSentCounters()
	return self.sentCounters
end

function MockLoggingProtocolModule:mockGetSentStats()
	return self.sentStats
end

function MockLoggingProtocolModule:mockClearSentEvents()
	self.sentEvents = {}
end

function MockLoggingProtocolModule:mockClearSentCounters()
	self.sentCounters = {}
end

function MockLoggingProtocolModule:mockClearSentStats()
	self.sentStats = {}
end

return MockLoggingProtocolModule