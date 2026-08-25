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
			local var7 = t
			local var8 = t_1
			local var9, var10 = signalsModule.createSignal(nil)
			var7[value] = var9
			var8[value] = var10
		end
		return t[value], t_1[value]
	end
	
	return {
		set = function(value, p0)
			-- upvalues: t (ref), t_1 (ref), signalsModule (copy), cryoModule (copy)
			if not t[value] then
				local var11 = t
				local var12 = t_1
				local var13, var14 = signalsModule.createSignal(nil)
				var11[value] = var13
				var12[value] = var14
			end
			local var15 = t_1[value]
			local var16 = t[value](false)
			
			if type(var16) == "table" and type(p0) == "table" then
				var15(cryoModule.Dictionary.union(var16, p0))
				
				return
			end
			var15(p0)
		end,
		clear = function(p1)
			-- upvalues: t_1 (ref), t_3 (write)
			if t_1[p1] then
				t_1[p1](nil)
			end
			t_3[p1] = nil
		end,
		has = function(p2)
			-- upvalues: t (ref)
			return if t[p2] then t[p2](false) ~= nil else false
		end,
		get = function(p3)
			-- upvalues: t (ref)
			return if t[p3] then t[p3](false) else nil
		end,
		markCommitted = function(p4)
			-- upvalues: t (ref), t_3 (write)
			if if not t[p4] then false else t[p4](false) ~= nil then
				t_3[p4] = true
			end
		end,
		isCommitted = function(p5)
			-- upvalues: t_3 (write)
			return t_3[p5] == true
		end,
		drainCommitted = function(p6, p7)
			-- upvalues: t_3 (write), t (ref), t_1 (ref)
			for i, v in p6 do
				if t_3[v] then
					local var17 = t[v] and t[v](false) or nil
					
					if var17 ~= nil then
						p7(v, var17)
					end
					if t_1[v] then
						t_1[v](nil)
					end
					t_3[v] = nil
				end
			end
		end,
		getMergedResult = function(p8, p9)
			-- upvalues: t_2 (write), t (ref), t_1 (ref), signalsModule (copy), cryoModule (copy)
			if t_2[p8] then
				return t_2[p8]
			elseif not t[p8] then
				local var18 = t
				local var19 = t_1
				local var20, var21 = signalsModule.createSignal(nil)
				var18[p8] = var20
				var19[p8] = var21
			end
			local var22 = t[p8]
			local _ = t_1[p8]
			t_2[p8] = {
				data = signalsModule.createComputed(function(p10)
					-- upvalues: var22 (ref), p9 (ref), cryoModule (copy)
					local var23 = var22(p10)
					local var24 = p9.data(p10)
					
					return if var23 == nil then var24 elseif type(var23) == "table" then cryoModule.Dictionary.join(if type(var24) == "table" then var24 else {}, var23) else var23
				end),
				status = p9.status
			}
			
			return t_2[p8]
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