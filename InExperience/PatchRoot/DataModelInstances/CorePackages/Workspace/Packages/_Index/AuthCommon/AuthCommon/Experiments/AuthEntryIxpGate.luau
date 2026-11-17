local Parent = script:FindFirstAncestor("AuthCommon").Parent
local _ = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local TelemetryConfigs = require(Parent.AuthAnalytics).TelemetryConfigs
local WaitForBrowserTrackerIxpModule = require(script.Parent.waitForBrowserTrackerIxp)
local WaitForBtidIxpBeforeAuthEntryTimeoutMs = game:DefineFastInt("WaitForBtidIxpBeforeAuthEntryTimeoutMs", 3000)
local AuthEntryIxpUnheldWaitWindowMs = game:DefineFastInt("AuthEntryIxpUnheldWaitWindowMs", 10000)

return {
	wait = function(p1, Promise)
		-- upvalues: PromiseModule (copy), WaitForBrowserTrackerIxpModule (copy), WaitForBtidIxpBeforeAuthEntryTimeoutMs (copy)
		local ClockTime = os.clock()
		local NoPromise = Promise == nil
		local ScaledClockTime = 0
		
		if Promise then
			local function recordConcurrentGate()
				-- upvalues: NoPromise (ref), ScaledClockTime (ref), ClockTime (copy)
				NoPromise = true
				ScaledClockTime = (os.clock() - ClockTime) * 1000
			end
			
			Promise:andThen(recordConcurrentGate, recordConcurrentGate)
		end
		return PromiseModule.new(function(Callback)
			-- upvalues: NoPromise (ref), ScaledClockTime (ref), ClockTime (copy), WaitForBrowserTrackerIxpModule (upval), p1 (copy), WaitForBtidIxpBeforeAuthEntryTimeoutMs (upval)
			local function settle(Result)
				-- upvalues: Callback (copy), NoPromise (upval), ScaledClockTime (upval)
				Callback({
					ready = Result.ready,
					outcome = Result.outcome,
					initialStatus = Result.initialStatus,
					elapsedMs = Result.elapsedMs,
					heldMs = if NoPromise then math.max(0, (math.floor(Result.elapsedMs - ScaledClockTime))) else 0
				})
			end
			
			local function settleAfterFailure()
				-- upvalues: settle (copy), ClockTime (upval)
				settle({
					ready = false,
					outcome = "waitFailed",
					initialStatus = "Unknown",
					elapsedMs = math.floor((os.clock() - ClockTime) * 1000)
				})
			end
			
			local Success, Result = pcall(WaitForBrowserTrackerIxpModule, p1, WaitForBtidIxpBeforeAuthEntryTimeoutMs / 1000)
			
			if Success then
				Result:andThen(settle, settleAfterFailure)
				
				return
			else
				settle({
					ready = false,
					outcome = "waitFailed",
					initialStatus = "Unknown",
					elapsedMs = math.floor((os.clock() - ClockTime) * 1000)
				})
			end
		end)
	end,
	logNavigation = function(IXPService, Surface, p1)
		-- upvalues: LoggingProtocolModule (copy), TelemetryConfigs (copy)
		pcall(function()
			-- upvalues: LoggingProtocolModule (upval), TelemetryConfigs (upval), Surface (copy), IXPService (copy), p1 (copy)
			local Default = LoggingProtocolModule.default
			Default:logRobloxTelemetryCounter(TelemetryConfigs.AuthEntryIxpStatusConfig, 1, {
				surface = Surface,
				status = IXPService:GetBrowserTrackerLayerLoadingStatus().Name,
				waited = tostring(p1 ~= nil)
			})
			
			if p1 then
				Default:logRobloxTelemetryStat(TelemetryConfigs.AuthEntryIxpWaitStatConfig, p1.heldMs, { mode = "held", surface = Surface, outcome = p1.outcome })
				Default:logRobloxTelemetryStat(TelemetryConfigs.AuthEntryIxpWaitStatConfig, p1.elapsedMs, {
					mode = "heldElapsed",
					surface = Surface,
					outcome = p1.outcome
				})
			end
		end)
	end,
	measureUnheldWait = function(p1, Surface)
		-- upvalues: WaitForBrowserTrackerIxpModule (copy), AuthEntryIxpUnheldWaitWindowMs (copy), LoggingProtocolModule (copy), TelemetryConfigs (copy)
		pcall(function()
			-- upvalues: WaitForBrowserTrackerIxpModule (upval), p1 (copy), AuthEntryIxpUnheldWaitWindowMs (upval), LoggingProtocolModule (upval), TelemetryConfigs (upval), Surface (copy)
			WaitForBrowserTrackerIxpModule(p1, AuthEntryIxpUnheldWaitWindowMs / 1000):andThen(function(Result)
				-- upvalues: LoggingProtocolModule (upval), TelemetryConfigs (upval), Surface (upval)
				LoggingProtocolModule.default:logRobloxTelemetryStat(TelemetryConfigs.AuthEntryIxpWaitStatConfig, Result.elapsedMs, {
					mode = "unheld",
					surface = Surface,
					outcome = Result.outcome
				})
			end)
		end)
	end
}