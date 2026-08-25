local function pack(...)
	return select("#", ...), { ... }
end

local function wpcallPacked(p0, ...)
	-- upvalues: pack (ref)
	local var12, var13 = pack(...)
	local var14, var15 = pack(xpcall(function()
		-- upvalues: p0 (ref), var13 (ref), var12 (ref)
		return p0(unpack(var13, 1, var12))
	end, debug.traceback))
	
	return var14, var15
end

local function _(p1, p2, p3)
	-- upvalues: wpcallPacked (ref)
	return function(...)
		-- upvalues: wpcallPacked (copy), p1 (ref), p2 (ref), p3 (ref)
		local var16, var17 = wpcallPacked(p1, ...)
		
		if var17[1] then
			p2(unpack(var17, 2, var16))
			
			return
		end
		p3(unpack(var17, 2, var16))
	end
end

local _ = function(p4)
	return next(p4) == nil
end

local _ = function(p5)
	assert(type(p5) == "string", "createSymbol requires `name` to be a string.")
	local var18 = newproxy(true)
	
	getmetatable(var18).__tostring = function()
		-- upvalues: p5 (ref)
		return ("Symbol(%s)"):format(p5)
	end
	
	return var18
end

assert(true, "createSymbol requires `name` to be a string.")
local var2 = newproxy(true)
local var3 = "PromiseMarker"

getmetatable(var2).__tostring = function()
	-- upvalues: var3 (ref)
	return ("Symbol(%s)"):format(var3)
end

local t = { prototype = {} }
t.__index = t.prototype
local t_1 = {}
assert(true, "createSymbol requires `name` to be a string.")
local var6 = newproxy(true)
local var7 = "Started"

getmetatable(var6).__tostring = function()
	-- upvalues: var7 (ref)
	return ("Symbol(%s)"):format(var7)
end

t_1.Started = var6
assert(true, "createSymbol requires `name` to be a string.")
local var8 = newproxy(true)
local var9 = "Resolved"

getmetatable(var8).__tostring = function()
	-- upvalues: var9 (ref)
	return ("Symbol(%s)"):format(var9)
end

t_1.Resolved = var8
assert(true, "createSymbol requires `name` to be a string.")
local var10 = newproxy(true)
local var11 = "Rejected"

getmetatable(var10).__tostring = function()
	-- upvalues: var11 (ref)
	return ("Symbol(%s)"):format(var11)
end

t_1.Rejected = var10
t.Status = t_1

