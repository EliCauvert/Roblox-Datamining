local config = { __mode = "k" }
local Success, Result = pcall(game.DefineFastFlag, game, "ReducePromiseTaskDefer", false)

if not Success then
	Result = false
end
local function _(Callback): boolean --[[ Line: 16 | Named "isCallable" ]]
	if type(Callback) == "function" then
		return true
	end
	if type(Callback) == "table" then
		local Meta = getmetatable(Callback)
		
		if Meta and type((rawget(Meta, "__call"))) == "function" then
			return true
		end
	end
	return false
end

local function makeEnum(p1, List) --[[ Line: 34 ]]
	local t = {}
	
	for _, value in ipairs(List) do
		t[value] = value
	end
	return (setmetatable(t, {
		__index = function(_, p2) --[[ Line: 42 ]]
			-- upvalues: p1 (copy)
			error(string.format("%s is not in %s!", p2, p1), 2)
		end,
		__newindex = function() --[[ Line: 45 ]]
			-- upvalues: p1 (copy)
			error(string.format("Creating new members in %s is not allowed!", p1), 2)
		end
	}))
end

local Module = nil
Module = {
	Kind = makeEnum("Promise.Error.Kind", {
		"ExecutionError",
		"AlreadyCancelled",
		"NotResolvedInTime",
		"TimedOut"
	})
}
Module.__index = Module

function Module.new(p2, Parent) --[[ Line: 70 ]]
	-- upvalues: Module (ref)
	local P4 = p2 or {}
	
	return (setmetatable({
		error = tostring(P4.error) or "[This error has no error text.]",
		trace = P4.trace,
		context = P4.context,
		kind = P4.kind,
		parent = Parent,
		createdTick = os.clock(),
		createdTrace = debug.traceback()
	}, Module))
end

function Module.is(p2): boolean --[[ Line: 83 ]]
	if type(p2) == "table" then
		local Meta = getmetatable(p2)
		
		if type(Meta) == "table" then
			return rawget(p2, "error") ~= nil and type((rawget(Meta, "extend"))) == "function"
		end
	end
	return false
end

function Module:isKind(ExecutionError): boolean --[[ Line: 95 ]]
	-- upvalues: Module (ref)
	assert(ExecutionError ~= nil, "Argument #2 to Promise.Error.isKind must not be nil")
	
	return Module.is(self) and self.kind == ExecutionError
end

function Module:extend(p2) --[[ Line: 101 ]]
	-- upvalues: Module (ref)
	local P10 = p2 or {}
	P10.kind = P10.kind or self.kind
	
	return Module.new(P10, self)
end

