-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:12 2026 Pacific Standard Time.

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

local function _(p0) --[[ line: 29 | named "isCallable" ]]
	if typeof(p0) == "function" then
		return true
	elseif typeof(p0) == "table" then
		local var14 = getmetatable(p0)
		
		return if var14 and rawget(var14, "__call") then true else p0._isMockFunction
	end
end

local _ = function() --[[ line: 45 | named "hasSymbols" ]]
	-- upvalues: symbol (ref)
	return typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function"
end

local _ = function(p1) --[[ line: 50 | named "hasSymbol" ]]
	-- upvalues: symbol (ref), boolean (ref)
	return (typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function") and boolean.toJSBoolean(symbol[p1])
end

local _ = function(p2) --[[ line: 54 | named "getSymbol" ]]
	-- upvalues: symbol (ref), boolean (ref)
	return if (typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function") and boolean.toJSBoolean(symbol[p2]) then symbol[p2] else "@@" .. p2
end

if (typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function") and (not (typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function") or not boolean.toJSBoolean(symbol.observable)) then
	symbol.observable = symbol("observable")
end
local _ = if (typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function") and boolean.toJSBoolean(symbol.iterator) then symbol.iterator else "@@iterator"
local var5 = if (typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function") and boolean.toJSBoolean(symbol.observable) then symbol.observable else "@@observable"
local var6 = if (typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function") and boolean.toJSBoolean(symbol.species) then symbol.species else "@@species"

local function getMethod(p3, p4) --[[ line: 72 ]]
	-- upvalues: error (ref)
	local var16
	local var15 = p3[p4]
	
	if var15 == nil then
		return nil
	elseif typeof(var15) == "function" then
		var16 = true
	elseif typeof(var15) == "table" then
		local var17 = getmetatable(var15)
		var16 = if var17 and rawget(var17, "__call") then true elseif var15._isMockFunction then true else false
	end
	if not var16 then
		error(error.new(tostring(var15) .. " is not a function"))
	end
	return var15
end

local _ = function(p5) --[[ line: 86 | named "getSpecies" ]]
	-- upvalues: var6 (ref), t (write)
	local var18 = p5[var6]
	
	return if var18 == nil then t else var18
end

local _ = function(p6) --[[ line: 97 | named "isObservable" ]]
	-- upvalues: instanceof (ref), t (write)
	return instanceof(p6, t)
end

local tbl = nil
tbl = setmetatable({}, {
	__call = function(_, p7) --[[ line: 104 ]]
		-- upvalues: tbl (write), setTimeout (ref)
		if tbl.log then
			tbl:log(p7)
			
			return
		end
		setTimeout(function() --[[ line: 108 ]]
			-- upvalues: p7 (ref)
			error(p7)
		end, 0)
	end
})

local _ = function(p8) --[[ line: 116 | named "enqueue" ]]
	-- upvalues: promiseModule (ref), tbl (write)
	promiseModule.delay(0):doneCall(function() --[[ line: 117 ]]
		-- upvalues: p8 (ref), tbl (copy)
		xpcall(p8, function(p9) --[[ line: 118 ]]
			-- upvalues: tbl (copy)
			tbl(p9)
		end)
	end)
end

local function cleanupSubscription(p10) --[[ line: 124 ]]
	-- upvalues: error (ref), tbl (write)
	local cleanup = p10._cleanup
	
	if cleanup == nil then return end
	p10._cleanup = nil
	
	if not cleanup then return end
	local ok, ok_1
	local var19 = true
	local var20 = nil
	
	if typeof(cleanup) == "function" then
		ok = true
	elseif typeof(cleanup) == "table" then
		ok_1 = getmetatable(cleanup)
		ok = if ok_1 and rawget(ok_1, "__call") then true elseif cleanup._isMockFunction then true else false
	end
	if ok then
		ok, ok_1 = pcall(cleanup)
		var19 = ok
		var20 = ok_1
	else
		local var23
		ok_1 = cleanup.unsubscribe
		
		if ok_1 == nil then
			ok = nil
		elseif typeof(ok_1) == "function" then
			var23 = true
		elseif typeof(ok_1) == "table" then
			local var24 = getmetatable(ok_1)
			var23 = if var24 and rawget(var24, "__call") then true elseif ok_1._isMockFunction then true else false
		end
		if not var23 then
			error(error.new(tostring(ok_1) .. " is not a function"))
		end
		ok = ok_1
		if ok then
			ok_1, status_1 = pcall(ok, cleanup)
			var19 = ok_1
			var20 = status_1
		end
	end
	if not var19 then
		tbl(var20)
	end
end

local _ = function(p11) --[[ line: 153 | named "closeSubscription" ]]
	p11._observer = nil
	p11._queue = nil
	p11._state = "closed"
end

local function flushSubscription(p12) --[[ line: 159 ]]
	-- upvalues: boolean (ref), notifySubscription (write)
	local queue = p12._queue
	
	if not boolean.toJSBoolean(queue) then return end
	p12._queue = nil
	p12._state = "ready"
	
	for i = 1, #queue do
		notifySubscription(p12, queue[i].type, queue[i].value)
		
		if p12._state == "closed" then break end
	end
end

notifySubscription = function(p13, p14, p15) --[[ line: 177 | named "notifySubscription" ]]
	-- upvalues: getMethod (ref), tbl (write), cleanupSubscription (ref)
	p13._state = "running"
	local observer = p13._observer
	local var25 = nil
	local ok, status = pcall(getMethod, observer, p14)
	
	if not ok then
		tbl(status)
		
		return
	elseif p14 == "next" then
		if status then
			local ok_1, status_1 = pcall(status, observer, p15)
			ok = ok_1
			var25 = status_1
		end
	elseif p14 == "error" then
		p13._observer = nil
		p13._queue = nil
		p13._state = "closed"
		
		if status then
			local ok_1, status_1 = pcall(status, observer, p15)
			ok = ok_1
			var25 = status_1
		else
			tbl(p15)
		end
	elseif p14 == "complete" then
		p13._observer = nil
		p13._queue = nil
		p13._state = "closed"
		
		if status then
			local ok_1, status_1 = pcall(status, observer, p15)
			ok = ok_1
			var25 = status_1
		end
	end
	if not ok then
		tbl(var25)
	end
	if p13._state == "closed" then
		cleanupSubscription(p13)
		
		return
	elseif p13._state == "running" then
		p13._state = "ready"
	end
end

local function onNotify(p16, p17, p18) --[[ line: 216 ]]
	-- upvalues: flushSubscription (ref), promiseModule (ref), tbl (write), notifySubscription (write)
	if p16._state == "closed" then return end
	if p16._state == "buffering" then
		assert(p16._queue, "observable subscription queue nil during onNotify")
		table.insert(p16._queue, { type = p17, value = p18 })
		
		return
	elseif p16._state == "ready" then
		notifySubscription(p16, p17, p18)
		
		return
	end
	p16._state = "buffering"
	p16._queue = { { type = p17, value = p18 } }
	
	local var26 = function() --[[ line: 230 ]]
		-- upvalues: flushSubscription (copy), p16 (ref)
		return flushSubscription(p16)
	end
	
	promiseModule.delay(0):doneCall(function() --[[ line: 117 ]]
		-- upvalues: var26 (ref), tbl (copy)
		xpcall(var26, function(p19) --[[ line: 118 ]]
			-- upvalues: tbl (copy)
			tbl(p19)
		end)
	end)
end

local t_2 = {}

function t_2:__index(p20) --[[ line: 259 ]]
	-- upvalues: t_2 (ref)
	return if p20 == "closed" then self._state == "closed" elseif rawget(self, p20) then rawget(self, p20) elseif rawget(t_2, p20) then rawget(t_2, p20) else nil
end

function t_2:__newindex(p21, p22) --[[ line: 271 ]]
	if p21 == "closed" then
		error("setting getter-only property 'closed'")
	end
	rawset(self, p21, p22)
end

function t_2.new(p23, p24) --[[ line: 278 ]]
	-- upvalues: t_2 (ref), t_1 (write)
	local tbl = setmetatable({}, t_2)
	tbl._cleanup = nil
	tbl._observer = p23
	tbl._queue = nil
	tbl._state = "initializing"
	local var28 = t_1.new(tbl)
	local ok, status = pcall(p24, var28)
	
	if ok then
		tbl._cleanup = status
	else
		var28:error(status)
	end
	if tbl._state == "initializing" then
		tbl._state = "ready"
	end
	return tbl
end

function t_2:unsubscribe() --[[ line: 304 ]]
	-- upvalues: cleanupSubscription (ref)
	if self._state ~= "closed" then
		self._observer = nil
		self._queue = nil
		self._state = "closed"
		cleanupSubscription(self)
	end
end

t_1 = {}

function t_1:__index(p25) --[[ line: 320 ]]
	-- upvalues: t_1 (write)
	return if p25 == "closed" then self._subscription._state == "closed" elseif rawget(t_1, p25) then rawget(t_1, p25) else rawget(self, p25)
end

function t_1:__newindex(p26, p27) --[[ line: 329 ]]
	if p26 == "closed" then
		error("setting getter-only property 'closed'")
	end
	rawset(self, p26, p27)
end

function t_1.new(p28) --[[ line: 336 ]]
	-- upvalues: t_1 (write)
	return setmetatable({ _subscription = p28 }, t_1)
end

function t_1:next(p29) --[[ line: 345 ]]
	-- upvalues: onNotify (ref)
	onNotify(self._subscription, "next", p29)
end

function t_1:error(p30) --[[ line: 349 ]]
	-- upvalues: onNotify (ref)
	onNotify(self._subscription, "error", p30)
end

function t_1:complete() --[[ line: 353 ]]
	-- upvalues: onNotify (ref)
	onNotify(self._subscription, "complete")
end

t = {}
t.__index = t

local function isObservableClass(p31) --[[ line: 413 ]]
	-- upvalues: var5 (ref), t (write)
	return typeof(p31) == "table" and (p31[var5] == t[var5] and typeof(rawget(p31, "new")) == "function")
end

function t.new(p32) --[[ line: 419 ]]
	-- upvalues: t (write)
	local var29
	if typeof(p32) == "function" then
		var29 = true
	elseif typeof(p32) == "table" then
		local var30 = getmetatable(p32)
		var29 = if var30 and rawget(var30, "__call") then true elseif p32._isMockFunction then true else false
	end
	if not var29 then
		error("Observable initializer must be a function")
	end
	return setmetatable({ _subscriber = p32 }, t)
end

function t:subscribe(p33, p34, p35) --[[ line: 437 ]]
	-- upvalues: t_2 (ref)
	if typeof(p33) ~= "table" or p33 == nil then
		p33 = { start = nil, next = p33, error = p34, complete = p35 }
	end
	return t_2.new(p33, self._subscriber)
end

function t.forEach(p36, p37) --[[ line: 455 ]]
	-- upvalues: promiseModule (ref), error (ref)
	return promiseModule.new(function(p38, p39) --[[ line: 456 ]]
		-- upvalues: p37 (ref), error (copy), p36 (ref)
		local var32
		local var31 = p37
		
		if typeof(var31) == "function" then
			var32 = true
		elseif typeof(var31) == "table" then
			local var33 = getmetatable(var31)
			var32 = if var33 and rawget(var33, "__call") then true elseif var31._isMockFunction then true else false
		end
		if var32 then
			local var34 = nil
			
			var31 = function() --[[ line: 466 | named "done" ]]
				-- upvalues: var34 (write), p38 (ref)
				var34:unsubscribe()
				p38()
			end
			
			var34 = p36:subscribe({
				next = function(_, p40) --[[ line: 472 ]]
					-- upvalues: p37 (copy), var31 (ref), p39 (ref), var34 (write)
					local ok, status = pcall(p37, p40, var31)
					
					if not ok then
						p39(status)
						var34:unsubscribe()
					end
				end,
				error = function(_, p41) --[[ line: 481 ]]
					-- upvalues: p39 (ref)
					p39(p41)
				end,
				complete = function(_) --[[ line: 484 ]]
					-- upvalues: p38 (ref)
					p38()
				end
			})
			
			return
		end
		p39(error.new(tostring(p37) .. " is not a function"))
	end)
end

function t:map(p42) --[[ line: 492 ]]
	-- upvalues: error (ref), var6 (ref), t (write)
	local var35, var36
	if typeof(p42) == "function" then
		var35 = true
	elseif typeof(p42) == "table" then
		var36 = getmetatable(p42)
		var35 = if var36 and rawget(var36, "__call") then true elseif p42._isMockFunction then true else false
	end
	if not var35 then
		error(error.new(tostring(p42) .. " is not a function"))
	end
	var36 = self[var6]
	
	return (if var36 ~= nil then t else var36).new(function(p43) --[[ line: 501 ]]
		-- upvalues: self (ref), p42 (ref)
		return self:subscribe({
			next = function(_, p44) --[[ line: 503 ]]
				-- upvalues: p42 (copy), p43 (ref)
				local ok, status = pcall(p42, p44)
				
				if ok then
					p43:next(status)
					
					return
				end
				p43:error(status)
			end,
			error = function(_, p45) --[[ line: 514 ]]
				-- upvalues: p43 (ref)
				p43:error(p45)
			end,
			complete = function(_) --[[ line: 517 ]]
				-- upvalues: p43 (ref)
				p43:complete()
			end
		})
	end)
end

function t:filter(p46) --[[ line: 526 ]]
	-- upvalues: error (ref), var6 (ref), t (write), boolean (ref)
	local var37, var38
	if typeof(p46) == "function" then
		var37 = true
	elseif typeof(p46) == "table" then
		var38 = getmetatable(p46)
		var37 = if var38 and rawget(var38, "__call") then true elseif p46._isMockFunction then true else false
	end
	if not var37 then
		error(error.new(tostring(p46) .. " is not a function"))
	end
	var38 = self[var6]
	
	return (if var38 ~= nil then t else var38).new(function(p47) --[[ line: 535 ]]
		-- upvalues: self (ref), p46 (ref), boolean (copy)
		return self:subscribe({
			next = function(_, p48) --[[ line: 537 ]]
				-- upvalues: p46 (copy), p47 (ref), boolean (copy)
				local ok, status = xpcall(p46, function(p49) --[[ line: 539 ]]
					-- upvalues: p47 (copy)
					p47:error(p49)
				end, p48)
				
				if ok and not boolean.toJSBoolean(status) then return end
				if ok then
					p47:next(p48)
					
					return
				end
			end,
			error = function(_, p50) --[[ line: 552 ]]
				-- upvalues: p47 (ref)
				p47:error(p50)
			end,
			complete = function(_) --[[ line: 555 ]]
				-- upvalues: p47 (ref)
				p47:complete()
			end
		})
	end)
end

function t:reduce(p51, ...) --[[ line: 562 ]]
	-- upvalues: error (ref), var6 (ref), t (write)
	local var40, var41
	local list = { p51, ... }
	
	if typeof(p51) == "function" then
		var40 = true
	elseif typeof(p51) == "table" then
		var41 = getmetatable(p51)
		var40 = if var41 and rawget(var41, "__call") then true elseif p51._isMockFunction then true else false
	end
	if not var40 then
		error(error.new(tostring(p51) .. " is not a function"))
	end
	var41 = self[var6]
	local var42 = if var41 ~= nil then t else var41
	var41 = #list > 1
	local var43 = false
	local var44 = list[2]
	
	return var42.new(function(p52) --[[ line: 577 ]]
		-- upvalues: self (ref), var43 (write), var41 (ref), var44 (write), p51 (ref), error (copy)
		return self:subscribe({
			next = function(_, p53) --[[ line: 579 ]]
				-- upvalues: var43 (copy), var41 (copy), var44 (copy), p51 (copy), p52 (ref)
				local var45 = not var43
				var43 = true
				
				if var45 and not var41 then
					var44 = p53
					
					return
				end
				local var46 = nil
				local ok, status = xpcall(p51, function(p54) --[[ line: 585 ]]
					-- upvalues: p52 (copy)
					p52:error(p54)
				end, var44, p53)
				var44 = status
				var46 = ok
			end,
			error = function(_, p55) --[[ line: 593 ]]
				-- upvalues: p52 (ref)
				p52:error(p55)
			end,
			complete = function(_) --[[ line: 596 ]]
				-- upvalues: var43 (copy), var41 (copy), p52 (ref), error (copy), var44 (copy)
				if not var43 and not var41 then
					p52:error(error.new("Cannot reduce an empty sequence"))
				end
				p52:next(var44)
				p52:complete()
			end
		})
	end)
end

function t:concat(...) --[[ line: 609 ]]
	-- upvalues: var6 (ref), t (write), boolean (ref)
	local list = { ... }
	local var48 = self[var6]
	local var49 = if var48 ~= nil then t else var48
	
	return var49.new(function(p56) --[[ line: 614 ]]
		-- upvalues: list (ref), var49 (ref), self (ref), boolean (copy)
		local var50 = nil
		local var51 = 1
		
		local function startNext(p57) --[[ line: 617 ]]
			-- upvalues: var50 (write), p56 (ref), var51 (write), list (copy), startNext (ref), var49 (copy)
			var50 = p57:subscribe({
				next = function(_, p58) --[[ line: 619 ]]
					-- upvalues: p56 (copy)
					p56:next(p58)
				end,
				error = function(_, p59) --[[ line: 622 ]]
					-- upvalues: p56 (copy)
					p56:error(p59)
				end,
				complete = function(_) --[[ line: 625 ]]
					-- upvalues: var51 (copy), list (copy), var50 (copy), p56 (copy), startNext (copy), var49 (copy)
					if var51 == #list + 1 then
						var50 = nil
						p56:complete()
						
						return
					end
					var51 += 1
					startNext(var49.from(list[var51]))
				end
			})
		end
		
		startNext(self)
		
		return function() --[[ line: 644 ]]
			-- upvalues: boolean (copy), var50 (write)
			if boolean.toJSBoolean(var50) then
				var50:unsubscribe()
				var50 = nil
			end
		end
	end)
end

function t:flatMap(p60) --[[ line: 654 ]]
	-- upvalues: error (ref), var6 (ref), t (write), boolean (ref), array (ref)
	local var54, var55
	local var53 = nil
	
	if typeof(p60) == "function" then
		var54 = true
	elseif typeof(p60) == "table" then
		var55 = getmetatable(p60)
		var54 = if var55 and rawget(var55, "__call") then true elseif p60._isMockFunction then true else false
	end
	if not var54 then
		error(error.new(tostring(p60) .. " is not a function"))
	end
	var55 = self[var6]
	local var56 = if var55 ~= nil then t else var55
	
	return var56.new(function(p61) --[[ line: 665 ]]
		-- upvalues: self (ref), boolean (copy), p60 (ref), var56 (ref), array (copy), var53 (write)
		local t = {}
		local var58 = self:subscribe({
			next = function(_, p62) --[[ line: 668 ]]
				-- upvalues: boolean (copy), p60 (copy), p61 (ref), var56 (copy), array (copy), t (ref), var53 (copy)
				if boolean.toJSBoolean(p60) then
					local _ = nil
					local ok, status = xpcall(p60, function(p63) --[[ line: 672 ]]
						-- upvalues: p61 (copy)
						p61:error(p63)
					end, p62)
					local _ = ok
					p62 = status
				end
				local var59 = nil
				table.insert(t, var56.from(p62):subscribe({
					next = function(_, p64) --[[ line: 680 ]]
						-- upvalues: p61 (copy)
						p61:next(p64)
					end,
					error = function(_, p65) --[[ line: 683 ]]
						-- upvalues: p61 (copy)
						p61:error(p65)
					end,
					complete = function(_) --[[ line: 686 ]]
						-- upvalues: array (copy), t (copy), var59 (write), var53 (copy)
						local var60 = array.indexOf(t, var59)
						
						if var60 >= 1 then
							array.splice(t, var60, 1)
						end
						var53()
					end
				}))
				
				return nil
			end,
			error = function(_, p66) --[[ line: 701 ]]
				-- upvalues: p61 (ref)
				p61:error(p66)
			end,
			complete = function(_) --[[ line: 704 ]]
				-- upvalues: var53 (copy)
				var53()
			end
		})
		
		var53 = function() --[[ line: 709 | named "completeIfDone" ]]
			-- upvalues: var58 (ref), t (ref), p61 (ref)
			if var58.closed and #t == 0 then
				p61:complete()
			end
		end
		
		return function() --[[ line: 715 ]]
			-- upvalues: array (copy), t (ref), var58 (ref)
			array.forEach(t, function(p67) --[[ line: 716 ]]
				return p67:unsubscribe()
			end)
			var58:unsubscribe()
		end
	end)
end

t[var5] = function(p68) --[[ line: 724 ]]
	return p68
end

function t.from(p69, p70) --[[ line: 729 ]]
	-- upvalues: isObservableClass (write), t (write), error (ref), var5 (ref), instanceof (ref), array (ref), promiseModule (ref), tbl (write)
	local var61, var62
	local _ = nil
	local _ = nil
	
	if isObservableClass(p69) then
		var61 = p69
		var62 = p70
	else
		var61 = t
		var62 = p69
	end
	if var62 == nil then
		error(error.new(tostring(var62) .. " is not an object"))
	end
	local var64, var65
	local var63 = var62[var5]
	
	if var63 == nil then
		var64 = nil
	elseif typeof(var63) == "function" then
		var65 = true
	elseif typeof(var63) == "table" then
		local var66 = getmetatable(var63)
		var65 = if var66 and rawget(var66, "__call") then true elseif var63._isMockFunction then true else false
	end
	if not var65 then
		error(error.new(tostring(var63) .. " is not a function"))
	end
	var64 = var63
	if var64 then
		local var67 = var64(var62)
		
		return if instanceof(var67, t) and var67.new == var61.new then var67 else var61.new(function(p71) --[[ line: 758 ]]
			-- upvalues: var67 (ref)
			return var67:subscribe(p71)
		end)
	elseif array.isArray(var62) then
		return t.new(function(p72) --[[ line: 780 ]]
			-- upvalues: var62 (write), promiseModule (copy), tbl (copy)
			local var68 = function() --[[ line: 781 ]]
				-- upvalues: p72 (ref), var62 (copy)
				if p72.closed then return end
				for i, v in pairs(var62) do
					p72:next(v)
					
					if p72.closed then return end
				end
				p72:complete()
			end
			
			promiseModule.delay(0):doneCall(function() --[[ line: 117 ]]
				-- upvalues: var68 (ref), tbl (copy)
				xpcall(var68, function(p73) --[[ line: 118 ]]
					-- upvalues: tbl (copy)
					tbl(p73)
				end)
			end)
		end)
	end
	error(error.new(tostring(var62) .. " is not observable"))
end

function t.of(p74, ...) --[[ line: 803 ]]
	-- upvalues: isObservableClass (write), t (write), promiseModule (ref), tbl (write)
	local var69, list
	local _ = nil
	local _ = nil
	
	if isObservableClass(p74) then
		var69 = p74
		list = { ... }
	else
		var69 = t
		list = { p74, ... }
	end
	return var69.new(function(p75) --[[ line: 813 ]]
		-- upvalues: list (write), promiseModule (copy), tbl (copy)
		local var71 = function() --[[ line: 814 ]]
			-- upvalues: p75 (ref), list (copy)
			if p75.closed then return end
			for i, v in ipairs(list) do
				p75:next(v)
				
				if p75.closed then return end
			end
			p75:complete()
		end
		
		promiseModule.delay(0):doneCall(function() --[[ line: 117 ]]
			-- upvalues: var71 (ref), tbl (copy)
			xpcall(var71, function(p76) --[[ line: 118 ]]
				-- upvalues: tbl (copy)
				tbl(p76)
			end)
		end)
	end)
end

if typeof(symbol) == "table" and typeof(getmetatable(symbol).__call) == "function" then
	t[symbol("extensions")] = { symbol = var5, hostReportError = tbl }
end
return { Observable = t }