local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local InstanceofFunction = LuauPolyfillModule.instanceof
local Boolean = LuauPolyfillModule.Boolean
local Error1 = LuauPolyfillModule.Error
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local Array = LuauPolyfillModule.Array
local SymbolFunction = LuauPolyfillModule.Symbol
local Module = nil
local v1 = nil
local Callback = nil
local isObservableClass = nil

local function _(p1): boolean
	if typeof(p1) == "function" then
		return true
	end
	if typeof(p1) == "table" then
		local Meta = getmetatable(p1)
		
		if Meta and rawget(Meta, "__call") then
			return true
		elseif p1._isMockFunction then
			return true
		end
	end
	return false
end

local _ = function(): boolean
	-- upvalues: SymbolFunction (copy)
	return typeof(SymbolFunction) == "table" and typeof(getmetatable(SymbolFunction).__call) == "function"
end

local _ = function(p1)
	-- upvalues: SymbolFunction (copy), Boolean (copy)
	return typeof(SymbolFunction) == "table" and typeof(getmetatable(SymbolFunction).__call) == "function" and Boolean.toJSBoolean(SymbolFunction[p1])
end

local _ = function(Text)
	-- upvalues: SymbolFunction (copy), Boolean (copy)
	local JSBoolean = typeof(SymbolFunction) == "table" and (typeof(getmetatable(SymbolFunction).__call) == "function" and Boolean.toJSBoolean(SymbolFunction[Text]))
	
	return if JSBoolean then SymbolFunction[Text] else "@@" .. Text
end

if typeof(SymbolFunction) == "table" and typeof(getmetatable(SymbolFunction).__call) == "function" and (typeof(SymbolFunction) ~= "table" or typeof(getmetatable(SymbolFunction).__call) ~= "function" or not Boolean.toJSBoolean(SymbolFunction.observable)) then
	SymbolFunction.observable = SymbolFunction("observable")
end
if typeof(SymbolFunction) == "table" and typeof(getmetatable(SymbolFunction).__call) == "function" and Boolean.toJSBoolean(SymbolFunction.iterator) then
	local _ = SymbolFunction.iterator
end
local JSBoolean = typeof(SymbolFunction) == "table" and (typeof(getmetatable(SymbolFunction).__call) == "function" and Boolean.toJSBoolean(SymbolFunction.observable))
local Observable = if JSBoolean then SymbolFunction.observable else "@@observable"
local JSBoolean1 = typeof(SymbolFunction) == "table" and (typeof(getmetatable(SymbolFunction).__call) == "function" and Boolean.toJSBoolean(SymbolFunction.species))
local Species = if JSBoolean1 then SymbolFunction.species else "@@species"

local function getMethod(p1, p2)
	-- upvalues: Error1 (copy)
	local v2 = p1[p2]
	local Flag = nil
	
	if v2 == nil then
		return nil
	end
	repeat
		if typeof(v2) == "function" then
			Flag = true
			break
		end
		if typeof(v2) == "table" then
			local Meta = getmetatable(v2)
			
			if Meta and rawget(Meta, "__call") then
				Flag = true
				break
			end
			if v2._isMockFunction then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	if not Flag then
		error(Error1.new(tostring(v2) .. " is not a function"))
	end
	return v2
end

local _ = function(p1)
	-- upvalues: Species (copy), Module (ref)
	local v2 = p1[Species]
	
	return if v2 == nil then Module else v2
end

local _ = function(p1)
	-- upvalues: InstanceofFunction (copy), Module (ref)
	return InstanceofFunction(p1, Module)
end

local HostReportError = nil
HostReportError = setmetatable({}, {
	__call = function(_, p1)
		-- upvalues: HostReportError (ref), SetTimeoutFunction (copy)
		if HostReportError.log then
			HostReportError:log(p1)
			
			return
		else
			SetTimeoutFunction(function()
				-- upvalues: p1 (copy)
				error(p1)
			end, 0)
		end
	end
})

local _ = function(p1)
	-- upvalues: PromiseModule (copy), HostReportError (ref)
	PromiseModule.delay(0):doneCall(function()
		-- upvalues: p1 (copy), HostReportError (upval)
		xpcall(p1, function(Err)
			-- upvalues: HostReportError (upval)
			HostReportError(Err)
		end)
	end)
