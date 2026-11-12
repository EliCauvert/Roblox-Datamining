local SignalsSchedulerModule = require(script.Parent.Parent.SignalsScheduler)
local FlushFunction = SignalsSchedulerModule.flush
local ScheduleFunction = SignalsSchedulerModule.schedule
local CallUserSpaceModule = require(script.Parent.callUserSpace)

local function noop() end

local function noopReturningZero(): number
	return 0
end

local OnSignalSet = noop
local OnSignalNotify = noop
local BeginComputedEval = noopReturningZero
local EndComputedEval = noop
local BeginEffectRun = noopReturningZero
local EndEffectRun = noop
local ShowInternals = false
local WarnScopelessReads = false

local function Report(Message)
	warn(Message)
end

local Frozen = table.freeze({ __mode = "k" })

local function _(p1)
	-- upvalues: Frozen (copy)
	return (setmetatable(p1, Frozen))
end

local function defaultEquals(p1, p2): boolean
	return p1 == p2
end

local t = {}

local _ = function()
	-- upvalues: t (copy), Report (ref)
	local Traceback = debug.traceback("", 3)
	
	if t[Traceback] == nil then
		t[Traceback] = true
		Report(`Signals: a source was read without naming a scope, so nothing re-runs when it changes:{Traceback}`)
	end
end

local function handleError(p1, ...)
	if not p1 then
		error((...))
	end
end

local function handleScopeValidation(Callback: () -> (), Success, ...)
	-- upvalues: handleError (copy)
	Callback()
	handleError(Success, ...)
	
	return ...
end

local function callUserSpaceWithScopeValidation(p1, Callback)
	-- upvalues: handleScopeValidation (copy), CallUserSpaceModule (copy)
	local Flag = true
	
	return handleScopeValidation(function()
		-- upvalues: Flag (ref)
		Flag = false
	end, pcall(CallUserSpaceModule, p1, function(p2)
		-- upvalues: Flag (ref), Callback (copy)
		if not Flag then
			error("attempted to use scope beyond scope's lifetime")
		end
		return Callback(p2)
	end))
end

local SIGNALSVALIDATIONENABLED = _G.__SIGNALS_VALIDATION_ENABLED__ or _G.__DEV__
local Callback = if SIGNALSVALIDATIONENABLED then callUserSpaceWithScopeValidation else CallUserSpaceModule

