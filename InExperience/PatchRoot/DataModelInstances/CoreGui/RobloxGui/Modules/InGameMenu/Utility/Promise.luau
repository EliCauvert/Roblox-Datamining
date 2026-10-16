local function pack(...) --[[ Line: 13 ]]
	return select("#", ...), { ... }
end

local function wpcallPacked(Callback, ...) --[[ Line: 26 ]]
	-- upvalues: pack (copy)
	local PackResult, PackResult2 = pack(...)
	local PackResult1, PackResult2_1 = pack(xpcall(function() --[[ Line: 29 ]]
		-- upvalues: Callback (copy), PackResult2 (copy), PackResult (copy)
		return Callback(unpack(PackResult2, 1, PackResult))
	end, debug.traceback))
	
	return PackResult1, PackResult2_1
end

local function _(p1, p2, p3) --[[ Line: 49 | Named "createAdvancer" ]]
	-- upvalues: wpcallPacked (copy)
	return function(...) --[[ Line: 50 ]]
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

local _ = function(p1): boolean --[[ Line: 62 | Named "isEmpty" ]]
	return next(p1) == nil
end

local _ = function(p1) --[[ Line: 66 | Named "createSymbol" ]]
	assert(type(p1) == "string", "createSymbol requires `name` to be a string.")
	local Proxy = newproxy(true)
	
	getmetatable(Proxy).__tostring = function(): string --[[ Line: 71 ]]
		-- upvalues: p1 (copy)
		return ("Symbol(%s)"):format(p1)
	end
	
	return Proxy
end

assert(true, "createSymbol requires `name` to be a string.")
local Proxy = newproxy(true)
local v1 = "PromiseMarker"

getmetatable(Proxy).__tostring = function(): string --[[ Line: 71 ]]
	-- upvalues: v1 (copy)
	return ("Symbol(%s)"):format(v1)
end

local PromiseModule = { prototype = {} }
PromiseModule.__index = PromiseModule.prototype
local Status = {}
assert(true, "createSymbol requires `name` to be a string.")
local Proxy1 = newproxy(true)
local v2 = "Started"

getmetatable(Proxy1).__tostring = function(): string --[[ Line: 71 ]]
	-- upvalues: v2 (copy)
	return ("Symbol(%s)"):format(v2)
end

Status.Started = Proxy1
assert(true, "createSymbol requires `name` to be a string.")
local Proxy2 = newproxy(true)
local v3 = "Resolved"

getmetatable(Proxy2).__tostring = function(): string --[[ Line: 71 ]]
	-- upvalues: v3 (copy)
	return ("Symbol(%s)"):format(v3)
end

Status.Resolved = Proxy2
assert(true, "createSymbol requires `name` to be a string.")
local Proxy3 = newproxy(true)
local v4 = "Rejected"

getmetatable(Proxy3).__tostring = function(): string --[[ Line: 71 ]]
	-- upvalues: v4 (copy)
	return ("Symbol(%s)"):format(v4)
end

Status.Rejected = Proxy3
PromiseModule.Status = Status

function PromiseModule.new(p1) --[[ Line: 114 ]]
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
	
	local function reject(...) --[[ Line: 146 ]]
		-- upvalues: config (copy)
		config:_reject(...)
	end
	
	local _, WpcallPackedResult2 = wpcallPacked(p1, function(...) --[[ Line: 142 | Named "resolve" ]]
		-- upvalues: config (copy)
		config:_resolve(...)
	end, reject)
	local WpcallPackedResultEntry = WpcallPackedResult2[2]
	
	if not WpcallPackedResult2[1] and config._status == PromiseModule.Status.Started then
		reject(WpcallPackedResultEntry)
	end
	return config
end

