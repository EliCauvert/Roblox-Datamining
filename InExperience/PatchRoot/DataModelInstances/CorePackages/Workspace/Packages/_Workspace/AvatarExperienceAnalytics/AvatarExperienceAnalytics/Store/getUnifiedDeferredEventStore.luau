local signalsModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.Signals)
local createSignal = signalsModule.createSignal

return signalsModule.createComputed(function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(false)
	local t = {}
	
	return {
		isEntered = var1,
		enqueue = function(p1, p2)
			-- upvalues: t (write)
			local var3 = t[p1]
			
			if not var3 then
				var3 = {}
				t[p1] = var3
			end
			table.insert(var3, p2)
		end,
		takePending = function(p1)
			-- upvalues: t (write)
			if p1 ~= nil then
				local var3 = t[p1] or {}
				t[p1] = nil
				
				return var3
			end
			local t_1 = {}
			
			for i, v in t do
				for i_1, v_1 in v do
					table.insert(t_1, v_1)
				end
			end
			t = {}
			
			return t_1
		end,
		markEntered = function()
			-- upvalues: var2 (ref)
			var2(true)
		end,
		reset = function()
			-- upvalues: var2 (ref), t (write)
			var2(false)
			t = {}
		end
	}
end)