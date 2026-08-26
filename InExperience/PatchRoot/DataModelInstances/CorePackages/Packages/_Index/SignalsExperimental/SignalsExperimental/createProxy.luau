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
	local var5 = createComputed(function(p2)
		-- upvalues: var3 (ref), t (ref)
		var3(p2)
		local var6 = 0
		
		for i, v in ipairs(t) do
			if v.getter(false) ~= nil then
				var6 += 1
			end
		end
		return var6
	end)
	
	local function nextSignal(value, p3)
		while true do
			local var7, var8 = next(value, p3)
			if var7 ~= nil then
				if var8 == nil then continue end
				local ter = var8.getter(false)
				
				if ter ~= nil then
					return var7, ter
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
		__call = function(_, p4)
			-- upvalues: var5 (ref), var3 (ref), t (ref), createSignal (copy)
			local function nextSignal(value, p5)
				-- upvalues: p4 (ref)
				while true do
					local var9, var10 = next(value, p5)
					if var9 ~= nil then
						if var10 == nil then continue end
						local ter = var10.getter(p4)
						
						if ter ~= nil then
							return var9, ter
						end
					end
					return nil
				end
			end
			
			return setmetatable({}, table.freeze({
				__metatable = false,
				__len = function()
					-- upvalues: var5 (copy), p4 (ref)
					return var5(p4)
				end,
				__iter = function()
					-- upvalues: var3 (copy), p4 (ref), nextSignal (ref), t (copy)
					var3(p4)
					
					return nextSignal, t
				end,
				__index = function(_, p6)
					-- upvalues: t (copy), p4 (ref), createSignal (copy)
					local var11 = t[p6]
					
					if var11 == nil then
						if p4 == nil then
							return nil
						end
						local var12 = nil
						local var13, var14 = createSignal(function()
							-- upvalues: var12 (ref)
							return var12
						end)
						var11 = { getter = var13, setter = var14 }
						t[p6] = var11
					end
					return var11.getter(p4)
				end,
				__newindex = function(_, p6, p7)
					error(`attempt to update read-only store at {p6} with {p7}`, 2)
				end
			}))
		end,
		__iter = function()
			-- upvalues: nextSignal (ref), t (ref)
			return nextSignal, t
		end,
		__index = function(_, p5)
			-- upvalues: t (ref)
			local var9 = t[p5]
			
			return if var9 == nil then nil else var9.getter(false)
		end,
		__newindex = function(_, p5, p6)
			-- upvalues: t (ref), createSignal (copy), var4 (ref), batch (copy)
			local var9 = t[p5]
			
			if var9 ~= nil then
				local ter = var9.getter(false)
				
				if ter ~= p6 then
					batch(function()
						-- upvalues: var9 (write), p6 (ref), ter (ref), var4 (copy)
						var9.setter(function()
							-- upvalues: p6 (copy)
							return p6
						end)
						
						if ter == nil or p6 == nil then
							var4()
						end
					end)
				end
			elseif p6 ~= nil then
				local var10, var11 = createSignal(function()
					-- upvalues: p6 (ref)
					return p6
				end)
				t[p5] = { getter = var10, setter = var11 }
				var4()
			end
		end
	}))
end