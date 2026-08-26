local parent = script.Parent
local parent_1 = parent.Parent
local messageBus = require(parent_1.MessageBus).MessageBus
local tModule = require(parent_1.t)
local argCheckModule = require(parent_1.ArgCheck)
local _ = require(parent.LoggingProtocolTypes)
local appCommonLibModule = require(parent_1.AppCommonLib)
local callOnce = appCommonLibModule.callOnce
local callOncePerDMModule = require(parent.callOncePerDM)
local signal = appCommonLibModule.Signal
game:DefineFastFlag("EnableTelemetryProtocol", false)

function getDomainName()
	return if game:GetFastFlag("EnableTelemetryProtocol") then "Telemetry" else "Logging"
end

local t = {
	UNSPECIFIED = "UNSPECIFIED",
	EventIngest = "EventIngest",
	Points = "Points",
	EphemeralCounter = "EphemeralCounter",
	EphemeralStat = "EphemeralStat",
	Counter = "RobloxTelemetryCounter",
	Stats = "RobloxTelemetryStat"
}
local t_1 = {
	TelemetryBackends = t,
	StandardizedFields = {
		addPlaceId = "addPlaceId",
		addUniverseId = "addUniverseId",
		addPlaceInstanceId = "addPlaceInstanceId",
		addSessionId = "addSessionId",
		addOsInfo = "addOSInfo"
	},
	LOG_EVENT_WITH_TIMESTAMP_DESCRIPTOR = {
		fid = messageBus.getMessageId(getDomainName(), "logEventWithTimestamp"),
		validateParams = tModule.strictInterface({
			eventName = tModule.string,
			timestamp = tModule.optional(tModule.number),
			metadata = tModule.optional(tModule.keys(tModule.string))
		})
	},
	GET_TIMESTAMP_DESCRIPTOR = {
		fid = messageBus.getMessageId(getDomainName(), "getTimestamp"),
		validateParams = tModule.table
	},
	LOG_EVENT_FROM_LUA_DESCRIPTOR = {
		fid = messageBus.getMessageId(getDomainName(), "logEventFromLua"),
		validateParams = tModule.interface({
			eventType = tModule.string,
			config = tModule.optional(tModule.strictInterface({
				eventName = tModule.string,
				backends = tModule.array(tModule.valueOf(t)),
				throttlingPercentage = tModule.optional(tModule.number),
				lastUpdated = tModule.optional(tModule.array(tModule.integer)),
				description = tModule.optional(tModule.string),
				links = tModule.optional(tModule.string)
			})),
			data = tModule.optional(tModule.table)
		})
	}
}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: messageBus (ref), signal (ref), t_1 (ref)
	local t = {
		messageBus = p1 or messageBus,
		durationLoggerSignal = signal.new()
	}
	setmetatable(t, t_1)
	
	return t
end

function t_1:setDurationLoggerListener(p1)
	return self.durationLoggerSignal:connect(p1)
end

function t_1:logEventWithTimestamp(p1, p2, p3)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p1, "string", "eventName")
	argCheckModule.isType(p2, "number", "timestamp")
	self.messageBus.call(self.LOG_EVENT_WITH_TIMESTAMP_DESCRIPTOR, { eventName = p1, timestamp = p2, metadata = p3 })
	self.durationLoggerSignal:fire(p1)
end

function t_1:logEvent(p1, p2)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p1, "string", "eventName")
	self:logEventWithTimestamp(p1, 0, p2)
end

function t_1.logEventOnce(p1, p2, p3)
	-- upvalues: argCheckModule (ref), callOncePerDMModule (ref), callOnce (ref)
	argCheckModule.isType(p2, "string", "eventName")
	
	if game:DefineFastFlag("LuaAppSendTTIEventsPerDM", false) then
		callOncePerDMModule(string.format("logging_protocol_key-%s", p2), function()
			-- upvalues: p1 (ref), p2 (ref), p3 (ref)
			p1:logEvent(p2, p3)
		end)
		
		return
	end
	callOnce(string.format("logging_protocol_key-%s", p2), function()
		-- upvalues: p1 (ref), p2 (ref), p3 (ref)
		p1:logEvent(p2, p3)
	end)
end

function t_1:getTimestamp()
	return self.messageBus.call(self.GET_TIMESTAMP_DESCRIPTOR, {})
end

function t_1:logRobloxTelemetryCounter(p1, p2, p3)
	self.messageBus.call(self.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
		eventType = "RobloxTelemetryCounter",
		config = p1,
		data = if p2 then { incrementValue = p2, customFields = p3 } elseif p3 then { customFields = p3 } else nil
	})
end

function t_1:logRobloxTelemetryStat(p1, p2, p3)
	self.messageBus.call(self.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
		eventType = "RobloxTelemetryStat",
		config = p1,
		data = { statValue = p2, customFields = p3 }
	})
end

function t_1:logRobloxTelemetryEvent(p1, p2, p3, p4)
	self.messageBus.call(self.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
		eventType = "RobloxTelemetry",
		config = p1,
		data = {
			standardizedFields = p2,
			customFields = p3,
			eventContext = p4
		}
	})
end

function t_1:logEphemeralCounterEvent(p1, p2)
	self.messageBus.call(self.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
		eventType = "EphemeralCounter",
		config = p1,
		data = if p2 then { incrementValue = p2 } else nil
	})
end

function t_1:logEphemeralStatEvent(p1, p2)
	self.messageBus.call(self.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
		eventType = "EphemeralStat",
		config = p1,
		data = { statValue = p2 }
	})
end

t_1.default = t_1.new()

return t_1