local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local promiseModule = require(parent.Promise)
local instanceof = luauPolyfillModule.instanceof
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local setTimeout = luauPolyfillModule.setTimeout
local array = luauPolyfillModule.Array
local symbol = luauPolyfillModule.Symbol
local t = nil
local t_1 = nil
local notifySubscription = nil
local _ = nil

local function _(p1)
	if typeof(p1) == "function" then
		return true
	elseif typeof(p1) == "table" then
		local var1 = getmetatable(p1)
		
		return if var1 and rawget(var1, "__call") then true else p1._isMockFunction
	end
end

local _ = function()
	-- upvalues: symbol (ref)
	return typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function"
end

local _ = function(p1)
	-- upvalues: symbol (ref), boolean (ref)
	return (typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function") and boolean.toJSBoolean(symbol[p1])
end

local _ = function(p1)
	-- upvalues: symbol (ref), boolean (ref)
	return if (typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function") and boolean.toJSBoolean(symbol[p1]) then symbol[p1] else "@@" .. p2
end

if (typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function") and (not (typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function") or not boolean.toJSBoolean(symbol.observable)) then
	symbol.observable = symbol("observable")
end
local _ = if (typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function") and boolean.toJSBoolean(symbol.iterator) then symbol.iterator else "@@iterator"
local var1 = if (typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function") and boolean.toJSBoolean(symbol.observable) then symbol.observable else "@@observable"
local var2 = if (typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function") and boolean.toJSBoolean(symbol.species) then symbol.species else "@@species"

local function getMethod(p1, p2)
	-- upvalues: error (ref)
	local var3
	local var4 = p1[p2]
	
	if var4 == nil then
		return nil
	elseif typeof(var4) == "function" then
		var3 = true
	elseif typeof(var4) == "table" then
		local var5 = getmetatable(var4)
		var3 = if var5 and rawget(var5, "__call") then true elseif var4._isMockFunction then true else false
	end
	if not var3 then
		error(error.new(tostring(var4) .. " is not a function"))
	end
	return var4
end

local _ = function(p1)
	-- upvalues: var2 (ref), t (write)
	local var3 = p1[var2]
	
	return if var3 == nil then t else var3
end

local _ = function(p1)
	-- upvalues: instanceof (ref), t (write)
	return instanceof(p1, t)
end

local tbl = nil
tbl = setmetatable({}, {
	__call = function(_, p1)
		-- upvalues: tbl (write), setTimeout (ref)
		if tbl.log then
			tbl:log(p1)
			
			return
		end
		setTimeout(function()
			-- upvalues: p1 (ref)
			error(p1)
		end, 0)
	end
})

local _ = function(p1)
	-- upvalues: promiseModule (ref), tbl (write)
	promiseModule.delay(0):doneCall(function()
		-- upvalues: p1 (ref), tbl (copy)
		xpcall(p1, function(p2)
			-- upvalues: tbl (copy)
			tbl(p2)
		end)
	end)
end

local function cleanupSubscription(p1)
	-- upvalues: error (ref), tbl (write)
	local cleanup = p1._cleanup
	
	if cleanup == nil then return end
	p1._cleanup = nil
	
	if not cleanup then return end
	local ok, ok_1
	local var3 = true
	local var4 = nil
	
	if typeof(cleanup) == "function" then
		ok = true
	elseif typeof(cleanup) == "table" then
		ok_1 = getmetatable(cleanup)
		ok = if ok_1 and rawget(ok_1, "__call") then true elseif cleanup._isMockFunction then true else false
	end
	if ok then
		ok, ok_1 = pcall(cleanup)
		var3 = ok
		var4 = ok_1
	else
		local var5
		ok_1 = cleanup.unsubscribe
		
		if ok_1 == nil then
			ok = nil
		elseif typeof(ok_1) == "function" then
			var5 = true
		elseif typeof(ok_1) == "table" then
			local var6 = getmetatable(ok_1)
			var5 = if var6 and rawget(var6, "__call") then true elseif ok_1._isMockFunction then true else false
		end
		if not var5 then
			error(error.new(tostring(ok_1) .. " is not a function"))
		end
		ok = ok_1
		if ok then
			ok_1, status_1 = pcall(ok, cleanup)
			var3 = ok_1
			var4 = status_1
		end
	end
	if not var3 then
		tbl(var4)
	end
end

local _ = function(p1)
	p1._observer = nil
	p1._queue = nil
	p1._state = "closed"
end

local function flushSubscription(p1)
	-- upvalues: boolean (ref), notifySubscription (write)
	local queue = p1._queue
	
	if not boolean.toJSBoolean(queue) then return end
	p1._queue = nil
	p1._state = "ready"
	
	for i = 1, #queue do
		notifySubscription(p1, queue[i].type, queue[i].value)
		
		if p1._state == "closed" then break end
	end
end

notifySubscription = function(p2, p3, p4)
	-- upvalues: getMethod (ref), tbl (write), cleanupSubscription (ref)
	p2._state = "running"
	local observer = p2._observer
	local var3 = nil
	local ok, status = pcall(getMethod, observer, p3)
	
	if not ok then
		tbl(status)
		
		return
	elseif p3 == "next" then
		if status then
			local ok_1, status_1 = pcall(status, observer, p4)
			ok = ok_1
			var3 = status_1
		end
	elseif p3 == "error" then
		p2._observer = nil
		p2._queue = nil
		p2._state = "closed"
		
		if status then
			local ok_1, status_1 = pcall(status, observer, p4)
			ok = ok_1
			var3 = status_1
		else
			tbl(p4)
		end
	elseif p3 == "complete" then
		p2._observer = nil
		p2._queue = nil
		p2._state = "closed"
		
		if status then
			local ok_1, status_1 = pcall(status, observer, p4)
			ok = ok_1
			var3 = status_1
		end
	end
	if not ok then
		tbl(var3)
	end
	if p2._state == "closed" then
		cleanupSubscription(p2)
		
		return
	elseif p2._state == "running" then
		p2._state = "ready"
	end
end

local function onNotify(p2, p3, p4)
	-- upvalues: flushSubscription (ref), promiseModule (ref), tbl (write), notifySubscription (write)
	if p2._state == "closed" then return end
	if p2._state == "buffering" then
		assert(p2._queue, "observable subscription queue nil during onNotify")
		table.insert(p2._queue, { type = p3, value = p4 })
		
		return
	elseif p2._state == "ready" then
		notifySubscription(p2, p3, p4)
		
		return
	end
	p2._state = "buffering"
	p2._queue = { { type = p3, value = p4 } }
	
	local var3 = function()
		-- upvalues: flushSubscription (copy), p2 (ref)
		return flushSubscription(p2)
	end
	
	promiseModule.delay(0):doneCall(function()
		-- upvalues: var3 (ref), tbl (copy)
		xpcall(var3, function(p5)
			-- upvalues: tbl (copy)
			tbl(p5)
		end)
	end)
end

local t_2 = {}

function t_2:__index(p2)
	-- upvalues: t_2 (ref)
	return if p2 == "closed" then self._state == "closed" elseif rawget(self, p2) then rawget(self, p2) elseif rawget(t_2, p2) then rawget(t_2, p2) else nil
end

function t_2:__newindex(p2, p3)
	if p2 == "closed" then
		error("setting getter-only property 'closed'")
	end
	rawset(self, p2, p3)
end

function t_2.new(p2, p3)
	-- upvalues: t_2 (ref), t_1 (write)
	local tbl = setmetatable({}, t_2)
	tbl._cleanup = nil
	tbl._observer = p2
	tbl._queue = nil
	tbl._state = "initializing"
	local var3 = t_1.new(tbl)
	local ok, status = pcall(p3, var3)
	
	if ok then
		tbl._cleanup = status
	else
		var3:error(status)
	end
	if tbl._state == "initializing" then
		tbl._state = "ready"
	end
	return tbl
end

function t_2:unsubscribe()
	-- upvalues: cleanupSubscription (ref)
	if self._state ~= "closed" then
		self._observer = nil
		self._queue = nil
		self._state = "closed"
		cleanupSubscription(self)
	end
end

t_1 = {}

function t_1:__index(p2)
	-- upvalues: t_1 (write)
	return if p2 == "closed" then self._subscription._state == "closed" elseif rawget(t_1, p2) then rawget(t_1, p2) else rawget(self, p2)
end

function t_1:__newindex(p2, p3)
	if p2 == "closed" then
		error("setting getter-only property 'closed'")
	end
	rawset(self, p2, p3)
end

function t_1.new(p2)
	-- upvalues: t_1 (write)
	return setmetatable({ _subscription = p2 }, t_1)
end

function t_1:next(p2)
	-- upvalues: onNotify (ref)
	onNotify(self._subscription, "next", p2)
end

function t_1:error(p2)
	-- upvalues: onNotify (ref)
	onNotify(self._subscription, "error", p2)
end

function t_1:complete()
	-- upvalues: onNotify (ref)
	onNotify(self._subscription, "complete")
end

t = {}
t.__index = t

local function isObservableClass(p2)
	-- upvalues: var1 (ref), t (write)
	return typeof(p2) == "table" and (p2[var1] == t[var1] and typeof(rawget(p2, "new")) == "function")
end

function t.new(p2)
	-- upvalues: t (write)
	local var3
	if typeof(p2) == "function" then
		var3 = true
	elseif typeof(p2) == "table" then
		local var4 = getmetatable(p2)
		var3 = if var4 and rawget(var4, "__call") then true elseif p2._isMockFunction then true else false
	end
	if not var3 then
		error("Observable initializer must be a function")
	end
	return setmetatable({ _subscriber = p2 }, t)
end

function t:subscribe(p2, p3, p4)
	-- upvalues: t_2 (ref)
	if typeof(p2) ~= "table" or p2 == nil then
		p2 = { start = nil, next = p2, error = p3, complete = p4 }
	end
	return t_2.new(p2, self._subscriber)
end

function t.forEach(p2, p3)
	-- upvalues: promiseModule (ref), error (ref)
	return promiseModule.new(function(p4, p5)
		-- upvalues: p3 (ref), error (copy), p2 (ref)
		local var3
		local var4 = p3
		
		if typeof(var4) == "function" then
			var3 = true
		elseif typeof(var4) == "table" then
			local var5 = getmetatable(var4)
			var3 = if var5 and rawget(var5, "__call") then true elseif var4._isMockFunction then true else false
		end
		if var3 then
			local var6 = nil
			
			var4 = function()
				-- upvalues: var6 (write), p4 (ref)
				var6:unsubscribe()
				p4()
			end
			
			var6 = p2:subscribe({
				next = function(_, p6)
					-- upvalues: p3 (copy), var4 (ref), p5 (ref), var6 (write)
					local ok, status = pcall(p3, p6, var4)
					
					if not ok then
						p5(status)
						var6:unsubscribe()
					end
				end,
				error = function(_, p6)
					-- upvalues: p5 (ref)
					p5(p6)
				end,
				complete = function(_)
					-- upvalues: p4 (ref)
					p4()
				end
			})
			
			return
		end
		p5(error.new(tostring(p3) .. " is not a function"))
	end)
end

function t:map(p2)
	-- upvalues: error (ref), var2 (ref), t (write)
	local var3, var4
	if typeof(p2) == "function" then
		var3 = true
	elseif typeof(p2) == "table" then
		var4 = getmetatable(p2)
		var3 = if var4 and rawget(var4, "__call") then true elseif p2._isMockFunction then true else false
	end
	if not var3 then
		error(error.new(tostring(p2) .. " is not a function"))
	end
	var4 = self[var2]
	
	return (if var4 ~= nil then t else var4).new(function(p3)
		-- upvalues: self (ref), p2 (ref)
		return self:subscribe({
			next = function(_, p4)
				-- upvalues: p2 (copy), p3 (ref)
				local ok, status = pcall(p2, p4)
				
				if ok then
					p3:next(status)
					
					return
				end
				p3:error(status)
			end,
			error = function(_, p4)
				-- upvalues: p3 (ref)
				p3:error(p4)
			end,
			complete = function(_)
				-- upvalues: p3 (ref)
				p3:complete()
			end
		})
	end)
end

function t:filter(p2)
	-- upvalues: error (ref), var2 (ref), t (write), boolean (ref)
	local var3, var4
	if typeof(p2) == "function" then
		var3 = true
	elseif typeof(p2) == "table" then
		var4 = getmetatable(p2)
		var3 = if var4 and rawget(var4, "__call") then true elseif p2._isMockFunction then true else false
	end
	if not var3 then
		error(error.new(tostring(p2) .. " is not a function"))
	end
	var4 = self[var2]
	
	return (if var4 ~= nil then t else var4).new(function(p3)
		-- upvalues: self (ref), p2 (ref), boolean (copy)
		return self:subscribe({
			next = function(_, p4)
				-- upvalues: p2 (copy), p3 (ref), boolean (copy)
				local ok, status = xpcall(p2, function(p5)
					-- upvalues: p3 (copy)
					p3:error(p5)
				end, p4)
				
				if ok and not boolean.toJSBoolean(status) then return end
				if ok then
					p3:next(p4)
					
					return
				end
			end,
			error = function(_, p4)
				-- upvalues: p3 (ref)
				p3:error(p4)
			end,
			complete = function(_)
				-- upvalues: p3 (ref)
				p3:complete()
			end
		})
	end)
end

function t:reduce(p2, ...)
	-- upvalues: error (ref), var2 (ref), t (write)
	local var3, var4
	local list = { p2, ... }
	
	if typeof(p2) == "function" then
		var3 = true
	elseif typeof(p2) == "table" then
		var4 = getmetatable(p2)
		var3 = if var4 and rawget(var4, "__call") then true elseif p2._isMockFunction then true else false
	end
	if not var3 then
		error(error.new(tostring(p2) .. " is not a function"))
	end
	var4 = self[var2]
	local var5 = if var4 ~= nil then t else var4
	var4 = #list > 1
	local var6 = false
	local var7 = list[2]
	
	return var5.new(function(p3)
		-- upvalues: self (ref), var6 (write), var4 (ref), var7 (write), p2 (ref), error (copy)
		return self:subscribe({
			next = function(_, p4)
				-- upvalues: var6 (copy), var4 (copy), var7 (copy), p2 (copy), p3 (ref)
				local var8 = not var6
				var6 = true
				
				if var8 and not var4 then
					var7 = p4
					
					return
				end
				local var9 = nil
				local ok, status = xpcall(p2, function(p5)
					-- upvalues: p3 (copy)
					p3:error(p5)
				end, var7, p4)
				var7 = status
				var9 = ok
			end,
			error = function(_, p4)
				-- upvalues: p3 (ref)
				p3:error(p4)
			end,
			complete = function(_)
				-- upvalues: var6 (copy), var4 (copy), p3 (ref), error (copy), var7 (copy)
				if not var6 and not var4 then
					p3:error(error.new("Cannot reduce an empty sequence"))
				end
				p3:next(var7)
				p3:complete()
			end
		})
	end)
end

function t:concat(...)
	-- upvalues: var2 (ref), t (write), boolean (ref)
	local list = { ... }
	local var3 = self[var2]
	local var4 = if var3 ~= nil then t else var3
	
	return var4.new(function(p2)
		-- upvalues: list (ref), var4 (ref), self (ref), boolean (copy)
		local var5 = nil
		local var6 = 1
		
		local function startNext(p3)
			-- upvalues: var5 (write), p2 (ref), var6 (write), list (copy), startNext (ref), var4 (copy)
			var5 = p3:subscribe({
				next = function(_, p4)
					-- upvalues: p2 (copy)
					p2:next(p4)
				end,
				error = function(_, p4)
					-- upvalues: p2 (copy)
					p2:error(p4)
				end,
				complete = function(_)
					-- upvalues: var6 (copy), list (copy), var5 (copy), p2 (copy), startNext (copy), var4 (copy)
					if var6 == #list + 1 then
						var5 = nil
						p2:complete()
						
						return
					end
					var6 += 1
					startNext(var4.from(list[var6]))
				end
			})
		end
		
		startNext(self)
		
		return function()
			-- upvalues: boolean (copy), var5 (write)
			if boolean.toJSBoolean(var5) then
				var5:unsubscribe()
				var5 = nil
			end
		end
	end)
end

function t:flatMap(p2)
	-- upvalues: error (ref), var2 (ref), t (write), boolean (ref), array (ref)
	local var3, var4
	local var5 = nil
	
	if typeof(p2) == "function" then
		var3 = true
	elseif typeof(p2) == "table" then
		var4 = getmetatable(p2)
		var3 = if var4 and rawget(var4, "__call") then true elseif p2._isMockFunction then true else false
	end
	if not var3 then
		error(error.new(tostring(p2) .. " is not a function"))
	end
	var4 = self[var2]
	local var6 = if var4 ~= nil then t else var4
	
	return var6.new(function(p3)
		-- upvalues: self (ref), boolean (copy), p2 (ref), var6 (ref), array (copy), var5 (write)
		local t = {}
		local var7 = self:subscribe({
			next = function(_, p4)
				-- upvalues: boolean (copy), p2 (copy), p3 (ref), var6 (copy), array (copy), t (ref), var5 (copy)
				if boolean.toJSBoolean(p2) then
					local _ = nil
					local ok, status = xpcall(p2, function(p5)
						-- upvalues: p3 (copy)
						p3:error(p5)
					end, p4)
					local _ = ok
					p4 = status
				end
				local var8 = nil
				table.insert(t, var6.from(p4):subscribe({
					next = function(_, p5)
						-- upvalues: p3 (copy)
						p3:next(p5)
					end,
					error = function(_, p5)
						-- upvalues: p3 (copy)
						p3:error(p5)
					end,
					complete = function(_)
						-- upvalues: array (copy), t (copy), var8 (write), var5 (copy)
						local var9 = array.indexOf(t, var8)
						
						if var9 >= 1 then
							array.splice(t, var9, 1)
						end
						var5()
					end
				}))
				
				return nil
			end,
			error = function(_, p4)
				-- upvalues: p3 (ref)
				p3:error(p4)
			end,
			complete = function(_)
				-- upvalues: var5 (copy)
				var5()
			end
		})
		
		var5 = function()
			-- upvalues: var7 (ref), t (ref), p3 (ref)
			if var7.closed and #t == 0 then
				p3:complete()
			end
		end
		
		return function()
			-- upvalues: array (copy), t (ref), var7 (ref)
			array.forEach(t, function(p4)
				return p4:unsubscribe()
			end)
			var7:unsubscribe()
		end
	end)
end

t[var1] = function(p2)
	return p2
end

function t.from(p2, p3)
	-- upvalues: isObservableClass (write), t (write), error (ref), var1 (ref), instanceof (ref), array (ref), promiseModule (ref), tbl (write)
	local var3, var4
	local _ = nil
	local _ = nil
	
	if isObservableClass(p2) then
		var3 = p2
		var4 = p3
	else
		var3 = t
		var4 = p2
	end
	if var4 == nil then
		error(error.new(tostring(var4) .. " is not an object"))
	end
	local var5, var6
	local var7 = var4[var1]
	
	if var7 == nil then
		var5 = nil
	elseif typeof(var7) == "function" then
		var6 = true
	elseif typeof(var7) == "table" then
		local var8 = getmetatable(var7)
		var6 = if var8 and rawget(var8, "__call") then true elseif var7._isMockFunction then true else false
	end
	if not var6 then
		error(error.new(tostring(var7) .. " is not a function"))
	end
	var5 = var7
	if var5 then
		local var9 = var5(var4)
		
		return if instanceof(var9, t) and var9.new == var3.new then var9 else var3.new(function(p4)
			-- upvalues: var9 (ref)
			return var9:subscribe(p4)
		end)
	elseif array.isArray(var4) then
		return t.new(function(p4)
			-- upvalues: var4 (write), promiseModule (copy), tbl (copy)
			local var10 = function()
				-- upvalues: p4 (ref), var4 (copy)
				if p4.closed then return end
				for i, v in pairs(var4) do
					p4:next(v)
					
					if p4.closed then return end
				end
				p4:complete()
			end
			
			promiseModule.delay(0):doneCall(function()
				-- upvalues: var10 (ref), tbl (copy)
				xpcall(var10, function(p5)
					-- upvalues: tbl (copy)
					tbl(p5)
				end)
			end)
		end)
	end
	error(error.new(tostring(var4) .. " is not observable"))
end

function t.of(p4, ...)
	-- upvalues: isObservableClass (write), t (write), promiseModule (ref), tbl (write)
	local var10, list
	local _ = nil
	local _ = nil
	
	if isObservableClass(p4) then
		var10 = p4
		list = { ... }
	else
		var10 = t
		list = { p4, ... }
	end
	return var10.new(function(p5)
		-- upvalues: list (write), promiseModule (copy), tbl (copy)
		local var11 = function()
			-- upvalues: p5 (ref), list (copy)
			if p5.closed then return end
			for i, v in ipairs(list) do
				p5:next(v)
				
				if p5.closed then return end
			end
			p5:complete()
		end
		
		promiseModule.delay(0):doneCall(function()
			-- upvalues: var11 (ref), tbl (copy)
			xpcall(var11, function(p6)
				-- upvalues: tbl (copy)
				tbl(p6)
			end)
		end)
	end)
end

if typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function" then
	t[symbol("extensions")] = { symbol = var1, hostReportError = tbl }
end
return { Observable = t }