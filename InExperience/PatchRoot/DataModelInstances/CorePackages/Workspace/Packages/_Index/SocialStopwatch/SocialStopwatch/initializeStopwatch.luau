local SocialStopwatch = script:FindFirstAncestor("SocialStopwatch")
local Parent = SocialStopwatch.Parent
local HttpService = game:GetService("HttpService")
local TimersFunction = require(Parent.SocialLuaAnalytics).Analytics.Timing.Timers
local _ = require(SocialStopwatch.Events)
local EventModesModule = require(SocialStopwatch.EventModes)
local EventRegisterModule = require(SocialStopwatch.EventRegister)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local StopwatchTelemetryConfigModule = require(SocialStopwatch.StopwatchTelemetryConfig)
local _ = require(script.Parent.Types)

return function() --[[ Line: 21 ]]
	-- upvalues: TimersFunction (copy), LoggingProtocolModule (copy), EventRegisterModule (copy), StopwatchTelemetryConfigModule (copy), EventModesModule (copy), HttpService (copy)
	local StartResults = {}
	local TimersResult = TimersFunction()
	local Default = LoggingProtocolModule.default
	
	local function _(Text) --[[ Line: 26 ]]
		-- upvalues: EventRegisterModule (upval)
		local EventRegisterModuleEntry = EventRegisterModule[Text]
		
		if not EventRegisterModuleEntry then
			error("Event not registered: " .. Text)
		end
		return EventRegisterModuleEntry
	end
	
	local _ = function(p1) --[[ Line: 34 ]]
		-- upvalues: EventRegisterModule (upval), StartResults (ref), Default (copy), StopwatchTelemetryConfigModule (upval), EventModesModule (upval), TimersResult (copy)
		return function(Key) --[[ Line: 35 ]]
			-- upvalues: EventRegisterModule (upval), StartResults (upval), Default (upval), StopwatchTelemetryConfigModule (upval), p1 (copy), EventModesModule (upval), TimersResult (upval)
			local EventRegisterModuleEntry = EventRegisterModule[Key]
			
			if not EventRegisterModuleEntry then
				error("Event not registered: " .. Key)
			end
			local StartResult = StartResults[Key]
			
			if not StartResult then
				Default:logRobloxTelemetryEvent(StopwatchTelemetryConfigModule, { Default.StandardizedFields.addOsInfo }, { count = 1, eventName = `FailedOn{p1}{Key}` })
				
				if EventRegisterModuleEntry.mode == EventModesModule.Strict then
					error(`Cannot {p1} an event that has not been started: {Key}`)
				end
			end
			return if StartResult and TimersResult.getStartTimestamp(StartResult) then {
				startTime = TimersResult.getStartTimestamp(StartResult),
				id = StartResult,
				timeElapsed = TimersResult.getTime(StartResult)
			} else nil
		end
	end
	
	local v1 = "Get"
	
	local function Get(Key) --[[ Line: 35 ]]
		-- upvalues: EventRegisterModule (upval), StartResults (ref), Default (copy), StopwatchTelemetryConfigModule (upval), v1 (copy), EventModesModule (upval), TimersResult (copy)
		local EventRegisterModuleEntry = EventRegisterModule[Key]
		
		if not EventRegisterModuleEntry then
			error("Event not registered: " .. Key)
		end
		local StartResult = StartResults[Key]
		
		if not StartResult then
			Default:logRobloxTelemetryEvent(StopwatchTelemetryConfigModule, { Default.StandardizedFields.addOsInfo }, { count = 1, eventName = `FailedOn{v1}{Key}` })
			
			if EventRegisterModuleEntry.mode == EventModesModule.Strict then
				error(`Cannot {v1} an event that has not been started: {Key}`)
			end
		end
		return if StartResult and TimersResult.getStartTimestamp(StartResult) then {
			startTime = TimersResult.getStartTimestamp(StartResult),
			id = StartResult,
			timeElapsed = TimersResult.getTime(StartResult)
		} else nil
	end
	
	local v2 = "Stop"
	
	local function v17(Key) --[[ Line: 35 ]]
		-- upvalues: EventRegisterModule (upval), StartResults (ref), Default (copy), StopwatchTelemetryConfigModule (upval), v2 (copy), EventModesModule (upval), TimersResult (copy)
		local EventRegisterModuleEntry = EventRegisterModule[Key]
		
		if not EventRegisterModuleEntry then
			error("Event not registered: " .. Key)
		end
		local StartResult = StartResults[Key]
		
		if not StartResult then
			Default:logRobloxTelemetryEvent(StopwatchTelemetryConfigModule, { Default.StandardizedFields.addOsInfo }, { count = 1, eventName = `FailedOn{v2}{Key}` })
			
			if EventRegisterModuleEntry.mode == EventModesModule.Strict then
				error(`Cannot {v2} an event that has not been started: {Key}`)
			end
		end
		return if StartResult and TimersResult.getStartTimestamp(StartResult) then {
			startTime = TimersResult.getStartTimestamp(StartResult),
			id = StartResult,
			timeElapsed = TimersResult.getTime(StartResult)
		} else nil
	end
	
	return {
		start = function(Text, p1) --[[ Line: 65 ]]
			-- upvalues: EventRegisterModule (upval), TimersResult (copy), HttpService (upval), StartResults (ref), Default (copy), StopwatchTelemetryConfigModule (upval), EventModesModule (upval)
			local EventRegisterModuleEntry = EventRegisterModule[Text]
			
			if not EventRegisterModuleEntry then
				error("Event not registered: " .. Text)
			end
			local StartResult = TimersResult.start(HttpService:GenerateGUID(false), p1)
			
			if StartResults[Text] then
				Default:logRobloxTelemetryEvent(StopwatchTelemetryConfigModule, { Default.StandardizedFields.addOsInfo }, { count = 1, eventName = `FailedOnStart{Text}` })
				
				if EventRegisterModuleEntry.mode == EventModesModule.Strict then
					error("Cannot start event twice: " .. Text)
				end
			end
			StartResults[Text] = StartResult
			
			return {
				startTime = TimersResult.getStartTimestamp(StartResult),
				id = StartResult
			}
		end,
		get = Get,
		stop = function(Key) --[[ Line: 90 ]]
			-- upvalues: v17 (copy), StartResults (ref)
			StartResults[Key] = nil
			
			return (v17(Key))
		end,
		_unsafeClearEventLog = function() --[[ Line: 95 ]]
			-- upvalues: StartResults (ref)
			StartResults = {}
		end
	}
end