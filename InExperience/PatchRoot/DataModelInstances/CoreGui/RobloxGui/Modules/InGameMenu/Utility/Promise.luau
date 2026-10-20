local function pack(...)
	return select("#", ...), { ... }
end

local function wpcallPacked(Callback, ...)
	-- upvalues: pack (copy)
	local PackResult, PackResult2 = pack(...)
	local PackResult1, PackResult2_1 = pack(xpcall(function()
		-- upvalues: Callback (copy), PackResult2 (copy), PackResult (copy)
		return Callback(unpack(PackResult2, 1, PackResult))
	end, debug.traceback))
	
	return PackResult1, PackResult2_1
end

local function _(p1, p2, p3)
	-- upvalues: wpcallPacked (copy)
	return function(...)
		-- upvalues: wpcallPacked (upval), p1 (copy), p2 (copy), p3 (copy)
		local v1, v2 = wpcallPacked(p1, ...)
		
		if v2[1] then
			p2(unpack(v2, 2, v1))
			
			return
		else
			p3(unpack(v2, 2, v1))
		end
	end
end

local _ = function(p1): boolean
	return next(p1) == nil
end

local _ = function(p1)
	assert(type(p1) == "string", "createSymbol requires `name` to be a string.")
	local Proxy = newproxy(true)
	
	getmetatable(Proxy).__tostring = function(): string
		-- upvalues: p1 (copy)
		return ("Symbol(%s)"):format(p1)
	end
	
	return Proxy
end

assert(true, "createSymbol requires `name` to be a string.")
local Proxy = newproxy(true)
local v1 = "PromiseMarker"

getmetatable(Proxy).__tostring = function(): string
	-- upvalues: v1 (copy)
	return ("Symbol(%s)"):format(v1)
end

local PromiseModule = { prototype = {} }
PromiseModule.__index = PromiseModule.prototype
local Status = {}
assert(true, "createSymbol requires `name` to be a string.")
local Proxy1 = newproxy(true)
local v2 = "Started"

getmetatable(Proxy1).__tostring = function(): string
	-- upvalues: v2 (copy)
	return ("Symbol(%s)"):format(v2)
end

Status.Started = Proxy1
assert(true, "createSymbol requires `name` to be a string.")
local Proxy2 = newproxy(true)
local v3 = "Resolved"

getmetatable(Proxy2).__tostring = function(): string
	-- upvalues: v3 (copy)
	return ("Symbol(%s)"):format(v3)
end

Status.Resolved = Proxy2
assert(true, "createSymbol requires `name` to be a string.")
local Proxy3 = newproxy(true)
local v4 = "Rejected"

getmetatable(Proxy3).__tostring = function(): string
	-- upvalues: v4 (copy)
	return ("Symbol(%s)"):format(v4)
end

Status.Rejected = Proxy3
PromiseModule.Status = Status

function PromiseModule.new(p1)
	-- upvalues: Proxy (copy), PromiseModule (copy), wpcallPacked (copy)
	local config = {
		_source = debug.traceback(),
		[Proxy] = true,
		_status = PromiseModule.Status.Started,
		_values = nil,
		_valuesLength = -1,
		_unhandledRejection = false,
		_queuedResolve = {},
		_queuedReject = {}
	}
	setmetatable(config, PromiseModule)
	
	local function reject(...)
		-- upvalues: config (copy)
		config:_reject(...)
	end
	
	local _, WpcallPackedResult2 = wpcallPacked(p1, function(...)
		-- upvalues: config (copy)
		config:_resolve(...)
	end, reject)
	local WpcallPackedResultEntry = WpcallPackedResult2[2]
	
	if not WpcallPackedResult2[1] and config._status == PromiseModule.Status.Started then
		reject(WpcallPackedResultEntry)
	end
	return config
end

function PromiseModule.resolve(p1)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(Callback: (any) -> ())
		-- upvalues: p1 (copy)
		Callback(p1)
	end)
end

function PromiseModule.reject(p1)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(_, Callback: (any) -> ())
		-- upvalues: p1 (copy)
		Callback(p1)
	end)
end

function PromiseModule:all()
	-- upvalues: PromiseModule (copy)
	if type(self) ~= "table" then
		error("Please pass a list of promises to Promise.all", 2)
	end
	if #self == 0 then
		return PromiseModule.resolve({})
	end
	for i = 1, #self do
		if not PromiseModule.is(self[i]) then
			error(("Non-promise value passed into Promise.all at index #%d"):format(i), 2)
		end
	end
	return PromiseModule.new(function(Callback, Callback1)
		-- upvalues: self (copy)
		local t = {}
		local Count = 0
		
		local function resolveOne(Key, ...)
			-- upvalues: t (copy), Count (ref), self (upval), Callback (copy)
			t[Key] = (...)
			Count += 1
			
			if Count == #self then
				Callback(t)
			end
		end
		
		for i = 1, #self do
			self[i]:andThen(function(...)
				-- upvalues: resolveOne (copy), i (copy)
				resolveOne(i, ...)
			end, function(...)
				-- upvalues: Callback1 (copy)
				Callback1(...)
			end)
		end
	end)
end

function PromiseModule:is(): boolean
	-- upvalues: Proxy (copy)
	return type(self) == "table" and self[Proxy] == true
