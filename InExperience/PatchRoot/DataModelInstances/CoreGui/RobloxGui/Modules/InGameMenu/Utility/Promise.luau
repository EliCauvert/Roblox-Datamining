local function pack(...)
	return select("#", ...), { ... }
end

local function wpcallPacked(p1, ...)
	-- upvalues: pack (ref)
	local var1, var2 = pack(...)
	local var3, var4 = pack(xpcall(function()
		-- upvalues: p1 (ref), var2 (ref), var1 (ref)
		return p1(unpack(var2, 1, var1))
	end, debug.traceback))
	
	return var3, var4
end

local function _(p1, p2, p3)
	-- upvalues: wpcallPacked (ref)
	return function(...)
		-- upvalues: wpcallPacked (copy), p1 (ref), p2 (ref), p3 (ref)
		local var1, var2 = wpcallPacked(p1, ...)
		
		if var2[1] then
			p2(unpack(var2, 2, var1))
			
			return
		end
		p3(unpack(var2, 2, var1))
	end
end

local _ = function(p1)
	return next(p1) == nil
end

local _ = function(p1)
	assert(type(p1) == "string", "createSymbol requires `name` to be a string.")
	local var1 = newproxy(true)
	
	getmetatable(var1).__tostring = function()
		-- upvalues: p1 (ref)
		return ("Symbol(%s)"):format(p1)
	end
	
	return var1
end

assert(true, "createSymbol requires `name` to be a string.")
local var1 = newproxy(true)
local var2 = "PromiseMarker"

getmetatable(var1).__tostring = function()
	-- upvalues: var2 (ref)
	return ("Symbol(%s)"):format(var2)
end

local t = { prototype = {} }
t.__index = t.prototype
local t_1 = {}
assert(true, "createSymbol requires `name` to be a string.")
local var3 = newproxy(true)
local var4 = "Started"

getmetatable(var3).__tostring = function()
	-- upvalues: var4 (ref)
	return ("Symbol(%s)"):format(var4)
end

t_1.Started = var3
assert(true, "createSymbol requires `name` to be a string.")
local var5 = newproxy(true)
local var6 = "Resolved"

getmetatable(var5).__tostring = function()
	-- upvalues: var6 (ref)
	return ("Symbol(%s)"):format(var6)
end

t_1.Resolved = var5
assert(true, "createSymbol requires `name` to be a string.")
local var7 = newproxy(true)
local var8 = "Rejected"

getmetatable(var7).__tostring = function()
	-- upvalues: var8 (ref)
	return ("Symbol(%s)"):format(var8)
end

t_1.Rejected = var7
t.Status = t_1

function t.new(p1)
	-- upvalues: var1 (ref), t (ref), wpcallPacked (ref)
	local t_1 = {
		_source = debug.traceback(),
		[var1] = true,
		_status = t.Status.Started,
		_values = nil,
		_valuesLength = -1,
		_unhandledRejection = false,
		_queuedResolve = {},
		_queuedReject = {}
	}
	setmetatable(t_1, t)
	
	local function reject(...)
		-- upvalues: t_1 (ref)
		t_1:_reject(...)
	end
	
	local _, var9 = wpcallPacked(p1, function(...)
		-- upvalues: t_1 (ref)
		t_1:_resolve(...)
	end, reject)
	local var10 = var9[2]
	
	if not var9[1] and t_1._status == t.Status.Started then
		reject(var10)
	end
	return t_1
end

function t.resolve(p1)
	-- upvalues: t (ref)
	return t.new(function(p2)
		-- upvalues: p1 (ref)
		p2(p1)
	end)
end

function t.reject(p1)
	-- upvalues: t (ref)
	return t.new(function(_, p2)
		-- upvalues: p1 (ref)
		p2(p1)
	end)
end

function t:all()
	-- upvalues: t (ref)
	if type(self) ~= "table" then
		error("Please pass a list of promises to Promise.all", 2)
	end
	if #self == 0 then
		return t.resolve({})
	end
	for i = 1, #self do
		if not t.is(self[i]) then
			error(("Non-promise value passed into Promise.all at index #%d"):format(i), 2)
		end
	end
	return t.new(function(p1, p2)
		-- upvalues: self (ref)
		local t = {}
		local var9 = 0
		
		local function resolveOne(p3, ...)
			-- upvalues: t (ref), var9 (write), self (copy), p1 (ref)
			t[p3] = ...
			var24 += 1
			
			if var9 == #self then
				p1(t)
			end
		end
		
		for i = 1, #self do
			self[i]:andThen(function(...)
				-- upvalues: resolveOne (ref), i (ref)
				resolveOne(i, ...)
			end, function(...)
				-- upvalues: p2 (ref)
				p2(...)
			end)
		end
	end)
