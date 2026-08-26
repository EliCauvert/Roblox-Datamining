local t = { __mode = "k" }
local ok, status = pcall(game.DefineFastFlag, game, "ReducePromiseTaskDefer", false)

if not ok then
	status = false
end
local function _(p1)
	if type(p1) == "function" then
		return true
	elseif type(p1) == "table" then
		local var1 = getmetatable(p1)
		
		return var1 and type(rawget(var1, "__call")) == "function"
	end
end

local function makeEnum(p1, p2)
	local t = {}
	
	for i, v in ipairs(p2) do
		t[v] = v
	end
	return setmetatable(t, {
		__index = function(_, p3)
			-- upvalues: p1 (ref)
			error(string.format("%s is not in %s!", p3, p1), 2)
		end,
		__newindex = function()
			-- upvalues: p1 (ref)
			error(string.format("Creating new members in %s is not allowed!", p1), 2)
		end
	})
end

local _ = nil
local t_1 = {
	Kind = makeEnum("Promise.Error.Kind", {
		"ExecutionError",
		"AlreadyCancelled",
		"NotResolvedInTime",
		"TimedOut"
	})
}
t_1.__index = t_1

function t_1.new(p3, p4)
	-- upvalues: t_1 (write)
	p3 = p3 or {}
	
	return setmetatable({
		error = tostring(p3.error) or "[This error has no error text.]",
		trace = p3.trace,
		context = p3.context,
		kind = p3.kind,
		parent = p4,
		createdTick = os.clock(),
		createdTrace = debug.traceback()
	}, t_1)
end

function t_1.is(p3)
	if type(p3) == "table" then
		local var1 = getmetatable(p3)
		
		return type(var1) == "table" and (rawget(p3, "error") ~= nil and type(rawget(var1, "extend")) == "function")
	end
end

function t_1:isKind(p3)
	-- upvalues: t_1 (write)
	assert(p3 ~= nil, "Argument #2 to Promise.Error.isKind must not be nil")
	
	return t_1.is(self) and self.kind == p3
end

function t_1:extend(p3)
	-- upvalues: t_1 (write)
	p3 = p3 or {}
	p3.kind = p3.kind or self.kind
	
	return t_1.new(p3, self)
end

