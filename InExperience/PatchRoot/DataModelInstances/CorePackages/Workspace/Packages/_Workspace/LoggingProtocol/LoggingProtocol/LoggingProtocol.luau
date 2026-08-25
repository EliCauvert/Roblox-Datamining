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

function t_1.new(p0)
	-- upvalues: messageBus (ref), signal (ref), t_1 (ref)
	local t = {
		messageBus = p0 or messageBus,
		durationLoggerSignal = signal.new()
	}
	setmetatable(t, t_1)
	
	return t
end

function t_1:setDurationLoggerListener(p1)
	return self.durationLoggerSignal:connect(p1)
end

function t_1:logEventWithTimestamp(p2, p3, p4)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p2, "string", "eventName")
	argCheckModule.isType(p3, "number", "timestamp")
	self.messageBus.call(self.LOG_EVENT_WITH_TIMESTAMP_DESCRIPTOR, { eventName = p2, timestamp = p3, metadata = p4 })
	self.durationLoggerSignal:fire(p2)
end

function t_1:logEvent(p5, p6)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p5, "string", "eventName")
	self:logEventWithTimestamp(p5, 0, p6)
end

function t_1.logEventOnce(p7, p8, p9)
	-- upvalues: argCheckModule (ref), callOncePerDMModule (ref), callOnce (ref)
	argCheckModule.isType(p8, "string", "eventName")
	
	if game:DefineFastFlag("LuaAppSendTTIEventsPerDM", false) then
		callOncePerDMModule(string.format("logging_protocol_key-%s", p8), function()
			-- upvalues: p7 (ref), p8 (ref), p9 (ref)
			p7:logEvent(p8, p9)
		end)
		
		return
	end
	callOnce(string.format("logging_protocol_key-%s", p8), function()
		-- upvalues: p7 (ref), p8 (ref), p9 (ref)
		p7:logEvent(p8, p9)
	end)
end

function t_1:getTimestamp()
	return self.messageBus.call(self.GET_TIMESTAMP_DESCRIPTOR, {})
end

function t_1:logRobloxTelemetryCounter(p10, p11, p12)
	self.messageBus.call(self.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
		eventType = "RobloxTelemetryCounter",
		config = p10,
		data = if p11 then { incrementValue = p11, customFields = p12 } elseif p12 then { customFields = p12 } else nil
	})
end

function t_1:logRobloxTelemetryStat(p13, p14, p15)
	self.messageBus.call(self.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
		eventType = "RobloxTelemetryStat",
		config = p13,
		data = { statValue = p14, customFields = p15 }
	})
end

function t_1:logRobloxTelemetryEvent(p16, p17, p18, p19)
	self.messageBus.call(self.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
		eventType = "RobloxTelemetry",
		config = p16,
		data = {
			standardizedFields = p17,
			customFields = p18,
			eventContext = p19
		}
	})
end

function t_1:logEphemeralCounterEvent(p20, p21)
	self.messageBus.call(self.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
		eventType = "EphemeralCounter",
		config = p20,
		data = if p21 then { incrementValue = p21 } else nil
	})
end

function t_1:logEphemeralStatEvent(p22, p23)
	self.messageBus.call(self.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
		eventType = "EphemeralStat",
		config = p22,
		data = { statValue = p23 }
	})
end

t_1.default = t_1.new()

return t_1