end

local function cleanupSubscription(p1)
	-- upvalues: Error1 (copy), HostReportError (ref)
	local Cleanup = p1._cleanup
	
	if Cleanup == nil then return end
	p1._cleanup = nil
	
	if not Cleanup then return end
	local v2 = true
	local v3 = nil
	local Flag = nil
	repeat
		if typeof(Cleanup) == "function" then
			Flag = true
			break
		end
		if typeof(Cleanup) == "table" then
			local Meta = getmetatable(Cleanup)
			
			if Meta and rawget(Meta, "__call") then
				Flag = true
				break
			end
			if Cleanup._isMockFunction then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	if Flag then
		v2, v37 = pcall(Cleanup)
	else
		local Unsubscribe = Cleanup.unsubscribe
		local Flag1 = nil
		local v4 = nil
		
		if Unsubscribe == nil then
			v4 = nil
		else
			repeat
				if typeof(Unsubscribe) == "function" then
					Flag1 = true
					break
				end
				if typeof(Unsubscribe) == "table" then
					local Meta = getmetatable(Unsubscribe)
					
					if Meta and rawget(Meta, "__call") then
						Flag1 = true
						break
					end
					if Unsubscribe._isMockFunction then
						Flag1 = true
						break
					end
				end
				Flag1 = false
			until true
			if not Flag1 then
				error(Error1.new(tostring(Unsubscribe) .. " is not a function"))
			end
			v4 = Unsubscribe
		end
		if v4 then
			v2, v37 = pcall(v4, Cleanup)
		end
	end
	if not v2 then
		HostReportError(v3)
	end
end

local _ = function(p1)
	p1._observer = nil
	p1._queue = nil
	p1._state = "closed"
end

local function flushSubscription(p1)
	-- upvalues: Boolean (copy), Callback (ref)
	local Queue = p1._queue
	
	if not Boolean.toJSBoolean(Queue) then return end
	p1._queue = nil
	p1._state = "ready"
	
	for i = 1, #Queue do
		Callback(p1, Queue[i].type, Queue[i].value)
		
		if p1._state == "closed" then break end
	end
end

Callback = function(p2, Type, p3)
	-- upvalues: getMethod (copy), HostReportError (ref), cleanupSubscription (copy)
	p2._state = "running"
	local Observer = p2._observer
	local v2 = nil
	local Success, Result = pcall(getMethod, Observer, Type)
	
	if not Success then
		HostReportError(Result)
		
		return
	end
	if Type == "next" then
		if Result then
			Success, v46 = pcall(Result, Observer, p3)
		end
	elseif Type == "error" then
		p2._observer = nil
		p2._queue = nil
		p2._state = "closed"
		
		if Result then
			Success, v46 = pcall(Result, Observer, p3)
		else
			HostReportError(p3)
		end
	elseif Type == "complete" then
		p2._observer = nil
		p2._queue = nil
		p2._state = "closed"
		
		if Result then
			Success, v46 = pcall(Result, Observer, p3)
		end
	end
	if not Success then
		HostReportError(v2)
	end
	if p2._state == "closed" then
		cleanupSubscription(p2)
		
		return
	end
	if p2._state == "running" then
		p2._state = "ready"
	end
end

local function onNotify(Subscription, p2, Value)
	-- upvalues: flushSubscription (copy), PromiseModule (copy), HostReportError (ref), Callback (ref)
	if Subscription._state == "closed" then return end
	if Subscription._state == "buffering" then
		assert(Subscription._queue, "observable subscription queue nil during onNotify")
		table.insert(Subscription._queue, { type = p2, value = Value })
		
		return
	end
	if Subscription._state == "ready" then
		Callback(Subscription, p2, Value)
		
		return
	else
		Subscription._state = "buffering"
		Subscription._queue = { { type = p2, value = Value } }
		
		local function v49()
			-- upvalues: flushSubscription (upval), Subscription (copy)
			return flushSubscription(Subscription)
		end
		
		PromiseModule.delay(0):doneCall(function()
			-- upvalues: v49 (copy), HostReportError (upval)
			xpcall(v49, function(Err)
				-- upvalues: HostReportError (upval)
				HostReportError(Err)
			end)
		end)
	end
