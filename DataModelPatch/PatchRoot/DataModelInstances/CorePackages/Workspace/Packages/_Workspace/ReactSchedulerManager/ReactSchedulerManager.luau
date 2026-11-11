local Parent = script.Parent
local FFlagEnableSchedulerFlagOverrides = require(Parent.SharedFlags).FFlagEnableSchedulerFlagOverrides
local GetReactSchedulerIXPConfigFunction = require(Parent.SharedFlags).GetReactSchedulerIXPConfig
local GetSchedulerFlagOverrides = require(Parent.SharedFlags).GetSchedulerFlagOverrides
local SchedulerModule = require(Parent.Scheduler)
local Default = require(Parent.AppStartup).AppStartupSequence.default
local _ = require(Parent.AppCommonLib)
local LuaAppStartupReactSchedulerDelayMs = game:DefineFastInt("LuaAppStartupReactSchedulerDelayMs", 0)
local LuaAppStartupReactSchedulerInterval = game:DefineFastInt("LuaAppStartupReactSchedulerInterval", 15)

return {
	startup = function()
		-- upvalues: GetReactSchedulerIXPConfigFunction (copy), SchedulerModule (copy), FFlagEnableSchedulerFlagOverrides (copy), GetSchedulerFlagOverrides (copy), LuaAppStartupReactSchedulerDelayMs (copy), LuaAppStartupReactSchedulerInterval (copy), Default (copy)
		local ReactSchedulerIXPConfig = GetReactSchedulerIXPConfigFunction()
		
		if ReactSchedulerIXPConfig then
			SchedulerModule.unstable_setSchedulerFlags(ReactSchedulerIXPConfig)
		end
		if FFlagEnableSchedulerFlagOverrides then
			local App = GetSchedulerFlagOverrides.getApp()
			
			if App then
				SchedulerModule.unstable_setSchedulerFlags(App)
			end
		end
		if LuaAppStartupReactSchedulerDelayMs > 0 then
			local Unstable_getSchedulerFlagsResult = SchedulerModule.unstable_getSchedulerFlags()
			SchedulerModule.unstable_setSchedulerFlags({ yieldInterval = LuaAppStartupReactSchedulerInterval })
			local DelayedThread = nil
			local ChangedConnection = nil
			DelayedThread = task.delay(LuaAppStartupReactSchedulerDelayMs / 1000, function()
				-- upvalues: SchedulerModule (upval), Unstable_getSchedulerFlagsResult (copy), ChangedConnection (ref), DelayedThread (ref)
				SchedulerModule.unstable_setSchedulerFlags(Unstable_getSchedulerFlagsResult)
				
				if ChangedConnection then
					ChangedConnection:disconnect()
					ChangedConnection = nil
				end
				DelayedThread = nil
			end)
			ChangedConnection = Default.changed:connect(function()
				-- upvalues: Default (upval), DelayedThread (ref), SchedulerModule (upval), Unstable_getSchedulerFlagsResult (copy), ChangedConnection (ref)
				if Default.isInteractive and DelayedThread then
					task.cancel(DelayedThread)
					SchedulerModule.unstable_setSchedulerFlags(Unstable_getSchedulerFlagsResult)
					
					if ChangedConnection then
						ChangedConnection:disconnect()
						ChangedConnection = nil
					end
					DelayedThread = nil
				end
			end)
		end
	end
}