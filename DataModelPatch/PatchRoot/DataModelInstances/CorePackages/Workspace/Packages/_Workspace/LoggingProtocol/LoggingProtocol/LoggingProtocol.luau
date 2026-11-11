local Parent = script.Parent
local Parent1 = Parent.Parent
local MessageBus = require(Parent1.MessageBus).MessageBus
local TModule = require(Parent1.t)
local ArgCheckModule = require(Parent1.ArgCheck)
local _ = require(Parent.LoggingProtocolTypes)
local AppCommonLibModule = require(Parent1.AppCommonLib)
local CallOnceFunction = AppCommonLibModule.callOnce
local CallOncePerDMModule = require(Parent.callOncePerDM)
local Signal = AppCommonLibModule.Signal
game:DefineFastFlag("EnableTelemetryProtocol", false)

function getDomainName(): string
	return if game:GetFastFlag("EnableTelemetryProtocol") then "Telemetry" else "Logging"
end

local TelemetryBackends = {
	UNSPECIFIED = "UNSPECIFIED",
	EventIngest = "EventIngest",
	Points = "Points",
	EphemeralCounter = "EphemeralCounter",
	EphemeralStat = "EphemeralStat",
	Counter = "RobloxTelemetryCounter",
	Stats = "RobloxTelemetryStat"
}
local LoggingProtocolModule = {
	TelemetryBackends = TelemetryBackends,
	StandardizedFields = {
		addPlaceId = "addPlaceId",
		addUniverseId = "addUniverseId",
		addPlaceInstanceId = "addPlaceInstanceId",
		addSessionId = "addSessionId",
		addOsInfo = "addOSInfo"
	},
	LOG_EVENT_WITH_TIMESTAMP_DESCRIPTOR = {
		fid = MessageBus.getMessageId(getDomainName(), "logEventWithTimestamp"),
		validateParams = TModule.strictInterface({
			eventName = TModule.string,
			timestamp = TModule.optional(TModule.number),
			metadata = TModule.optional(TModule.keys(TModule.string))
		})
	},
	GET_TIMESTAMP_DESCRIPTOR = {
		fid = MessageBus.getMessageId(getDomainName(), "getTimestamp"),
		validateParams = TModule.table
	},
	LOG_EVENT_FROM_LUA_DESCRIPTOR = {
		fid = MessageBus.getMessageId(getDomainName(), "logEventFromLua"),
		validateParams = TModule.interface({
			eventType = TModule.string,
			config = TModule.optional(TModule.strictInterface({
				eventName = TModule.string,
				backends = TModule.array(TModule.valueOf(TelemetryBackends)),
				throttlingPercentage = TModule.optional(TModule.number),
				lastUpdated = TModule.optional(TModule.array(TModule.integer)),
				description = TModule.optional(TModule.string),
				links = TModule.optional(TModule.string)
			})),
			data = TModule.optional(TModule.table)
		})
	}
}
LoggingProtocolModule.__index = LoggingProtocolModule

function LoggingProtocolModule.new(p1)
	-- upvalues: MessageBus (copy), Signal (copy), LoggingProtocolModule (copy)
	local config = {
		messageBus = p1 or MessageBus,
		durationLoggerSignal = Signal.new()
	}
	setmetatable(config, LoggingProtocolModule)
	
	return config
end

function LoggingProtocolModule:setDurationLoggerListener(p1)
	return self.durationLoggerSignal:connect(p1)
end

function LoggingProtocolModule:logEventWithTimestamp(EventName, Timestamp, Metadata)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(EventName, "string", "eventName")
	ArgCheckModule.isType(Timestamp, "number", "timestamp")
	self.messageBus.call(self.LOG_EVENT_WITH_TIMESTAMP_DESCRIPTOR, {
		eventName = EventName,
		timestamp = Timestamp,
		metadata = Metadata
	})
	self.durationLoggerSignal:fire(EventName)
end

function LoggingProtocolModule:logEvent(EventName, Metadata)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(EventName, "string", "eventName")
	self:logEventWithTimestamp(EventName, 0, Metadata)
end

function LoggingProtocolModule.logEventOnce(p1, p2, p3)
	-- upvalues: ArgCheckModule (copy), CallOncePerDMModule (copy), CallOnceFunction (copy)
	ArgCheckModule.isType(p2, "string", "eventName")
	
	if game:DefineFastFlag("LuaAppSendTTIEventsPerDM", false) then
		CallOncePerDMModule(string.format("logging_protocol_key-%s", p2), function()
			-- upvalues: p1 (copy), p2 (copy), p3 (copy)
			p1:logEvent(p2, p3)
		end)
		
		return
	else
		CallOnceFunction(string.format("logging_protocol_key-%s", p2), function()
			-- upvalues: p1 (copy), p2 (copy), p3 (copy)
			p1:logEvent(p2, p3)
		end)
	end
end

function LoggingProtocolModule:getTimestamp()
	return self.messageBus.call(self.GET_TIMESTAMP_DESCRIPTOR, {})
end

function LoggingProtocolModule:logRobloxTelemetryCounter(Config, IncrementValue, CustomFields)
	self.messageBus.call(self.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
		eventType = "RobloxTelemetryCounter",
		config = Config,
		data = if IncrementValue then {
			incrementValue = IncrementValue,
			customFields = CustomFields
		} elseif CustomFields then { customFields = CustomFields } else nil
	})
end

function LoggingProtocolModule:logRobloxTelemetryStat(Config, StatValue, CustomFields)
	self.messageBus.call(self.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
		eventType = "RobloxTelemetryStat",
		config = Config,
		data = { statValue = StatValue, customFields = CustomFields }
	})
end

function LoggingProtocolModule:logRobloxTelemetryEvent(Config, StandardizedFields, CustomFields, EventContext)
	self.messageBus.call(self.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
		eventType = "RobloxTelemetry",
		config = Config,
		data = {
			standardizedFields = StandardizedFields,
			customFields = CustomFields,
			eventContext = EventContext
		}
	})
end

function LoggingProtocolModule:logEphemeralCounterEvent(Config, IncrementValue)
	self.messageBus.call(self.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
		eventType = "EphemeralCounter",
		config = Config,
		data = if IncrementValue then { incrementValue = IncrementValue } else nil
	})
end

function LoggingProtocolModule:logEphemeralStatEvent(Config, StatValue)
	self.messageBus.call(self.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
		eventType = "EphemeralStat",
		config = Config,
		data = { statValue = StatValue }
	})
end

LoggingProtocolModule.default = LoggingProtocolModule.new()

return LoggingProtocolModule