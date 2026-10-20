local Parent = script.Parent.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Object = LuauPolyfillModule.Object
local SharedModule = require(Parent.Shared)
local Console = SharedModule.console
local ErrorToStringFunction = SharedModule.errorToString
local DescribeError = SharedModule.describeError
local SafeFlagsModule = require(Parent.SafeFlags)

local function GetCurrentTime(): number
	return os.clock() * 1000
end

local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local Flag = false
local Callback = nil
local None = Object.None
local ReactSchedulerYieldInterval2 = SafeFlagsModule.createGetFInt("ReactSchedulerYieldInterval2", 15)
local DesiredFrameRate: number = SafeFlagsModule.createGetFInt("ReactSchedulerDesiredFrameRate", 60)()
local MinimumFrameRate: number = SafeFlagsModule.createGetFInt("ReactSchedulerMinFrameRate", 30)()
local DeferredWork = SafeFlagsModule.createGetFFlag("ReactSchedulerEnableDeferredWork")()
local HeartbeatFrameMarker = SafeFlagsModule.createGetFFlag("ReactSchedulerSetFrameMarkerOnHeartbeatEnd")()
local TargetMsByHeartbeatDelta = SafeFlagsModule.createGetFFlag("ReactSchedulerSetTargetMsByHeartbeatDelta")()
local NumberOfLookbackFrames = SafeFlagsModule.createGetFInt("ReactSchedulerNumberOfLookbackFrames", 1)()
local LookbackUseRingBuffer = SafeFlagsModule.createGetFFlag("ReactSchedulerLookbackUseRingBuffer")()
local Flag1 = false
local ScaledClockTime = 0
local MinValue = 1000 / DesiredFrameRate
local MaxValue = 1000 / MinimumFrameRate
local ClampedValue: number = MinValue
local Value: number = ClampedValue
local HeartbeatConnection = nil
local Buffer = if LookbackUseRingBuffer then table.create(NumberOfLookbackFrames) else nil
local v1 = 1

local function _()
	-- upvalues: MinValue (ref), DesiredFrameRate (ref), MaxValue (ref), MinimumFrameRate (ref), ClampedValue (ref), Value (ref)
	MinValue = 1000 / DesiredFrameRate
	MaxValue = 1000 / MinimumFrameRate
	ClampedValue = MinValue
	Value = ClampedValue
end

local _ = function()
	-- upvalues: HeartbeatConnection (ref), NumberOfLookbackFrames (ref), LookbackUseRingBuffer (ref), Buffer (copy), v1 (ref), Value (ref), ClampedValue (ref), MinValue (ref), MaxValue (ref)
	if HeartbeatConnection then
		HeartbeatConnection:Disconnect()
	end
	HeartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(DeltaTime: number)
		-- upvalues: NumberOfLookbackFrames (upval), LookbackUseRingBuffer (upval), Buffer (upval), v1 (upval), Value (upval), ClampedValue (upval), MinValue (upval), MaxValue (upval)
		if NumberOfLookbackFrames <= 1 then
			ClampedValue = math.clamp(DeltaTime * 1000, MinValue, MaxValue)
			
			return
		end
		if LookbackUseRingBuffer then
			Buffer[v1] = DeltaTime * 1000
			v1 = v1 % NumberOfLookbackFrames + 1
			local Total = 0
			local NumberOfLookbackFrames: number = NumberOfLookbackFrames
			
			for i = 1, NumberOfLookbackFrames do
				if Buffer[i] == nil then
					NumberOfLookbackFrames = i - 1
					break
				else
					Total += Buffer[i]
				end
			end
			Value = Total / NumberOfLookbackFrames
		else
			local NumberOfLookbackFrames1: number = NumberOfLookbackFrames
			Value = (Value * (NumberOfLookbackFrames1 - 1) + DeltaTime * 1000) / NumberOfLookbackFrames1
		end
		ClampedValue = math.clamp(Value, MinValue, MaxValue)
	end)
