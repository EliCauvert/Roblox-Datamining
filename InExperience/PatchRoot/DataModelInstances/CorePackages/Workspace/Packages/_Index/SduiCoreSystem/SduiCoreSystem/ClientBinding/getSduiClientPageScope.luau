local signalsModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.Signals)
local tbl = setmetatable({}, { __mode = "v" })

local function _(value, p0)
	-- upvalues: signalsModule (ref)
	local var2 = value[p0]
	
	if var2 then
		return var2
	end
	local var3, var4 = signalsModule.createSignal(nil)
	local t = { get = var3, set = var4 }
	value[p0] = t
	
	return t
end

return function(p1)
	-- upvalues: tbl (ref), signalsModule (ref)
	local var6 = tbl[p1]
	
	if var6 then
		return var6
	end
	local t = {}
	local t_1 = {
		get = function(p2)
			-- upvalues: t (ref), signalsModule (copy)
			local var10
			local var9 = t[p2]
			
			if var9 then
				var10 = var9
			else
				local var11, var12 = signalsModule.createSignal(nil)
				local t_1 = { get = var11, set = var12 }
				t[p2] = t_1
				var10 = t_1
			end
			return var10.get(false)
		end,
		set = function(value, p3)
			-- upvalues: t (ref), signalsModule (copy)
			local var15
			local var14 = t[value]
			
			if var14 then
				var15 = var14
			else
				local var16, var17 = signalsModule.createSignal(nil)
				local t_1 = { get = var16, set = var17 }
				t[value] = t_1
				var15 = t_1
			end
			var15.set(p3)
		end,
		getSignal = function(value)
			-- upvalues: t (ref), signalsModule (copy)
			local var20
			local var19 = t[value]
			
			if var19 then
				var20 = var19
			else
				local var21, var22 = signalsModule.createSignal(nil)
				local t_1 = { get = var21, set = var22 }
				t[value] = t_1
				var20 = t_1
			end
			return var20.get
		end
	}
	tbl[p1] = t_1
	
	return t_1
end