end

local t = {}

function t.__index(p2, p3)
	-- upvalues: t (copy)
	return if p3 == "closed" then p2._state == "closed" elseif rawget(p2, p3) then rawget(p2, p3) elseif rawget(t, p3) then rawget(t, p3) else nil
end

function t.__newindex(p2, p3, p4)
	if p3 == "closed" then
		error("setting getter-only property 'closed'")
	end
	rawset(p2, p3, p4)
end

function t.new(_observer, Subscriber)
	-- upvalues: t (copy), v1 (ref)
	local self = setmetatable({}, t)
	self._cleanup = nil
	self._observer = _observer
	self._queue = nil
	self._state = "initializing"
	local NewResult = v1.new(self)
	local Success, Result = pcall(Subscriber, NewResult)
	
	if Success then
		self._cleanup = Result
	else
		NewResult:error(Result)
	end
	if self._state == "initializing" then
		self._state = "ready"
	end
	return self
end

function t:unsubscribe()
	-- upvalues: cleanupSubscription (copy)
	if self._state ~= "closed" then
		self._observer = nil
		self._queue = nil
		self._state = "closed"
		cleanupSubscription(self)
	end
end

v1 = {}

function v1.__index(p2, p3)
	-- upvalues: v1 (ref)
	return if p3 == "closed" then p2._subscription._state == "closed" elseif rawget(v1, p3) then rawget(v1, p3) else rawget(p2, p3)
end

function v1.__newindex(p2, p3, p4)
	if p3 == "closed" then
		error("setting getter-only property 'closed'")
	end
	rawset(p2, p3, p4)
end

function v1.new(_subscription)
	-- upvalues: v1 (ref)
	return (setmetatable({ _subscription = _subscription }, v1))
end

function v1:next(p2)
	-- upvalues: onNotify (copy)
	onNotify(self._subscription, "next", p2)
end

function v1:error(p2)
	-- upvalues: onNotify (copy)
	onNotify(self._subscription, "error", p2)
end

function v1:complete()
	-- upvalues: onNotify (copy)
	onNotify(self._subscription, "complete")
end

Module = {}
Module.__index = Module

isObservableClass = function(p2): boolean
	-- upvalues: Observable (copy), Module (ref)
	return typeof(p2) == "table" and p2[Observable] == Module[Observable] and typeof((rawget(p2, "new"))) == "function"
end

function Module.new(_subscriber)
	-- upvalues: Module (ref)
	local Flag = nil
	repeat
		if typeof(_subscriber) == "function" then
			Flag = true
			break
		end
		if typeof(_subscriber) == "table" then
			local Meta = getmetatable(_subscriber)
			
			if Meta and rawget(Meta, "__call") then
				Flag = true
				break
			end
			if _subscriber._isMockFunction then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	if not Flag then
		error("Observable initializer must be a function")
	end
	return (setmetatable({ _subscriber = _subscriber }, Module))
end

function Module:subscribe(Observer, p2, Complete)
	-- upvalues: t (copy)
	if typeof(Observer) ~= "table" or Observer == nil then
		Observer = {
			start = nil,
			next = Observer,
			error = p2,
			complete = Complete
		}
	end
	return (t.new(Observer, self._subscriber))
end

function Module.forEach(p2, p3)
	-- upvalues: PromiseModule (copy), Error1 (copy)
	return PromiseModule.new(function(Callback1, Callback: (any) -> ())
		-- upvalues: p3 (copy), Error1 (upval), p2 (copy)
		local Flag = nil
		repeat
			if typeof(p3) == "function" then
				Flag = true
				break
			end
			if typeof(p3) == "table" then
				local Meta = getmetatable(p3)
				
				if Meta and rawget(Meta, "__call") then
					Flag = true
					break
				end
				if p3._isMockFunction then
					Flag = true
					break
				end
			end
			Flag = false
		until true
		if Flag then
			local SubscribeResult = nil
			
			local function done()
				-- upvalues: SubscribeResult (ref), Callback1 (copy)
				SubscribeResult:unsubscribe()
				Callback1()
			end
			
			SubscribeResult = p2:subscribe({
				next = function(_, p4)
					-- upvalues: p3 (upval), done (copy), Callback (copy), SubscribeResult (ref)
					local Success, Result = pcall(p3, p4, done)
					
					if not Success then
						Callback(Result)
						SubscribeResult:unsubscribe()
					end
				end,
				error = function(_, p4)
					-- upvalues: Callback (copy)
					Callback(p4)
				end,
				complete = function(_)
					-- upvalues: Callback1 (copy)
					Callback1()
				end
			})
			
			return
		else
			Callback(Error1.new(tostring(p3) .. " is not a function"))
		end
	end)
