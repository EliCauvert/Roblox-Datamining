local function pack(...) --[[ line: 12 ]]
	return select("#", ...), { ... }
end

local function wpcallPacked(p0, ...) --[[ line: 25 ]]
	-- upvalues: pack (ref)
	local var3, var4 = pack(...)
	local var5, var6 = pack(xpcall(function() --[[ line: 28 ]]
		-- upvalues: p0 (ref), var4 (ref), var3 (ref)
		return p0(unpack(var4, 1, var3))
	end, debug.traceback))
	
	return var5, var6
end

local function _(p1, p2, p3) --[[ line: 48 | named "createAdvancer" ]]
	-- upvalues: wpcallPacked (ref)
	return function(...) --[[ line: 49 ]]
		-- upvalues: wpcallPacked (copy), p1 (ref), p2 (ref), p3 (ref)
		local var7, var8 = wpcallPacked(p1, ...)
		
		if var8[1] then
			p2(unpack(var8, 2, var7))
			
			return
		end
		p3(unpack(var8, 2, var7))
	end
end

local _ = function(p4) --[[ line: 61 | named "isEmpty" ]]
	return next(p4) == nil
end

local t = {}
t.__index = t
t.Status = {
	Started = "Started",
	Resolved = "Resolved",
	Rejected = "Rejected"
}

function t.new(p5) --[[ line: 93 ]]
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
	
	local function reject(...) --[[ line: 125 ]]
		-- upvalues: t_1 (ref)
		t_1:_reject(...)
	end
	
	local _, var11 = wpcallPacked(p5, function(...) --[[ line: 121 | named "resolve" ]]
		-- upvalues: t_1 (ref)
		t_1:_resolve(...)
	end, reject)
	local var12 = var11[2]
	
	if not var11[1] and t_1._status == t.Status.Started then
		reject(var12)
	end
	return t_1
end

function t.resolve(p6) --[[ line: 143 ]]
	-- upvalues: t (ref)
	return t.new(function(p7) --[[ line: 144 ]]
		-- upvalues: p6 (ref)
		p7(p6)
	end)
end

function t.reject(p8) --[[ line: 152 ]]
	-- upvalues: t (ref)
	return t.new(function(_, p9) --[[ line: 153 ]]
		-- upvalues: p8 (ref)
		p9(p8)
	end)
end

function t.all(...) --[[ line: 163 ]]
	-- upvalues: t (ref)
	local list = { ... }
	
	if type(list[1]) == "table" and list[1]._type ~= "Promise" then
		list = list[1]
	end
	return t.new(function(p10, p11) --[[ line: 172 ]]
		-- upvalues: list (write), t (copy)
		local var14 = false
		local t_1 = {}
		local var16 = 0
		local var17 = 0
		
		for i in pairs(list) do
			var17 += 1
		end
		local function _(p12, p13) --[[ line: 184 | named "promiseCompleted" ]]
			-- upvalues: var14 (write), t_1 (ref), var16 (write), var17 (write), p10 (ref)
			if var14 then return end
			t_1[p12] = p13
			var16 += 1
			
			if var16 == var17 then
				p10(t_1)
				var14 = true
			end
		end
		
		if var17 == 0 then
			p10(t_1)
			var14 = true
			
			return
		end
		for i_1, v in pairs(list) do
			if v._status == t.Status.Started then
				v:andThen(function(p15) --[[ line: 208 ]]
					-- upvalues: i_1 (ref), var14 (write), t_1 (ref), var16 (write), var17 (write), p10 (ref)
					if var14 then return end
					t_1[i_1] = p15
					var16 += 1
					
					if var16 == var17 then
						p10(t_1)
						var14 = true
					end
				end):catch(function(p14) --[[ line: 211 ]]
					-- upvalues: var14 (write), p11 (ref)
					var14 = true
					p11(p14)
				end)
			elseif v._status == t.Status.Resolved then
				local var18 = unpack(v._values)
				
				if not var14 then
					t_1[i_1] = var18
					var16 += 1
					
					if var16 == var17 then
						p10(t_1)
						var14 = true
					end
				end
			else
				v:catch(function(_) --[[ line: 224 ]]
					-- upvalues: var14 (write), p11 (ref), v (ref)
					var14 = true
					p11(unpack(v._values))
				end)
			end
		end
	end)
end

function t:is() --[[ line: 236 ]]
	return type(self) == "table" and self._type == "Promise"
end

