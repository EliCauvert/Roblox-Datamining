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

return function(p0)
	-- upvalues: createSignal (ref), createComputed (ref), batch (ref)
	local t = {}
	
	for i, v in p0 do
		local var8, var9 = createSignal(function()
			-- upvalues: v (ref)
			return v
		end)
		t[i] = { getter = var8, setter = var9 }
	end
	local var4, var5 = createSignal(nil, function()
		return false
	end)
	local var6 = createComputed(function(p1)
		-- upvalues: var4 (ref), t (ref)
		var4(p1)
		local var10 = 0
		
		for i, v in ipairs(t) do
			if v.getter(false) ~= nil then
				var10 += 1
			end
		end
		return var10
	end)
	
	local function nextSignal(value, p2)
		while true do
			local var11, var12 = next(value, p2)
			if var11 ~= nil then
				if var12 == nil then continue end
				local ter = var12.getter(false)
				
				if ter ~= nil then
					return var11, ter
				end
			end
			return nil
		end
	end
	
	return setmetatable({}, table.freeze({
		__metatable = false,
		__len = function()
			-- upvalues: var6 (ref)
			return var6(false)
		end,
		__call = function(_, p3)
			-- upvalues: var6 (ref), var4 (ref), t (ref), createSignal (copy)
			local function nextSignal(value, p4)
				-- upvalues: p3 (ref)
				while true do
					local var15, var16 = next(value, p4)
					if var15 ~= nil then
						if var16 == nil then continue end
						local ter = var16.getter(p3)
						
						if ter ~= nil then
							return var15, ter
						end
					end
					return nil
				end
			end
			
			return setmetatable({}, table.freeze({
				__metatable = false,
				__len = function()
					-- upvalues: var6 (copy), p3 (ref)
					return var6(p3)
				end,
				__iter = function()
					-- upvalues: var4 (copy), p3 (ref), nextSignal (ref), t (copy)
					var4(p3)
					
					return nextSignal, t
				end,
				__index = function(_, p5)
					-- upvalues: t (copy), p3 (ref), createSignal (copy)
					local var18 = t[p5]
					
					if var18 == nil then
						if p3 == nil then
							return nil
						end
						local var19 = nil
						local var20, var21 = createSignal(function()
							-- upvalues: var19 (ref)
							return var19
						end)
						var18 = { getter = var20, setter = var21 }
						t[p5] = var18
					end
					return var18.getter(p3)
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
		__index = function(_, p8)
			-- upvalues: t (ref)
			local var22 = t[p8]
			
			return if var22 == nil then nil else var22.getter(false)
		end,
		__newindex = function(_, p9, p10)
			-- upvalues: t (ref), createSignal (copy), var5 (ref), batch (copy)
			local var23 = t[p9]
			
			if var23 ~= nil then
				local ter = var23.getter(false)
				
				if ter ~= p10 then
					batch(function()
						-- upvalues: var23 (write), p10 (ref), ter (ref), var5 (copy)
						var23.setter(function()
							-- upvalues: p10 (copy)
							return p10
						end)
						
						if ter == nil or p10 == nil then
							var5()
						end
					end)
				end
			elseif p10 ~= nil then
				local var24, var25 = createSignal(function()
					-- upvalues: p10 (ref)
					return p10
				end)
				t[p9] = { getter = var24, setter = var25 }
				var5()
			end
		end
	}))
end