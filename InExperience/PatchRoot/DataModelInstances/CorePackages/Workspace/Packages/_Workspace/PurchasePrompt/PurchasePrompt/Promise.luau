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

local t = {}
t.__index = t
t.Status = {
	Started = "Started",
	Resolved = "Resolved",
	Rejected = "Rejected"
}

function t.new(p1)
	-- upvalues: t (ref), wpcallPacked (ref)
	local t_1 = {
		_type = "Promise",
		_values = nil,
		_valuesLength = -1,
		_unhandledRejection = false,
		_source = debug.traceback(),
		_status = t.Status.Started,
		_queuedResolve = {},
		_queuedReject = {}
	}
	setmetatable(t_1, t)
	
	local function reject(...)
		-- upvalues: t_1 (ref)
		t_1:_reject(...)
	end
	
	local _, var1 = wpcallPacked(p1, function(...)
		-- upvalues: t_1 (ref)
		t_1:_resolve(...)
	end, reject)
	local var2 = var1[2]
	
	if not var1[1] and t_1._status == t.Status.Started then
		reject(var2)
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

function t.all(...)
	-- upvalues: t (ref)
	local list = { ... }
	
	if type(list[1]) == "table" and list[1]._type ~= "Promise" then
		list = list[1]
	end
	return t.new(function(p1, p2)
		-- upvalues: list (write), t (copy)
		local var1 = false
		local t_1 = {}
		local var2 = 0
		local var3 = 0
		
		for i in pairs(list) do
			var3 += 1
		end
		local function _(p3, p4)
			-- upvalues: var1 (write), t_1 (ref), var2 (write), var3 (write), p1 (ref)
			if var1 then return end
			t_1[p3] = p4
			var2 += 1
			
			if var2 == var3 then
				p1(t_1)
				var1 = true
			end
		end
		
		if var3 == 0 then
			p1(t_1)
			var1 = true
			
			return
		end
		for i_1, v in pairs(list) do
			if v._status == t.Status.Started then
				v:andThen(function(p3)
					-- upvalues: i_1 (ref), var1 (write), t_1 (ref), var2 (write), var3 (write), p1 (ref)
					if var1 then return end
					t_1[i_1] = p3
					var2 += 1
					
					if var2 == var3 then
						p1(t_1)
						var1 = true
					end
				end):catch(function(p3)
					-- upvalues: var1 (write), p2 (ref)
					var1 = true
					p2(p3)
				end)
			elseif v._status == t.Status.Resolved then
				local var4 = unpack(v._values)
				
				if not var1 then
					t_1[i_1] = var4
					var2 += 1
					
					if var2 == var3 then
						p1(t_1)
						var1 = true
					end
				end
			else
				v:catch(function(_)
					-- upvalues: var1 (write), p2 (ref), v (ref)
					var1 = true
					p2(unpack(v._values))
				end)
			end
		end
	end)
end

function t:is()
	return type(self) == "table" and self._type == "Promise"
end

function t.promisify(p3)
	-- upvalues: t (ref)
	return function(...)
		-- upvalues: t (copy), p3 (ref)
		local list = { ... }
		local var5 = select("#", ...)
		
		return t.new(function(p4, p5)
			-- upvalues: p3 (copy), list (ref), var5 (ref)
			spawn(function()
				-- upvalues: p3 (copy), list (copy), var5 (copy), p4 (ref), p5 (ref)
				local ok, status = pcall(p3, unpack(list, 1, var5))
				
				if ok then
					p4(status)
					
					return
				end
				p5(status)
			end)
		end)
	end
end

function t:getStatus()
	return self._status
end

function t:andThen(p3, p4)
	-- upvalues: t (ref), wpcallPacked (ref)
	self._unhandledRejection = false
	
	return t.new(function(p5, p6)
		-- upvalues: p3 (ref), wpcallPacked (copy), p4 (ref), self (ref), t (copy)
		local var5 = p5
		
		if p3 then
			local var6 = p3
			
			var5 = function(...)
				-- upvalues: wpcallPacked (copy), var6 (ref), p5 (ref), p6 (ref)
				local var7, var8 = wpcallPacked(var6, ...)
				
				if var8[1] then
					p5(unpack(var8, 2, var7))
					
					return
				end
				p6(unpack(var8, 2, var7))
			end
		end
		local var7 = p6
		
		if p4 then
			local var8 = p4
			
			var7 = function(...)
				-- upvalues: wpcallPacked (copy), var8 (ref), p5 (ref), p6 (ref)
				local var9, var10 = wpcallPacked(var8, ...)
				
				if var10[1] then
					p5(unpack(var10, 2, var9))
					
					return
				end
				p6(unpack(var10, 2, var9))
			end
		end
		if self._status == t.Status.Started then
			table.insert(self._queuedResolve, var5)
			table.insert(self._queuedReject, var7)
			
			return
		elseif self._status == t.Status.Resolved then
			var5(unpack(self._values, 1, self._valuesLength))
			
			return
		elseif self._status == t.Status.Rejected then
			var7(unpack(self._values, 1, self._valuesLength))
		end
	end)
end

function t:catch(p3)
	return self:andThen(nil, p3)
end

function t:await()
	-- upvalues: t (ref)
	self._unhandledRejection = false
	
	if self._status == t.Status.Started then
		local var5 = nil
		local var6 = nil
		local bindableEvent = Instance.new("BindableEvent")
		self:andThen(function(...)
			-- upvalues: var5 (write), var6 (write), bindableEvent (ref)
			var5 = { ... }
			var6 = select("#", ...)
			bindableEvent:Fire(true)
		end, function(...)
			-- upvalues: var5 (write), var6 (write), bindableEvent (ref)
			var5 = { ... }
			var6 = select("#", ...)
			bindableEvent:Fire(false)
		end)
		local var7 = bindableEvent.Event:Wait()
		bindableEvent:Destroy()
		
		return var7, unpack(var5, 1, var6)
	elseif self._status == t.Status.Resolved then
		return true, unpack(self._values, 1, self._valuesLength)
	elseif self._status == t.Status.Rejected then
		return false, unpack(self._values, 1, self._valuesLength)
	end
end

function t:_resolve(...)
	-- upvalues: t (ref)
	if self._status ~= t.Status.Started then return end
	local var5 = select("#", ...)
	
	if t.is(...) then
		if var5 > 1 then
			warn(("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s"):format(self._source))
		end;
		(...):andThen(function(...)
			-- upvalues: self (ref)
			self:_resolve(...)
		end, function(...)
			-- upvalues: self (ref)
			self:_reject(...)
		end)
		
		return
	else
		self._status = t.Status.Resolved
		self._values = { ... }
		self._valuesLength = var5
		
		for i, v in ipairs(self._queuedResolve) do
			v(...)
		end
	end
end

function t:_reject(...)
	-- upvalues: t (ref)
	if self._status ~= t.Status.Started then return end
	self._status = t.Status.Rejected
	self._values = { ... }
	self._valuesLength = select("#", ...)
	
	if next(self._queuedReject) == nil then
		self._unhandledRejection = true
		local var6 = tostring(...)
		spawn(function()
			-- upvalues: self (ref), var6 (ref)
			if self._unhandledRejection then
				warn(("Unhandled promise rejection:\n\n%s\n\n%s"):format(var6, self._source))
				
				return
			end
		end)
		
		return
	end
	for i, v in ipairs(self._queuedReject) do
		v(...)
	end
end

return t