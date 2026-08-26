local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local _ = require(dataHydration.DataHydrationTypes)

return function()
	-- upvalues: signalsModule (ref), cryoModule (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	local function _(value)
		-- upvalues: t (ref), t_1 (ref), signalsModule (copy)
		if not t[value] then
			local var1 = t
			local var2 = t_1
			local var3, var4 = signalsModule.createSignal(nil)
			var1[value] = var3
			var2[value] = var4
		end
		return t[value], t_1[value]
	end
	
	return {
		set = function(value, p1)
			-- upvalues: t (ref), t_1 (ref), signalsModule (copy), cryoModule (copy)
			if not t[value] then
				local var1 = t
				local var2 = t_1
				local var3, var4 = signalsModule.createSignal(nil)
				var1[value] = var3
				var2[value] = var4
			end
			local var5 = t_1[value]
			local var6 = t[value](false)
			
			if type(var6) == "table" and type(p1) == "table" then
				var5(cryoModule.Dictionary.union(var6, p1))
				
				return
			end
			var5(p1)
		end,
		clear = function(p1)
			-- upvalues: t_1 (ref), t_3 (write)
			if t_1[p1] then
				t_1[p1](nil)
			end
			t_3[p1] = nil
		end,
		has = function(p1)
			-- upvalues: t (ref)
			return if t[p1] then t[p1](false) ~= nil else false
		end,
		get = function(p1)
			-- upvalues: t (ref)
			return if t[p1] then t[p1](false) else nil
		end,
		markCommitted = function(p1)
			-- upvalues: t (ref), t_3 (write)
			if if not t[p1] then false else t[p1](false) ~= nil then
				t_3[p1] = true
			end
		end,
		isCommitted = function(p1)
			-- upvalues: t_3 (write)
			return t_3[p1] == true
		end,
		drainCommitted = function(p1, p2)
			-- upvalues: t_3 (write), t (ref), t_1 (ref)
			for i, v in p1 do
				if t_3[v] then
					local var1 = t[v] and t[v](false) or nil
					
					if var1 ~= nil then
						p2(v, var1)
					end
					if t_1[v] then
						t_1[v](nil)
					end
					t_3[v] = nil
				end
			end
		end,
		getMergedResult = function(p3, p4)
			-- upvalues: t_2 (write), t (ref), t_1 (ref), signalsModule (copy), cryoModule (copy)
			if t_2[p3] then
				return t_2[p3]
			elseif not t[p3] then
				local var2 = t
				local var3 = t_1
				local var4, var5 = signalsModule.createSignal(nil)
				var2[p3] = var4
				var3[p3] = var5
			end
			local var6 = t[p3]
			local _ = t_1[p3]
			t_2[p3] = {
				data = signalsModule.createComputed(function(p5)
					-- upvalues: var6 (ref), p4 (ref), cryoModule (copy)
					local var7 = var6(p5)
					local var8 = p4.data(p5)
					
					return if var7 == nil then var8 elseif type(var7) == "table" then cryoModule.Dictionary.join(if type(var8) == "table" then var8 else {}, var7) else var7
				end),
				status = p4.status
			}
			
			return t_2[p3]
		end,
		clearAll = function()
			-- upvalues: t_1 (ref), t_3 (write), t_2 (write)
			for i, v in t_1 do
				v(nil)
			end
			t_3 = {}
			t_2 = {}
		end
	}
end