end

function PromiseModule.prototype.getStatus(p1)
	return p1._status
end

function PromiseModule.prototype.andThen(p1, p2, p3)
	-- upvalues: PromiseModule (copy), wpcallPacked (copy)
	p1._unhandledRejection = false
	
	return PromiseModule.new(function(Callback2, Callback3)
		-- upvalues: p2 (copy), wpcallPacked (upval), p3 (copy), p1 (copy), PromiseModule (upval)
		local Callback: (any) -> () = if p2 then function(...)
			-- upvalues: wpcallPacked (upval), p2 (copy), Callback2 (copy), Callback3 (copy)
			local v5, v6 = wpcallPacked(p2, ...)
			
			if v6[1] then
				Callback2(unpack(v6, 2, v5))
				
				return
			else
				Callback3(unpack(v6, 2, v5))
			end
		end else Callback2
		local Callback1: (any) -> () = if p3 then function(...)
			-- upvalues: wpcallPacked (upval), p3 (copy), Callback2 (copy), Callback3 (copy)
			local v5, v6 = wpcallPacked(p3, ...)
			
			if v6[1] then
				Callback2(unpack(v6, 2, v5))
				
				return
			else
				Callback3(unpack(v6, 2, v5))
			end
		end else Callback3
		
		if p1._status == PromiseModule.Status.Started then
			table.insert(p1._queuedResolve, Callback)
			table.insert(p1._queuedReject, Callback1)
			
			return
		end
		if p1._status == PromiseModule.Status.Resolved then
			Callback(unpack(p1._values, 1, p1._valuesLength))
			
			return
		end
		if p1._status == PromiseModule.Status.Rejected then
			Callback1(unpack(p1._values, 1, p1._valuesLength))
		end
	end)
end

function PromiseModule.prototype.catch(Promise, p1)
	return Promise:andThen(nil, p1)
end

function PromiseModule.prototype.await(Promise)
	-- upvalues: PromiseModule (copy), pack (copy)
	Promise._unhandledRejection = false
	
	if Promise._status == PromiseModule.Status.Started then
		local Status = nil
		local Status1 = nil
		local BindableEvent = Instance.new("BindableEvent")
		Promise:andThen(function(...)
			-- upvalues: Status1 (ref), Status (ref), pack (upval), BindableEvent (copy)
			Status1, Status = pack(...)
			BindableEvent:Fire(true)
		end, function(...)
			-- upvalues: Status1 (ref), Status (ref), pack (upval), BindableEvent (copy)
			Status1, Status = pack(...)
			BindableEvent:Fire(false)
		end)
		local WaitResult = BindableEvent.Event:Wait()
		BindableEvent:Destroy()
		
		return WaitResult, unpack(Status, 1, Status1)
	end
	local Status = Promise._status
	local Status1 = PromiseModule
	Status1 = Status1.Status
	Status1 = Status1.Resolved
	
	if Status == Status1 then
		Status = true
		Status1 = unpack
		
		return Status, Status1(Promise._values, 1, Promise._valuesLength)
	end
	Status = Promise._status
	Status1 = PromiseModule
	Status1 = Status1.Status
	Status1 = Status1.Rejected
	
	if Status == Status1 then
		Status = false
		Status1 = unpack
		
		return Status, Status1(Promise._values, 1, Promise._valuesLength)
	else
		Status = error
		Status1 = "Promise had an invalid status."
		Status(Status1)
	end
end

function PromiseModule.prototype._unwrap(p1)
	-- upvalues: PromiseModule (copy)
	if p1._status == PromiseModule.Status.Started then
		error("Promise has not resolved or rejected.", 2)
	end
	return p1._status == PromiseModule.Status.Resolved, unpack(p1._values, 1, p1._valuesLength)
end

function PromiseModule.prototype._resolve(p1, ...)
	-- upvalues: PromiseModule (copy), pack (copy)
	if p1._status ~= PromiseModule.Status.Started then return end
	if PromiseModule.is((...)) then
		if select("#", ...) > 1 then
			warn((("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s"):format(p1._source)))
		end;
		(...):andThen(function(...)
			-- upvalues: p1 (copy)
			p1:_resolve(...)
		end, function(...)
			-- upvalues: p1 (copy)
			p1:_reject(...)
		end)
		
		return
	else
		p1._status = PromiseModule.Status.Resolved
		p1._valuesLength, p1._values = pack(...)
		
		for _, value in ipairs(p1._queuedResolve) do
			value(...)
		end
	end
end

function PromiseModule.prototype._reject(p2, ...)
	-- upvalues: PromiseModule (copy), pack (copy)
	if p2._status ~= PromiseModule.Status.Started then return end
	p2._status = PromiseModule.Status.Rejected
	p2._valuesLength, p2._values = pack(...)
	
	if next(p2._queuedReject) == nil then
		p2._unhandledRejection = true
		local Text = tostring((...))
		spawn(function()
			-- upvalues: p2 (copy), Text (copy)
			if p2._unhandledRejection then
				warn((("Unhandled promise rejection:\n\n%s\n\n%s"):format(Text, p2._source)))
				
				return
			end
		end)
		
		return
	end
	for _, value in ipairs(p2._queuedReject) do
		value(...)
	end
end

return PromiseModule