end

function t:is()
	-- upvalues: var1 (ref)
	return type(self) == "table" and self[var1] == true
end

function t.prototype.getStatus(p1)
	return p1._status
end

function t.prototype.andThen(p1, p2, p3)
	-- upvalues: t (ref), wpcallPacked (ref)
	p1._unhandledRejection = false
	
	return t.new(function(p4, p5)
		-- upvalues: p2 (ref), wpcallPacked (copy), p3 (ref), p1 (ref), t (copy)
		local var9 = p4
		
		if p2 then
			local var10 = p2
			
			var9 = function(...)
				-- upvalues: wpcallPacked (copy), var10 (ref), p4 (ref), p5 (ref)
				local var11, var12 = wpcallPacked(var10, ...)
				
				if var12[1] then
					p4(unpack(var12, 2, var11))
					
					return
				end
				p5(unpack(var12, 2, var11))
			end
		end
		local var11 = p5
		
		if p3 then
			local var12 = p3
			
			var11 = function(...)
				-- upvalues: wpcallPacked (copy), var12 (ref), p4 (ref), p5 (ref)
				local var13, var14 = wpcallPacked(var12, ...)
				
				if var14[1] then
					p4(unpack(var14, 2, var13))
					
					return
				end
				p5(unpack(var14, 2, var13))
			end
		end
		if p1._status == t.Status.Started then
			table.insert(p1._queuedResolve, var9)
			table.insert(p1._queuedReject, var11)
			
			return
		elseif p1._status == t.Status.Resolved then
			var9(unpack(p1._values, 1, p1._valuesLength))
			
			return
		elseif p1._status == t.Status.Rejected then
			var11(unpack(p1._values, 1, p1._valuesLength))
		end
	end)
end

function t.prototype.catch(p1, p2)
	return p1:andThen(nil, p2)
end

function t.prototype.await(p1)
	-- upvalues: t (ref), pack (ref)
	p1._unhandledRejection = false
	
	if p1._status == t.Status.Started then
		local var9 = nil
		local var10 = nil
		local bindableEvent = Instance.new("BindableEvent")
		p1:andThen(function(...)
			-- upvalues: var10 (write), var9 (write), pack (copy), bindableEvent (ref)
			local var11, var12 = pack(...)
			var10 = var11
			var9 = var12
			bindableEvent:Fire(true)
		end, function(...)
			-- upvalues: var10 (write), var9 (write), pack (copy), bindableEvent (ref)
			local var11, var12 = pack(...)
			var10 = var11
			var9 = var12
			bindableEvent:Fire(false)
		end)
		local var11 = bindableEvent.Event:Wait()
		bindableEvent:Destroy()
		
		return var11, unpack(var9, 1, var10)
	elseif p1._status == t.Status.Resolved then
		return true, unpack(p1._values, 1, p1._valuesLength)
	elseif p1._status == t.Status.Rejected then
		return false, unpack(p1._values, 1, p1._valuesLength)
	end
	error("Promise had an invalid status.")
end

function t.prototype._unwrap(p1)
	-- upvalues: t (ref)
	if p1._status == t.Status.Started then
		error("Promise has not resolved or rejected.", 2)
	end
	return p1._status == t.Status.Resolved, unpack(p1._values, 1, p1._valuesLength)
end

function t.prototype._resolve(p1, ...)
	-- upvalues: t (ref), pack (ref)
	if p1._status ~= t.Status.Started then return end
	if t.is(...) then
		if select("#", ...) > 1 then
			warn(("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s"):format(p1._source))
		end;
		(...):andThen(function(...)
			-- upvalues: p1 (ref)
			p1:_resolve(...)
		end, function(...)
			-- upvalues: p1 (ref)
			p1:_reject(...)
		end)
		
		return
	else
		p1._status = t.Status.Resolved
		local var9, var10 = pack(...)
		p1._valuesLength = var9
		p1._values = var10
		
		for i, v in ipairs(p1._queuedResolve) do
			v(...)
		end
	end
end

function t.prototype._reject(p2, ...)
	-- upvalues: t (ref), pack (ref)
	if p2._status ~= t.Status.Started then return end
	p2._status = t.Status.Rejected
	local var11, var12 = pack(...)
	p2._valuesLength = var11
	p2._values = var12
	
	if next(p2._queuedReject) == nil then
		p2._unhandledRejection = true
		local var13 = tostring(...)
		spawn(function()
			-- upvalues: p2 (ref), var13 (ref)
			if p2._unhandledRejection then
				warn(("Unhandled promise rejection:\n\n%s\n\n%s"):format(var13, p2._source))
				
				return
			end
		end)
		
		return
	end
	for i, v in ipairs(p2._queuedReject) do
		v(...)
	end
end

return t