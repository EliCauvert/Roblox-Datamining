local MockEventIngestService = {}
MockEventIngestService.__index = MockEventIngestService

function MockEventIngestService.new()
	-- upvalues: MockEventIngestService (copy)
	local config = { methodCalls = {} }
	setmetatable(config, { __index = MockEventIngestService })
	
	return config
end

function MockEventIngestService:_resetMockData()
	self.methodCalls = {}
end

function MockEventIngestService:setRBXEvent(EventContext, EventName, AdditionalArgs)
	table.insert(self.methodCalls, {
		name = "setRBXEvent",
		args = {
			eventContext = EventContext,
			eventName = EventName,
			additionalArgs = AdditionalArgs
		}
	})
end

function MockEventIngestService:setRBXEventStream(EventContext, EventName, AdditionalArgs)
	table.insert(self.methodCalls, {
		name = "setRBXEventStream",
		args = {
			eventContext = EventContext,
			eventName = EventName,
			additionalArgs = AdditionalArgs
		}
	})
end

function MockEventIngestService:sendEventImmediately(EventContext, EventName, AdditionalArgs)
	table.insert(self.methodCalls, {
		name = "sendEventImmediately",
		args = {
			eventContext = EventContext,
			eventName = EventName,
			additionalArgs = AdditionalArgs
		}
	})
end

function MockEventIngestService:sendEventDeferred(EventContext, EventName, AdditionalArgs)
	table.insert(self.methodCalls, {
		name = "sendEventDeferred",
		args = {
			eventContext = EventContext,
			eventName = EventName,
			additionalArgs = AdditionalArgs
		}
	})
end

return MockEventIngestService