end

function Module:map(p2)
	-- upvalues: Error1 (copy), Species (copy), Module (ref)
	local Flag = nil
	repeat
		if typeof(p2) == "function" then
			Flag = true
			break
		end
		if typeof(p2) == "table" then
			local Meta = getmetatable(p2)
			
			if Meta and rawget(Meta, "__call") then
				Flag = true
				break
			end
			if p2._isMockFunction then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	if not Flag then
		error(Error1.new(tostring(p2) .. " is not a function"))
	end
	local v2 = self[Species]
	
	return (if v2 == nil then Module else v2).new(function(p3)
		-- upvalues: self (copy), p2 (copy)
		return self:subscribe({
			next = function(_, p4)
				-- upvalues: p2 (upval), p3 (copy)
				local Success, Result = pcall(p2, p4)
				
				if Success then
					p3:next(Result)
					
					return
				else
					p3:error(Result)
				end
			end,
			error = function(_, p4)
				-- upvalues: p3 (copy)
				p3:error(p4)
			end,
			complete = function(_)
				-- upvalues: p3 (copy)
				p3:complete()
			end
		})
	end)
end

function Module:filter(p2)
	-- upvalues: Error1 (copy), Species (copy), Module (ref), Boolean (copy)
	local Flag = nil
	repeat
		if typeof(p2) == "function" then
			Flag = true
			break
		end
		if typeof(p2) == "table" then
			local Meta = getmetatable(p2)
			
			if Meta and rawget(Meta, "__call") then
				Flag = true
				break
			end
			if p2._isMockFunction then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	if not Flag then
		error(Error1.new(tostring(p2) .. " is not a function"))
	end
	local v2 = self[Species]
	
	return (if v2 == nil then Module else v2).new(function(p3)
		-- upvalues: self (copy), p2 (copy), Boolean (upval)
		return self:subscribe({
			next = function(_, p4)
				-- upvalues: p2 (upval), p3 (copy), Boolean (upval)
				local Success, Result = xpcall(p2, function(Err)
					-- upvalues: p3 (upval)
					p3:error(Err)
				end, p4)
				
				if Success and not Boolean.toJSBoolean(Result) then return end
				if Success then
					p3:next(p4)
					
					return
				end
			end,
			error = function(_, p4)
				-- upvalues: p3 (copy)
				p3:error(p4)
			end,
			complete = function(_)
				-- upvalues: p3 (copy)
				p3:complete()
			end
		})
	end)
end

function Module:reduce(p2, ...)
	-- upvalues: Error1 (copy), Species (copy), Module (ref)
	local list = { p2, ... }
	local Flag = nil
	repeat
		if typeof(p2) == "function" then
			Flag = true
			break
		end
		if typeof(p2) == "table" then
			local Meta = getmetatable(p2)
			
			if Meta and rawget(Meta, "__call") then
				Flag = true
				break
			end
			if p2._isMockFunction then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	if not Flag then
		error(Error1.new(tostring(p2) .. " is not a function"))
	end
	local v2 = self[Species]
	local Module1 = if v2 == nil then Module else v2
	local v3 = #list > 1
	local Flag1 = false
	local Entry = list[2]
	
	return Module1.new(function(p3)
		-- upvalues: self (copy), Flag1 (ref), v3 (copy), Entry (ref), p2 (copy), Error1 (upval)
		return self:subscribe({
			next = function(_, p4)
				-- upvalues: Flag1 (upval), v3 (upval), Entry (upval), p2 (upval), p3 (copy)
				local NoFlag = not Flag1
				Flag1 = true
				
				if NoFlag and not v3 then
					Entry = p4
					
					return
				else
					local _, Result = xpcall(p2, function(Err)
						-- upvalues: p3 (upval)
						p3:error(Err)
					end, Entry, p4)
					Entry = Result
				end
			end,
			error = function(_, p4)
				-- upvalues: p3 (copy)
				p3:error(p4)
			end,
			complete = function(_)
				-- upvalues: Flag1 (upval), v3 (upval), p3 (copy), Error1 (upval), Entry (upval)
				if not Flag1 and not v3 then
					p3:error(Error1.new("Cannot reduce an empty sequence"))
				end
				p3:next(Entry)
				p3:complete()
			end
		})
	end)
