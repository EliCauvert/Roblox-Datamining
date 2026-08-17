local signalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)
local createSignal = signalsModule.createSignal

return function() --[[ line: 37 | named "createToastStore" ]]
	-- upvalues: createSignal (ref), signalsModule (ref)
	local var1 = 0
	local var2, var3 = createSignal({})
	
	return {
		getToasts = var2,
		getToast = signalsModule.createComputed(function(p0) --[[ line: 73 ]]
			-- upvalues: var2 (ref)
			local var4 = var2(p0)
			
			return if #var4 == 0 then nil else var4[#var4].data
		end),
		triggerToast = function(p1) --[[ line: 41 ]]
			-- upvalues: var1 (write), var2 (ref), var3 (ref)
			var1 += 1
			local t = { id = var1, data = p1 }
			local var6 = var2(false)
			
			if #var6 >= 4 then
				local t_1 = {}
				
				for i = #var6 - 4 + 2, #var6 do
					table.insert(t_1, var6[i])
				end
				table.insert(t_1, t)
				var3(t_1)
			else
				local cloned = table.clone(var6)
				table.insert(cloned, t)
				var3(cloned)
			end
			return t.id
		end,
		dismissToast = function(p2) --[[ line: 62 ]]
			-- upvalues: var2 (ref), var3 (ref)
			local t = {}
			
			for i, v in var2(false) do
				if v.id ~= p2 then
					table.insert(t, v)
				end
			end
			var3(t)
		end
	}
end