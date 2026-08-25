local socialStopwatch = script:FindFirstAncestor("SocialStopwatch")
local parent = socialStopwatch.Parent
local httpService = game:GetService("HttpService")
local timers = require(parent.SocialLuaAnalytics).Analytics.Timing.Timers
local _ = require(socialStopwatch.Events)
local eventModesModule = require(socialStopwatch.EventModes)
local eventRegisterModule = require(socialStopwatch.EventRegister)
local loggingProtocolModule = require(parent.LoggingProtocol)
local stopwatchTelemetryConfigModule = require(socialStopwatch.StopwatchTelemetryConfig)
local _ = require(script.Parent.Types)

return function()
	-- upvalues: timers (ref), loggingProtocolModule (ref), eventRegisterModule (ref), stopwatchTelemetryConfigModule (ref), eventModesModule (ref), httpService (ref)
	local t = {}
	local var7 = timers()
	local default = loggingProtocolModule.default
	
	local _ = function(p0)
		-- upvalues: eventRegisterModule (copy)
		local var12 = eventRegisterModule[p0]
		
		if not var12 then
			error("Event not registered: " .. p0)
		end
		return var12
	end
	
	local _ = function(p1)
		-- upvalues: eventRegisterModule (copy), t (write), default (ref), stopwatchTelemetryConfigModule (copy), eventModesModule (copy), var7 (ref)
		return function(p2)
			-- upvalues: eventRegisterModule (copy), t (copy), default (copy), stopwatchTelemetryConfigModule (copy), p1 (ref), eventModesModule (copy), var7 (copy)
			local var13 = eventRegisterModule[p2]
			
			if not var13 then
				error("Event not registered: " .. p2)
			end
			local var14 = t[p2]
			
			if not var14 then
				default:logRobloxTelemetryEvent(stopwatchTelemetryConfigModule, { default.StandardizedFields.addOsInfo }, { count = 1, eventName = `FailedOn{p1}{p2}` })
				
				if var13.mode == eventModesModule.Strict then
					error(`Cannot {p1} an event that has not been started: {p2}`)
				end
			end
			return if var14 and var7.getStartTimestamp(var14) then {
				startTime = var7.getStartTimestamp(var14),
				id = var14,
				timeElapsed = var7.getTime(var14)
			} else nil
		end
	end
	
	local var8 = "Get"
	
	local var9 = function(p3)
		-- upvalues: eventRegisterModule (copy), t (write), default (ref), stopwatchTelemetryConfigModule (copy), var8 (ref), eventModesModule (copy), var7 (ref)
		local var13 = eventRegisterModule[p3]
		
		if not var13 then
			error("Event not registered: " .. p3)
		end
		local var14 = t[p3]
		
		if not var14 then
			default:logRobloxTelemetryEvent(stopwatchTelemetryConfigModule, { default.StandardizedFields.addOsInfo }, { count = 1, eventName = `FailedOn{var8}{p3}` })
			
			if var13.mode == eventModesModule.Strict then
				error(`Cannot {var8} an event that has not been started: {p3}`)
			end
		end
		return if var14 and var7.getStartTimestamp(var14) then {
			startTime = var7.getStartTimestamp(var14),
			id = var14,
			timeElapsed = var7.getTime(var14)
		} else nil
	end
	
	local var10 = "Stop"
	
	local var11 = function(p4)
		-- upvalues: eventRegisterModule (copy), t (write), default (ref), stopwatchTelemetryConfigModule (copy), var10 (ref), eventModesModule (copy), var7 (ref)
		local var13 = eventRegisterModule[p4]
		
		if not var13 then
			error("Event not registered: " .. p4)
		end
		local var14 = t[p4]
		
		if not var14 then
			default:logRobloxTelemetryEvent(stopwatchTelemetryConfigModule, { default.StandardizedFields.addOsInfo }, { count = 1, eventName = `FailedOn{var10}{p4}` })
			
			if var13.mode == eventModesModule.Strict then
				error(`Cannot {var10} an event that has not been started: {p4}`)
			end
		end
		return if var14 and var7.getStartTimestamp(var14) then {
			startTime = var7.getStartTimestamp(var14),
			id = var14,
			timeElapsed = var7.getTime(var14)
		} else nil
	end
	
	return {
		start = function(p5, p6)
			-- upvalues: eventRegisterModule (copy), var7 (ref), httpService (copy), t (write), default (ref), stopwatchTelemetryConfigModule (copy), eventModesModule (copy)
			local var15 = eventRegisterModule[p5]
			
			if not var15 then
				error("Event not registered: " .. p5)
			end
			local var16 = var7.start(httpService:GenerateGUID(false), p6)
			
			if t[p5] then
				default:logRobloxTelemetryEvent(stopwatchTelemetryConfigModule, { default.StandardizedFields.addOsInfo }, { count = 1, eventName = `FailedOnStart{p5}` })
				
				if var15.mode == eventModesModule.Strict then
					error("Cannot start event twice: " .. p5)
				end
			end
			t[p5] = var16
			
			return { startTime = var7.getStartTimestamp(var16), id = var16 }
		end,
		get = var9,
		stop = function(p7)
			-- upvalues: var11 (ref), t (write)
			local var17 = var11(p7)
			t[p7] = nil
			
			return var17
		end,
		_unsafeClearEventLog = function()
			-- upvalues: t (write)
			t = {}
		end
	}
end