function Module.getErrorChain(p2) --[[ Line: 109 ]]
	local List = { p2 }
	while List[#List].parent do
		table.insert(List, List[#List].parent)
	end
	return List
end

function Module:__tostring(): string --[[ Line: 119 ]]
	local List = {
		string.format("-- Promise.Error(%s) --", self.kind or "?")
	}
	
	for _, value in ipairs(self:getErrorChain()) do
		table.insert(List, table.concat({ value.trace or value.error, value.context }, "\n"))
	end
	return table.concat(List, "\n")
end

local function pack(...) --[[ Line: 143 ]]
	return select("#", ...), { ... }
end

local function packResult(p3, ...) --[[ Line: 150 ]]
	return p3, select("#", ...), { ... }
end

local _ = function(p3) --[[ Line: 154 | Named "makeErrorHandler" ]]
	-- upvalues: Module (ref)
	assert(p3 ~= nil, "traceback is nil")
	
	return function(p4) --[[ Line: 157 ]]
		-- upvalues: Module (upval), p3 (copy)
		return if type(p4) == "table" then p4 else Module.new({
			error = p4,
			kind = Module.Kind.ExecutionError,
			trace = debug.traceback(tostring(p4), 2),
			context = "Promise created at:\n\n" .. p3
		})
	end
end

local function runExecutor(Source, p3, ...) --[[ Line: 177 ]]
	-- upvalues: packResult (copy), Module (ref)
	local Callback = xpcall
	assert(Source ~= nil, "traceback is nil")
	
	return packResult(Callback(p3, function(p4) --[[ Line: 157 ]]
		-- upvalues: Module (upval), Source (copy)
		return if type(p4) == "table" then p4 else Module.new({
			error = p4,
			kind = Module.Kind.ExecutionError,
			trace = debug.traceback(tostring(p4), 2),
			context = "Promise created at:\n\n" .. Source
		})
	end, ...))
end

local _ = function(p3, p4, p5, p6) --[[ Line: 185 | Named "createAdvancer" ]]
	-- upvalues: runExecutor (copy)
	return function(...) --[[ Line: 186 ]]
		-- upvalues: runExecutor (upval), p3 (copy), p4 (copy), p5 (copy), p6 (copy)
		local v1, v2, v3 = runExecutor(p3, p4, ...)
		
		if v1 then
			p5(unpack(v3, 1, v2))
			
			return
		else
			p6(v3[1])
		end
	end
end

local _ = function(p3): boolean --[[ Line: 197 | Named "isEmpty" ]]
	return next(p3) == nil
end

local PromiseModule = {
	Error = Module,
	Status = makeEnum("Promise.Status", { "Started", "Resolved", "Rejected", "Cancelled" }),
	_getTime = os.clock,
	_timeEvent = game:GetService("RunService").Heartbeat,
	_unhandledRejectionCallbacks = {},
	prototype = {}
}
PromiseModule.__index = PromiseModule.prototype

function PromiseModule._new(Traceback, p3, Parent) --[[ Line: 236 ]]
	-- upvalues: PromiseModule (copy), config (copy), runExecutor (copy)
	if Parent ~= nil and not PromiseModule.is(Parent) then
		error("Argument #2 to Promise.new must be a promise or nil", 2)
	end
	local config1 = {
		_thread = nil,
		_values = nil,
		_valuesLength = -1,
		_unhandledRejection = true,
		_cancellationHook = nil,
		_source = Traceback,
		_status = PromiseModule.Status.Started,
		_queuedResolve = {},
		_queuedReject = {},
		_queuedFinally = {},
		_parent = Parent,
		_consumers = setmetatable({}, config)
	}
	
	if Parent and Parent._status == PromiseModule.Status.Started then
		Parent._consumers[config1] = true
	end
	setmetatable(config1, PromiseModule)
	
	local function resolve(...) --[[ Line: 284 ]]
		-- upvalues: config1 (copy)
		config1:_resolve(...)
	end
	
	local function reject(...) --[[ Line: 288 ]]
		-- upvalues: config1 (copy)
		config1:_reject(...)
	end
	
	local function onCancel(Callback: () -> ()): boolean --[[ Line: 292 ]]
		-- upvalues: config1 (copy), PromiseModule (upval)
		if Callback then
			if config1._status == PromiseModule.Status.Cancelled then
				Callback()
			else
				config1._cancellationHook = Callback
			end
		end
		return config1._status == PromiseModule.Status.Cancelled
	end
	
	config1._thread = coroutine.create(function() --[[ Line: 304 ]]
		-- upvalues: runExecutor (upval), config1 (copy), p3 (copy), resolve (copy), reject (copy), onCancel (copy)
		local RunExecutorResult, _, RunExecutorResult3 = runExecutor(config1._source, p3, resolve, reject, onCancel)
		
		if not RunExecutorResult then
			reject(RunExecutorResult3[1])
		end
	end)
	task.spawn(config1._thread)
	
	return config1
end

function PromiseModule.new(p3) --[[ Line: 355 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule._new(debug.traceback(nil, 2), p3)
end

function PromiseModule:__tostring(): string --[[ Line: 359 ]]
	return string.format("Promise(%s)", self._status)
end

function PromiseModule.defer(p3) --[[ Line: 381 ]]
	-- upvalues: PromiseModule (copy), runExecutor (copy)
	local Traceback = debug.traceback(nil, 2)
	
	return (PromiseModule._new(Traceback, function(p4, Callback, p5) --[[ Line: 384 ]]
		-- upvalues: PromiseModule (upval), runExecutor (upval), Traceback (copy), p3 (copy)
		local Connection = nil
		Connection = PromiseModule._timeEvent:Connect(function() --[[ Line: 386 ]]
			-- upvalues: Connection (ref), runExecutor (upval), Traceback (upval), p3 (upval), p4 (copy), Callback (copy), p5 (copy)
			Connection:Disconnect()
			local RunExecutorResult, _, RunExecutorResult3 = runExecutor(Traceback, p3, p4, Callback, p5)
			
			if not RunExecutorResult then
				Callback(RunExecutorResult3[1])
			end
		end)
	end))
end

PromiseModule.async = PromiseModule.defer

function PromiseModule.resolve(...) --[[ Line: 424 ]]
	-- upvalues: pack (copy), PromiseModule (copy)
	local PackResult, PackResult2 = pack(...)
	
	return PromiseModule._new(debug.traceback(nil, 2), function(Callback: (any) -> ()) --[[ Line: 426 ]]
		-- upvalues: PackResult2 (copy), PackResult (copy)
		Callback(unpack(PackResult2, 1, PackResult))
	end)
end

function PromiseModule.reject(...) --[[ Line: 441 ]]
	-- upvalues: pack (copy), PromiseModule (copy)
	local PackResult, PackResult2 = pack(...)
	
	return PromiseModule._new(debug.traceback(nil, 2), function(_, Callback: (any) -> ()) --[[ Line: 443 ]]
		-- upvalues: PackResult2 (copy), PackResult (copy)
		Callback(unpack(PackResult2, 1, PackResult))
	end)
end

function PromiseModule._try(Traceback, Callback, ...) --[[ Line: 452 ]]
	-- upvalues: pack (copy), PromiseModule (copy)
	local PackResult, PackResult2 = pack(...)
	
	return PromiseModule._new(Traceback, function(Callback1: (any) -> ()) --[[ Line: 455 ]]
		-- upvalues: Callback (copy), PackResult2 (copy), PackResult (copy)
		Callback1(Callback(unpack(PackResult2, 1, PackResult)))
	end)
end

function PromiseModule.try(p3, ...) --[[ Line: 483 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule._try(debug.traceback(nil, 2), p3, ...)
end

function PromiseModule._all(Traceback, List, p3) --[[ Line: 492 ]]
	-- upvalues: PromiseModule (copy)
	if type(List) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.all"), 3)
	end
	for i, value in pairs(List) do
		if not PromiseModule.is(value) then
			error(string.format("Non-promise value passed into %s at index %s", "Promise.all", (tostring(i))), 3)
		end
	end
	return if #List == 0 or p3 == 0 then PromiseModule.resolve({}) else PromiseModule._new(Traceback, function(Callback1, Callback2, Callback: (any) -> ()) --[[ Line: 510 ]]
		-- upvalues: p3 (copy), List (copy)
		local t = {}
		local t1 = {}
		local Count = 0
		local Count1 = 0
		local Flag = false
		
		local function resolveOne(Key, ...) --[[ Line: 528 ]]
			-- upvalues: Flag (ref), Count (ref), p3 (upval), t (copy), List (upval), Callback1 (copy), t1 (copy)
			if Flag then return end
			Count += 1
			
			if p3 == nil then
				t[Key] = (...)
			else
				t[Count] = (...)
			end
			if (p3 or #List) <= Count then
				Flag = true
				Callback1(t)
				
				for _, value in ipairs(t1) do
					value:cancel()
				end
			end
		end
		
		Callback(function() --[[ Line: 521 | Named "cancel" ]]
			-- upvalues: t1 (copy)
			for _, value in ipairs(t1) do
				value:cancel()
			end
		end)
		
		for i, Promise in ipairs(List) do
			t1[i] = Promise:andThen(function(...) --[[ Line: 553 ]]
				-- upvalues: resolveOne (copy), i (copy)
				resolveOne(i, ...)
			end, function(...) --[[ Line: 555 ]]
				-- upvalues: Count1 (ref), p3 (upval), List (upval), t1 (copy), Flag (ref), Callback2 (copy)
				Count1 += 1
				
				if p3 == nil or #List - Count1 < p3 then
					for _, value in ipairs(t1) do
						value:cancel()
					end
					Flag = true
					Callback2(...)
				end
			end)
		end
		if Flag then
			for _, value in ipairs(t1) do
				value:cancel()
			end
		end
	end)
end

function PromiseModule.all(...) --[[ Line: 597 ]]
	-- upvalues: PromiseModule (copy)
	local list = { ... }
	
	if type(list[1]) == "table" and not PromiseModule.is(list[1]) then
		list = list[1]
	end
	return PromiseModule._all(debug.traceback(nil, 2), list)
end

function PromiseModule.fold(p4, Callback, p5) --[[ Line: 634 ]]
	-- upvalues: PromiseModule (copy)
	assert(type(p4) == "table", "Bad argument #1 to Promise.fold: must be a table")
	local Flag = nil
	repeat
		if type(Callback) == "function" then
			Flag = true
			break
		end
		if type(Callback) == "table" then
			local Meta = getmetatable(Callback)
			
			if Meta and type((rawget(Meta, "__call"))) == "function" then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	assert(Flag, "Bad argument #2 to Promise.fold: must be a function")
	local ResolveResult = PromiseModule.resolve(p5)
	
	return PromiseModule.each(p4, function(p6, p7) --[[ Line: 639 ]]
		-- upvalues: ResolveResult (ref), Callback (copy)
		ResolveResult = ResolveResult:andThen(function(Result) --[[ Line: 640 ]]
			-- upvalues: Callback (upval), p6 (copy), p7 (copy)
			return Callback(Result, p6, p7)
		end)
	end):andThen(function() --[[ Line: 643 ]]
		-- upvalues: ResolveResult (ref)
		return ResolveResult
	end)
end

function PromiseModule.some(p4, p5) --[[ Line: 667 ]]
	-- upvalues: PromiseModule (copy)
	assert(type(p5) == "number", "Bad argument #2 to Promise.some: must be a number")
	
	return PromiseModule._all(debug.traceback(nil, 2), p4, p5)
end

function PromiseModule.any(p4) --[[ Line: 691 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule._all(debug.traceback(nil, 2), p4, 1):andThen(function(Entry) --[[ Line: 692 ]]
		return Entry[1]
	end)
end

function PromiseModule.allSettled(List) --[[ Line: 713 ]]
	-- upvalues: PromiseModule (copy)
	if type(List) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2)
	end
	for i, value in pairs(List) do
		if not PromiseModule.is(value) then
			error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", (tostring(i))), 2)
		end
	end
	return if #List == 0 then PromiseModule.resolve({}) else PromiseModule._new(debug.traceback(nil, 2), function(Callback1, _, Callback: (any) -> ()) --[[ Line: 731 ]]
		-- upvalues: List (copy)
		local t = {}
		local t2 = {}
		local Count = 0
		
		local function resolveOne(Key, ...) --[[ Line: 741 ]]
			-- upvalues: Count (ref), t (copy), List (upval), Callback1 (copy)
			Count += 1
			t[Key] = (...)
			
			if #List <= Count then
				Callback1(t)
			end
		end
		
		Callback(function() --[[ Line: 751 ]]
			-- upvalues: t2 (copy)
			for _, value in ipairs(t2) do
				value:cancel()
			end
		end)
		
		for i, Promise in ipairs(List) do
			t2[i] = Promise:finally(function(...) --[[ Line: 760 ]]
				-- upvalues: resolveOne (copy), i (copy)
				resolveOne(i, ...)
			end)
		end
	end)
end

function PromiseModule.race(List) --[[ Line: 791 ]]
	-- upvalues: PromiseModule (copy)
	assert(type(List) == "table", string.format("Please pass a list of promises to %s", "Promise.race"))
	
	for i, value in pairs(List) do
		assert(PromiseModule.is(value), string.format("Non-promise value passed into %s at index %s", "Promise.race", (tostring(i))))
	end
	return PromiseModule._new(debug.traceback(nil, 2), function(p4, p5, Callback) --[[ Line: 798 ]]
		-- upvalues: List (copy)
		local t = {}
		local Flag = false
		
		local function _() --[[ Line: 802 | Named "cancel" ]]
			-- upvalues: t (copy)
			for _, value in ipairs(t) do
				value:cancel()
			end
		end
		
		local _ = function(Callback) --[[ Line: 808 | Named "finalize" ]]
			-- upvalues: t (copy), Flag (ref)
			return function(...) --[[ Line: 809 ]]
				-- upvalues: t (upval), Flag (upval), Callback (copy)
				for _, value in ipairs(t) do
					value:cancel()
				end
				Flag = true
				
				return Callback(...)
			end
		end
		
		if Callback(function(...) --[[ Line: 809 ]]
			-- upvalues: t (copy), Flag (ref), p5 (copy)
			for _, value in ipairs(t) do
				value:cancel()
			end
			Flag = true
			
			return p5(...)
		end) then return end
		for i, Promise in ipairs(List) do
			t[i] = Promise:andThen(function(...) --[[ Line: 809 ]]
				-- upvalues: t (copy), Flag (ref), p4 (copy)
				for _, value in ipairs(t) do
					value:cancel()
				end
				Flag = true
				
				return p4(...)
			end, function(...) --[[ Line: 809 ]]
				-- upvalues: t (copy), Flag (ref), p5 (copy)
				for _, value in ipairs(t) do
					value:cancel()
				end
				Flag = true
				
				return p5(...)
			end)
		end
		if Flag then
			for _, value in ipairs(t) do
				value:cancel()
			end
		end
	end)
end

function PromiseModule.each(Promises, Callback) --[[ Line: 886 ]]
	-- upvalues: PromiseModule (copy), Module (ref)
	assert(type(Promises) == "table", string.format("Please pass a list of promises to %s", "Promise.each"))
	local Flag = nil
	repeat
		if type(Callback) == "function" then
			Flag = true
			break
		end
		if type(Callback) == "table" then
			local Meta = getmetatable(Callback)
			
			if Meta and type((rawget(Meta, "__call"))) == "function" then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	assert(Flag, string.format("Please pass a handler function to %s!", "Promise.each"))
	
	return PromiseModule._new(debug.traceback(nil, 2), function(Callback3: (any) -> (), Callback2, Callback1: (any) -> ()) --[[ Line: 890 ]]
		-- upvalues: Promises (copy), PromiseModule (upval), Module (upval), Callback (copy)
		local t = {}
		local List = {}
		local Flag = false
		
		local function _() --[[ Line: 896 | Named "cancel" ]]
			-- upvalues: List (copy)
			for _, value in ipairs(List) do
				value:cancel()
			end
		end
		
		Callback1(function() --[[ Line: 902 ]]
			-- upvalues: Flag (ref), List (copy)
			Flag = true
			
			for _, value in ipairs(List) do
				value:cancel()
			end
		end)
		local Promises1 = {}
		
		for i, promis in ipairs(Promises) do
			if not PromiseModule.is(promis) then
				Promises1[i] = promis
				continue
			end
			if promis:getStatus() == PromiseModule.Status.Cancelled then
				for _, value in ipairs(List) do
					value:cancel()
				end
				return Callback2(Module.new({
					error = "Promise is cancelled",
					kind = Module.Kind.AlreadyCancelled,
					context = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", i, promis._source)
				}))
			end
			if promis:getStatus() == PromiseModule.Status.Rejected then
				for _, value1 in ipairs(List) do
					value1:cancel()
				end
				return Callback2(select(2, promis:await()))
			else
				local v1 = promis:andThen(function(...) --[[ Line: 935 ]]
					return ...
				end)
				table.insert(List, v1)
				Promises1[i] = v1
				continue
			end
		end
		local v2 = nil
		local Promise = nil
		for i1, Promise in ipairs(Promises1) do
			if PromiseModule.is(Promise) then
				local v3
				v3, Promise = Promise:await()
				
				if not v3 then
					for _, value2 in ipairs(List) do
						value2:cancel()
					end
					return Callback2(Promise)
				end
			end
			if Flag then return end
			local ResolveResult = PromiseModule.resolve(Callback(Promise, i1))
			table.insert(List, ResolveResult)
			local v4
			v4, v77 = ResolveResult:await()
			
			if v4 then
				t[i1] = v2
				continue
			else
				for _, value3 in ipairs(List) do
					value3:cancel()
				end
				return Callback2(v2)
			end
		end
		Callback3(t)
	end)
end

function PromiseModule:is(): boolean --[[ Line: 985 ]]
	-- upvalues: PromiseModule (copy)
	if type(self) ~= "table" then
		return false
	end
	local Meta = getmetatable(self)
	
	if Meta == PromiseModule then
		return true
	end
	if Meta == nil then
		local AndThenFunction = self.andThen
		
		if type(AndThenFunction) == "function" then
			return true
		end
		if type(AndThenFunction) == "table" then
			local Meta1 = getmetatable(AndThenFunction)
			
			if Meta1 and type((rawget(Meta1, "__call"))) == "function" then
				return true
			end
		end
		return false
	else
		if type(Meta) == "table" and type((rawget(Meta, "__index"))) == "table" then
			local RawValue = rawget(rawget(Meta, "__index"), "andThen")
			local Flag = nil
			repeat
				if type(RawValue) == "function" then
					Flag = true
					break
				end
				if type(RawValue) == "table" then
					local Meta2 = getmetatable(RawValue)
					
					if Meta2 and type((rawget(Meta2, "__call"))) == "function" then
						Flag = true
						break
					end
				end
				Flag = false
			until true
			if Flag then
				return true
			end
		end
		return false
	end
end

function PromiseModule.promisify(p6) --[[ Line: 1034 ]]
	-- upvalues: PromiseModule (copy)
	return function(...) --[[ Line: 1035 ]]
		-- upvalues: PromiseModule (upval), p6 (copy)
		return PromiseModule._try(debug.traceback(nil, 2), p6, ...)
	end
end

local Previous = nil
local Connection = nil

function PromiseModule.delay(p6: number) --[[ Line: 1065 ]]
	-- upvalues: PromiseModule (copy), Connection (ref), Previous (ref)
	assert(type(p6) == "number", "Bad argument #1 to Promise.delay, must be a number.")
	
	if p6 < 0.016666666666666666 or p6 == 1e999 then
		p6 = 0.016666666666666666
	end
	return PromiseModule._new(debug.traceback(nil, 2), function(Resolve, _, Callback: (any) -> ()) --[[ Line: 1073 ]]
		-- upvalues: PromiseModule (upval), p6 (ref), Connection (upval), Previous (upval)
		local Time = PromiseModule._getTime()
		local NewTime = Time + p6
		local Previous1 = { resolve = Resolve, startTime = Time, endTime = NewTime }
		
		if Connection == nil then
			Previous = Previous1
			Connection = PromiseModule._timeEvent:Connect(function() --[[ Line: 1085 ]]
				-- upvalues: PromiseModule (upval), Previous (upval), Connection (upval)
				local Time = PromiseModule._getTime()
				while Previous ~= nil and Previous.endTime < Time do
					local Previous1 = Previous
					Previous = Previous1.next
					
					if Previous == nil then
						Connection:Disconnect()
						Connection = nil
					else
						Previous.previous = nil
					end
					Previous1.resolve(PromiseModule._getTime() - Previous1.startTime)
				end
			end)
		elseif Previous.endTime < NewTime then
			local Previous2 = Previous
			local Next1 = Previous2.next
			while Next1 ~= nil and Next1.endTime < NewTime do
				Previous2 = Next1
				Next1 = Previous2.next
			end
			Previous2.next = Previous1
			Previous1.previous = Previous2
			
			if Next1 ~= nil then
				Previous1.next = Next1
				Next1.previous = Previous1
			end
		else
			Previous1.next = Previous
			Previous.previous = Previous1
			Previous = Previous1
		end
		Callback(function() --[[ Line: 1130 ]]
			-- upvalues: Previous1 (copy), Previous (upval), Connection (upval)
			local Next1 = Previous1.next
			
			if Previous == Previous1 then
				if Next1 == nil then
					Connection:Disconnect()
					Connection = nil
				else
					Next1.previous = nil
				end
				Previous = Next1
				
				return
			else
				local Previous2 = Previous1.previous
				Previous2.next = Next1
				
				if Next1 ~= nil then
					Next1.previous = Previous2
				end
			end
		end)
	end)
end

function PromiseModule.prototype.timeout(p7, p8, p9) --[[ Line: 1194 ]]
	-- upvalues: PromiseModule (copy), Module (ref)
	local Traceback = debug.traceback(nil, 2)
	
	return PromiseModule.race({
		PromiseModule.delay(p8):andThen(function() --[[ Line: 1198 ]]
			-- upvalues: PromiseModule (upval), p9 (copy), Module (upval), p8 (copy), Traceback (copy)
			return PromiseModule.reject(p9 == nil and Module.new({
				error = "Timed out",
				kind = Module.Kind.TimedOut,
				context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", p8, Traceback)
			}) or p9)
		end),
		p7
	})
end

function PromiseModule.prototype.getStatus(p7) --[[ Line: 1218 ]]
	return p7._status
end

function PromiseModule.prototype._andThen(Parent, Traceback, p7, p8) --[[ Line: 1227 ]]
	-- upvalues: PromiseModule (copy), runExecutor (copy), Module (ref)
	Parent._unhandledRejection = false
	
	return PromiseModule._new(Traceback, function(p9, Callback2: (any) -> ()) --[[ Line: 1231 ]]
		-- upvalues: p7 (copy), Traceback (copy), runExecutor (upval), p8 (copy), Parent (copy), PromiseModule (upval), Module (upval)
		local Callback: (any) -> () = if p7 then function(...) --[[ Line: 186 ]]
			-- upvalues: runExecutor (upval), Traceback (copy), p7 (copy), p9 (copy), Callback2 (copy)
			local v5, v6, v7 = runExecutor(Traceback, p7, ...)
			
			if v5 then
				p9(unpack(v7, 1, v6))
				
				return
			else
				Callback2(v7[1])
			end
		end else p9
		local Callback1: (any) -> () = if p8 then function(...) --[[ Line: 186 ]]
			-- upvalues: runExecutor (upval), Traceback (copy), p8 (copy), p9 (copy), Callback2 (copy)
			local v5, v6, v7 = runExecutor(Traceback, p8, ...)
			
			if v5 then
				p9(unpack(v7, 1, v6))
				
				return
			else
				Callback2(v7[1])
			end
		end else Callback2
		
		if Parent._status == PromiseModule.Status.Started then
			table.insert(Parent._queuedResolve, Callback)
			table.insert(Parent._queuedReject, Callback1)
			
			return
		end
		if Parent._status == PromiseModule.Status.Resolved then
			Callback(unpack(Parent._values, 1, Parent._valuesLength))
			
			return
		end
		if Parent._status == PromiseModule.Status.Rejected then
			Callback1(unpack(Parent._values, 1, Parent._valuesLength))
			
			return
		end
		if Parent._status == PromiseModule.Status.Cancelled then
			Callback2(Module.new({
				error = "Promise is cancelled",
				kind = Module.Kind.AlreadyCancelled,
				context = "Promise created at\n\n" .. Traceback
			}))
		end
	end, Parent)
end

function PromiseModule.prototype.andThen(p7, Callback, Callback1) --[[ Line: 1288 ]]
	local Flag = true
	repeat
		if Callback == nil then break end
		if type(Callback) == "function" then
			Flag = true
			break
		end
		if type(Callback) == "table" then
			local Meta = getmetatable(Callback)
			
			if Meta and type((rawget(Meta, "__call"))) == "function" then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	assert(Flag, string.format("Please pass a handler function to %s!", "Promise:andThen"))
	local Flag1 = true
	repeat
		if Callback1 == nil then break end
		if type(Callback1) == "function" then
			Flag1 = true
			break
		end
		if type(Callback1) == "table" then
			local Meta = getmetatable(Callback1)
			
			if Meta and type((rawget(Meta, "__call"))) == "function" then
				Flag1 = true
				break
			end
		end
		Flag1 = false
	until true
	assert(Flag1, string.format("Please pass a handler function to %s!", "Promise:andThen"))
	
	return p7:_andThen(debug.traceback(nil, 2), Callback, Callback1)
end

function PromiseModule.prototype.andThenAsync(p7, Callback, Callback1) --[[ Line: 1316 ]]
	-- upvalues: pack (copy), PromiseModule (copy)
	local Flag = true
	repeat
		if Callback == nil then break end
		if type(Callback) == "function" then
			Flag = true
			break
		end
		if type(Callback) == "table" then
			local Meta = getmetatable(Callback)
			
			if Meta and type((rawget(Meta, "__call"))) == "function" then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	assert(Flag, string.format("Please pass a handler function to %s!", "Promise:andThenAsync"))
	local Flag1 = true
	repeat
		if Callback1 == nil then break end
		if type(Callback1) == "function" then
			Flag1 = true
			break
		end
		if type(Callback1) == "table" then
			local Meta = getmetatable(Callback1)
			
			if Meta and type((rawget(Meta, "__call"))) == "function" then
				Flag1 = true
				break
			end
		end
		Flag1 = false
	until true
	assert(Flag1, string.format("Please pass a handler function to %s!", "Promise:andThenAsync"))
	
	return p7:_andThen(debug.traceback(nil, 2), function(...) --[[ Line: 1323 ]]
		-- upvalues: pack (upval), PromiseModule (upval)
		local PackResult, PackResult2 = pack(...)
		
		return PromiseModule.defer(function(Callback: (any) -> ()) --[[ Line: 1325 ]]
			-- upvalues: PackResult2 (copy), PackResult (copy)
			Callback(unpack(PackResult2, 1, PackResult))
		end)
	end, function(...) --[[ Line: 1329 ]]
		-- upvalues: pack (upval), PromiseModule (upval)
		local PackResult, PackResult2 = pack(...)
		
		return PromiseModule.defer(function(_, Callback: (any) -> ()) --[[ Line: 1331 ]]
			-- upvalues: PackResult2 (copy), PackResult (copy)
			Callback(unpack(PackResult2, 1, PackResult))
		end)
	end):andThen(Callback, Callback1)
end

function PromiseModule.prototype.catch(p7, Callback) --[[ Line: 1358 ]]
	local Flag = true
	repeat
		if Callback == nil then break end
		if type(Callback) == "function" then
			Flag = true
			break
		end
		if type(Callback) == "table" then
			local Meta = getmetatable(Callback)
			
			if Meta and type((rawget(Meta, "__call"))) == "function" then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	assert(Flag, string.format("Please pass a handler function to %s!", "Promise:catch"))
	
	return p7:_andThen(debug.traceback(nil, 2), nil, Callback)
end

function PromiseModule.prototype.tap(p7, Callback) --[[ Line: 1379 ]]
	-- upvalues: PromiseModule (copy), pack (copy)
	local Flag = nil
	repeat
		if type(Callback) == "function" then
			Flag = true
			break
		end
		if type(Callback) == "table" then
			local Meta = getmetatable(Callback)
			
			if Meta and type((rawget(Meta, "__call"))) == "function" then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	assert(Flag, string.format("Please pass a handler function to %s!", "Promise:tap"))
	
	return p7:_andThen(debug.traceback(nil, 2), function(...) --[[ Line: 1381 ]]
		-- upvalues: Callback (copy), PromiseModule (upval), pack (upval)
		local CallbackResult = Callback(...)
		
		if PromiseModule.is(CallbackResult) then
			local PackResult, PackResult2 = pack(...)
			
			return CallbackResult:andThen(function() --[[ Line: 1386 ]]
				-- upvalues: PackResult2 (copy), PackResult (copy)
				return unpack(PackResult2, 1, PackResult)
			end)
		else
			return ...
		end
	end)
end

function PromiseModule.prototype.andThenCall(p7, Callback, ...) --[[ Line: 1414 ]]
	-- upvalues: pack (copy)
	local Flag = nil
	repeat
		if type(Callback) == "function" then
			Flag = true
			break
		end
		if type(Callback) == "table" then
			local Meta = getmetatable(Callback)
			
			if Meta and type((rawget(Meta, "__call"))) == "function" then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	assert(Flag, string.format("Please pass a handler function to %s!", "Promise:andThenCall"))
	local PackResult, PackResult2 = pack(...)
	
	return p7:_andThen(debug.traceback(nil, 2), function() --[[ Line: 1417 ]]
		-- upvalues: Callback (copy), PackResult2 (copy), PackResult (copy)
		return Callback(unpack(PackResult2, 1, PackResult))
	end)
end

function PromiseModule.prototype.andThenReturn(p7, ...) --[[ Line: 1444 ]]
	-- upvalues: pack (copy)
	local PackResult, PackResult2 = pack(...)
	
	return p7:_andThen(debug.traceback(nil, 2), function() --[[ Line: 1446 ]]
		-- upvalues: PackResult2 (copy), PackResult (copy)
		return unpack(PackResult2, 1, PackResult)
	end)
end

function PromiseModule.prototype.cancel(p7) --[[ Line: 1462 ]]
	-- upvalues: PromiseModule (copy)
	if p7._status ~= PromiseModule.Status.Started then return end
	p7._status = PromiseModule.Status.Cancelled
	
	if p7._cancellationHook then
		p7._cancellationHook()
	end
	coroutine.close(p7._thread)
	
	if p7._parent then
		p7._parent:_consumerCancelled(p7)
	end
	for consumer in pairs(p7._consumers) do
		consumer:cancel()
	end
	p7:_finalize()
end

function PromiseModule.prototype._consumerCancelled(p8, p9) --[[ Line: 1490 ]]
	-- upvalues: PromiseModule (copy)
	if p8._status ~= PromiseModule.Status.Started then return end
	p8._consumers[p9] = nil
	
	if next(p8._consumers) == nil then
		p8:cancel()
	end
end

function PromiseModule.prototype._finally(Parent, Traceback, p8, p9) --[[ Line: 1506 ]]
	-- upvalues: PromiseModule (copy), runExecutor (copy)
	if not p9 then
		Parent._unhandledRejection = false
	end
	return PromiseModule._new(Traceback, function(Callback1, Callback2) --[[ Line: 1512 ]]
		-- upvalues: p8 (copy), Traceback (copy), runExecutor (upval), p9 (copy), Parent (copy), PromiseModule (upval)
		local Callback: (any) -> () = if p9 then function(...) --[[ Line: 1520 ]]
			-- upvalues: Parent (upval), PromiseModule (upval), Callback1 (copy), Callback (copy)
			return if Parent._status == PromiseModule.Status.Rejected then Callback1(Parent) else Callback(...)
		end elseif p8 then function(...) --[[ Line: 186 ]]
			-- upvalues: runExecutor (upval), Traceback (copy), p8 (copy), Callback1 (copy), Callback2 (copy)
			local v5, v6, v7 = runExecutor(Traceback, p8, ...)
			
			if v5 then
				Callback1(unpack(v7, 1, v6))
				
				return
			else
				Callback2(v7[1])
			end
		end else Callback1
		
		if Parent._status == PromiseModule.Status.Started then
			table.insert(Parent._queuedFinally, Callback)
			
			return
		else
			Callback(Parent._status)
		end
	end, Parent)
end

function PromiseModule.prototype.finally(p8, Callback) --[[ Line: 1588 ]]
	local Flag = true
	repeat
		if Callback == nil then break end
		if type(Callback) == "function" then
			Flag = true
			break
		end
		if type(Callback) == "table" then
			local Meta = getmetatable(Callback)
			
			if Meta and type((rawget(Meta, "__call"))) == "function" then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	assert(Flag, string.format("Please pass a handler function to %s!", "Promise:finally"))
	
	return p8:_finally(debug.traceback(nil, 2), Callback)
end

function PromiseModule.prototype.finallyCall(p8, Callback, ...) --[[ Line: 1602 ]]
	-- upvalues: pack (copy)
	local Flag = nil
	repeat
		if type(Callback) == "function" then
			Flag = true
			break
		end
		if type(Callback) == "table" then
			local Meta = getmetatable(Callback)
			
			if Meta and type((rawget(Meta, "__call"))) == "function" then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	assert(Flag, string.format("Please pass a handler function to %s!", "Promise:finallyCall"))
	local PackResult, PackResult2 = pack(...)
	
	return p8:_finally(debug.traceback(nil, 2), function() --[[ Line: 1605 ]]
		-- upvalues: Callback (copy), PackResult2 (copy), PackResult (copy)
		return Callback(unpack(PackResult2, 1, PackResult))
	end)
end

function PromiseModule.prototype.finallyReturn(p8, ...) --[[ Line: 1628 ]]
	-- upvalues: pack (copy)
	local PackResult, PackResult2 = pack(...)
	
	return p8:_finally(debug.traceback(nil, 2), function() --[[ Line: 1630 ]]
		-- upvalues: PackResult2 (copy), PackResult (copy)
		return unpack(PackResult2, 1, PackResult)
	end)
end

function PromiseModule.prototype.done(p8, Callback) --[[ Line: 1638 ]]
	local Flag = true
	repeat
		if Callback == nil then break end
		if type(Callback) == "function" then
			Flag = true
			break
		end
		if type(Callback) == "table" then
			local Meta = getmetatable(Callback)
			
			if Meta and type((rawget(Meta, "__call"))) == "function" then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	assert(Flag, string.format("Please pass a handler function to %s!", "Promise:done"))
	
	return p8:_finally(debug.traceback(nil, 2), Callback, true)
end

function PromiseModule.prototype.doneCall(p8, Callback, ...) --[[ Line: 1649 ]]
	-- upvalues: pack (copy)
	local Flag = nil
	repeat
		if type(Callback) == "function" then
			Flag = true
			break
		end
		if type(Callback) == "table" then
			local Meta = getmetatable(Callback)
			
			if Meta and type((rawget(Meta, "__call"))) == "function" then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	assert(Flag, string.format("Please pass a handler function to %s!", "Promise:doneCall"))
	local PackResult, PackResult2 = pack(...)
	
	return p8:_finally(debug.traceback(nil, 2), function() --[[ Line: 1652 ]]
		-- upvalues: Callback (copy), PackResult2 (copy), PackResult (copy)
		return Callback(unpack(PackResult2, 1, PackResult))
	end, true)
end

function PromiseModule.prototype.doneReturn(p8, ...) --[[ Line: 1660 ]]
	-- upvalues: pack (copy)
	local PackResult, PackResult2 = pack(...)
	
	return p8:_finally(debug.traceback(nil, 2), function() --[[ Line: 1662 ]]
		-- upvalues: PackResult2 (copy), PackResult (copy)
		return unpack(PackResult2, 1, PackResult)
	end, true)
end

function PromiseModule.prototype.awaitStatus(Promise) --[[ Line: 1674 ]]
	-- upvalues: PromiseModule (copy)
	Promise._unhandledRejection = false
	
	if Promise._status == PromiseModule.Status.Started then
		local CurrentThread = coroutine.running()
		Promise:finally(function() --[[ Line: 1680 ]]
			-- upvalues: CurrentThread (copy)
			task.spawn(CurrentThread)
		end)
		coroutine.yield()
	end
	if Promise._status == PromiseModule.Status.Resolved then
		return Promise._status, unpack(Promise._values, 1, Promise._valuesLength)
	elseif Promise._status == PromiseModule.Status.Rejected then
		return Promise._status, unpack(Promise._values, 1, Promise._valuesLength)
	else
		return Promise._status
	end
end

local function awaitHelper(AwaitStatusResult, ...) --[[ Line: 1696 ]]
	-- upvalues: PromiseModule (copy)
	return AwaitStatusResult == PromiseModule.Status.Resolved, ...
end

function PromiseModule.prototype.await(p8) --[[ Line: 1721 ]]
	-- upvalues: awaitHelper (copy)
	return awaitHelper(p8:awaitStatus())
end

local function expectHelper(AwaitStatusResult, ...) --[[ Line: 1725 ]]
	-- upvalues: PromiseModule (copy)
	if AwaitStatusResult ~= PromiseModule.Status.Resolved then
		error(if (...) == nil then "Expected Promise rejected with no value." else (...), 3)
	end
	return ...
end

function PromiseModule.prototype.expect(p8) --[[ Line: 1758 ]]
	-- upvalues: expectHelper (copy)
	return expectHelper(p8:awaitStatus())
end

PromiseModule.prototype.awaitValue = PromiseModule.prototype.expect

function PromiseModule.prototype._unwrap(p8) --[[ Line: 1772 ]]
	-- upvalues: PromiseModule (copy)
	if p8._status == PromiseModule.Status.Started then
		error("Promise has not resolved or rejected.", 2)
	end
	return p8._status == PromiseModule.Status.Resolved, unpack(p8._values, 1, p8._valuesLength)
end

function PromiseModule.prototype._resolve(p8, ...) --[[ Line: 1782 ]]
	-- upvalues: PromiseModule (copy), Module (ref), pack (copy)
	if p8._status == PromiseModule.Status.Started then
		if PromiseModule.is((...)) then
			if select("#", ...) > 1 then
				warn((string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", p8._source)))
			end
			local Promise = (...)
			local _parent = Promise:andThen(function(...) --[[ Line: 1803 ]]
				-- upvalues: p8 (copy)
				p8:_resolve(...)
			end, function(...) --[[ Line: 1805 ]]
				-- upvalues: Promise (copy), Module (upval), p8 (copy)
				local NewModule = if Promise._error then Module.new({
					context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]",
					error = Promise._error,
					kind = Module.Kind.ExecutionError
				}) else Promise._values[1]
				
				if Module.isKind(NewModule, Module.Kind.ExecutionError) then
					return p8:_reject(NewModule:extend({
						error = "This Promise was chained to a Promise that errored.",
						trace = "",
						context = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", p8._source)
					}))
				else
					p8:_reject(...)
				end
			end)
			
			if _parent._status == PromiseModule.Status.Cancelled then
				p8:cancel()
				
				return
			end
			if _parent._status == PromiseModule.Status.Started then
				p8._parent = _parent
				_parent._consumers[p8] = true
			end
			return
		else
			p8._status = PromiseModule.Status.Resolved
			p8._valuesLength, p8._values = pack(...)
			
			for _, value in ipairs(p8._queuedResolve) do
				coroutine.wrap(value)(...)
			end
			p8:_finalize()
			
			return
		end
	elseif PromiseModule.is((...)) then
		(...):_consumerCancelled(p8)
	end
end

function PromiseModule.prototype._reject(p9, ...) --[[ Line: 1853 ]]
	-- upvalues: PromiseModule (copy), pack (copy)
	if p9._status ~= PromiseModule.Status.Started then return end
	p9._status = PromiseModule.Status.Rejected
	p9._valuesLength, p9._values = pack(...)
	
	if next(p9._queuedReject) == nil then
		local Text = tostring((...))
		coroutine.wrap(function() --[[ Line: 1875 ]]
			-- upvalues: PromiseModule (upval), p9 (copy), Text (copy)
			PromiseModule._timeEvent:Wait()
			
			if not p9._unhandledRejection then return end
			local Formatted = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", Text, p9._source)
			
			for _, unhandledRejectionCallback in ipairs(PromiseModule._unhandledRejectionCallbacks) do
				task.spawn(unhandledRejectionCallback, p9, unpack(p9._values, 1, p9._valuesLength))
			end
			if not PromiseModule.TEST then
				warn(Formatted)
				
				return
			end
		end)()
	else
		for _, value in ipairs(p9._queuedReject) do
			coroutine.wrap(value)(...)
		end
	end
	p9:_finalize()
end

local List = {}
local DeferredThread = nil

local function closeThreads() --[[ Line: 1906 ]]
	-- upvalues: DeferredThread (ref), List (ref)
	DeferredThread = nil
	local Threads = List
	List = {}
	
	for _, thread in Threads do
		coroutine.close(thread)
	end
end

function PromiseModule.prototype._finalize(p10) --[[ Line: 1920 ]]
	-- upvalues: PromiseModule (copy), Result (ref), List (ref), DeferredThread (ref), closeThreads (copy)
	for _, value in ipairs(p10._queuedFinally) do
		coroutine.wrap(value)(p10._status)
	end
	p10._queuedFinally = nil
	p10._queuedReject = nil
	p10._queuedResolve = nil
	
	if not PromiseModule.TEST then
		p10._parent = nil
		p10._consumers = nil
	end
	if Result then
		table.insert(List, p10._thread)
		
		if not DeferredThread then
			DeferredThread = task.defer(closeThreads)
			
			return
		end
	else
		task.defer(coroutine.close, p10._thread)
	end
end

function PromiseModule.prototype.now(p11, p12) --[[ Line: 1965 ]]
	-- upvalues: PromiseModule (copy), Module (ref)
	local Traceback = debug.traceback(nil, 2)
	
	return if p11._status == PromiseModule.Status.Resolved then p11:_andThen(Traceback, function(...) --[[ Line: 1968 ]]
		return ...
	end) else PromiseModule.reject(p12 == nil and Module.new({
		error = "This Promise was not resolved in time for :now()",
		kind = Module.Kind.NotResolvedInTime,
		context = ":now() was called at:\n\n" .. Traceback
	}) or p12)
end

function PromiseModule.retry(Callback, p11, ...) --[[ Line: 2010 ]]
	-- upvalues: PromiseModule (copy)
	local Flag = nil
	repeat
		if type(Callback) == "function" then
			Flag = true
			break
		end
		if type(Callback) == "table" then
			local Meta = getmetatable(Callback)
			
			if Meta and type((rawget(Meta, "__call"))) == "function" then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	assert(Flag, "Parameter #1 to Promise.retry must be a function")
	assert(type(p11) == "number", "Parameter #2 to Promise.retry must be a number")
	local list = { ... }
	local Selected = select("#", ...)
	
	return PromiseModule.resolve(Callback(...)):catch(function(...) --[[ Line: 2016 ]]
		-- upvalues: p11 (copy), PromiseModule (upval), Callback (copy), list (copy), Selected (copy)
		return if p11 > 0 then PromiseModule.retry(Callback, p11 - 1, unpack(list, 1, Selected)) else PromiseModule.reject(...)
	end)
end

function PromiseModule.retryWithDelay(Callback, p11, p12, ...) --[[ Line: 2038 ]]
	-- upvalues: PromiseModule (copy)
	local Flag = nil
	repeat
		if type(Callback) == "function" then
			Flag = true
			break
		end
		if type(Callback) == "table" then
			local Meta = getmetatable(Callback)
			
			if Meta and type((rawget(Meta, "__call"))) == "function" then
				Flag = true
				break
			end
		end
		Flag = false
	until true
	assert(Flag, "Parameter #1 to Promise.retry must be a function")
	assert(type(p11) == "number", "Parameter #2 (times) to Promise.retry must be a number")
	assert(type(p12) == "number", "Parameter #3 (seconds) to Promise.retry must be a number")
	local list = { ... }
	local Selected = select("#", ...)
	
	return PromiseModule.resolve(Callback(...)):catch(function(...) --[[ Line: 2045 ]]
		-- upvalues: p11 (copy), PromiseModule (upval), p12 (copy), Callback (copy), list (copy), Selected (copy)
		if p11 > 0 then
			PromiseModule.delay(p12):await()
			
			return PromiseModule.retryWithDelay(Callback, p11 - 1, p12, unpack(list, 1, Selected))
		else
			return PromiseModule.reject(...)
		end
	end)
end

function PromiseModule.fromEvent(Signal, p11) --[[ Line: 2080 ]]
	-- upvalues: PromiseModule (copy)
	local Callback = p11 or function(): boolean --[[ Line: 2081 ]]
		return true
	end
	
	return PromiseModule._new(debug.traceback(nil, 2), function(Callback2, _, Callback1: (any) -> ()) --[[ Line: 2085 ]]
		-- upvalues: Signal (copy), Callback (ref)
		local Connection = nil
		local Flag = false
		
		local function disconnect() --[[ Line: 2089 ]]
			-- upvalues: Connection (ref)
			Connection:Disconnect()
			Connection = nil
		end
		
		Connection = Signal:Connect(function(...) --[[ Line: 2098 ]]
			-- upvalues: Callback (upval), Callback2 (copy), Connection (ref), Flag (ref)
			local CallbackResult = Callback(...)
			
			if CallbackResult == true then
				Callback2(...)
				
				if Connection then
					Connection:Disconnect()
					Connection = nil
					
					return
				else
					Flag = true
					
					return
				end
			elseif type(CallbackResult) ~= "boolean" then
				error("Promise.fromEvent predicate should always return a boolean")
			end
		end)
		
		if Flag and Connection then
			return disconnect()
		else
			Callback1(disconnect)
		end
	end)
end

function PromiseModule.onUnhandledRejection(Value) --[[ Line: 2132 ]]
	-- upvalues: PromiseModule (copy)
	table.insert(PromiseModule._unhandledRejectionCallbacks, Value)
	
	return function() --[[ Line: 2135 ]]
		-- upvalues: PromiseModule (upval), Value (copy)
		local FoundIndex: number? = table.find(PromiseModule._unhandledRejectionCallbacks, Value)
		
		if FoundIndex then
			table.remove(PromiseModule._unhandledRejectionCallbacks, FoundIndex)
		end
	end
end

return PromiseModule