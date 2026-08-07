local t = { __mode = "k" }
local ok, status = pcall(game.DefineFastFlag, game, "ReducePromiseTaskDefer", false)

if not ok then
	status = false
end
local function _(p0) --[[ line: 16 | named "isCallable" ]]
	if type(p0) == "function" then
		return true
	elseif type(p0) == "table" then
		local var12 = getmetatable(p0)
		
		return var12 and type(rawget(var12, "__call")) == "function"
	end
end

local function makeEnum(p1, p2) --[[ line: 34 ]]
	local t = {}
	
	for i, v in ipairs(p2) do
		t[v] = v
	end
	return setmetatable(t, {
		__index = function(_, p3) --[[ line: 42 ]]
			-- upvalues: p1 (ref)
			error(string.format("%s is not in %s!", p3, p1), 2)
		end,
		__newindex = function() --[[ line: 45 ]]
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

function t_1.new(p4, p5) --[[ line: 70 ]]
	-- upvalues: t_1 (write)
	p4 = p4 or {}
	
	return setmetatable({
		error = tostring(p4.error) or "[This error has no error text.]",
		trace = p4.trace,
		context = p4.context,
		kind = p4.kind,
		parent = p5,
		createdTick = os.clock(),
		createdTrace = debug.traceback()
	}, t_1)
end

function t_1.is(p6) --[[ line: 83 ]]
	if type(p6) == "table" then
		local var15 = getmetatable(p6)
		
		return type(var15) == "table" and (rawget(p6, "error") ~= nil and type(rawget(var15, "extend")) == "function")
	end
end

function t_1:isKind(p7) --[[ line: 95 ]]
	-- upvalues: t_1 (write)
	assert(p7 ~= nil, "Argument #2 to Promise.Error.isKind must not be nil")
	
	return t_1.is(self) and self.kind == p7
end

function t_1:extend(p8) --[[ line: 101 ]]
	-- upvalues: t_1 (write)
	p8 = p8 or {}
	p8.kind = p8.kind or self.kind
	
	return t_1.new(p8, self)
end

function t_1.getErrorChain(p9) --[[ line: 109 ]]
	local list = { p9 }
	while list[#list].parent do
		table.insert(list, list[#list].parent)
	end
	return list
end

function t_1:__tostring() --[[ line: 119 ]]
	local list = {
		string.format("-- Promise.Error(%s) --", self.kind or "?")
	}
	
	for i, v in ipairs(self:getErrorChain()) do
		table.insert(list, table.concat({ v.trace or v.error, v.context }, "\n"))
	end
	return table.concat(list, "\n")
end

local function pack(...) --[[ line: 143 ]]
	return select("#", ...), { ... }
end

local function packResult(p10, ...) --[[ line: 150 ]]
	return p10, select("#", ...), { ... }
end

local _ = function(p11) --[[ line: 154 | named "makeErrorHandler" ]]
	-- upvalues: t_1 (write)
	assert(p11 ~= nil, "traceback is nil")
	
	return function(p12) --[[ line: 157 ]]
		-- upvalues: t_1 (copy), p11 (ref)
		return if type(p12) == "table" then p12 else t_1.new({
			error = p12,
			kind = t_1.Kind.ExecutionError,
			trace = debug.traceback(tostring(p12), 2),
			context = "Promise created at:\n\n" .. p11
		})
	end
end

local function runExecutor(p13, p14, ...) --[[ line: 177 ]]
	-- upvalues: packResult (ref), t_1 (write)
	local _xpcall = xpcall
	assert(p13 ~= nil, "traceback is nil")
	
	return packResult(_xpcall(p14, function(p15) --[[ line: 157 ]]
		-- upvalues: t_1 (copy), p13 (ref)
		return if type(p15) == "table" then p15 else t_1.new({
			error = p15,
			kind = t_1.Kind.ExecutionError,
			trace = debug.traceback(tostring(p15), 2),
			context = "Promise created at:\n\n" .. p13
		})
	end, ...))
end

local _ = function(p16, p17, p18, p19) --[[ line: 185 | named "createAdvancer" ]]
	-- upvalues: runExecutor (ref)
	return function(...) --[[ line: 186 ]]
		-- upvalues: runExecutor (copy), p16 (ref), p17 (ref), p18 (ref), p19 (ref)
		local var20, var21, var22 = runExecutor(p16, p17, ...)
		
		if var20 then
			p18(unpack(var22, 1, var21))
			
			return
		end
		p19(var22[1])
	end
end

local _ = function(p20) --[[ line: 197 | named "isEmpty" ]]
	return next(p20) == nil
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

function t_2._new(p21, p22, p23) --[[ line: 236 ]]
	-- upvalues: t_2 (ref), t (ref), runExecutor (ref)
	if p23 ~= nil and not t_2.is(p23) then
		error("Argument #2 to Promise.new must be a promise or nil", 2)
	end
	local t_1 = {
		_thread = nil,
		_values = nil,
		_valuesLength = -1,
		_unhandledRejection = true,
		_cancellationHook = nil,
		_source = p21,
		_status = t_2.Status.Started,
		_queuedResolve = {},
		_queuedReject = {},
		_queuedFinally = {},
		_parent = p23,
		_consumers = setmetatable({}, t)
	}
	
	if p23 and p23._status == t_2.Status.Started then
		p23._consumers[t_1] = true
	end
	setmetatable(t_1, t_2)
	
	local function resolve(...) --[[ line: 284 ]]
		-- upvalues: t_1 (ref)
		t_1:_resolve(...)
	end
	
	local function reject(...) --[[ line: 288 ]]
		-- upvalues: t_1 (ref)
		t_1:_reject(...)
	end
	
	local function onCancel(p24) --[[ line: 292 ]]
		-- upvalues: t_1 (ref), t_2 (copy)
		if p24 then
			if t_1._status == t_2.Status.Cancelled then
				p24()
			else
				t_1._cancellationHook = p24
			end
		end
		return t_1._status == t_2.Status.Cancelled
	end
	
	t_1._thread = coroutine.create(function() --[[ line: 304 ]]
		-- upvalues: runExecutor (copy), t_1 (ref), p22 (ref), resolve (ref), reject (ref), onCancel (ref)
		local var27, _, var28 = runExecutor(t_1._source, p22, resolve, reject, onCancel)
		
		if not var27 then
			reject(var28[1])
		end
	end)
	task.spawn(t_1._thread)
	
	return t_1
end

function t_2.new(p25) --[[ line: 355 ]]
	-- upvalues: t_2 (ref)
	return t_2._new(debug.traceback(nil, 2), p25)
end

function t_2:__tostring() --[[ line: 359 ]]
	return string.format("Promise(%s)", self._status)
end

function t_2.defer(p26) --[[ line: 381 ]]
	-- upvalues: t_2 (ref), runExecutor (ref)
	local trac = debug.traceback(nil, 2)
	local _ = nil
	
	return t_2._new(trac, function(p27, p28, p29) --[[ line: 384 ]]
		-- upvalues: t_2 (copy), runExecutor (copy), trac (ref), p26 (ref)
		local timeEventConnection = nil
		timeEventConnection = t_2._timeEvent:Connect(function() --[[ line: 386 ]]
			-- upvalues: timeEventConnection (write), runExecutor (copy), trac (copy), p26 (copy), p27 (ref), p28 (ref), p29 (ref)
			timeEventConnection:Disconnect()
			local var31, _, var32 = runExecutor(trac, p26, p27, p28, p29)
			
			if not var31 then
				p28(var32[1])
			end
		end)
	end)
end

t_2.async = t_2.defer

function t_2.resolve(...) --[[ line: 424 ]]
	-- upvalues: pack (ref), t_2 (ref)
	local var33, var34 = pack(...)
	
	return t_2._new(debug.traceback(nil, 2), function(p30) --[[ line: 426 ]]
		-- upvalues: var34 (ref), var33 (ref)
		p30(unpack(var34, 1, var33))
	end)
end

function t_2.reject(...) --[[ line: 441 ]]
	-- upvalues: pack (ref), t_2 (ref)
	local var35, var36 = pack(...)
	
	return t_2._new(debug.traceback(nil, 2), function(_, p31) --[[ line: 443 ]]
		-- upvalues: var36 (ref), var35 (ref)
		p31(unpack(var36, 1, var35))
	end)
end

function t_2._try(p32, p33, ...) --[[ line: 452 ]]
	-- upvalues: pack (ref), t_2 (ref)
	local var37, var38 = pack(...)
	
	return t_2._new(p32, function(p34) --[[ line: 455 ]]
		-- upvalues: p33 (ref), var38 (ref), var37 (ref)
		p34(p33(unpack(var38, 1, var37)))
	end)
end

function t_2.try(p35, ...) --[[ line: 483 ]]
	-- upvalues: t_2 (ref)
	return t_2._try(debug.traceback(nil, 2), p35, ...)
end

function t_2._all(p36, p37, p38) --[[ line: 492 ]]
	-- upvalues: t_2 (ref)
	if type(p37) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.all"), 3)
	end
	for i, v in pairs(p37) do
		if not t_2.is(v) then
			error(string.format("Non-promise value passed into %s at index %s", "Promise.all", tostring(i)), 3)
		end
	end
	return if #p37 == 0 or p38 == 0 then t_2.resolve({}) else t_2._new(p36, function(p39, p40, p41) --[[ line: 510 ]]
		-- upvalues: p38 (ref), p37 (ref)
		local t = {}
		local t_1 = {}
		local var41 = 0
		local var42 = 0
		local var43 = false
		
		local function resolveOne(p42, ...) --[[ line: 528 ]]
			-- upvalues: var43 (write), var41 (write), p38 (copy), t (ref), p37 (copy), p39 (ref), t_1 (ref)
			if var43 then return end
			var41 += 1
			
			if p38 == nil then
				t[p42] = ...
			else
				t[var41] = ...
			end
			if (p38 or #p37) <= var41 then
				var43 = true
				p39(t)
				
				for i, v in ipairs(t_1) do
					v:cancel()
				end
			end
		end
		
		p41(function() --[[ line: 521 | named "cancel" ]]
			-- upvalues: t_1 (ref)
			for i, v in ipairs(t_1) do
				v:cancel()
			end
		end)
		
		for i, v in ipairs(p37) do
			t_1[i] = v:andThen(function(...) --[[ line: 553 ]]
				-- upvalues: resolveOne (ref), i (ref)
				resolveOne(i, ...)
			end, function(...) --[[ line: 555 ]]
				-- upvalues: var42 (write), p38 (copy), p37 (copy), t_1 (ref), var43 (write), p40 (ref)
				var42 += 1
				
				if p38 == nil or #p37 - var42 < p38 then
					for i, v in ipairs(t_1) do
						v:cancel()
					end
					var43 = true
					p40(...)
				end
			end)
		end
	end)
end

function t_2.all(...) --[[ line: 597 ]]
	-- upvalues: t_2 (ref)
	local list = { ... }
	
	if type(list[1]) == "table" and not t_2.is(list[1]) then
		list = list[1]
	end
	return t_2._all(debug.traceback(nil, 2), list)
end

function t_2.fold(p43, p44, p45) --[[ line: 634 ]]
	-- upvalues: t_2 (ref)
	local isNotFunction
	assert(type(p43) == "table", "Bad argument #1 to Promise.fold: must be a table")
	
	if type(p44) == "function" then
		isNotFunction = true
	elseif type(p44) == "table" then
		local var47 = getmetatable(p44)
		
		if var47 then
			isNotFunction = type(rawget(var47, "__call")) ~= "function"
		end
	end
	assert(isNotFunction, "Bad argument #2 to Promise.fold: must be a function")
	local var48 = t_2.resolve(p45)
	
	return t_2.each(p43, function(p46, p47) --[[ line: 639 ]]
		-- upvalues: var48 (write), p44 (ref)
		var48 = var48:andThen(function(p48) --[[ line: 640 ]]
			-- upvalues: p44 (copy), p46 (ref), p47 (ref)
			return p44(p48, p46, p47)
		end)
	end):andThen(function() --[[ line: 643 ]]
		-- upvalues: var48 (write)
		return var48
	end)
end

function t_2.some(p49, p50) --[[ line: 667 ]]
	-- upvalues: t_2 (ref)
	assert(type(p50) == "number", "Bad argument #2 to Promise.some: must be a number")
	
	return t_2._all(debug.traceback(nil, 2), p49, p50)
end

function t_2.any(p51) --[[ line: 691 ]]
	-- upvalues: t_2 (ref)
	return t_2._all(debug.traceback(nil, 2), p51, 1):andThen(function(p52) --[[ line: 692 ]]
		return p52[1]
	end)
end

function t_2.allSettled(value) --[[ line: 713 ]]
	-- upvalues: t_2 (ref)
	if type(value) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2)
	end
	for i, v in pairs(value) do
		if not t_2.is(v) then
			error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", tostring(i)), 2)
		end
	end
	return if #value == 0 then t_2.resolve({}) else t_2._new(debug.traceback(nil, 2), function(p53, _, p54) --[[ line: 731 ]]
		-- upvalues: value (ref)
		local t = {}
		local t_1 = {}
		local var51 = 0
		
		local function resolveOne(p55, ...) --[[ line: 741 ]]
			-- upvalues: var51 (write), t (ref), value (copy), p53 (ref)
			var51 += 1
			t[p55] = ...
			
			if #value <= var51 then
				p53(t)
			end
		end
		
		p54(function() --[[ line: 751 ]]
			-- upvalues: t_1 (ref)
			for i, v in ipairs(t_1) do
				v:cancel()
			end
		end)
		
		for i, v in ipairs(value) do
			t_1[i] = v:finally(function(...) --[[ line: 760 ]]
				-- upvalues: resolveOne (ref), i (ref)
				resolveOne(i, ...)
			end)
		end
	end)
end

function t_2.race(p56) --[[ line: 791 ]]
	-- upvalues: t_2 (ref)
	assert(type(p56) == "table", string.format("Please pass a list of promises to %s", "Promise.race"))
	
	for i, v in pairs(p56) do
		assert(t_2.is(v), string.format("Non-promise value passed into %s at index %s", "Promise.race", tostring(i)))
	end
	return t_2._new(debug.traceback(nil, 2), function(p57, p58, p59) --[[ line: 798 ]]
		-- upvalues: p56 (ref)
		local t = {}
		local var54 = false
		
		local function _() --[[ line: 802 | named "cancel" ]]
			-- upvalues: t (ref)
			for i, v in ipairs(t) do
				v:cancel()
			end
		end
		
		local _ = function(p60) --[[ line: 808 | named "finalize" ]]
			-- upvalues: t (ref), var54 (write)
			return function(...) --[[ line: 809 ]]
				-- upvalues: t (copy), var54 (copy), p60 (ref)
				for i, v in ipairs(t) do
					v:cancel()
				end
				var54 = true
				
				return p60(...)
			end
		end
		
		if p59(function(...) --[[ line: 809 ]]
			-- upvalues: t (ref), var54 (write), p58 (ref)
			for i, v in ipairs(t) do
				v:cancel()
			end
			var54 = true
			
			return p58(...)
		end) then return end
		for i, v in ipairs(p56) do
			t[i] = v:andThen(function(...) --[[ line: 809 ]]
				-- upvalues: t (ref), var54 (write), p57 (ref)
				for i, v in ipairs(t) do
					v:cancel()
				end
				var54 = true
				
				return p57(...)
			end, function(...) --[[ line: 809 ]]
				-- upvalues: t (ref), var54 (write), p58 (ref)
				for i, v in ipairs(t) do
					v:cancel()
				end
				var54 = true
				
				return p58(...)
			end)
		end
	end)
end

function t_2.each(p61, p62) --[[ line: 886 ]]
	-- upvalues: t_2 (ref), t_1 (write)
	local isNotFunction
	assert(type(p61) == "table", string.format("Please pass a list of promises to %s", "Promise.each"))
	
	if type(p62) == "function" then
		isNotFunction = true
	elseif type(p62) == "table" then
		local var56 = getmetatable(p62)
		
		if var56 then
			isNotFunction = type(rawget(var56, "__call")) ~= "function"
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise.each"))
	
	return t_2._new(debug.traceback(nil, 2), function(p63, p64, p65) --[[ line: 890 ]]
		-- upvalues: p61 (ref), t_2 (copy), t_1 (copy), p62 (ref)
		local t = {}
		local t_3 = {}
		local var59 = false
		
		local function _() --[[ line: 896 | named "cancel" ]]
			-- upvalues: t_3 (ref)
			for i, v in ipairs(t_3) do
				v:cancel()
			end
		end
		
		p65(function() --[[ line: 902 ]]
			-- upvalues: var59 (write), t_3 (ref)
			var59 = true
			
			for i, v in ipairs(t_3) do
				v:cancel()
			end
		end)
		local t_4 = {}
		
		for i, v in ipairs(p61) do
			if not t_2.is(v) then
				t_4[i] = v
				continue
			end
			if v:getStatus() ~= t_2.Status.Cancelled then
				if v:getStatus() ~= t_2.Status.Rejected then
					local var65 = v:andThen(function(...) --[[ line: 935 ]]
						return ...
					end)
					table.insert(t_3, var65)
					t_4[i] = var65
					continue
				end
				for i_1, v_2 in ipairs(t_3) do
					v_2:cancel()
				end
				return p64(select(2, v:await()))
			end
			for i_1, v_2 in ipairs(t_3) do
				v_2:cancel()
			end
			return p64(t_1.new({
				error = "Promise is cancelled",
				kind = t_1.Kind.AlreadyCancelled,
				context = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", i, v._source)
			}))
		end
		for i_1, v in ipairs(t_4) do
			local var61
			if t_2.is(v) then
				local _ = nil
				var61, var62 = v:await()
				v = var62
				
				if var61 then
					local var63 = t_2.resolve(p62(v, i_1))
					table.insert(t_3, var63)
					var61, var64 = var63:await()
					
					if var61 then
						t[i_1] = var64
						continue
					end
					for i_2, v_2 in ipairs(t_3) do
						v_2:cancel()
					end
					return p64(var64)
				end
				for i_2, v_2 in ipairs(t_3) do
					v_2:cancel()
				end
				return p64(v)
			end
		end
		p63(t)
		local v
	end)
end

function t_2:is() --[[ line: 985 ]]
	-- upvalues: t_2 (ref)
	if type(self) ~= "table" then
		return false
	end
	local var66 = getmetatable(self)
	
	if var66 == t_2 then
		return true
	elseif var66 == nil then
		local andThen = self.andThen
		
		if type(andThen) == "function" then
			return true
		elseif type(andThen) == "table" then
			local var67 = getmetatable(andThen)
			
			return var67 and type(rawget(var67, "__call")) == "function"
		elseif type(var66) == "table" and type(rawget(var66, "__index")) == "table" then
			local isNotFunction
			local var68 = rawget(rawget(var66, "__index"), "andThen")
			
			if type(var68) == "function" then
				isNotFunction = true
			elseif type(var68) == "table" then
				local var70 = getmetatable(var68)
				
				if var70 then
					isNotFunction = type(rawget(var70, "__call")) ~= "function"
				end
			end
			return isNotFunction
		end
	end
end

function t_2.promisify(p66) --[[ line: 1034 ]]
	-- upvalues: t_2 (ref)
	return function(...) --[[ line: 1035 ]]
		-- upvalues: t_2 (copy), p66 (ref)
		return t_2._try(debug.traceback(nil, 2), p66, ...)
	end
end

local awaitHelper = nil
local expectHelper = nil

function t_2.delay(p67) --[[ line: 1065 ]]
	-- upvalues: t_2 (ref), expectHelper (write), awaitHelper (write)
	assert(type(p67) == "number", "Bad argument #1 to Promise.delay, must be a number.")
	
	if p67 < 0.016666666667 or p67 == 1e999 then
		p67 = 0.016666666667
	end
	return t_2._new(debug.traceback(nil, 2), function(p68, _, p69) --[[ line: 1073 ]]
		-- upvalues: t_2 (copy), p67 (write), expectHelper (copy), awaitHelper (copy)
		local time = t_2._getTime()
		local var72 = time + p67
		local t = { resolve = p68, startTime = time, endTime = var72 }
		
		if expectHelper == nil then
			awaitHelper = t
			expectHelper = t_2._timeEvent:Connect(function() --[[ line: 1085 ]]
				-- upvalues: t_2 (copy), awaitHelper (copy), expectHelper (copy)
				local time = t_2._getTime()
				while awaitHelper ~= nil and awaitHelper.endTime < time do
					local var76 = awaitHelper
					awaitHelper = var76.next
					
					if awaitHelper == nil then
						expectHelper:Disconnect()
						expectHelper = nil
					else
						awaitHelper.previous = nil
					end
					var76.resolve(t_2._getTime() - var76.startTime)
				end
			end)
		elseif awaitHelper.endTime < var72 then
			local var74 = awaitHelper
			local next = var74.next
			while next ~= nil and next.endTime < var72 do
				var74 = next
				next = var74.next
			end
			var74.next = t
			t.previous = var74
			
			if next ~= nil then
				t.next = next
				next.previous = t
			end
		else
			t.next = awaitHelper
			awaitHelper.previous = t
			awaitHelper = t
		end
		p69(function() --[[ line: 1130 ]]
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

function t_2.prototype.timeout(p70, p71, p72) --[[ line: 1194 ]]
	-- upvalues: t_2 (ref), t_1 (write)
	local trac = debug.traceback(nil, 2)
	
	return t_2.race({
		t_2.delay(p71):andThen(function() --[[ line: 1198 ]]
			-- upvalues: t_2 (copy), p72 (ref), t_1 (copy), p71 (ref), trac (ref)
			return t_2.reject(p72 == nil and t_1.new({
				error = "Timed out",
				kind = t_1.Kind.TimedOut,
				context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", p71, trac)
			}) or p72)
		end),
		p70
	})
end

function t_2.prototype.getStatus(p73) --[[ line: 1218 ]]
	return p73._status
end

function t_2.prototype._andThen(p74, p75, p76, p77) --[[ line: 1227 ]]
	-- upvalues: t_2 (ref), runExecutor (ref), t_1 (write)
	p74._unhandledRejection = false
	
	return t_2._new(p75, function(p78, p79) --[[ line: 1231 ]]
		-- upvalues: p76 (ref), p75 (ref), runExecutor (copy), p77 (ref), p74 (ref), t_2 (copy), t_1 (copy)
		local var78 = p78
		
		if p76 then
			local var79 = p75
			local var80 = p76
			
			var78 = function(...) --[[ line: 186 ]]
				-- upvalues: runExecutor (copy), var79 (ref), var80 (ref), p78 (ref), p79 (ref)
				local var20, var21, var22 = runExecutor(var79, var80, ...)
				
				if var20 then
					p78(unpack(var22, 1, var21))
					
					return
				end
				p79(var22[1])
			end
		end
		local var81 = p79
		
		if p77 then
			local var82 = p75
			local var83 = p77
			
			var81 = function(...) --[[ line: 186 ]]
				-- upvalues: runExecutor (copy), var82 (ref), var83 (ref), p78 (ref), p79 (ref)
				local var20, var21, var22 = runExecutor(var82, var83, ...)
				
				if var20 then
					p78(unpack(var22, 1, var21))
					
					return
				end
				p79(var22[1])
			end
		end
		if p74._status == t_2.Status.Started then
			table.insert(p74._queuedResolve, var78)
			table.insert(p74._queuedReject, var81)
			
			return
		elseif p74._status == t_2.Status.Resolved then
			var78(unpack(p74._values, 1, p74._valuesLength))
			
			return
		elseif p74._status == t_2.Status.Rejected then
			var81(unpack(p74._values, 1, p74._valuesLength))
			
			return
		elseif p74._status == t_2.Status.Cancelled then
			p79(t_1.new({
				error = "Promise is cancelled",
				kind = t_1.Kind.AlreadyCancelled,
				context = "Promise created at\n\n" .. p75
			}))
		end
	end, p74)
end

function t_2.prototype.andThen(p80, p81, p82) --[[ line: 1288 ]]
	local isNotFunction = true
	
	if p81 ~= nil then
		if type(p81) == "function" then
			isNotFunction = true
		elseif type(p81) == "table" then
			local var85 = getmetatable(p81)
			
			if var85 then
				isNotFunction = type(rawget(var85, "__call")) ~= "function"
			end
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:andThen"))
	local isNotFunction_1 = true
	
	if p82 ~= nil then
		if type(p82) == "function" then
			isNotFunction_1 = true
		elseif type(p82) == "table" then
			local var87 = getmetatable(p82)
			
			if var87 then
				isNotFunction_1 = type(rawget(var87, "__call")) ~= "function"
			end
		end
	end
	assert(isNotFunction_1, string.format("Please pass a handler function to %s!", "Promise:andThen"))
	
	return p80:_andThen(debug.traceback(nil, 2), p81, p82)
end

function t_2.prototype.andThenAsync(p83, p84, p85) --[[ line: 1316 ]]
	-- upvalues: pack (ref), t_2 (ref)
	local isNotFunction = true
	
	if p84 ~= nil then
		if type(p84) == "function" then
			isNotFunction = true
		elseif type(p84) == "table" then
			local var89 = getmetatable(p84)
			
			if var89 then
				isNotFunction = type(rawget(var89, "__call")) ~= "function"
			end
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:andThenAsync"))
	local isNotFunction_1 = true
	
	if p85 ~= nil then
		if type(p85) == "function" then
			isNotFunction_1 = true
		elseif type(p85) == "table" then
			local var91 = getmetatable(p85)
			
			if var91 then
				isNotFunction_1 = type(rawget(var91, "__call")) ~= "function"
			end
		end
	end
	assert(isNotFunction_1, string.format("Please pass a handler function to %s!", "Promise:andThenAsync"))
	
	return p83:_andThen(debug.traceback(nil, 2), function(...) --[[ line: 1323 ]]
		-- upvalues: pack (copy), t_2 (copy)
		local var92, var93 = pack(...)
		
		return t_2.defer(function(p86) --[[ line: 1325 ]]
			-- upvalues: var93 (ref), var92 (ref)
			p86(unpack(var93, 1, var92))
		end)
	end, function(...) --[[ line: 1329 ]]
		-- upvalues: pack (copy), t_2 (copy)
		local var94, var95 = pack(...)
		
		return t_2.defer(function(_, p87) --[[ line: 1331 ]]
			-- upvalues: var95 (ref), var94 (ref)
			p87(unpack(var95, 1, var94))
		end)
	end):andThen(p84, p85)
end

function t_2.prototype.catch(p88, p89) --[[ line: 1358 ]]
	local isNotFunction = true
	
	if p89 ~= nil then
		if type(p89) == "function" then
			isNotFunction = true
		elseif type(p89) == "table" then
			local var97 = getmetatable(p89)
			
			if var97 then
				isNotFunction = type(rawget(var97, "__call")) ~= "function"
			end
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:catch"))
	
	return p88:_andThen(debug.traceback(nil, 2), nil, p89)
end

function t_2.prototype.tap(p90, p91) --[[ line: 1379 ]]
	-- upvalues: t_2 (ref), pack (ref)
	local isNotFunction
	if type(p91) == "function" then
		isNotFunction = true
	elseif type(p91) == "table" then
		local var99 = getmetatable(p91)
		
		if var99 then
			isNotFunction = type(rawget(var99, "__call")) ~= "function"
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:tap"))
	
	return p90:_andThen(debug.traceback(nil, 2), function(...) --[[ line: 1381 ]]
		-- upvalues: p91 (ref), t_2 (copy), pack (copy)
		local var100 = p91(...)
		
		if t_2.is(var100) then
			local var101, var102 = pack(...)
			
			return var100:andThen(function() --[[ line: 1386 ]]
				-- upvalues: var102 (ref), var101 (ref)
				return unpack(var102, 1, var101)
			end)
		end
		return ...
	end)
end

function t_2.prototype.andThenCall(p92, p93, ...) --[[ line: 1414 ]]
	-- upvalues: pack (ref)
	local isNotFunction
	if type(p93) == "function" then
		isNotFunction = true
	elseif type(p93) == "table" then
		local var104 = getmetatable(p93)
		
		if var104 then
			isNotFunction = type(rawget(var104, "__call")) ~= "function"
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:andThenCall"))
	local var105, var106 = pack(...)
	
	return p92:_andThen(debug.traceback(nil, 2), function() --[[ line: 1417 ]]
		-- upvalues: p93 (ref), var106 (ref), var105 (ref)
		return p93(unpack(var106, 1, var105))
	end)
end

function t_2.prototype.andThenReturn(p94, ...) --[[ line: 1444 ]]
	-- upvalues: pack (ref)
	local var107, var108 = pack(...)
	
	return p94:_andThen(debug.traceback(nil, 2), function() --[[ line: 1446 ]]
		-- upvalues: var108 (ref), var107 (ref)
		return unpack(var108, 1, var107)
	end)
end

function t_2.prototype.cancel(p95) --[[ line: 1462 ]]
	-- upvalues: t_2 (ref)
	if p95._status ~= t_2.Status.Started then return end
	p95._status = t_2.Status.Cancelled
	
	if p95._cancellationHook then
		p95._cancellationHook()
	end
	coroutine.close(p95._thread)
	
	if p95._parent then
		p95._parent:_consumerCancelled(p95)
	end
	for i in pairs(p95._consumers) do
		i:cancel()
	end
	p95:_finalize()
end

function t_2.prototype._consumerCancelled(p96, p97) --[[ line: 1490 ]]
	-- upvalues: t_2 (ref)
	if p96._status ~= t_2.Status.Started then return end
	p96._consumers[p97] = nil
	
	if next(p96._consumers) == nil then
		p96:cancel()
	end
end

function t_2.prototype._finally(p98, p99, p100, p101) --[[ line: 1506 ]]
	-- upvalues: t_2 (ref), runExecutor (ref)
	if not p101 then
		p98._unhandledRejection = false
	end
	return t_2._new(p99, function(p102, p103) --[[ line: 1512 ]]
		-- upvalues: p100 (ref), p99 (ref), runExecutor (copy), p101 (ref), p98 (ref), t_2 (copy)
		local var109 = p102
		
		if p100 then
			local var110 = p99
			local var111 = p100
			
			var109 = function(...) --[[ line: 186 ]]
				-- upvalues: runExecutor (copy), var110 (ref), var111 (ref), p102 (ref), p103 (ref)
				local var20, var21, var22 = runExecutor(var110, var111, ...)
				
				if var20 then
					p102(unpack(var22, 1, var21))
					
					return
				end
				p103(var22[1])
			end
		end
		if p101 then
			local var112 = var109
			
			var109 = function(...) --[[ line: 1520 ]]
				-- upvalues: p98 (copy), t_2 (copy), p102 (ref), var112 (ref)
				return if p98._status == t_2.Status.Rejected then p102(p98) else var112(...)
			end
		end
		if p98._status == t_2.Status.Started then
			table.insert(p98._queuedFinally, var109)
			
			return
		end
		var109(p98._status)
	end, p98)
end

function t_2.prototype.finally(p104, p105) --[[ line: 1588 ]]
	local isNotFunction = true
	
	if p105 ~= nil then
		if type(p105) == "function" then
			isNotFunction = true
		elseif type(p105) == "table" then
			local var114 = getmetatable(p105)
			
			if var114 then
				isNotFunction = type(rawget(var114, "__call")) ~= "function"
			end
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:finally"))
	
	return p104:_finally(debug.traceback(nil, 2), p105)
end

function t_2.prototype.finallyCall(p106, p107, ...) --[[ line: 1602 ]]
	-- upvalues: pack (ref)
	local isNotFunction
	if type(p107) == "function" then
		isNotFunction = true
	elseif type(p107) == "table" then
		local var116 = getmetatable(p107)
		
		if var116 then
			isNotFunction = type(rawget(var116, "__call")) ~= "function"
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:finallyCall"))
	local var117, var118 = pack(...)
	
	return p106:_finally(debug.traceback(nil, 2), function() --[[ line: 1605 ]]
		-- upvalues: p107 (ref), var118 (ref), var117 (ref)
		return p107(unpack(var118, 1, var117))
	end)
end

function t_2.prototype.finallyReturn(p108, ...) --[[ line: 1628 ]]
	-- upvalues: pack (ref)
	local var119, var120 = pack(...)
	
	return p108:_finally(debug.traceback(nil, 2), function() --[[ line: 1630 ]]
		-- upvalues: var120 (ref), var119 (ref)
		return unpack(var120, 1, var119)
	end)
end

function t_2.prototype.done(p109, p110) --[[ line: 1638 ]]
	local isNotFunction = true
	
	if p110 ~= nil then
		if type(p110) == "function" then
			isNotFunction = true
		elseif type(p110) == "table" then
			local var122 = getmetatable(p110)
			
			if var122 then
				isNotFunction = type(rawget(var122, "__call")) ~= "function"
			end
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:done"))
	
	return p109:_finally(debug.traceback(nil, 2), p110, true)
end

function t_2.prototype.doneCall(p111, p112, ...) --[[ line: 1649 ]]
	-- upvalues: pack (ref)
	local isNotFunction
	if type(p112) == "function" then
		isNotFunction = true
	elseif type(p112) == "table" then
		local var124 = getmetatable(p112)
		
		if var124 then
			isNotFunction = type(rawget(var124, "__call")) ~= "function"
		end
	end
	assert(isNotFunction, string.format("Please pass a handler function to %s!", "Promise:doneCall"))
	local var125, var126 = pack(...)
	
	return p111:_finally(debug.traceback(nil, 2), function() --[[ line: 1652 ]]
		-- upvalues: p112 (ref), var126 (ref), var125 (ref)
		return p112(unpack(var126, 1, var125))
	end, true)
end

function t_2.prototype.doneReturn(p113, ...) --[[ line: 1660 ]]
	-- upvalues: pack (ref)
	local var127, var128 = pack(...)
	
	return p113:_finally(debug.traceback(nil, 2), function() --[[ line: 1662 ]]
		-- upvalues: var128 (ref), var127 (ref)
		return unpack(var128, 1, var127)
	end, true)
end

function t_2.prototype.awaitStatus(p114) --[[ line: 1674 ]]
	-- upvalues: t_2 (ref)
	p114._unhandledRejection = false
	
	if p114._status == t_2.Status.Started then
		local currentThread = coroutine.running()
		p114:finally(function() --[[ line: 1680 ]]
			-- upvalues: currentThread (ref)
			task.spawn(currentThread)
		end)
		coroutine.yield()
	end
	if p114._status == t_2.Status.Resolved then
		return p114._status, unpack(p114._values, 1, p114._valuesLength)
	elseif p114._status == t_2.Status.Rejected then
		return p114._status, unpack(p114._values, 1, p114._valuesLength)
	end
	return p114._status
end

awaitHelper = function(p115, ...) --[[ line: 1696 | named "awaitHelper" ]]
	-- upvalues: t_2 (ref)
	return p115 == t_2.Status.Resolved, ...
end

function t_2.prototype.await(p116) --[[ line: 1721 ]]
	-- upvalues: awaitHelper (ref)
	return awaitHelper(p116:awaitStatus())
end

expectHelper = function(p117, ...) --[[ line: 1725 | named "expectHelper" ]]
	-- upvalues: t_2 (ref)
	if p117 ~= t_2.Status.Resolved then
		error(if ... == nil then "Expected Promise rejected with no value." else ..., 3)
	end
	return ...
end

function t_2.prototype.expect(p118) --[[ line: 1758 ]]
	-- upvalues: expectHelper (ref)
	return expectHelper(p118:awaitStatus())
end

t_2.prototype.awaitValue = t_2.prototype.expect

function t_2.prototype._unwrap(p119) --[[ line: 1772 ]]
	-- upvalues: t_2 (ref)
	if p119._status == t_2.Status.Started then
		error("Promise has not resolved or rejected.", 2)
	end
	return p119._status == t_2.Status.Resolved, unpack(p119._values, 1, p119._valuesLength)
end

function t_2.prototype._resolve(p120, ...) --[[ line: 1782 ]]
	-- upvalues: t_2 (ref), t_1 (write), pack (ref)
	if p120._status == t_2.Status.Started then
		if t_2.is(...) then
			if select("#", ...) > 1 then
				warn(string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", p120._source))
			end
			local var130 = ...
			local var131 = var130:andThen(function(...) --[[ line: 1803 ]]
				-- upvalues: p120 (ref)
				p120:_resolve(...)
			end, function(...) --[[ line: 1805 ]]
				-- upvalues: var130 (ref), t_1 (copy), p120 (ref)
				local var134 = if var130._error then t_1.new({
					context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]",
					error = var130._error,
					kind = t_1.Kind.ExecutionError
				}) else var130._values[1]
				
				if t_1.isKind(var134, t_1.Kind.ExecutionError) then
					return p120:_reject(var134:extend({
						error = "This Promise was chained to a Promise that errored.",
						trace = "",
						context = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", p120._source)
					}))
				end
				p120:_reject(...)
			end)
			
			if var131._status == t_2.Status.Cancelled then
				p120:cancel()
				
				return
			elseif var131._status == t_2.Status.Started then
				p120._parent = var131
				var131._consumers[p120] = true
			end
			return
		else
			p120._status = t_2.Status.Resolved
			local var132, var133 = pack(...)
			p120._valuesLength = var132
			p120._values = var133
			
			for i, v in ipairs(p120._queuedResolve) do
				coroutine.wrap(v)(...)
			end
			p120:_finalize()
			
			return
		end
	elseif t_2.is(...) then
		(...):_consumerCancelled(p120)
	end
end

function t_2.prototype._reject(p121, ...) --[[ line: 1853 ]]
	-- upvalues: t_2 (ref), pack (ref)
	if p121._status ~= t_2.Status.Started then return end
	p121._status = t_2.Status.Rejected
	local var135, var136 = pack(...)
	p121._valuesLength = var135
	p121._values = var136
	
	if next(p121._queuedReject) == nil then
		local var137 = tostring(...)
		coroutine.wrap(function() --[[ line: 1875 ]]
			-- upvalues: t_2 (copy), p121 (ref), var137 (ref)
			t_2._timeEvent:Wait()
			
			if not p121._unhandledRejection then return end
			local formattedText = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", var137, p121._source)
			
			for i, v in ipairs(t_2._unhandledRejectionCallbacks) do
				task.spawn(v, p121, unpack(p121._values, 1, p121._valuesLength))
			end
			if t_2.TEST then
				return
			end
			warn(formattedText)
		end)()
	else
		for i, v in ipairs(p121._queuedReject) do
			coroutine.wrap(v)(...)
		end
	end
	p121:_finalize()
end

local t_3 = {}
local var10 = nil

local function closeThreads() --[[ line: 1906 ]]
	-- upvalues: var10 (write), t_3 (write)
	var10 = nil
	t_3 = {}
	
	for i, v in t_3 do
		coroutine.close(v)
	end
end

function t_2.prototype._finalize(p122) --[[ line: 1920 ]]
	-- upvalues: t_2 (ref), status (write), t_3 (write), var10 (write), closeThreads (ref)
	for i, v in ipairs(p122._queuedFinally) do
		coroutine.wrap(v)(p122._status)
	end
	p122._queuedFinally = nil
	p122._queuedReject = nil
	p122._queuedResolve = nil
	
	if not t_2.TEST then
		p122._parent = nil
		p122._consumers = nil
	end
	if status then
		table.insert(t_3, p122._thread)
		
		if var10 then
			return
		else
			var10 = task.defer(closeThreads)
			
			return
		end
	else
		task.defer(coroutine.close, p122._thread)
	end
end

function t_2.prototype.now(p123, p124) --[[ line: 1965 ]]
	-- upvalues: t_2 (ref), t_1 (write)
	local trac = debug.traceback(nil, 2)
	
	return if p123._status == t_2.Status.Resolved then p123:_andThen(trac, function(...) --[[ line: 1968 ]]
		return ...
	end) else t_2.reject(p124 == nil and t_1.new({
		error = "This Promise was not resolved in time for :now()",
		kind = t_1.Kind.NotResolvedInTime,
		context = ":now() was called at:\n\n" .. trac
	}) or p124)
end

function t_2.retry(p125, p126, ...) --[[ line: 2010 ]]
	-- upvalues: t_2 (ref)
	local isNotFunction
	if type(p125) == "function" then
		isNotFunction = true
	elseif type(p125) == "table" then
		local var141 = getmetatable(p125)
		
		if var141 then
			isNotFunction = type(rawget(var141, "__call")) ~= "function"
		end
	end
	assert(isNotFunction, "Parameter #1 to Promise.retry must be a function")
	assert(type(p126) == "number", "Parameter #2 to Promise.retry must be a number")
	local list = { ... }
	local var143 = select("#", ...)
	
	return t_2.resolve(p125(...)):catch(function(...) --[[ line: 2016 ]]
		-- upvalues: p126 (ref), t_2 (copy), p125 (ref), list (ref), var143 (ref)
		return if p126 > 0 then t_2.retry(p125, p126 - 1, unpack(list, 1, var143)) else t_2.reject(...)
	end)
end

function t_2.retryWithDelay(p127, p128, p129, ...) --[[ line: 2038 ]]
	-- upvalues: t_2 (ref)
	local isNotFunction
	if type(p127) == "function" then
		isNotFunction = true
	elseif type(p127) == "table" then
		local var145 = getmetatable(p127)
		
		if var145 then
			isNotFunction = type(rawget(var145, "__call")) ~= "function"
		end
	end
	assert(isNotFunction, "Parameter #1 to Promise.retry must be a function")
	assert(type(p128) == "number", "Parameter #2 (times) to Promise.retry must be a number")
	assert(type(p129) == "number", "Parameter #3 (seconds) to Promise.retry must be a number")
	local list = { ... }
	local var147 = select("#", ...)
	
	return t_2.resolve(p127(...)):catch(function(...) --[[ line: 2045 ]]
		-- upvalues: p128 (ref), t_2 (copy), p129 (ref), p127 (ref), list (ref), var147 (ref)
		if p128 > 0 then
			t_2.delay(p129):await()
			
			return t_2.retryWithDelay(p127, p128 - 1, p129, unpack(list, 1, var147))
		end
		return t_2.reject(...)
	end)
end

function t_2.fromEvent(p130, p131) --[[ line: 2080 ]]
	-- upvalues: t_2 (ref)
	p131 = p131 or function() --[[ line: 2081 ]]
		return true
	end
	
	return t_2._new(debug.traceback(nil, 2), function(p132, _, p133) --[[ line: 2085 ]]
		-- upvalues: p130 (ref), p131 (write)
		local var148 = nil
		local var149 = false
		
		local function disconnect() --[[ line: 2089 ]]
			-- upvalues: var148 (write)
			var148:Disconnect()
			var148 = nil
		end
		
		var148 = p130:Connect(function(...) --[[ line: 2098 ]]
			-- upvalues: p131 (copy), p132 (ref), var148 (write), var149 (write)
			local var151 = p131(...)
			
			if var151 == true then
				p132(...)
				
				if var148 then
					var148:Disconnect()
					var148 = nil
					
					return
				end
				var149 = true
				
				return
			elseif type(var151) ~= "boolean" then
				error("Promise.fromEvent predicate should always return a boolean")
			end
		end)
		p133(disconnect)
	end)
end

function t_2.onUnhandledRejection(p134) --[[ line: 2132 ]]
	-- upvalues: t_2 (ref)
	table.insert(t_2._unhandledRejectionCallbacks, p134)
	
	return function() --[[ line: 2135 ]]
		-- upvalues: t_2 (copy), p134 (ref)
		local index = table.find(t_2._unhandledRejectionCallbacks, p134)
		
		if index then
			table.remove(t_2._unhandledRejectionCallbacks, index)
		end
	end
end

return t_2