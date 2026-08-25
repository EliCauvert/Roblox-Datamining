local createEffect = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createEffect
local _ = require(script.Parent.types)
local t = {}

return function(a, b, p0)
	-- upvalues: t (ref), createEffect (ref)
	local t_1 = {}
	local var2 = false
	local var3 = false
	
	local function _()
		-- upvalues: var3 (write), t (copy), t_1 (ref)
		if var3 then return end
		var3 = true
		local var7 = t[t_1]
		t[t_1] = nil
		
		if var7 ~= nil then
			var7()
		end
	end
	
	local _ = function(value)
		-- upvalues: var2 (write), var3 (write), t (copy), t_1 (ref), b (ref), p0 (ref)
		if var2 then return end
		var2 = true
		
		if not var3 then
			var3 = true
			local var8 = t[t_1]
			t[t_1] = nil
			
			if var8 ~= nil then
				var8()
			end
		end
		if value.status == "succeeded" and b then
			b(value.result)
			
			return
		elseif value.status == "failed" and p0 then
			p0(value.error or "request failed", value.errorCode)
		end
	end
	
	local var4 = a(false)
	
	if var4.status == "pending" then
		local _ = nil
		local var6 = createEffect(function(p1)
			-- upvalues: a (ref), var2 (write), var3 (write), t (copy), t_1 (ref), b (ref), p0 (ref)
			local var9 = a(p1)
			
			if var9.status == "pending" then return end
			if var2 then return end
			var2 = true
			
			if not var3 then
				var3 = true
				local var10 = t[t_1]
				t[t_1] = nil
				
				if var10 ~= nil then
					var10()
				end
			end
			if var9.status == "succeeded" and b then
				b(var9.result)
				
				return
			elseif var9.status == "failed" and p0 then
				p0(var9.error or "request failed", var9.errorCode)
			end
		end)
		
		if var3 then
			var6()
		else
			t[t_1] = var6
		end
		return
	else
		var2 = true
		var3 = true
		local var5 = t[t_1]
		t[t_1] = nil
		
		if var5 ~= nil then
			var5()
		end
		if var4.status == "succeeded" and b then
			b(var4.result)
		elseif var4.status == "failed" and p0 then
			p0(var4.error or "request failed", var4.errorCode)
		end
	end
end