return {
	createSignal = function(Value, p1, Name)
		-- upvalues: defaultEquals (copy), ShowInternals (ref), CallUserSpaceModule (copy), Frozen (copy), WarnScopelessReads (ref), t (copy), Report (ref), OnSignalNotify (ref), OnSignalSet (ref), FlushFunction (copy)
		local Flag = false
		local ClockTime = 0
		local Value1 = nil
		local self = nil
		local DefaultEquals = if p1 == nil then defaultEquals else p1
		local Config = if ShowInternals then { version = 0, name = Name, value = Value } else nil
		
		local function ensureInitialized()
			-- upvalues: Flag (ref), Value1 (ref), Value (copy), CallUserSpaceModule (upval), ClockTime (ref), self (ref), Frozen (upval), Config (copy)
			if not Flag then
				Flag = true
				Value1 = if typeof(Value) == "function" then CallUserSpaceModule(Value) else Value
				ClockTime = os.clock()
				self = setmetatable({}, Frozen)
				
				if Config then
					Config.version = ClockTime
					Config.value = Value1
					Config.observers = self
				end
			end
		end
		
		local function source(Key, p2)
			-- upvalues: self (ref), ClockTime (ref)
			if Key == nil then
				return ClockTime
			end
			if p2 then
				self[Key] = nil
			else
				self[Key] = true
			end
			return 0
		end
		
		local function _(Callback)
			-- upvalues: source (copy), self (ref), WarnScopelessReads (upval), t (upval), Report (upval)
			if Callback then
				local CallbackResult = Callback(source)
				
				if CallbackResult ~= nil then
					self[CallbackResult] = true
					
					return
				end
			elseif Callback == nil and WarnScopelessReads then
				local Traceback = debug.traceback("", 3)
				
				if t[Traceback] == nil then
					t[Traceback] = true
					Report(`Signals: a source was read without naming a scope, so nothing re-runs when it changes:{Traceback}`)
				end
			end
		end
		
		local _ = function()
			-- upvalues: self (ref), OnSignalNotify (upval)
			local Count = 0
			
			for i in self do
				i()
				Count += 1
			end
			OnSignalNotify(Count)
			table.clear(self)
		end
		
		return function(Callback)
			-- upvalues: ensureInitialized (copy), source (copy), self (ref), WarnScopelessReads (upval), t (upval), Report (upval), Value1 (ref)
			ensureInitialized()
			
			if Callback then
				local CallbackResult = Callback(source)
				
				if CallbackResult ~= nil then
					self[CallbackResult] = true
				end
			elseif Callback == nil and WarnScopelessReads then
				local Traceback = debug.traceback("", 3)
				
				if t[Traceback] == nil then
					t[Traceback] = true
					Report(`Signals: a source was read without naming a scope, so nothing re-runs when it changes:{Traceback}`)
				end
			end
			return Value1
		end, function(p2)
			-- upvalues: ensureInitialized (copy), CallUserSpaceModule (upval), Value1 (ref), DefaultEquals (copy), OnSignalSet (upval), ClockTime (ref), Config (copy), self (ref), OnSignalNotify (upval), FlushFunction (upval)
			ensureInitialized()
			local CallUserSpaceModuleResult = if typeof(p2) == "function" then CallUserSpaceModule(p2, Value1) else p2
			
			if not CallUserSpaceModule(DefaultEquals, Value1, CallUserSpaceModuleResult) then
				OnSignalSet()
				Value1 = CallUserSpaceModuleResult
				ClockTime = os.clock()
				
				if Config then
					Config.version = ClockTime
					Config.value = Value1
				end
				local Count = 0
				
				for i in self do
					i()
					Count += 1
				end
				OnSignalNotify(Count)
				table.clear(self)
				FlushFunction()
			end
		end
	end,
	createComputed = function(p2, Name, Name1)
		-- upvalues: defaultEquals (copy), ShowInternals (ref), BeginComputedEval (ref), Callback (copy), EndComputedEval (ref), Frozen (copy), CallUserSpaceModule (copy), WarnScopelessReads (ref), t (copy), Report (ref)
		local Flag = false
		local Flag1 = false
		local v1 = 0
		local ClockTime = 0
		
		if typeof(Name) == "string" then
			Name1 = Name
			Name = nil
		end
		local Value = nil
		local T = nil
		local self = nil
		local DefaultEquals = if Name == nil then defaultEquals else Name
		local Config = if ShowInternals then { version = 0, name = Name1 } else nil
		
		local function _()
			-- upvalues: self (ref)
			for i in self do
				i()
			end
			table.clear(self)
		end
		
		local function observer()
			-- upvalues: Flag1 (ref), self (ref)
			if not Flag1 then
				Flag1 = true
				
				for i in self do
					i()
				end
				table.clear(self)
			end
		end
		
		local function scope(Key)
			-- upvalues: T (ref), observer (copy)
			T[Key] = true
			
			return observer
		end
		
		local _ = function()
			-- upvalues: BeginComputedEval (upval), Callback (upval), p2 (copy), scope (copy), EndComputedEval (upval)
			local BeginComputedEvalResult = BeginComputedEval()
			local CallbackResult = Callback(p2, scope)
			EndComputedEval(BeginComputedEvalResult)
			
			return CallbackResult
		end
		
		local function ensureInitialized()
			-- upvalues: Flag (ref), self (ref), Frozen (upval), T (ref), Value (ref), BeginComputedEval (upval), Callback (upval), p2 (copy), scope (copy), EndComputedEval (upval), ClockTime (ref), v1 (ref), Config (copy)
			if not Flag then
				Flag = true
				self = setmetatable({}, Frozen)
				T = {}
				local BeginComputedEvalResult = BeginComputedEval()
				local CallbackResult = Callback(p2, scope)
				EndComputedEval(BeginComputedEvalResult)
				Value = CallbackResult
				ClockTime = os.clock()
				v1 = ClockTime
				
				if Config then
					Config.version = ClockTime
					Config.value = Value
				end
			end
		end
		
		local _ = function()
			-- upvalues: T (ref), observer (copy)
			for i in T do
				i(observer, true)
			end
			table.clear(T)
		end
		
		local function flushNotifications()
			-- upvalues: Flag1 (ref), T (ref), ClockTime (ref), observer (copy), BeginComputedEval (upval), Callback (upval), p2 (copy), scope (copy), EndComputedEval (upval), CallUserSpaceModule (upval), DefaultEquals (copy), Value (ref), v1 (ref), Config (copy)
			if Flag1 then
				Flag1 = false
				
				for i in T do
					if ClockTime < i() then
						for i1 in T do
							i1(observer, true)
						end
						table.clear(T)
						local BeginComputedEvalResult = BeginComputedEval()
						local CallbackResult = Callback(p2, scope)
						EndComputedEval(BeginComputedEvalResult)
						ClockTime = os.clock()
						
						if not CallUserSpaceModule(DefaultEquals, Value, CallbackResult) then
							Value = CallbackResult
							v1 = ClockTime
							
							if Config then
								Config.version = ClockTime
								Config.value = Value
							end
						end
						return
					end
				end
				for i2 in T do
					i2(observer)
				end
			end
		end
		
		local function source(Key, p3)
			-- upvalues: self (ref), flushNotifications (copy), v1 (ref)
			if Key == nil then
				flushNotifications()
				
				return v1
			end
			if p3 then
				self[Key] = nil
			else
				self[Key] = true
			end
			return 0
		end
		
		local _ = function(Callback)
			-- upvalues: source (copy), self (ref), WarnScopelessReads (upval), t (upval), Report (upval)
			if Callback then
				local CallbackResult = Callback(source)
				
				if CallbackResult ~= nil then
					self[CallbackResult] = true
					
					return
				end
			elseif Callback == nil and WarnScopelessReads then
				local Traceback = debug.traceback("", 3)
				
				if t[Traceback] == nil then
					t[Traceback] = true
					Report(`Signals: a source was read without naming a scope, so nothing re-runs when it changes:{Traceback}`)
				end
			end
		end
		
		return function(Callback)
			-- upvalues: ensureInitialized (copy), flushNotifications (copy), source (copy), self (ref), WarnScopelessReads (upval), t (upval), Report (upval), Value (ref)
			ensureInitialized()
			flushNotifications()
			
			if Callback then
				local CallbackResult = Callback(source)
				
				if CallbackResult ~= nil then
					self[CallbackResult] = true
				end
			elseif Callback == nil and WarnScopelessReads then
				local Traceback = debug.traceback("", 3)
				
				if t[Traceback] == nil then
					t[Traceback] = true
					Report(`Signals: a source was read without naming a scope, so nothing re-runs when it changes:{Traceback}`)
				end
			end
			return Value
		end
	end,
	createEffect = function(p3, Callback1: (any) -> (), p4)
		-- upvalues: Report (ref), BeginEffectRun (ref), Callback (copy), EndEffectRun (ref), ScheduleFunction (copy)
		local Flag = false
		local Flag1 = false
		local Flag2 = false
		local ClockTime = 0
		local v2 = nil
		local Tbl = {}
		local v3 = nil
		
		local function _()
			-- upvalues: v2 (ref), Report (upval), p4 (copy)
			if v2 then
				local v4 = v2
				v2 = nil
				local Success, Result = pcall(v4)
				
				if not Success then
					Report(`Signals: effect cleanup error{if p4 then ` in '{p27}'` else ""}: {Result}`)
				end
			end
		end
		
		local _ = function()
			-- upvalues: Tbl (copy), v3 (ref)
			for i in Tbl do
				i(v3, true)
			end
			table.clear(Tbl)
		end
		
		local function dispose()
			-- upvalues: Flag2 (ref), v2 (ref), Report (upval), p4 (copy), Tbl (copy), v3 (ref)
			Flag2 = true
			
			if v2 then
				local v5 = v2
				v2 = nil
				local Success, Result = pcall(v5)
				
				if not Success then
					Report(`Signals: effect cleanup error{if p4 then ` in '{p27}'` else ""}: {Result}`)
				end
			end
			for i in Tbl do
				i(v3, true)
			end
			table.clear(Tbl)
		end
		
		local function scope(Key)
			-- upvalues: Tbl (copy), v3 (ref)
			Tbl[Key] = true
			
			return v3
		end
		
		local _ = function()
			-- upvalues: v2 (ref), Report (upval), p4 (copy), BeginEffectRun (upval), Callback (upval), p3 (copy), scope (copy), EndEffectRun (upval)
			if v2 then
				local v6 = v2
				v2 = nil
				local Success, Result = pcall(v6)
				
				if not Success then
					Report(`Signals: effect cleanup error{if p4 then ` in '{p27}'` else ""}: {Result}`)
				end
			end
			local BeginEffectRunResult = BeginEffectRun()
			local CallbackResult = Callback(p3, scope)
			EndEffectRun(BeginEffectRunResult, p4)
			
			if typeof(CallbackResult) == "function" then
				v2 = CallbackResult
			end
		end
		
		local function processNotification()
			-- upvalues: Flag2 (ref), Flag1 (ref), Flag (ref), v2 (ref), Report (upval), p4 (copy), BeginEffectRun (upval), Callback (upval), p3 (copy), scope (copy), EndEffectRun (upval), ClockTime (ref), Tbl (copy), v3 (ref)
			if Flag2 then return end
			Flag1 = false
			
			if Flag then
				for i in Tbl do
					if ClockTime < i() then
						for i1 in Tbl do
							i1(v3, true)
						end
						table.clear(Tbl)
						
						if v2 then
							local v7 = v2
							v2 = nil
							local Success1, Result1 = pcall(v7)
							
							if not Success1 then
								Report(`Signals: effect cleanup error{if p4 then ` in '{p27}'` else ""}: {Result1}`)
							end
						end
						local BeginEffectRunResult = BeginEffectRun()
						local CallbackResult = Callback(p3, scope)
						EndEffectRun(BeginEffectRunResult, p4)
						
						if typeof(CallbackResult) == "function" then
							v2 = CallbackResult
						end
						ClockTime = os.clock()
						
						return
					end
				end
				for i2 in Tbl do
					i2(v3)
				end
				return
			else
				if v2 then
					local v8 = v2
					v2 = nil
					local Success, Result = pcall(v8)
					
					if not Success then
						Report(`Signals: effect cleanup error{if p4 then ` in '{p27}'` else ""}: {Result}`)
					end
				end
				local BeginEffectRunResult = BeginEffectRun()
				local CallbackResult = Callback(p3, scope)
				EndEffectRun(BeginEffectRunResult, p4)
				
				if typeof(CallbackResult) == "function" then
					v2 = CallbackResult
				end
				ClockTime = os.clock()
				Flag = true
			end
		end
		
		v3 = function()
			-- upvalues: Flag2 (ref), Flag1 (ref), Callback1 (copy), processNotification (copy), ScheduleFunction (upval)
			if not Flag2 and not Flag1 then
				Flag1 = true
				
				if Callback1 then
					Callback1(processNotification)
					
					return
				end
				ScheduleFunction(processNotification)
			end
		end
		
		if Callback1 then
			Flag1 = true
			Callback1(processNotification)
		else
			if v2 then
				local v9 = v2
				v2 = nil
				local Success, Result = pcall(v9)
				
				if not Success then
					Report(`Signals: effect cleanup error{if p4 then ` in '{p27}'` else ""}: {Result}`)
				end
			end
			local BeginEffectRunResult = BeginEffectRun()
			local CallbackResult = Callback(p3, scope)
			EndEffectRun(BeginEffectRunResult, p4)
			
			if typeof(CallbackResult) == "function" then
				v2 = CallbackResult
			end
			ClockTime = os.clock()
			Flag = true
		end
		return dispose
	end,
	createInternalSource = function(p5)
		-- upvalues: Frozen (copy), WarnScopelessReads (ref), t (copy), Report (ref)
		local ClockTime = os.clock()
		local v10 = p5
		local self = setmetatable({}, Frozen)
		
		local function source(Key, p6)
			-- upvalues: self (copy), ClockTime (ref)
			if Key == nil then
				return ClockTime
			end
			if p6 then
				self[Key] = nil
			else
				self[Key] = true
			end
			return 0
		end
		
		return function(Callback)
			-- upvalues: source (copy), self (copy), WarnScopelessReads (upval), t (upval), Report (upval), v10 (ref)
			if Callback then
				local CallbackResult = Callback(source)
				
				if CallbackResult ~= nil then
					self[CallbackResult] = true
				end
			elseif Callback == nil and WarnScopelessReads then
				local Traceback = debug.traceback("", 3)
				
				if t[Traceback] == nil then
					t[Traceback] = true
					Report(`Signals: a source was read without naming a scope, so nothing re-runs when it changes:{Traceback}`)
				end
			end
			return v10
		end, function(p6)
			-- upvalues: v10 (ref), ClockTime (ref), self (copy)
			if v10 ~= p6 then
				v10 = p6
				ClockTime = os.clock()
				
				for i in self do
					i()
				end
				table.clear(self)
			end
		end
	end,
	isCallable = function(Callback): boolean
		if type(Callback) == "function" then
			return true
		elseif type(Callback) == "table" then
			local Meta = getmetatable(Callback)
			
			return Meta ~= nil and typeof(Meta.__call) == "function"
		else
			return false
		end
	end,
	peek = function(Callback)
		return if type(Callback) == "function" then Callback(false) else Callback
	end,
	batch = SignalsSchedulerModule.batch,
	flush = FlushFunction,
	schedule = ScheduleFunction,
	setHooks = function(p6)
		-- upvalues: OnSignalSet (ref), noop (copy), OnSignalNotify (ref), BeginComputedEval (ref), noopReturningZero (copy), EndComputedEval (ref), BeginEffectRun (ref), EndEffectRun (ref)
		local T = if p6 == nil then {} else p6
		OnSignalSet = T.onSignalSet or noop
		OnSignalNotify = T.onSignalNotify or noop
		BeginComputedEval = T.beginComputedEval or noopReturningZero
		EndComputedEval = T.endComputedEval or noop
		BeginEffectRun = T.beginEffectRun or noopReturningZero
		EndEffectRun = T.endEffectRun or noop
	end,
	configure = function(p6)
		-- upvalues: ShowInternals (ref), WarnScopelessReads (ref), Report (ref)
		if p6.showInternals ~= nil then
			ShowInternals = p6.showInternals
		end
		if p6.warnScopelessReads ~= nil then
			WarnScopelessReads = p6.warnScopelessReads
		end
		if p6.report ~= nil then
			Report = p6.report
		end
	end
}