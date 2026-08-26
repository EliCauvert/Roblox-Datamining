local signalsModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.Signals)
local tbl = setmetatable({}, { __mode = "v" })

local function _(value, p1)
	-- upvalues: signalsModule (ref)
	local var1 = value[p1]
	
	if var1 then
		return var1
	end
	local var2, var3 = signalsModule.createSignal(nil)
	local t = { get = var2, set = var3 }
	value[p1] = t
	
	return t
end

return function(p1)
	-- upvalues: tbl (ref), signalsModule (ref)
	local var1 = tbl[p1]
	
	if var1 then
		return var1
	end
	local t = {}
	local t_1 = {
		get = function(p2)
			-- upvalues: t (ref), signalsModule (copy)
			local var2
			local var3 = t[p2]
			
			if var3 then
				var2 = var3
			else
				local var4, var5 = signalsModule.createSignal(nil)
				local t_1 = { get = var4, set = var5 }
				t[p2] = t_1
				var2 = t_1
			end
			return var2.get(false)
		end,
		set = function(value, p2)
			-- upvalues: t (ref), signalsModule (copy)
			local var2
			local var3 = t[value]
			
			if var3 then
				var2 = var3
			else
				local var4, var5 = signalsModule.createSignal(nil)
				local t_1 = { get = var4, set = var5 }
				t[value] = t_1
				var2 = t_1
			end
			var2.set(p2)
		end,
		getSignal = function(value)
			-- upvalues: t (ref), signalsModule (copy)
			local var2
			local var3 = t[value]
			
			if var3 then
				var2 = var3
			else
				local var4, var5 = signalsModule.createSignal(nil)
				local t_1 = { get = var4, set = var5 }
				t[value] = t_1
				var2 = t_1
			end
			return var2.get
		end
	}
	tbl[p1] = t_1
	
	return t_1
end