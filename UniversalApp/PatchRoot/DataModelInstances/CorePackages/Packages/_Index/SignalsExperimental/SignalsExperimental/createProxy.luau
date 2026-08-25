local parent = script.Parent.Parent
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local batch = require(parent.SignalsScheduler).batch

local function _(value)
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(function()
		-- upvalues: value (ref)
		return value
	end)
	
	return { getter = var1, setter = var2 }
end

return function(p1)
	-- upvalues: createSignal (ref), createComputed (ref), batch (ref)
	local t = {}
	
	for i, v in p1 do
		local var1, var2 = createSignal(function()
			-- upvalues: v (ref)
			return v
		end)
		t[i] = { getter = var1, setter = var2 }
	end
	local var3, var4 = createSignal(nil, function()
		return false
	end)
	local var5 = createComputed(function(p1)
		-- upvalues: var3 (ref), t (ref)
		var3(p1)
		local var1 = 0
		
		for i, v in ipairs(t) do
			if v.getter(false) ~= nil then
				var1 += 1
			end
		end
		return var1
	end)
	
	local function nextSignal(value, p1)
		while true do
			local var1, var2 = next(value, p1)
			if var1 ~= nil then
				if var2 == nil then continue end
				local ter = var2.getter(false)
				
				if ter ~= nil then
					return var1, ter
				end
			end
			return nil
		end
	end
	
	return setmetatable({}, table.freeze({
		__metatable = false,
		__len = function()
			-- upvalues: var5 (ref)
			return var5(false)
		end,
		__call = function(_, p1)
			-- upvalues: var5 (ref), var3 (ref), t (ref), createSignal (copy)
			local function nextSignal(value, p1)
				-- upvalues: p1 (ref)
				while true do
					local var1, var2 = next(value, p1)
					if var1 ~= nil then
						if var2 == nil then continue end
						local ter = var2.getter(p1)
						
						if ter ~= nil then
							return var1, ter
						end
					end
					return nil
				end
			end
			
			return setmetatable({}, table.freeze({
				__metatable = false,
				__len = function()
					-- upvalues: var5 (copy), p1 (ref)
					return var5(p1)
				end,
				__iter = function()
					-- upvalues: var3 (copy), p1 (ref), nextSignal (ref), t (copy)
					var3(p1)
					
					return nextSignal, t
				end,
				__index = function(_, p1)
					-- upvalues: t (copy), p1 (ref), createSignal (copy)
					local var1 = t[p1]
					
					if var1 == nil then
						if p1 == nil then
							return nil
						end
						local var2 = nil
						local var3, var4 = createSignal(function()
							-- upvalues: var2 (ref)
							return var2
						end)
						var1 = { getter = var3, setter = var4 }
						t[p1] = var1
					end
					return var1.getter(p1)
				end,
				__newindex = function(_, p1, p2)
					error(`attempt to update read-only store at {p1} with {p2}`, 2)
				end
			}))
		end,
		__iter = function()
			-- upvalues: nextSignal (ref), t (ref)
			return nextSignal, t
		end,
		__index = function(_, p1)
			-- upvalues: t (ref)
			local var1 = t[p1]
			
			return if var1 == nil then nil else var1.getter(false)
		end,
		__newindex = function(_, p1, p2)
			-- upvalues: t (ref), createSignal (copy), var4 (ref), batch (copy)
			local var1 = t[p1]
			
			if var1 ~= nil then
				local ter = var1.getter(false)
				
				if ter ~= p2 then
					batch(function()
						-- upvalues: var1 (write), p2 (ref), ter (ref), var4 (copy)
						var1.setter(function()
							-- upvalues: p2 (copy)
							return p2
						end)
						
						if ter == nil or p2 == nil then
							var4()
						end
					end)
				end
			elseif p2 ~= nil then
				local var2, var3 = createSignal(function()
					-- upvalues: p2 (ref)
					return p2
				end)
				t[p1] = { getter = var2, setter = var3 }
				var4()
			end
		end
	}))
end