local createEffect = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createEffect
local _ = require(script.Parent.types)
local t = {}

return function(a, b, p1)
	-- upvalues: t (ref), createEffect (ref)
	local t_1 = {}
	local var1 = false
	local var2 = false
	
	local function _()
		-- upvalues: var2 (write), t (copy), t_1 (ref)
		if var2 then return end
		var2 = true
		local var3 = t[t_1]
		t[t_1] = nil
		
		if var3 ~= nil then
			var3()
		end
	end
	
	local _ = function(value)
		-- upvalues: var1 (write), var2 (write), t (copy), t_1 (ref), b (ref), p1 (ref)
		if var1 then return end
		var1 = true
		
		if not var2 then
			var2 = true
			local var3 = t[t_1]
			t[t_1] = nil
			
			if var3 ~= nil then
				var3()
			end
		end
		if value.status == "succeeded" and b then
			b(value.result)
			
			return
		elseif value.status == "failed" and p1 then
			p1(value.error or "request failed", value.errorCode)
		end
	end
	
	local var3 = a(false)
	
	if var3.status == "pending" then
		local _ = nil
		local var4 = createEffect(function(p2)
			-- upvalues: a (ref), var1 (write), var2 (write), t (copy), t_1 (ref), b (ref), p1 (ref)
			local var5 = a(p2)
			
			if var5.status == "pending" then return end
			if var1 then return end
			var1 = true
			
			if not var2 then
				var2 = true
				local var6 = t[t_1]
				t[t_1] = nil
				
				if var6 ~= nil then
					var6()
				end
			end
			if var5.status == "succeeded" and b then
				b(var5.result)
				
				return
			elseif var5.status == "failed" and p1 then
				p1(var5.error or "request failed", var5.errorCode)
			end
		end)
		
		if var2 then
			var4()
		else
			t[t_1] = var4
		end
		return
	else
		var1 = true
		var2 = true
		local var5 = t[t_1]
		t[t_1] = nil
		
		if var5 ~= nil then
			var5()
		end
		if var3.status == "succeeded" and b then
			b(var3.result)
		elseif var3.status == "failed" and p1 then
			p1(var3.error or "request failed", var3.errorCode)
		end
	end
end