end

if TargetMsByHeartbeatDelta then
	if HeartbeatConnection then
		HeartbeatConnection:Disconnect()
	end
	HeartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(DeltaTime: number)
		-- upvalues: NumberOfLookbackFrames (ref), LookbackUseRingBuffer (ref), Buffer (copy), v1 (ref), Value (ref), ClampedValue (ref), MinValue (ref), MaxValue (ref)
		if NumberOfLookbackFrames <= 1 then
			ClampedValue = math.clamp(DeltaTime * 1000, MinValue, MaxValue)
			
			return
		end
		if LookbackUseRingBuffer then
			Buffer[v1] = DeltaTime * 1000
			v1 = v1 % NumberOfLookbackFrames + 1
			local Total = 0
			local NumberOfLookbackFrames: number = NumberOfLookbackFrames
			
			for i = 1, NumberOfLookbackFrames do
				if Buffer[i] == nil then
					NumberOfLookbackFrames = i - 1
					break
				else
					Total += Buffer[i]
				end
			end
			Value = Total / NumberOfLookbackFrames
		else
			local NumberOfLookbackFrames1: number = NumberOfLookbackFrames
			Value = (Value * (NumberOfLookbackFrames1 - 1) + DeltaTime * 1000) / NumberOfLookbackFrames1
		end
		ClampedValue = math.clamp(Value, MinValue, MaxValue)
	end)
end
local function setFrameMarker()
	-- upvalues: ScaledClockTime (ref)
	ScaledClockTime = os.clock() * 1000
end

local ReactSchedulerYieldIntervalResult = ReactSchedulerYieldInterval2()
local v2 = 0

local _ = function(): boolean
	-- upvalues: ScaledClockTime (ref), ClampedValue (ref), ReactSchedulerYieldIntervalResult (ref)
	return ReactSchedulerYieldIntervalResult < ClampedValue - (os.clock() * 1000 - ScaledClockTime)
end

local function performWorkUntilDeadline()
	-- upvalues: Callback (ref), v2 (ref), ReactSchedulerYieldIntervalResult (ref), DeferredWork (ref), HeartbeatFrameMarker (ref), Flag1 (ref), ScaledClockTime (ref), ClampedValue (ref), Flag (ref), performWorkUntilDeadline (ref), setFrameMarker (copy), ReactGlobalsModule (copy), DescribeError (copy), ErrorToStringFunction (copy)
	if Callback == nil then
		Flag = false
		
		return
	end
	local ScaledClockTime1 = os.clock() * 1000
	v2 = ScaledClockTime1 + ReactSchedulerYieldIntervalResult
	local Flag2 = true
	
	if DeferredWork and not HeartbeatFrameMarker and not Flag1 then
		ScaledClockTime = ScaledClockTime1
	end
	if HeartbeatFrameMarker and Flag1 and ClampedValue - (os.clock() * 1000 - ScaledClockTime) <= ReactSchedulerYieldIntervalResult then
		Flag2 = false
	end
	local function doWork()
		-- upvalues: Callback (upval), Flag2 (ref), ScaledClockTime1 (copy), Flag (upval), DeferredWork (upval), ScaledClockTime (upval), ClampedValue (upval), ReactSchedulerYieldIntervalResult (upval), Flag1 (upval), performWorkUntilDeadline (upval), HeartbeatFrameMarker (upval), setFrameMarker (upval)
		if Callback(Flag2, ScaledClockTime1) then
			if DeferredWork then
				if ClampedValue - (os.clock() * 1000 - ScaledClockTime) > ReactSchedulerYieldIntervalResult then
					Flag1 = true
					task.defer(performWorkUntilDeadline)
				else
					Flag1 = false
					task.delay(0, performWorkUntilDeadline)
					
					if HeartbeatFrameMarker then
						task.defer(setFrameMarker)
					end
				end
			else
				task.delay(0, performWorkUntilDeadline)
			end
		else
			Flag = false
			Callback = nil
		end
		return nil
	end
	local Success = nil
	local Result = nil
	
	if ReactGlobalsModule.__YOLO__ then
		Result = doWork()
		Success = true
	else
		Success, Result = xpcall(doWork, DescribeError)
	end
	if not Success then
		task.delay(0, performWorkUntilDeadline)
		
		if HeartbeatFrameMarker then
			task.defer(setFrameMarker)
		end
		error(ErrorToStringFunction(Result))
	end
