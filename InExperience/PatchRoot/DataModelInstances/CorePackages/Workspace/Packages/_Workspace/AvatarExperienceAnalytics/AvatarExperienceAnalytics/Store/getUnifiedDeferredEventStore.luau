local signalsModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.Signals)
local createSignal = signalsModule.createSignal

return signalsModule.createComputed(function() --[[ line: 18 | named "createUnifiedLoggingDeferredEventStore" ]]
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(false)
	local t = {}
	
	return {
		isEntered = var1,
		enqueue = function(p0, p1) --[[ line: 24 ]]
			-- upvalues: t (write)
			local var4 = t[p0]
			
			if not var4 then
				var4 = {}
				t[p0] = var4
			end
			table.insert(var4, p1)
		end,
		takePending = function(p2) --[[ line: 32 ]]
			-- upvalues: t (write)
			if p2 ~= nil then
				local var5 = t[p2] or {}
				t[p2] = nil
				
				return var5
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
		markEntered = function() --[[ line: 48 ]]
			-- upvalues: var2 (ref)
			var2(true)
		end,
		reset = function() --[[ line: 51 ]]
			-- upvalues: var2 (ref), t (write)
			var2(false)
			t = {}
		end
	}
end)