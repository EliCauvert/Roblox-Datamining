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
	local var1 = timers()
	local default = loggingProtocolModule.default
	
	local _ = function(p1)
		-- upvalues: eventRegisterModule (copy)
		local var2 = eventRegisterModule[p1]
		
		if not var2 then
			error("Event not registered: " .. p0)
		end
		return var2
	end
	
	local _ = function(p1)
		-- upvalues: eventRegisterModule (copy), t (write), default (ref), stopwatchTelemetryConfigModule (copy), eventModesModule (copy), var1 (ref)
		return function(p2)
			-- upvalues: eventRegisterModule (copy), t (copy), default (copy), stopwatchTelemetryConfigModule (copy), p1 (ref), eventModesModule (copy), var1 (copy)
			local var2 = eventRegisterModule[p2]
			
			if not var2 then
				error("Event not registered: " .. p2)
			end
			local var3 = t[p2]
			
			if not var3 then
				default:logRobloxTelemetryEvent(stopwatchTelemetryConfigModule, { default.StandardizedFields.addOsInfo }, { count = 1, eventName = `FailedOn{p1}{p2}` })
				
				if var2.mode == eventModesModule.Strict then
					error(`Cannot {p1} an event that has not been started: {p2}`)
				end
			end
			return if var3 and var1.getStartTimestamp(var3) then {
				startTime = var1.getStartTimestamp(var3),
				id = var3,
				timeElapsed = var1.getTime(var3)
			} else nil
		end
	end
	
	local var2 = "Get"
	
	local var3 = function(p1)
		-- upvalues: eventRegisterModule (copy), t (write), default (ref), stopwatchTelemetryConfigModule (copy), var2 (ref), eventModesModule (copy), var1 (ref)
		local var4 = eventRegisterModule[p1]
		
		if not var4 then
			error("Event not registered: " .. p3)
		end
		local var5 = t[p1]
		
		if not var5 then
			default:logRobloxTelemetryEvent(stopwatchTelemetryConfigModule, { default.StandardizedFields.addOsInfo }, { count = 1, eventName = `FailedOn{var2}{p1}` })
			
			if var4.mode == eventModesModule.Strict then
				error(`Cannot {var2} an event that has not been started: {p1}`)
			end
		end
		return if var5 and var1.getStartTimestamp(var5) then {
			startTime = var1.getStartTimestamp(var5),
			id = var5,
			timeElapsed = var1.getTime(var5)
		} else nil
	end
	
	local var4 = "Stop"
	
	local var5 = function(p1)
		-- upvalues: eventRegisterModule (copy), t (write), default (ref), stopwatchTelemetryConfigModule (copy), var4 (ref), eventModesModule (copy), var1 (ref)
		local var6 = eventRegisterModule[p1]
		
		if not var6 then
			error("Event not registered: " .. p4)
		end
		local var7 = t[p1]
		
		if not var7 then
			default:logRobloxTelemetryEvent(stopwatchTelemetryConfigModule, { default.StandardizedFields.addOsInfo }, { count = 1, eventName = `FailedOn{var4}{p1}` })
			
			if var6.mode == eventModesModule.Strict then
				error(`Cannot {var4} an event that has not been started: {p1}`)
			end
		end
		return if var7 and var1.getStartTimestamp(var7) then {
			startTime = var1.getStartTimestamp(var7),
			id = var7,
			timeElapsed = var1.getTime(var7)
		} else nil
	end
	
	return {
		start = function(p1, p2)
			-- upvalues: eventRegisterModule (copy), var1 (ref), httpService (copy), t (write), default (ref), stopwatchTelemetryConfigModule (copy), eventModesModule (copy)
			local var6 = eventRegisterModule[p1]
			
			if not var6 then
				error("Event not registered: " .. p5)
			end
			local var7 = var1.start(httpService:GenerateGUID(false), p2)
			
			if t[p1] then
				default:logRobloxTelemetryEvent(stopwatchTelemetryConfigModule, { default.StandardizedFields.addOsInfo }, { count = 1, eventName = `FailedOnStart{p1}` })
				
				if var6.mode == eventModesModule.Strict then
					error("Cannot start event twice: " .. p5)
				end
			end
			t[p1] = var7
			
			return { startTime = var1.getStartTimestamp(var7), id = var7 }
		end,
		get = var3,
		stop = function(p1)
			-- upvalues: var5 (ref), t (write)
			local var6 = var5(p1)
			t[p1] = nil
			
			return var6
		end,
		_unsafeClearEventLog = function()
			-- upvalues: t (write)
			t = {}
		end
	}
end