end

local _ = function(Callback)
	local Thread = coroutine.create(function()
		-- upvalues: Callback (copy)
		while true do
			local Success, Result = pcall((coroutine.wrap(Callback)))
			coroutine.yield(Success, Result)
		end
	end)
	
	return function()
		-- upvalues: Thread (copy)
		local _, Result, Resumed3 = coroutine.resume(Thread)
		
		if not Result then
			error(Resumed3)
		end
	end
end

local PerformWorkUntilDeadline = performWorkUntilDeadline
local Thread = coroutine.create(function()
	-- upvalues: PerformWorkUntilDeadline (copy)
	local Success, Result = pcall((coroutine.wrap(PerformWorkUntilDeadline)))
	coroutine.yield(Success, Result)
end)

performWorkUntilDeadline = function()
	-- upvalues: Thread (copy)
	local _, Result, Resumed3 = coroutine.resume(Thread)
	
	if not Result then
		error(Resumed3)
	end
end

return {
	requestHostCallback = function(p1)
		-- upvalues: Callback (ref), Flag (ref), performWorkUntilDeadline (ref), HeartbeatFrameMarker (ref), setFrameMarker (copy)
		Callback = p1
		
		if not Flag then
			Flag = true
			task.delay(0, performWorkUntilDeadline)
			
			if HeartbeatFrameMarker then
				task.defer(setFrameMarker)
			end
		end
	end,
	cancelHostCallback = function()
		-- upvalues: Callback (ref)
		Callback = nil
	end,
	requestHostTimeout = function(Callback, p1)
		-- upvalues: None (ref), SetTimeoutFunction (copy)
		None = SetTimeoutFunction(function()
			-- upvalues: Callback (copy)
			Callback(os.clock() * 1000)
		end, p1)
	end,
	cancelHostTimeout = function()
		-- upvalues: ClearTimeoutFunction (copy), None (ref), Object (copy)
		ClearTimeoutFunction(None)
		None = Object.None
	end,
	shouldYieldToHost = function(): boolean
		-- upvalues: v2 (ref)
		return v2 <= os.clock() * 1000
	end,
	requestPaint = function() end,
	getCurrentTime = GetCurrentTime,
	forceFrameRate = function(p1: number)
		-- upvalues: Console (copy), ReactSchedulerYieldIntervalResult (ref)
		if p1 < 0 or p1 > 125 then
			Console.warn("forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported")
			
			return
		end
		if p1 > 0 then
			ReactSchedulerYieldIntervalResult = math.floor(1000 / p1)
			
			return
		else
			ReactSchedulerYieldIntervalResult = 5
		end
	end,
	setSchedulerFlags = function(SchedulerFlags)
		-- upvalues: ReactSchedulerYieldIntervalResult (ref), DesiredFrameRate (ref), MinValue (ref), MaxValue (ref), MinimumFrameRate (ref), ClampedValue (ref), Value (ref), DeferredWork (ref), HeartbeatFrameMarker (ref), TargetMsByHeartbeatDelta (ref), HeartbeatConnection (ref), NumberOfLookbackFrames (ref), LookbackUseRingBuffer (ref), Buffer (copy), v1 (ref)
		if SchedulerFlags.yieldInterval ~= nil then
			ReactSchedulerYieldIntervalResult = SchedulerFlags.yieldInterval
		end
		if SchedulerFlags.desiredFrameRate ~= nil then
			DesiredFrameRate = SchedulerFlags.desiredFrameRate
			MinValue = 1000 / DesiredFrameRate
			MaxValue = 1000 / MinimumFrameRate
			ClampedValue = MinValue
			Value = ClampedValue
		end
		if SchedulerFlags.minimumFrameRate ~= nil then
			MinimumFrameRate = SchedulerFlags.minimumFrameRate
			MinValue = 1000 / DesiredFrameRate
			MaxValue = 1000 / MinimumFrameRate
			ClampedValue = MinValue
			Value = ClampedValue
		end
		if SchedulerFlags.deferredWork ~= nil then
			DeferredWork = SchedulerFlags.deferredWork
		end
		if SchedulerFlags.heartbeatFrameMarker ~= nil then
			HeartbeatFrameMarker = SchedulerFlags.heartbeatFrameMarker
		end
		if SchedulerFlags.targetMsByHeartbeatDelta ~= nil then
			TargetMsByHeartbeatDelta = SchedulerFlags.targetMsByHeartbeatDelta
			
			if SchedulerFlags.targetMsByHeartbeatDelta then
				if HeartbeatConnection then
					HeartbeatConnection:Disconnect()
				end
				HeartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(DeltaTime: number)
					-- upvalues: NumberOfLookbackFrames (upval), LookbackUseRingBuffer (upval), Buffer (upval), v1 (upval), Value (upval), ClampedValue (upval), MinValue (upval), MaxValue (upval)
					if NumberOfLookbackFrames <= 1 then
						ClampedValue = math.clamp(DeltaTime * 1000, MinValue, MaxValue)
						
						return
					end
					if LookbackUseRingBuffer then
						Buffer[v1] = DeltaTime * 1000
						v1 = v1 % NumberOfLookbackFrames + 1
						local Total = 0
						local NumberOfLookbackFrames: number = NumberOfLookbackFrames
						
						for i = 1, NumberOfLookbackFrames do
							if Buffer[i] == nil then
								NumberOfLookbackFrames = i - 1
								break
							else
								Total += Buffer[i]
							end
						end
						Value = Total / NumberOfLookbackFrames
					else
						local NumberOfLookbackFrames1: number = NumberOfLookbackFrames
						Value = (Value * (NumberOfLookbackFrames1 - 1) + DeltaTime * 1000) / NumberOfLookbackFrames1
					end
					ClampedValue = math.clamp(Value, MinValue, MaxValue)
				end)
			elseif HeartbeatConnection then
				HeartbeatConnection:Disconnect()
				HeartbeatConnection = nil
				ClampedValue = MinValue
			end
		end
		if SchedulerFlags.numberOfLookbackFrames ~= nil then
			NumberOfLookbackFrames = SchedulerFlags.numberOfLookbackFrames
		end
		if SchedulerFlags.lookbackUseRingBuffer ~= nil then
			LookbackUseRingBuffer = SchedulerFlags.lookbackUseRingBuffer
		end
	end,
	getSchedulerFlags = function()
		-- upvalues: ReactSchedulerYieldIntervalResult (ref), DesiredFrameRate (ref), MinimumFrameRate (ref), DeferredWork (ref), HeartbeatFrameMarker (ref), TargetMsByHeartbeatDelta (ref), NumberOfLookbackFrames (ref), LookbackUseRingBuffer (ref)
		return {
			yieldInterval = ReactSchedulerYieldIntervalResult,
			desiredFrameRate = DesiredFrameRate,
			minimumFrameRate = MinimumFrameRate,
			deferredWork = DeferredWork,
			heartbeatFrameMarker = HeartbeatFrameMarker,
			targetMsByHeartbeatDelta = TargetMsByHeartbeatDelta,
			numberOfLookbackFrames = NumberOfLookbackFrames,
			lookbackUseRingBuffer = LookbackUseRingBuffer
		}
	end
}