function PromiseModule.resolve(p1) --[[ Line: 164 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(Callback: (any) -> ()) --[[ Line: 165 ]]
		-- upvalues: p1 (copy)
		Callback(p1)
	end)
end

function PromiseModule.reject(p1) --[[ Line: 173 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(_, Callback: (any) -> ()) --[[ Line: 174 ]]
		-- upvalues: p1 (copy)
		Callback(p1)
	end)
end

function PromiseModule:all() --[[ Line: 184 ]]
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
	return PromiseModule.new(function(Callback, Callback1) --[[ Line: 202 ]]
		-- upvalues: self (copy)
		local t = {}
		local Count = 0
		
		local function resolveOne(Key, ...) --[[ Line: 211 ]]
			-- upvalues: t (copy), Count (ref), self (upval), Callback (copy)
			t[Key] = (...)
			Count += 1
			
			if Count == #self then
				Callback(t)
			end
		end
		
		for i = 1, #self do
			self[i]:andThen(function(...) --[[ Line: 224 ]]
				-- upvalues: resolveOne (copy), i (copy)
				resolveOne(i, ...)
			end, function(...) --[[ Line: 227 ]]
				-- upvalues: Callback1 (copy)
				Callback1(...)
			end)
		end
	end)
end

function PromiseModule:is(): boolean --[[ Line: 238 ]]
	-- upvalues: Proxy (copy)
	return type(self) == "table" and self[Proxy] == true
end

function PromiseModule.prototype.getStatus(p1) --[[ Line: 246 ]]
	return p1._status
end

function PromiseModule.prototype.andThen(p1, p2, p3) --[[ Line: 255 ]]
	-- upvalues: PromiseModule (copy), wpcallPacked (copy)
	p1._unhandledRejection = false
	
	return PromiseModule.new(function(Callback2, Callback3) --[[ Line: 259 ]]
		-- upvalues: p2 (copy), wpcallPacked (upval), p3 (copy), p1 (copy), PromiseModule (upval)
		local Callback: (any) -> () = if p2 then function(...) --[[ Line: 50 ]]
			-- upvalues: wpcallPacked (upval), p2 (copy), Callback2 (copy), Callback3 (copy)
			local v5, v6 = wpcallPacked(p2, ...)
			
			if v6[1] then
				Callback2(unpack(v6, 2, v5))
				
				return
			else
				Callback3(unpack(v6, 2, v5))
			end
		end else Callback2
		local Callback1: (any) -> () = if p3 then function(...) --[[ Line: 50 ]]
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

function PromiseModule.prototype.catch(Promise, p1) --[[ Line: 290 ]]
	return Promise:andThen(nil, p1)
end

function PromiseModule.prototype.await(Promise) --[[ Line: 299 ]]
	-- upvalues: PromiseModule (copy), pack (copy)
	Promise._unhandledRejection = false
	
	if Promise._status == PromiseModule.Status.Started then
		local Status = nil
		local Status1 = nil
		local BindableEvent = Instance.new("BindableEvent")
		Promise:andThen(function(...) --[[ Line: 308 ]]
			-- upvalues: Status1 (ref), Status (ref), pack (upval), BindableEvent (copy)
			Status1, Status = pack(...)
			BindableEvent:Fire(true)
		end, function(...) --[[ Line: 312 ]]
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

function PromiseModule.prototype._unwrap(p1) --[[ Line: 338 ]]
	-- upvalues: PromiseModule (copy)
	if p1._status == PromiseModule.Status.Started then
		error("Promise has not resolved or rejected.", 2)
	end
	return p1._status == PromiseModule.Status.Resolved, unpack(p1._values, 1, p1._valuesLength)
end

function PromiseModule.prototype._resolve(p1, ...) --[[ Line: 348 ]]
	-- upvalues: PromiseModule (copy), pack (copy)
	if p1._status ~= PromiseModule.Status.Started then return end
	if PromiseModule.is((...)) then
		if select("#", ...) > 1 then
			warn((("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s"):format(p1._source)))
		end;
		(...):andThen(function(...) --[[ Line: 367 ]]
			-- upvalues: p1 (copy)
			p1:_resolve(...)
		end, function(...) --[[ Line: 370 ]]
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

function PromiseModule.prototype._reject(p2, ...) --[[ Line: 387 ]]
	-- upvalues: PromiseModule (copy), pack (copy)
	if p2._status ~= PromiseModule.Status.Started then return end
	p2._status = PromiseModule.Status.Rejected
	p2._valuesLength, p2._values = pack(...)
	
	if next(p2._queuedReject) == nil then
		p2._unhandledRejection = true
		local Text = tostring((...))
		spawn(function() --[[ Line: 410 ]]
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