function t.new(p6)
	-- upvalues: var2 (ref), t (ref), wpcallPacked (ref)
	local t_1 = {
		_source = debug.traceback(),
		[var2] = true,
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
	
	local _, var21 = wpcallPacked(p6, function(...)
		-- upvalues: t_1 (ref)
		t_1:_resolve(...)
	end, reject)
	local var22 = var21[2]
	
	if not var21[1] and t_1._status == t.Status.Started then
		reject(var22)
	end
	return t_1
end

function t.resolve(p7)
	-- upvalues: t (ref)
	return t.new(function(p8)
		-- upvalues: p7 (ref)
		p8(p7)
	end)
end

function t.reject(p9)
	-- upvalues: t (ref)
	return t.new(function(_, p10)
		-- upvalues: p9 (ref)
		p10(p9)
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
	return t.new(function(p11, p12)
		-- upvalues: self (ref)
		local t = {}
		local var24 = 0
		
		local function resolveOne(p13, ...)
			-- upvalues: t (ref), var24 (write), self (copy), p11 (ref)
			t[p13] = ...
			var24 += 1
			
			if var24 == #self then
				p11(t)
			end
		end
		
		for i = 1, #self do
			self[i]:andThen(function(...)
				-- upvalues: resolveOne (ref), i (ref)
				resolveOne(i, ...)
			end, function(...)
				-- upvalues: p12 (ref)
				p12(...)
			end)
		end
	end)
end

function t:is()
	-- upvalues: var2 (ref)
	return type(self) == "table" and self[var2] == true
end

function t.prototype.getStatus(p14)
	return p14._status
end

function t.prototype.andThen(p15, p16, p17)
	-- upvalues: t (ref), wpcallPacked (ref)
	p15._unhandledRejection = false
	
	return t.new(function(p18, p19)
		-- upvalues: p16 (ref), wpcallPacked (copy), p17 (ref), p15 (ref), t (copy)
		local var26 = p18
		
		if p16 then
			local var27 = p16
			
			var26 = function(...)
				-- upvalues: wpcallPacked (copy), var27 (ref), p18 (ref), p19 (ref)
				local var16, var17 = wpcallPacked(var27, ...)
				
				if var17[1] then
					p18(unpack(var17, 2, var16))
					
					return
				end
				p19(unpack(var17, 2, var16))
			end
		end
		local var28 = p19
		
		if p17 then
			local var29 = p17
			
			var28 = function(...)
				-- upvalues: wpcallPacked (copy), var29 (ref), p18 (ref), p19 (ref)
				local var16, var17 = wpcallPacked(var29, ...)
				
				if var17[1] then
					p18(unpack(var17, 2, var16))
					
					return
				end
				p19(unpack(var17, 2, var16))
			end
		end
		if p15._status == t.Status.Started then
			table.insert(p15._queuedResolve, var26)
			table.insert(p15._queuedReject, var28)
			
			return
		elseif p15._status == t.Status.Resolved then
			var26(unpack(p15._values, 1, p15._valuesLength))
			
			return
		elseif p15._status == t.Status.Rejected then
			var28(unpack(p15._values, 1, p15._valuesLength))
		end
	end)
end

function t.prototype.catch(p20, p21)
	return p20:andThen(nil, p21)
end

function t.prototype.await(p22)
	-- upvalues: t (ref), pack (ref)
	p22._unhandledRejection = false
	
	if p22._status == t.Status.Started then
		local var30 = nil
		local var31 = nil
		local bindableEvent = Instance.new("BindableEvent")
		p22:andThen(function(...)
			-- upvalues: var31 (write), var30 (write), pack (copy), bindableEvent (ref)
			local var34, var35 = pack(...)
			var31 = var34
			var30 = var35
			bindableEvent:Fire(true)
		end, function(...)
			-- upvalues: var31 (write), var30 (write), pack (copy), bindableEvent (ref)
			local var36, var37 = pack(...)
			var31 = var36
			var30 = var37
			bindableEvent:Fire(false)
		end)
		local var33 = bindableEvent.Event:Wait()
		bindableEvent:Destroy()
		
		return var33, unpack(var30, 1, var31)
	elseif p22._status == t.Status.Resolved then
		return true, unpack(p22._values, 1, p22._valuesLength)
	elseif p22._status == t.Status.Rejected then
		return false, unpack(p22._values, 1, p22._valuesLength)
	end
	error("Promise had an invalid status.")
end

function t.prototype._unwrap(p23)
	-- upvalues: t (ref)
	if p23._status == t.Status.Started then
		error("Promise has not resolved or rejected.", 2)
	end
	return p23._status == t.Status.Resolved, unpack(p23._values, 1, p23._valuesLength)
end

function t.prototype._resolve(p24, ...)
	-- upvalues: t (ref), pack (ref)
	if p24._status ~= t.Status.Started then return end
	if t.is(...) then
		if select("#", ...) > 1 then
			warn(("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s"):format(p24._source))
		end;
		(...):andThen(function(...)
			-- upvalues: p24 (ref)
			p24:_resolve(...)
		end, function(...)
			-- upvalues: p24 (ref)
			p24:_reject(...)
		end)
		
		return
	else
		p24._status = t.Status.Resolved
		local var38, var39 = pack(...)
		p24._valuesLength = var38
		p24._values = var39
		
		for i, v in ipairs(p24._queuedResolve) do
			v(...)
		end
	end
end

function t.prototype._reject(p25, ...)
	-- upvalues: t (ref), pack (ref)
	if p25._status ~= t.Status.Started then return end
	p25._status = t.Status.Rejected
	local var40, var41 = pack(...)
	p25._valuesLength = var40
	p25._values = var41
	
	if next(p25._queuedReject) == nil then
		p25._unhandledRejection = true
		local var42 = tostring(...)
		spawn(function()
			-- upvalues: p25 (ref), var42 (ref)
			if p25._unhandledRejection then
				warn(("Unhandled promise rejection:\n\n%s\n\n%s"):format(var42, p25._source))
				
				return
			end
		end)
		
		return
	end
	for i, v in ipairs(p25._queuedReject) do
		v(...)
	end
end

return t