function t_1.getErrorChain(p3)
	local list = { p3 }
	while list[#list].parent do
		table.insert(list, list[#list].parent)
	end
	return list
end

function t_1:__tostring()
	local list = {
		string.format("-- Promise.Error(%s) --", self.kind or "?")
	}
	
	for i, v in ipairs(self:getErrorChain()) do
		table.insert(list, table.concat({ v.trace or v.error, v.context }, "\n"))
	end
	return table.concat(list, "\n")
end

local function pack(...)
	return select("#", ...), { ... }
end

local function packResult(p4, ...)
	return p4, select("#", ...), { ... }
end

local _ = function(p4)
	-- upvalues: t_1 (write)
	assert(p4 ~= nil, "traceback is nil")
	
	return function(p5)
		-- upvalues: t_1 (copy), p4 (ref)
		return if type(p5) == "table" then p5 else t_1.new({
			error = p5,
			kind = t_1.Kind.ExecutionError,
			trace = debug.traceback(tostring(p5), 2),
			context = "Promise created at:\n\n" .. p11
		})
	end
end

local function runExecutor(p4, p5, ...)
	-- upvalues: packResult (ref), t_1 (write)
	local _xpcall = xpcall
	assert(p4 ~= nil, "traceback is nil")
	
	return packResult(_xpcall(p5, function(p6)
		-- upvalues: t_1 (copy), p4 (ref)
		return if type(p6) == "table" then p6 else t_1.new({
			error = p6,
			kind = t_1.Kind.ExecutionError,
			trace = debug.traceback(tostring(p6), 2),
			context = "Promise created at:\n\n" .. p13
		})
	end, ...))
end

local _ = function(p4, p5, p6, p7)
	-- upvalues: runExecutor (ref)
	return function(...)
		-- upvalues: runExecutor (copy), p4 (ref), p5 (ref), p6 (ref), p7 (ref)
		local var1, var2, var3 = runExecutor(p4, p5, ...)
		
		if var1 then
			p6(unpack(var3, 1, var2))
			
			return
		end
		p7(var3[1])
	end
end

local _ = function(p4)
	return next(p4) == nil
end

local t_2 = {
	Error = t_1,
	Status = makeEnum("Promise.Status", { "Started", "Resolved", "Rejected", "Cancelled" }),
	_getTime = os.clock,
	_timeEvent = game:GetService("RunService").Heartbeat,
	_unhandledRejectionCallbacks = {},
	prototype = {}
}
t_2.__index = t_2.prototype

function t_2._new(p4, p5, p6)
	-- upvalues: t_2 (ref), t (ref), runExecutor (ref)
	if p6 ~= nil and not t_2.is(p6) then
		error("Argument #2 to Promise.new must be a promise or nil", 2)
	end
	local t_1 = {
		_thread = nil,
		_values = nil,
		_valuesLength = -1,
		_unhandledRejection = true,
		_cancellationHook = nil,
		_source = p4,
		_status = t_2.Status.Started,
		_queuedResolve = {},
		_queuedReject = {},
		_queuedFinally = {},
		_parent = p6,
		_consumers = setmetatable({}, t)
	}
	
	if p6 and p6._status == t_2.Status.Started then
		p6._consumers[t_1] = true
	end
	setmetatable(t_1, t_2)
	
	local function resolve(...)
		-- upvalues: t_1 (ref)
		t_1:_resolve(...)
	end
	
	local function reject(...)
		-- upvalues: t_1 (ref)
		t_1:_reject(...)
	end
	
	local function onCancel(p7)
		-- upvalues: t_1 (ref), t_2 (copy)
		if p7 then
			if t_1._status == t_2.Status.Cancelled then
				p7()
			else
				t_1._cancellationHook = p7
			end
		end
		return t_1._status == t_2.Status.Cancelled
	end
	
	t_1._thread = coroutine.create(function()
		-- upvalues: runExecutor (copy), t_1 (ref), p5 (ref), resolve (ref), reject (ref), onCancel (ref)
		local var1, _, var2 = runExecutor(t_1._source, p5, resolve, reject, onCancel)
		
		if not var1 then
			reject(var2[1])
		end
	end)
	task.spawn(t_1._thread)
	
	return t_1
end

function t_2.new(p4)
	-- upvalues: t_2 (ref)
	return t_2._new(debug.traceback(nil, 2), p4)
end

function t_2:__tostring()
	return string.format("Promise(%s)", self._status)
end

function t_2.defer(p4)
	-- upvalues: t_2 (ref), runExecutor (ref)
	local trac = debug.traceback(nil, 2)
	local _ = nil
	
	return t_2._new(trac, function(p5, p6, p7)
		-- upvalues: t_2 (copy), runExecutor (copy), trac (ref), p4 (ref)
		local timeEventConnection = nil
		timeEventConnection = t_2._timeEvent:Connect(function()
			-- upvalues: timeEventConnection (write), runExecutor (copy), trac (copy), p4 (copy), p5 (ref), p6 (ref), p7 (ref)
			timeEventConnection:Disconnect()
			local var1, _, var2 = runExecutor(trac, p4, p5, p6, p7)
			
			if not var1 then
				p6(var2[1])
			end
		end)
	end)
end

t_2.async = t_2.defer

function t_2.resolve(...)
	-- upvalues: pack (ref), t_2 (ref)
	local var1, var2 = pack(...)
	
	return t_2._new(debug.traceback(nil, 2), function(p4)
		-- upvalues: var2 (ref), var1 (ref)
		p4(unpack(var2, 1, var1))
	end)
end

function t_2.reject(...)
	-- upvalues: pack (ref), t_2 (ref)
	local var1, var2 = pack(...)
	
	return t_2._new(debug.traceback(nil, 2), function(_, p4)
		-- upvalues: var2 (ref), var1 (ref)
		p4(unpack(var2, 1, var1))
	end)
end

function t_2._try(p4, p5, ...)
	-- upvalues: pack (ref), t_2 (ref)
	local var1, var2 = pack(...)
	
	return t_2._new(p4, function(p6)
		-- upvalues: p5 (ref), var2 (ref), var1 (ref)
		p6(p5(unpack(var2, 1, var1)))
	end)
end

function t_2.try(p4, ...)
	-- upvalues: t_2 (ref)
	return t_2._try(debug.traceback(nil, 2), p4, ...)
end

function t_2._all(p4, p5, p6)
	-- upvalues: t_2 (ref)
	if type(p5) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.all"), 3)
	end
	for i, v in pairs(p5) do
		if not t_2.is(v) then
			error(string.format("Non-promise value passed into %s at index %s", "Promise.all", tostring(i)), 3)
		end
	end
	return if #p5 == 0 or p6 == 0 then t_2.resolve({}) else t_2._new(p4, function(p7, p8, p9)
		-- upvalues: p6 (ref), p5 (ref)
		local t = {}
		local t_1 = {}
		local var1 = 0
		local var2 = 0
		local var3 = false
		
		local function resolveOne(p10, ...)
			-- upvalues: var3 (write), var1 (write), p6 (copy), t (ref), p5 (copy), p7 (ref), t_1 (ref)
			if var3 then return end
			var1 += 1
			
			if p6 == nil then
				t[p10] = ...
			else
				t[var1] = ...
			end
			if (p6 or #p5) <= var1 then
				var3 = true
				p7(t)
				
				for i, v in ipairs(t_1) do
					v:cancel()
				end
			end
		end
		
		p9(function()
			-- upvalues: t_1 (ref)
			for i, v in ipairs(t_1) do
				v:cancel()
			end
		end)
		
		for i, v in ipairs(p5) do
			t_1[i] = v:andThen(function(...)
				-- upvalues: resolveOne (ref), i (ref)
				resolveOne(i, ...)
			end, function(...)
				-- upvalues: var2 (write), p6 (copy), p5 (copy), t_1 (ref), var3 (write), p8 (ref)
				var2 += 1
				
				if p6 == nil or #p5 - var2 < p6 then
					for i, v in ipairs(t_1) do
						v:cancel()
					end
					var3 = true
					p8(...)
				end
			end)
		end
	end)
end

function t_2.all(...)
	-- upvalues: t_2 (ref)
	local list = { ... }
	
	if type(list[1]) == "table" and not t_2.is(list[1]) then
		list = list[1]
	end
	return t_2._all(debug.traceback(nil, 2), list)
end

function t_2.fold(p11, p12, p13)
	-- upvalues: t_2 (ref)
	local isNotFunction
	assert(type(p11) == "table", "Bad argument #1 to Promise.fold: must be a table")
	
	if type(p12) == "function" then
		isNotFunction = true
	elseif type(p12) == "table" then
		local var4 = getmetatable(p12)
		
		if var4 then
			isNotFunction = type(rawget(var4, "__call")) ~= "function"
		end
	end
	assert(isNotFunction, "Bad argument #2 to Promise.fold: must be a function")
	local var5 = t_2.resolve(p13)
	
	return t_2.each(p11, function(p14, p15)
		-- upvalues: var5 (write), p12 (ref)
		var5 = var5:andThen(function(p16)
			-- upvalues: p12 (copy), p14 (ref), p15 (ref)
			return p12(p16, p14, p15)
		end)
	end):andThen(function()
		-- upvalues: var5 (write)
		return var5
	end)
end

function t_2.some(p11, p12)
	-- upvalues: t_2 (ref)
	assert(type(p12) == "number", "Bad argument #2 to Promise.some: must be a number")
	
	return t_2._all(debug.traceback(nil, 2), p11, p12)
end

function t_2.any(p11)
	-- upvalues: t_2 (ref)
	return t_2._all(debug.traceback(nil, 2), p11, 1):andThen(function(p12)
		return p12[1]
	end)
end

function t_2.allSettled(value)
	-- upvalues: t_2 (ref)
	if type(value) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2)
	end
	for i, v in pairs(value) do
		if not t_2.is(v) then
			error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", tostring(i)), 2)
		end
	end
	return if #value == 0 then t_2.resolve({}) else t_2._new(debug.traceback(nil, 2), function(p11, _, p12)
		-- upvalues: value (ref)
		local t = {}
		local t_1 = {}
		local var4 = 0
		
		local function resolveOne(p13, ...)
			-- upvalues: var4 (write), t (ref), value (copy), p11 (ref)
			var4 += 1
			t[p13] = ...
			
			if #value <= var4 then
				p11(t)
			end
		end
		
		p54(function()
			-- upvalues: t_1 (ref)
			for i, v in ipairs(t_1) do
				v:cancel()
			end
		end)
		
		for i, v in ipairs(value) do
			t_1[i] = v:finally(function(...)
				-- upvalues: resolveOne (ref), i (ref)
				resolveOne(i, ...)
			end)
		end
	end)
end

function t_2.race(p11)
	-- upvalues: t_2 (ref)
	assert(type(p11) == "table", string.format("Please pass a list of promises to %s", "Promise.race"))
	
	for i, v in pairs(p11) do
		assert(t_2.is(v), string.format("Non-promise value passed into %s at index %s", "Promise.race", tostring(i)))
	end
	return t_2._new(debug.traceback(nil, 2), function(p12, p13, p14)
		-- upvalues: p11 (ref)
		local t = {}
		local var4 = false
		
		local function _()
			-- upvalues: t (ref)
			for i, v in ipairs(t) do
				v:cancel()
			end
		end
		
		local _ = function(p15)
			-- upvalues: t (ref), var4 (write)
			return function(...)
				-- upvalues: t (copy), var4 (copy), p15 (ref)
				for i, v in ipairs(t) do
					v:cancel()
				end
				var4 = true
				
				return p15(...)
			end
		end
		
		if p14(function(...)
			-- upvalues: t (ref), var4 (write), p13 (ref)
			for i, v in ipairs(t) do
				v:cancel()
			end
			var4 = true
			
			return p13(...)
		end) then return end
		for i, v in ipairs(p11) do
			t[i] = v:andThen(function(...)
				-- upvalues: t (ref), var4 (write), p12 (ref)
				for i, v in ipairs(t) do
					v:cancel()
				end
				var4 = true
				
				return p12(...)
			end, function(...)
				-- upvalues: t (ref), var4 (write), p13 (ref)
				for i, v in ipairs(t) do
					v:cancel()
				end
				var4 = true
				
				return p13(...)
			end)
		end
	end)
end

function t_2.each(p16, p17)
	-- upvalues: t_2 (ref), t_1 (write)
	local isNotFunction
	assert(type(p16) == "table", string.format("Please pass a list of promises to %s", "Promise.each"))
	
	if type(p17) == "function" then
		isNotFunction = true
	elseif type(p17) == "table" then
		local var5 = getmetatable(p17)
		
		if var5 then
			isNotFunction = type(rawget(var5, "__call")) ~= "function"
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise.each"))
	
	return t_2._new(debug.traceback(nil, 2), function(p18, p19, p20)
		-- upvalues: p16 (ref), t_2 (copy), t_1 (copy), p17 (ref)
		local t = {}
		local t_3 = {}
		local var6 = false
		
		local function _()
			-- upvalues: t_3 (ref)
			for i, v in ipairs(t_3) do
				v:cancel()
			end
		end
		
		p20(function()
			-- upvalues: var6 (write), t_3 (ref)
			var6 = true
			
			for i, v in ipairs(t_3) do
				v:cancel()
			end
		end)
		local t_4 = {}
		
		for i, v in ipairs(p16) do
			if not t_2.is(v) then
				t_4[i] = v
				continue
			end
			if v:getStatus() ~= t_2.Status.Cancelled then
				if v:getStatus() ~= t_2.Status.Rejected then
					local var7 = v:andThen(function(...)
						return ...
					end)
					table.insert(t_3, var7)
					t_4[i] = var7
					continue
				end
				for i_1, v_2 in ipairs(t_3) do
					v_2:cancel()
				end
				return p19(select(2, v:await()))
			end
			for i_1, v_2 in ipairs(t_3) do
				v_2:cancel()
			end
			return p19(t_1.new({
				error = "Promise is cancelled",
				kind = t_1.Kind.AlreadyCancelled,
				context = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", i, v._source)
			}))
		end
		for i_1, v in ipairs(t_4) do
			local var8
			if t_2.is(v) then
				local _ = nil
				var8, var62 = v:await()
				v = var62
				
				if var8 then
					local var9 = t_2.resolve(p17(v, i_1))
					table.insert(t_3, var9)
					var8, var64 = var9:await()
					
					if var8 then
						t[i_1] = var64
						continue
					end
					for i_2, v_2 in ipairs(t_3) do
						v_2:cancel()
					end
					return p19(var64)
				end
				for i_2, v_2 in ipairs(t_3) do
					v_2:cancel()
				end
				return p19(v)
			end
		end
		p18(t)
		local v
	end)
end

function t_2:is()
	-- upvalues: t_2 (ref)
	if type(self) ~= "table" then
		return false
	end
	local var10 = getmetatable(self)
	
	if var10 == t_2 then
		return true
	elseif var10 == nil then
		local andThen = self.andThen
		
		if type(andThen) == "function" then
			return true
		elseif type(andThen) == "table" then
			local var11 = getmetatable(andThen)
			
			return var11 and type(rawget(var11, "__call")) == "function"
		elseif type(var10) == "table" and type(rawget(var10, "__index")) == "table" then
			local isNotFunction
			local var12 = rawget(rawget(var10, "__index"), "andThen")
			
			if type(var12) == "function" then
				isNotFunction = true
			elseif type(var12) == "table" then
				local var13 = getmetatable(var12)
				
				if var13 then
					isNotFunction = type(rawget(var13, "__call")) ~= "function"
				end
			end
			return isNotFunction
		end
	end
end

function t_2.promisify(p21)
	-- upvalues: t_2 (ref)
	return function(...)
		-- upvalues: t_2 (copy), p21 (ref)
		return t_2._try(debug.traceback(nil, 2), p21, ...)
	end
end

local awaitHelper = nil
local expectHelper = nil

function t_2.delay(p21)
	-- upvalues: t_2 (ref), expectHelper (write), awaitHelper (write)
	assert(type(p21) == "number", "Bad argument #1 to Promise.delay, must be a number.")
	
	if p21 < 0.016666666667 or p21 == 1e999 then
		p21 = 0.016666666667
	end
	return t_2._new(debug.traceback(nil, 2), function(p22, _, p23)
		-- upvalues: t_2 (copy), p21 (write), expectHelper (copy), awaitHelper (copy)
		local time = t_2._getTime()
		local var10 = time + p21
		local t = { resolve = p22, startTime = time, endTime = var10 }
		
		if expectHelper == nil then
			awaitHelper = t
			expectHelper = t_2._timeEvent:Connect(function()
				-- upvalues: t_2 (copy), awaitHelper (copy), expectHelper (copy)
				local time = t_2._getTime()
				while awaitHelper ~= nil and awaitHelper.endTime < time do
					local var11 = awaitHelper
					awaitHelper = var11.next
					
					if awaitHelper == nil then
						expectHelper:Disconnect()
						expectHelper = nil
					else
						awaitHelper.previous = nil
					end
					var11.resolve(t_2._getTime() - var11.startTime)
				end
			end)
		elseif awaitHelper.endTime < var10 then
			local var12 = awaitHelper
			local next = var12.next
			while next ~= nil and next.endTime < var10 do
				var12 = next
				next = var12.next
			end
			var12.next = t
			t.previous = var12
			
			if next ~= nil then
				t.next = next
				next.previous = t
			end
		else
			t.next = awaitHelper
			awaitHelper.previous = t
			awaitHelper = t
		end
		p23(function()
			-- upvalues: t (ref), awaitHelper (copy), expectHelper (copy)
			local next = t.next
			
			if awaitHelper == t then
				if next == nil then
					expectHelper:Disconnect()
					expectHelper = nil
				else
					next.previous = nil
				end
				awaitHelper = next
				
				return
			else
				local previous = t.previous
				previous.next = next
				
				if next ~= nil then
					next.previous = previous
				end
			end
		end)
	end)
end

function t_2.prototype.timeout(p24, p25, p26)
	-- upvalues: t_2 (ref), t_1 (write)
	local trac = debug.traceback(nil, 2)
	
	return t_2.race({
		t_2.delay(p25):andThen(function()
			-- upvalues: t_2 (copy), p26 (ref), t_1 (copy), p25 (ref), trac (ref)
			return t_2.reject(p26 == nil and t_1.new({
				error = "Timed out",
				kind = t_1.Kind.TimedOut,
				context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", p25, trac)
			}) or p26)
		end),
		p24
	})
end

function t_2.prototype.getStatus(p24)
	return p24._status
end

function t_2.prototype._andThen(p24, p25, p26, p27)
	-- upvalues: t_2 (ref), runExecutor (ref), t_1 (write)
	p24._unhandledRejection = false
	
	return t_2._new(p25, function(p28, p29)
		-- upvalues: p26 (ref), p25 (ref), runExecutor (copy), p27 (ref), p24 (ref), t_2 (copy), t_1 (copy)
		local var11 = p28
		
		if p26 then
			local var12 = p25
			local var13 = p26
			
			var11 = function(...)
				-- upvalues: runExecutor (copy), var12 (ref), var13 (ref), p28 (ref), p29 (ref)
				local var14, var15, var16 = runExecutor(var12, var13, ...)
				
				if var14 then
					p28(unpack(var16, 1, var15))
					
					return
				end
				p29(var16[1])
			end
		end
		local var14 = p29
		
		if p27 then
			local var15 = p25
			local var16 = p27
			
			var14 = function(...)
				-- upvalues: runExecutor (copy), var15 (ref), var16 (ref), p28 (ref), p29 (ref)
				local var17, var18, var19 = runExecutor(var15, var16, ...)
				
				if var17 then
					p28(unpack(var19, 1, var18))
					
					return
				end
				p29(var19[1])
			end
		end
		if p24._status == t_2.Status.Started then
			table.insert(p24._queuedResolve, var11)
			table.insert(p24._queuedReject, var14)
			
			return
		elseif p24._status == t_2.Status.Resolved then
			var11(unpack(p24._values, 1, p24._valuesLength))
			
			return
		elseif p24._status == t_2.Status.Rejected then
			var14(unpack(p24._values, 1, p24._valuesLength))
			
			return
		elseif p24._status == t_2.Status.Cancelled then
			p29(t_1.new({
				error = "Promise is cancelled",
				kind = t_1.Kind.AlreadyCancelled,
				context = "Promise created at\n\n" .. p75
			}))
		end
	end, p24)
end

function t_2.prototype.andThen(p24, p25, p26)
	local isNotFunction = true
	
	if p25 ~= nil then
		if type(p25) == "function" then
			isNotFunction = true
		elseif type(p25) == "table" then
			local var11 = getmetatable(p25)
			
			if var11 then
				isNotFunction = type(rawget(var11, "__call")) ~= "function"
			end
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:andThen"))
	local isNotFunction_1 = true
	
	if p26 ~= nil then
		if type(p26) == "function" then
			isNotFunction_1 = true
		elseif type(p26) == "table" then
			local var12 = getmetatable(p26)
			
			if var12 then
				isNotFunction_1 = type(rawget(var12, "__call")) ~= "function"
			end
		end
	end
	assert(isNotFunction_1, string.format("Please pass a handler function to %s!", "Promise:andThen"))
	
	return p24:_andThen(debug.traceback(nil, 2), p25, p26)
end

function t_2.prototype.andThenAsync(p24, p25, p26)
	-- upvalues: pack (ref), t_2 (ref)
	local isNotFunction = true
	
	if p25 ~= nil then
		if type(p25) == "function" then
			isNotFunction = true
		elseif type(p25) == "table" then
			local var11 = getmetatable(p25)
			
			if var11 then
				isNotFunction = type(rawget(var11, "__call")) ~= "function"
			end
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:andThenAsync"))
	local isNotFunction_1 = true
	
	if p26 ~= nil then
		if type(p26) == "function" then
			isNotFunction_1 = true
		elseif type(p26) == "table" then
			local var12 = getmetatable(p26)
			
			if var12 then
				isNotFunction_1 = type(rawget(var12, "__call")) ~= "function"
			end
		end
	end
	assert(isNotFunction_1, string.format("Please pass a handler function to %s!", "Promise:andThenAsync"))
	
	return p24:_andThen(debug.traceback(nil, 2), function(...)
		-- upvalues: pack (copy), t_2 (copy)
		local var13, var14 = pack(...)
		
		return t_2.defer(function(p27)
			-- upvalues: var14 (ref), var13 (ref)
			p27(unpack(var14, 1, var13))
		end)
	end, function(...)
		-- upvalues: pack (copy), t_2 (copy)
		local var13, var14 = pack(...)
		
		return t_2.defer(function(_, p27)
			-- upvalues: var14 (ref), var13 (ref)
			p27(unpack(var14, 1, var13))
		end)
	end):andThen(p25, p26)
end

function t_2.prototype.catch(p24, p25)
	local isNotFunction = true
	
	if p25 ~= nil then
		if type(p25) == "function" then
			isNotFunction = true
		elseif type(p25) == "table" then
			local var11 = getmetatable(p25)
			
			if var11 then
				isNotFunction = type(rawget(var11, "__call")) ~= "function"
			end
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:catch"))
	
	return p24:_andThen(debug.traceback(nil, 2), nil, p25)
end

function t_2.prototype.tap(p24, p25)
	-- upvalues: t_2 (ref), pack (ref)
	local isNotFunction
	if type(p25) == "function" then
		isNotFunction = true
	elseif type(p25) == "table" then
		local var11 = getmetatable(p25)
		
		if var11 then
			isNotFunction = type(rawget(var11, "__call")) ~= "function"
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:tap"))
	
	return p24:_andThen(debug.traceback(nil, 2), function(...)
		-- upvalues: p25 (ref), t_2 (copy), pack (copy)
		local var12 = p25(...)
		
		if t_2.is(var12) then
			local var13, var14 = pack(...)
			
			return var12:andThen(function()
				-- upvalues: var14 (ref), var13 (ref)
				return unpack(var14, 1, var13)
			end)
		end
		return ...
	end)
end

function t_2.prototype.andThenCall(p26, p27, ...)
	-- upvalues: pack (ref)
	local isNotFunction
	if type(p27) == "function" then
		isNotFunction = true
	elseif type(p27) == "table" then
		local var12 = getmetatable(p27)
		
		if var12 then
			isNotFunction = type(rawget(var12, "__call")) ~= "function"
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:andThenCall"))
	local var13, var14 = pack(...)
	
	return p26:_andThen(debug.traceback(nil, 2), function()
		-- upvalues: p27 (ref), var14 (ref), var13 (ref)
		return p27(unpack(var14, 1, var13))
	end)
end

function t_2.prototype.andThenReturn(p26, ...)
	-- upvalues: pack (ref)
	local var12, var13 = pack(...)
	
	return p26:_andThen(debug.traceback(nil, 2), function()
		-- upvalues: var13 (ref), var12 (ref)
		return unpack(var13, 1, var12)
	end)
end

function t_2.prototype.cancel(p26)
	-- upvalues: t_2 (ref)
	if p26._status ~= t_2.Status.Started then return end
	p26._status = t_2.Status.Cancelled
	
	if p26._cancellationHook then
		p26._cancellationHook()
	end
	coroutine.close(p26._thread)
	
	if p26._parent then
		p26._parent:_consumerCancelled(p26)
	end
	for i in pairs(p26._consumers) do
		i:cancel()
	end
	p26:_finalize()
end

function t_2.prototype._consumerCancelled(p27, p28)
	-- upvalues: t_2 (ref)
	if p27._status ~= t_2.Status.Started then return end
	p27._consumers[p28] = nil
	
	if next(p27._consumers) == nil then
		p27:cancel()
	end
end

function t_2.prototype._finally(p27, p28, p29, p30)
	-- upvalues: t_2 (ref), runExecutor (ref)
	if not p30 then
		p27._unhandledRejection = false
	end
	return t_2._new(p28, function(p31, p32)
		-- upvalues: p29 (ref), p28 (ref), runExecutor (copy), p30 (ref), p27 (ref), t_2 (copy)
		local var12 = p31
		
		if p29 then
			local var13 = p28
			local var14 = p29
			
			var12 = function(...)
				-- upvalues: runExecutor (copy), var13 (ref), var14 (ref), p31 (ref), p32 (ref)
				local var15, var16, var17 = runExecutor(var13, var14, ...)
				
				if var15 then
					p31(unpack(var17, 1, var16))
					
					return
				end
				p32(var17[1])
			end
		end
		if p30 then
			local var15 = var12
			
			var12 = function(...)
				-- upvalues: p27 (copy), t_2 (copy), p31 (ref), var15 (ref)
				return if p27._status == t_2.Status.Rejected then p31(p27) else var15(...)
			end
		end
		if p27._status == t_2.Status.Started then
			table.insert(p27._queuedFinally, var12)
			
			return
		end
		var12(p27._status)
	end, p27)
end

function t_2.prototype.finally(p27, p28)
	local isNotFunction = true
	
	if p28 ~= nil then
		if type(p28) == "function" then
			isNotFunction = true
		elseif type(p28) == "table" then
			local var12 = getmetatable(p28)
			
			if var12 then
				isNotFunction = type(rawget(var12, "__call")) ~= "function"
			end
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:finally"))
	
	return p27:_finally(debug.traceback(nil, 2), p28)
end

function t_2.prototype.finallyCall(p27, p28, ...)
	-- upvalues: pack (ref)
	local isNotFunction
	if type(p28) == "function" then
		isNotFunction = true
	elseif type(p28) == "table" then
		local var12 = getmetatable(p28)
		
		if var12 then
			isNotFunction = type(rawget(var12, "__call")) ~= "function"
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:finallyCall"))
	local var13, var14 = pack(...)
	
	return p27:_finally(debug.traceback(nil, 2), function()
		-- upvalues: p28 (ref), var14 (ref), var13 (ref)
		return p28(unpack(var14, 1, var13))
	end)
end

function t_2.prototype.finallyReturn(p27, ...)
	-- upvalues: pack (ref)
	local var12, var13 = pack(...)
	
	return p27:_finally(debug.traceback(nil, 2), function()
		-- upvalues: var13 (ref), var12 (ref)
		return unpack(var13, 1, var12)
	end)
end

function t_2.prototype.done(p27, p28)
	local isNotFunction = true
	
	if p28 ~= nil then
		if type(p28) == "function" then
			isNotFunction = true
		elseif type(p28) == "table" then
			local var12 = getmetatable(p28)
			
			if var12 then
				isNotFunction = type(rawget(var12, "__call")) ~= "function"
			end
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:done"))
	
	return p27:_finally(debug.traceback(nil, 2), p28, true)
end

function t_2.prototype.doneCall(p27, p28, ...)
	-- upvalues: pack (ref)
	local isNotFunction
	if type(p28) == "function" then
		isNotFunction = true
	elseif type(p28) == "table" then
		local var12 = getmetatable(p28)
		
		if var12 then
			isNotFunction = type(rawget(var12, "__call")) ~= "function"
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:doneCall"))
	local var13, var14 = pack(...)
	
	return p27:_finally(debug.traceback(nil, 2), function()
		-- upvalues: p28 (ref), var14 (ref), var13 (ref)
		return p28(unpack(var14, 1, var13))
	end, true)
end

function t_2.prototype.doneReturn(p27, ...)
	-- upvalues: pack (ref)
	local var12, var13 = pack(...)
	
	return p27:_finally(debug.traceback(nil, 2), function()
		-- upvalues: var13 (ref), var12 (ref)
		return unpack(var13, 1, var12)
	end, true)
end

function t_2.prototype.awaitStatus(p27)
	-- upvalues: t_2 (ref)
	p27._unhandledRejection = false
	
	if p27._status == t_2.Status.Started then
		local currentThread = coroutine.running()
		p27:finally(function()
			-- upvalues: currentThread (ref)
			task.spawn(currentThread)
		end)
		coroutine.yield()
	end
	if p27._status == t_2.Status.Resolved then
		return p27._status, unpack(p27._values, 1, p27._valuesLength)
	elseif p27._status == t_2.Status.Rejected then
		return p27._status, unpack(p27._values, 1, p27._valuesLength)
	end
	return p27._status
end

awaitHelper = function(p27, ...)
	-- upvalues: t_2 (ref)
	return p27 == t_2.Status.Resolved, ...
end

function t_2.prototype.await(p28)
	-- upvalues: awaitHelper (ref)
	return awaitHelper(p28:awaitStatus())
end

expectHelper = function(p28, ...)
	-- upvalues: t_2 (ref)
	if p28 ~= t_2.Status.Resolved then
		error(if ... == nil then "Expected Promise rejected with no value." else ..., 3)
	end
	return ...
end

function t_2.prototype.expect(p29)
	-- upvalues: expectHelper (ref)
	return expectHelper(p29:awaitStatus())
end

t_2.prototype.awaitValue = t_2.prototype.expect

function t_2.prototype._unwrap(p29)
	-- upvalues: t_2 (ref)
	if p29._status == t_2.Status.Started then
		error("Promise has not resolved or rejected.", 2)
	end
	return p29._status == t_2.Status.Resolved, unpack(p29._values, 1, p29._valuesLength)
end

function t_2.prototype._resolve(p29, ...)
	-- upvalues: t_2 (ref), t_1 (write), pack (ref)
	if p29._status == t_2.Status.Started then
		if t_2.is(...) then
			if select("#", ...) > 1 then
				warn(string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", p29._source))
			end
			local var12 = ...
			local var131 = var12:andThen(function(...)
				-- upvalues: p29 (ref)
				p29:_resolve(...)
			end, function(...)
				-- upvalues: var12 (ref), t_1 (copy), p29 (ref)
				local var13 = if var12._error then t_1.new({
					context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]",
					error = var12._error,
					kind = t_1.Kind.ExecutionError
				}) else var12._values[1]
				
				if t_1.isKind(var13, t_1.Kind.ExecutionError) then
					return p29:_reject(var13:extend({
						error = "This Promise was chained to a Promise that errored.",
						trace = "",
						context = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", p29._source)
					}))
				end
				p29:_reject(...)
			end)
			
			if var131._status == t_2.Status.Cancelled then
				p29:cancel()
				
				return
			elseif var131._status == t_2.Status.Started then
				p29._parent = var131
				var131._consumers[p29] = true
			end
			return
		else
			p29._status = t_2.Status.Resolved
			local var13, var14 = pack(...)
			p29._valuesLength = var13
			p29._values = var14
			
			for i, v in ipairs(p29._queuedResolve) do
				coroutine.wrap(v)(...)
			end
			p29:_finalize()
			
			return
		end
	elseif t_2.is(...) then
		(...):_consumerCancelled(p29)
	end
end

function t_2.prototype._reject(p30, ...)
	-- upvalues: t_2 (ref), pack (ref)
	if p30._status ~= t_2.Status.Started then return end
	p30._status = t_2.Status.Rejected
	local var15, var16 = pack(...)
	p30._valuesLength = var15
	p30._values = var16
	
	if next(p30._queuedReject) == nil then
		local var17 = tostring(...)
		coroutine.wrap(function()
			-- upvalues: t_2 (copy), p30 (ref), var17 (ref)
			t_2._timeEvent:Wait()
			
			if not p30._unhandledRejection then return end
			local formattedText = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", var17, p30._source)
			
			for i, v in ipairs(t_2._unhandledRejectionCallbacks) do
				task.spawn(v, p30, unpack(p30._values, 1, p30._valuesLength))
			end
			if t_2.TEST then
				return
			end
			warn(formattedText)
		end)()
	else
		for i, v in ipairs(p30._queuedReject) do
			coroutine.wrap(v)(...)
		end
	end
	p30:_finalize()
end

local t_3 = {}
local var18 = nil

local function closeThreads()
	-- upvalues: var18 (write), t_3 (write)
	var18 = nil
	t_3 = {}
	
	for i, v in t_3 do
		coroutine.close(v)
	end
end

function t_2.prototype._finalize(p31)
	-- upvalues: t_2 (ref), status (write), t_3 (write), var18 (write), closeThreads (ref)
	for i, v in ipairs(p31._queuedFinally) do
		coroutine.wrap(v)(p31._status)
	end
	p31._queuedFinally = nil
	p31._queuedReject = nil
	p31._queuedResolve = nil
	
	if not t_2.TEST then
		p31._parent = nil
		p31._consumers = nil
	end
	if status then
		table.insert(t_3, p31._thread)
		
		if var18 then
			return
		else
			var18 = task.defer(closeThreads)
			
			return
		end
	else
		task.defer(coroutine.close, p31._thread)
	end
end

function t_2.prototype.now(p32, p33)
	-- upvalues: t_2 (ref), t_1 (write)
	local trac = debug.traceback(nil, 2)
	
	return if p32._status == t_2.Status.Resolved then p32:_andThen(trac, function(...)
		return ...
	end) else t_2.reject(p33 == nil and t_1.new({
		error = "This Promise was not resolved in time for :now()",
		kind = t_1.Kind.NotResolvedInTime,
		context = ":now() was called at:\n\n" .. trac
	}) or p33)
end

function t_2.retry(p34, p35, ...)
	-- upvalues: t_2 (ref)
	local isNotFunction
	if type(p34) == "function" then
		isNotFunction = true
	elseif type(p34) == "table" then
		local var19 = getmetatable(p34)
		
		if var19 then
			isNotFunction = type(rawget(var19, "__call")) ~= "function"
		end
	end
	assert(isNotFunction, "Parameter #1 to Promise.retry must be a function")
	assert(type(p35) == "number", "Parameter #2 to Promise.retry must be a number")
	local list = { ... }
	local var20 = select("#", ...)
	
	return t_2.resolve(p34(...)):catch(function(...)
		-- upvalues: p35 (ref), t_2 (copy), p34 (ref), list (ref), var20 (ref)
		return if p35 > 0 then t_2.retry(p34, p35 - 1, unpack(list, 1, var20)) else t_2.reject(...)
	end)
end

function t_2.retryWithDelay(p34, p35, p36, ...)
	-- upvalues: t_2 (ref)
	local isNotFunction
	if type(p34) == "function" then
		isNotFunction = true
	elseif type(p34) == "table" then
		local var19 = getmetatable(p34)
		
		if var19 then
			isNotFunction = type(rawget(var19, "__call")) ~= "function"
		end
	end
	assert(isNotFunction, "Parameter #1 to Promise.retry must be a function")
	assert(type(p35) == "number", "Parameter #2 (times) to Promise.retry must be a number")
	assert(type(p36) == "number", "Parameter #3 (seconds) to Promise.retry must be a number")
	local list = { ... }
	local var20 = select("#", ...)
	
	return t_2.resolve(p34(...)):catch(function(...)
		-- upvalues: p35 (ref), t_2 (copy), p36 (ref), p34 (ref), list (ref), var20 (ref)
		if p35 > 0 then
			t_2.delay(p36):await()
			
			return t_2.retryWithDelay(p34, p35 - 1, p36, unpack(list, 1, var20))
		end
		return t_2.reject(...)
	end)
end

function t_2.fromEvent(p34, p35)
	-- upvalues: t_2 (ref)
	p35 = p35 or function()
		return true
	end
	
	return t_2._new(debug.traceback(nil, 2), function(p36, _, p37)
		-- upvalues: p34 (ref), p35 (write)
		local var19 = nil
		local var20 = false
		
		local function disconnect()
			-- upvalues: var19 (write)
			var19:Disconnect()
			var19 = nil
		end
		
		var19 = p34:Connect(function(...)
			-- upvalues: p35 (copy), p36 (ref), var19 (write), var20 (write)
			local var21 = p35(...)
			
			if var21 == true then
				p36(...)
				
				if var19 then
					var19:Disconnect()
					var19 = nil
					
					return
				end
				var20 = true
				
				return
			elseif type(var21) ~= "boolean" then
				error("Promise.fromEvent predicate should always return a boolean")
			end
		end)
		p37(disconnect)
	end)
end

function t_2.onUnhandledRejection(p34)
	-- upvalues: t_2 (ref)
	table.insert(t_2._unhandledRejectionCallbacks, p34)
	
	return function()
		-- upvalues: t_2 (copy), p34 (ref)
		local index = table.find(t_2._unhandledRejectionCallbacks, p34)
		
		if index then
			table.remove(t_2._unhandledRejectionCallbacks, index)
		end
	end
end

return t_2