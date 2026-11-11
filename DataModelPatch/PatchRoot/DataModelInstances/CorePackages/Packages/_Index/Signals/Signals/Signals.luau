local SignalsSchedulerModule = require(script.Parent.Parent.SignalsScheduler)
local FlushFunction = SignalsSchedulerModule.flush
local ScheduleFunction = SignalsSchedulerModule.schedule
local CallUserSpaceModule = require(script.Parent.callUserSpace)
local Frozen = table.freeze({ __mode = "k" })

local function _(p1)
	-- upvalues: Frozen (copy)
	return (setmetatable(p1, Frozen))
end

local function defaultEquals(p1, p2): boolean
	return p1 == p2
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
	createSignal = function(p1, p2)
		-- upvalues: defaultEquals (copy), CallUserSpaceModule (copy), Frozen (copy), FlushFunction (copy)
		local Flag = false
		local ClockTime = 0
		local v1 = nil
		local self = nil
		local DefaultEquals = if p2 == nil then defaultEquals else p2
		
		local function ensureInitialized()
			-- upvalues: Flag (ref), v1 (ref), p1 (copy), CallUserSpaceModule (upval), ClockTime (ref), self (ref), Frozen (upval)
			if not Flag then
				Flag = true
				v1 = if typeof(p1) == "function" then CallUserSpaceModule(p1) else p1
				ClockTime = os.clock()
				self = setmetatable({}, Frozen)
			end
		end
		
		local function source(Key, p3)
			-- upvalues: self (ref), ClockTime (ref)
			if Key == nil then
				return ClockTime
			end
			if p3 then
				self[Key] = nil
			else
				self[Key] = true
			end
			return 0
		end
		
		local function _(Callback)
			-- upvalues: source (copy), self (ref)
			if Callback then
				self[Callback(source)] = true
			end
		end
		
		local _ = function()
			-- upvalues: self (ref)
			for i in self do
				i()
			end
			table.clear(self)
		end
		
		return function(Callback)
			-- upvalues: ensureInitialized (copy), source (copy), self (ref), v1 (ref)
			ensureInitialized()
			
			if Callback then
				self[Callback(source)] = true
			end
			return v1
		end, function(p3)
			-- upvalues: ensureInitialized (copy), CallUserSpaceModule (upval), v1 (ref), DefaultEquals (copy), ClockTime (ref), self (ref), FlushFunction (upval)
			ensureInitialized()
			local CallUserSpaceModuleResult = if typeof(p3) == "function" then CallUserSpaceModule(p3, v1) else p3
			
			if not CallUserSpaceModule(DefaultEquals, v1, CallUserSpaceModuleResult) then
				v1 = CallUserSpaceModuleResult
				ClockTime = os.clock()
				
				for i in self do
					i()
				end
				table.clear(self)
				FlushFunction()
			end
		end
	end,
	createComputed = function(p3, p4)
		-- upvalues: defaultEquals (copy), Frozen (copy), Callback (copy), CallUserSpaceModule (copy)
		local Flag = false
		local Flag1 = false
		local v2 = 0
		local ClockTime = 0
		local v3 = nil
		local T = nil
		local self = nil
		local DefaultEquals = if p4 == nil then defaultEquals else p4
		
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
		
		local function ensureInitialized()
			-- upvalues: Flag (ref), self (ref), Frozen (upval), T (ref), v3 (ref), Callback (upval), p3 (copy), scope (copy), ClockTime (ref), v2 (ref)
			if not Flag then
				Flag = true
				self = setmetatable({}, Frozen)
				T = {}
				v3 = Callback(p3, scope)
				ClockTime = os.clock()
				v2 = ClockTime
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
			-- upvalues: Flag1 (ref), T (ref), ClockTime (ref), observer (copy), Callback (upval), p3 (copy), scope (copy), CallUserSpaceModule (upval), DefaultEquals (copy), v3 (ref), v2 (ref)
			if Flag1 then
				Flag1 = false
				
				for i in T do
					if ClockTime < i() then
						for i1 in T do
							i1(observer, true)
						end
						table.clear(T)
						local CallbackResult = Callback(p3, scope)
						ClockTime = os.clock()
						
						if not CallUserSpaceModule(DefaultEquals, v3, CallbackResult) then
							v3 = CallbackResult
							v2 = ClockTime
						end
						return
					end
				end
				for i2 in T do
					i2(observer)
				end
			end
		end
		
		local function source(Key, p5)
			-- upvalues: self (ref), flushNotifications (copy), v2 (ref)
			if Key == nil then
				flushNotifications()
				
				return v2
			end
			if p5 then
				self[Key] = nil
			else
				self[Key] = true
			end
			return 0
		end
		
		local _ = function(Callback)
			-- upvalues: source (copy), self (ref)
			if Callback then
				self[Callback(source)] = true
			end
		end
		
		return function(Callback)
			-- upvalues: ensureInitialized (copy), flushNotifications (copy), source (copy), self (ref), v3 (ref)
			ensureInitialized()
			flushNotifications()
			
			if Callback then
				self[Callback(source)] = true
			end
			return v3
		end
	end,
	createEffect = function(p5)
		-- upvalues: Callback (copy), ScheduleFunction (copy)
		local Flag = false
		local Flag1 = false
		local ClockTime = 0
		local Tbl = {}
		local Observer = nil
		
		local function _()
			-- upvalues: Tbl (copy), Observer (ref)
			for i in Tbl do
				i(Observer, true)
			end
			table.clear(Tbl)
		end
		
		local function dispose()
			-- upvalues: Flag1 (ref), Tbl (copy), Observer (ref)
			Flag1 = true
			
			for i in Tbl do
				i(Observer, true)
			end
			table.clear(Tbl)
		end
		
		local function scope(Key)
			-- upvalues: Tbl (copy), Observer (ref)
			Tbl[Key] = true
			
			return Observer
		end
		
		local function processNotification()
			-- upvalues: Flag1 (ref), Flag (ref), Tbl (copy), ClockTime (ref), Observer (ref), Callback (upval), p5 (copy), scope (copy)
			if not Flag1 then
				Flag = false
				
				for i in Tbl do
					if ClockTime < i() then
						for i1 in Tbl do
							i1(Observer, true)
						end
						table.clear(Tbl)
						Callback(p5, scope)
						ClockTime = os.clock()
						
						return
					end
				end
				for i2 in Tbl do
					i2(Observer)
				end
			end
		end
		
		Observer = function()
			-- upvalues: Flag1 (ref), Flag (ref), ScheduleFunction (upval), processNotification (copy)
			if not Flag1 and not Flag then
				Flag = true
				ScheduleFunction(processNotification)
			end
		end
		
		Callback(p5, scope)
		ClockTime = os.clock()
		
		return dispose
	end
}