end

function Module:concat(...)
	-- upvalues: Species (copy), Module (ref), Boolean (copy)
	local list = { ... }
	local v2 = self[Species]
	local Module1 = if v2 == nil then Module else v2
	
	return Module1.new(function(p2)
		-- upvalues: list (copy), Module1 (copy), self (copy), Boolean (upval)
		local SubscribeResult = nil
		local Count = 1
		
		local function startNext(FromResult)
			-- upvalues: SubscribeResult (ref), p2 (copy), Count (ref), list (upval), startNext (copy), Module1 (upval)
			SubscribeResult = FromResult:subscribe({
				next = function(_, p3)
					-- upvalues: p2 (upval)
					p2:next(p3)
				end,
				error = function(_, p3)
					-- upvalues: p2 (upval)
					p2:error(p3)
				end,
				complete = function(_)
					-- upvalues: Count (upval), list (upval), SubscribeResult (upval), p2 (upval), startNext (upval), Module1 (upval)
					if Count == #list + 1 then
						SubscribeResult = nil
						p2:complete()
						
						return
					else
						local Count1: number = Count
						Count += 1
						startNext(Module1.from(list[Count1]))
					end
				end
			})
		end
		
		startNext(self)
		
		return function()
			-- upvalues: Boolean (upval), SubscribeResult (ref)
			if Boolean.toJSBoolean(SubscribeResult) then
				SubscribeResult:unsubscribe()
				SubscribeResult = nil
			end
		end
	end)
end

function Module:flatMap(p2)
	-- upvalues: Error1 (copy), Species (copy), Module (ref), Boolean (copy), Array (copy)
	local CompleteIfDone = nil
	local Flag = nil
	repeat
		if typeof(p2) == "function" then
			Flag = true
			break
		end
		if typeof(p2) == "table" then
			local Meta = getmetatable(p2)
			
			if Meta and rawget(Meta, "__call") then
				Flag = true
				break
			end
			if p2._isMockFunction then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	if not Flag then
		error(Error1.new(tostring(p2) .. " is not a function"))
	end
	local v2 = self[Species]
	local Module1 = if v2 == nil then Module else v2
	
	return Module1.new(function(p3)
		-- upvalues: self (copy), Boolean (upval), p2 (copy), Module1 (copy), Array (upval), CompleteIfDone (ref)
		local List = {}
		local SubscribeResult = self:subscribe({
			next = function(_, p4)
				-- upvalues: Boolean (upval), p2 (upval), p3 (copy), Module1 (upval), Array (upval), List (copy), CompleteIfDone (upval)
				if Boolean.toJSBoolean(p2) then
					local _
					_, p90 = xpcall(p2, function(Err)
						-- upvalues: p3 (upval)
						p3:error(Err)
					end, p4)
				end
				local SubscribeResult = nil
				SubscribeResult = Module1.from(p4):subscribe({
					next = function(_, p5)
						-- upvalues: p3 (upval)
						p3:next(p5)
					end,
					error = function(_, p5)
						-- upvalues: p3 (upval)
						p3:error(p5)
					end,
					complete = function(_)
						-- upvalues: Array (upval), List (upval), SubscribeResult (ref), CompleteIfDone (upval)
						local IndexOfResult: number = Array.indexOf(List, SubscribeResult)
						
						if IndexOfResult >= 1 then
							Array.splice(List, IndexOfResult, 1)
						end
						CompleteIfDone()
					end
				})
				table.insert(List, SubscribeResult)
				
				return nil
			end,
			error = function(_, p4)
				-- upvalues: p3 (copy)
				p3:error(p4)
			end,
			complete = function(_)
				-- upvalues: CompleteIfDone (upval)
				CompleteIfDone()
			end
		})
		
		CompleteIfDone = function()
			-- upvalues: SubscribeResult (copy), List (copy), p3 (copy)
			if SubscribeResult.closed and #List == 0 then
				p3:complete()
			end
		end
		
		return function()
			-- upvalues: Array (upval), List (copy), SubscribeResult (copy)
			Array.forEach(List, function(p4)
				return p4:unsubscribe()
			end)
			SubscribeResult:unsubscribe()
		end
	end)