function t.promisify(p16) --[[ line: 247 ]]
	-- upvalues: t (ref)
	return function(...) --[[ line: 248 ]]
		-- upvalues: t (copy), p16 (ref)
		local list = { ... }
		local var20 = select("#", ...)
		
		return t.new(function(p17, p18) --[[ line: 252 ]]
			-- upvalues: p16 (copy), list (ref), var20 (ref)
			spawn(function() --[[ line: 253 ]]
				-- upvalues: p16 (copy), list (copy), var20 (copy), p17 (ref), p18 (ref)
				local ok, status = pcall(p16, unpack(list, 1, var20))
				
				if ok then
					p17(status)
					
					return
				end
				p18(status)
			end)
		end)
	end
end

function t:getStatus() --[[ line: 266 ]]
	return self._status
end

function t:andThen(p19, p20) --[[ line: 274 ]]
	-- upvalues: t (ref), wpcallPacked (ref)
	self._unhandledRejection = false
	
	return t.new(function(p21, p22) --[[ line: 278 ]]
		-- upvalues: p19 (ref), wpcallPacked (copy), p20 (ref), self (ref), t (copy)
		local var21 = p21
		
		if p19 then
			local var22 = p19
			
			var21 = function(...) --[[ line: 49 ]]
				-- upvalues: wpcallPacked (copy), var22 (ref), p21 (ref), p22 (ref)
				local var7, var8 = wpcallPacked(var22, ...)
				
				if var8[1] then
					p21(unpack(var8, 2, var7))
					
					return
				end
				p22(unpack(var8, 2, var7))
			end
		end
		local var23 = p22
		
		if p20 then
			local var24 = p20
			
			var23 = function(...) --[[ line: 49 ]]
				-- upvalues: wpcallPacked (copy), var24 (ref), p21 (ref), p22 (ref)
				local var7, var8 = wpcallPacked(var24, ...)
				
				if var8[1] then
					p21(unpack(var8, 2, var7))
					
					return
				end
				p22(unpack(var8, 2, var7))
			end
		end
		if self._status == t.Status.Started then
			table.insert(self._queuedResolve, var21)
			table.insert(self._queuedReject, var23)
			
			return
		elseif self._status == t.Status.Resolved then
			var21(unpack(self._values, 1, self._valuesLength))
			
			return
		elseif self._status == t.Status.Rejected then
			var23(unpack(self._values, 1, self._valuesLength))
		end
	end)
end

function t:catch(p23) --[[ line: 309 ]]
	return self:andThen(nil, p23)
end

function t:await() --[[ line: 317 ]]
	-- upvalues: t (ref)
	self._unhandledRejection = false
	
	if self._status == t.Status.Started then
		local var25 = nil
		local var26 = nil
		local bindableEvent = Instance.new("BindableEvent")
		self:andThen(function(...) --[[ line: 325 ]]
			-- upvalues: var25 (write), var26 (write), bindableEvent (ref)
			var25 = { ... }
			var26 = select("#", ...)
			bindableEvent:Fire(true)
		end, function(...) --[[ line: 329 ]]
			-- upvalues: var25 (write), var26 (write), bindableEvent (ref)
			var25 = { ... }
			var26 = select("#", ...)
			bindableEvent:Fire(false)
		end)
		local var28 = bindableEvent.Event:Wait()
		bindableEvent:Destroy()
		
		return var28, unpack(var25, 1, var26)
	elseif self._status == t.Status.Resolved then
		return true, unpack(self._values, 1, self._valuesLength)
	elseif self._status == t.Status.Rejected then
		return false, unpack(self._values, 1, self._valuesLength)
	end
end

function t:_resolve(...) --[[ line: 346 ]]
	-- upvalues: t (ref)
	if self._status ~= t.Status.Started then return end
	local var29 = select("#", ...)
	
	if t.is(...) then
		if var29 > 1 then
			warn(("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s"):format(self._source))
		end;
		(...):andThen(function(...) --[[ line: 363 ]]
			-- upvalues: self (ref)
			self:_resolve(...)
		end, function(...) --[[ line: 365 ]]
			-- upvalues: self (ref)
			self:_reject(...)
		end)
		
		return
	else
		self._status = t.Status.Resolved
		self._values = { ... }
		self._valuesLength = var29
		
		for i, v in ipairs(self._queuedResolve) do
			v(...)
		end
	end
end

function t:_reject(...) --[[ line: 382 ]]
	-- upvalues: t (ref)
	if self._status ~= t.Status.Started then return end
	self._status = t.Status.Rejected
	self._values = { ... }
	self._valuesLength = select("#", ...)
	
	if next(self._queuedReject) == nil then
		self._unhandledRejection = true
		local var30 = tostring(...)
		spawn(function() --[[ line: 406 ]]
			-- upvalues: self (ref), var30 (ref)
			if self._unhandledRejection then
				warn(("Unhandled promise rejection:\n\n%s\n\n%s"):format(var30, self._source))
				
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