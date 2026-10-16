local signalsModule = require(script:FindFirstAncestor("BuildExperience").Parent.Signals)

local function _(p1, p2)
	return if p1.priority == p2.priority then p2.order < p1.order else p2.priority < p1.priority
end

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal({})
	
	return {
		register = function(p1, p2, p3)
			-- upvalues: var2 (ref)
			local t = { priority = p2, order = p3 }
			var2(function(p4)
				-- upvalues: p1 (ref), t (ref)
				local cloned = table.clone(p4)
				cloned[p1] = t
				
				return cloned
			end)
		end,
		unregister = function(p1)
			-- upvalues: var2 (ref)
			var2(function(p2)
				-- upvalues: p1 (ref)
				if p2[p1] == nil then
					return p2
				end
				local cloned = table.clone(p2)
				cloned[p1] = nil
				
				return cloned
			end)
		end,
		getEmphasizedKey = signalsModule.createComputed(function(p1)
			-- upvalues: var1 (ref)
			local var3 = nil
			local var4 = nil
			
			for i, v in var1(p1) do
				if var4 == nil then
					var3 = i
					var4 = v
					continue
				end
				local var5
				local var6 = var4
				
				if v.priority == var6.priority then
					var5 = var6.order < v.order
				else
					var5 = var6.priority < v.priority
					var5 = nil
				end
				if var5 then
				end
			end
			return var3
		end)
	}
end