end

Module[Observable] = function(p2)
	return p2
end

function Module.from(p2, p3)
	-- upvalues: isObservableClass (ref), Module (ref), Error1 (copy), Observable (copy), InstanceofFunction (copy), Array (copy), PromiseModule (copy), HostReportError (ref)
	local v2 = nil
	local v3 = nil
	
	if isObservableClass(p2) then
		v3 = p2
		v2 = p3
	else
		v3 = Module
		v2 = p2
	end
	if v2 == nil then
		error(Error1.new(tostring(v2) .. " is not an object"))
	end
	local v4 = v2[Observable]
	local Flag = nil
	local Callback = nil
	
	if v4 == nil then
		Callback = nil
	else
		repeat
			if typeof(v4) == "function" then
				Flag = true
				break
			end
			if typeof(v4) == "table" then
				local Meta = getmetatable(v4)
				
				if Meta and rawget(Meta, "__call") then
					Flag = true
					break
				end
				if v4._isMockFunction then
					Flag = true
					break
				end
			end
			Flag = false
		until true
		if not Flag then
			error(Error1.new(tostring(v4) .. " is not a function"))
		end
		Callback = v4
	end
	if Callback then
		local CallbackResult = Callback(v2)
		
		return if InstanceofFunction(CallbackResult, Module) and CallbackResult.new == v3.new then CallbackResult else v3.new(function(p4)
			-- upvalues: CallbackResult (copy)
			return CallbackResult:subscribe(p4)
		end)
	elseif Array.isArray(v2) then
		return Module.new(function(p4)
			-- upvalues: v2 (ref), PromiseModule (upval), HostReportError (upval)
			local function v107()
				-- upvalues: p4 (copy), v2 (upval)
				if p4.closed then return end
				for _, value in pairs(v2) do
					p4:next(value)
					
					if p4.closed then return end
				end
				p4:complete()
			end
			
			PromiseModule.delay(0):doneCall(function()
				-- upvalues: v107 (copy), HostReportError (upval)
				xpcall(v107, function(Err)
					-- upvalues: HostReportError (upval)
					HostReportError(Err)
				end)
			end)
		end)
	else
		error(Error1.new(tostring(v2) .. " is not observable"))
	end
end

function Module.of(p4, ...)
	-- upvalues: isObservableClass (ref), Module (ref), PromiseModule (copy), HostReportError (ref)
	local List = nil
	local v5 = nil
	
	if isObservableClass(p4) then
		v5 = p4
		List = { ... }
	else
		v5 = Module
		List = { p4, ... }
	end
	return v5.new(function(p5)
		-- upvalues: List (ref), PromiseModule (upval), HostReportError (upval)
		local function v111()
			-- upvalues: p5 (copy), List (upval)
			if p5.closed then return end
			for _, value in ipairs(List) do
				p5:next(value)
				
				if p5.closed then return end
			end
			p5:complete()
		end
		
		PromiseModule.delay(0):doneCall(function()
			-- upvalues: v111 (copy), HostReportError (upval)
			xpcall(v111, function(Err)
				-- upvalues: HostReportError (upval)
				HostReportError(Err)
			end)
		end)
	end)
end

if typeof(SymbolFunction) == "table" and typeof(getmetatable(SymbolFunction).__call) == "function" then
	Module[SymbolFunction("extensions")] = { symbol = Observable, hostReportError = HostReportError }
end
return { Observable = Module }