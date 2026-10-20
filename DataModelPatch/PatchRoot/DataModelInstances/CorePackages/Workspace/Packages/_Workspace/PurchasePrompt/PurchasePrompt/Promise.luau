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

local PromiseModule = {}
PromiseModule.__index = PromiseModule
PromiseModule.Status = {
	Started = "Started",
	Resolved = "Resolved",
	Rejected = "Rejected"
}

function PromiseModule.new(p1)
	-- upvalues: PromiseModule (copy), wpcallPacked (copy)
	local config = {
		_type = "Promise",
		_values = nil,
		_valuesLength = -1,
		_unhandledRejection = false,
		_source = debug.traceback(),
		_status = PromiseModule.Status.Started,
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

function PromiseModule.all(...)
	-- upvalues: PromiseModule (copy)
	local Promises = { ... }
	
	if type(Promises[1]) == "table" and Promises[1]._type ~= "Promise" then
		Promises = Promises[1]
	end
	return PromiseModule.new(function(Callback: (any) -> (), Callback1)
		-- upvalues: Promises (ref), PromiseModule (upval)
		local Flag = false
		local t = {}
		local Count = 0
		local Count1 = 0
		
		for _ in pairs(Promises) do
			Count1 += 1
		end
		local function _(Key, p1)
			-- upvalues: Flag (ref), t (copy), Count (ref), Count1 (ref), Callback (copy)
			if Flag then return end
			t[Key] = p1
			Count += 1
			
			if Count == Count1 then
				Callback(t)
				Flag = true
			end
		end
		
		if Count1 == 0 then
			Callback(t)
			Flag = true
			
			return
		end
		for i, promis in pairs(Promises) do
			if promis._status == PromiseModule.Status.Started then
				promis:andThen(function(Result)
					-- upvalues: i (copy), Flag (ref), t (copy), Count (ref), Count1 (ref), Callback (copy)
					if Flag then return end
					t[i] = Result
					Count += 1
					
					if Count == Count1 then
						Callback(t)
						Flag = true
					end
				end):catch(function(Err)
					-- upvalues: Flag (ref), Callback1 (copy)
					Flag = true
					Callback1(Err)
				end)
			elseif promis._status == PromiseModule.Status.Resolved then
				local Unpacked = unpack(promis._values)
				
				if not Flag then
					t[i] = Unpacked
					Count += 1
					
					if Count == Count1 then
						Callback(t)
						Flag = true
					end
				end
			else
				promis:catch(function(_)
					-- upvalues: Flag (ref), Callback1 (copy), promis (copy)
					Flag = true
					Callback1(unpack(promis._values))
				end)
			end
		end
	end)
end

function PromiseModule:is(): boolean
	return type(self) == "table" and self._type == "Promise"
end

function PromiseModule.promisify(p1)
	-- upvalues: PromiseModule (copy)
	return function(...)
		-- upvalues: PromiseModule (upval), p1 (copy)
		local list = { ... }
		local Selected = select("#", ...)
		
		return PromiseModule.new(function(Callback, Callback1)
			-- upvalues: p1 (upval), list (copy), Selected (copy)
			spawn(function()
				-- upvalues: p1 (upval), list (upval), Selected (upval), Callback (copy), Callback1 (copy)
				local Success, Result = pcall(p1, unpack(list, 1, Selected))
				
				if Success then
					Callback(Result)
					
					return
				else
					Callback1(Result)
				end
			end)
		end)
	end
end

function PromiseModule:getStatus()
	return self._status
end

function PromiseModule:andThen(p1, p2)
	-- upvalues: PromiseModule (copy), wpcallPacked (copy)
	self._unhandledRejection = false
	
	return PromiseModule.new(function(Callback2, Callback3)
		-- upvalues: p1 (copy), wpcallPacked (upval), p2 (copy), self (copy), PromiseModule (upval)
		local Callback: (any) -> () = if p1 then function(...)
			-- upvalues: wpcallPacked (upval), p1 (copy), Callback2 (copy), Callback3 (copy)
			local v1, v2 = wpcallPacked(p1, ...)
			
			if v2[1] then
				Callback2(unpack(v2, 2, v1))
				
				return
			else
				Callback3(unpack(v2, 2, v1))
			end
		end else Callback2
		local Callback1: (any) -> () = if p2 then function(...)
			-- upvalues: wpcallPacked (upval), p2 (copy), Callback2 (copy), Callback3 (copy)
			local v1, v2 = wpcallPacked(p2, ...)
			
			if v2[1] then
				Callback2(unpack(v2, 2, v1))
				
				return
			else
				Callback3(unpack(v2, 2, v1))
			end
		end else Callback3
		
		if self._status == PromiseModule.Status.Started then
			table.insert(self._queuedResolve, Callback)
			table.insert(self._queuedReject, Callback1)
			
			return
		end
		if self._status == PromiseModule.Status.Resolved then
			Callback(unpack(self._values, 1, self._valuesLength))
			
			return
		end
		if self._status == PromiseModule.Status.Rejected then
			Callback1(unpack(self._values, 1, self._valuesLength))
		end
	end)
end

function PromiseModule:catch(p1)
	return self:andThen(nil, p1)
end

function PromiseModule:await()
	-- upvalues: PromiseModule (copy)
	self._unhandledRejection = false
	
	if self._status == PromiseModule.Status.Started then
		local List = nil
		local Selected = nil
		local BindableEvent = Instance.new("BindableEvent")
		self:andThen(function(...)
			-- upvalues: List (ref), Selected (ref), BindableEvent (copy)
			List = { ... }
			Selected = select("#", ...)
			BindableEvent:Fire(true)
		end, function(...)
			-- upvalues: List (ref), Selected (ref), BindableEvent (copy)
			List = { ... }
			Selected = select("#", ...)
			BindableEvent:Fire(false)
		end)
		local WaitResult = BindableEvent.Event:Wait()
		BindableEvent:Destroy()
		
		return WaitResult, unpack(List, 1, Selected)
	end
	local List = self._status
	local Selected = PromiseModule
	Selected = Selected.Status
	Selected = Selected.Resolved
	
	if List == Selected then
		List = true
		Selected = unpack
		
		return List, Selected(self._values, 1, self._valuesLength)
	end
	List = self._status
	Selected = PromiseModule
	Selected = Selected.Status
	Selected = Selected.Rejected
	
	if List ~= Selected then return end
	List = false
	Selected = unpack
	
	return List, Selected(self._values, 1, self._valuesLength)
end

function PromiseModule:_resolve(...)
	-- upvalues: PromiseModule (copy)
	if self._status ~= PromiseModule.Status.Started then return end
	local Selected: number = select("#", ...)
	
	if PromiseModule.is((...)) then
		if Selected > 1 then
			warn((("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s"):format(self._source)))
		end;
		(...):andThen(function(...)
			-- upvalues: self (copy)
			self:_resolve(...)
		end, function(...)
			-- upvalues: self (copy)
			self:_reject(...)
		end)
		
		return
	else
		self._status = PromiseModule.Status.Resolved
		self._values = { ... }
		self._valuesLength = Selected
		
		for _, value in ipairs(self._queuedResolve) do
			value(...)
		end
	end
end

function PromiseModule:_reject(...)
	-- upvalues: PromiseModule (copy)
	if self._status ~= PromiseModule.Status.Started then return end
	self._status = PromiseModule.Status.Rejected
	self._values = { ... }
	self._valuesLength = select("#", ...)
	
	if next(self._queuedReject) == nil then
		self._unhandledRejection = true
		local Text = tostring((...))
		spawn(function()
			-- upvalues: self (copy), Text (copy)
			if self._unhandledRejection then
				warn((("Unhandled promise rejection:\n\n%s\n\n%s"):format(Text, self._source)))
				
				return
			end
		end)
		
		return
	end
	for _, value in ipairs(self._queuedReject) do
		value(...)
	end
end

return PromiseModule