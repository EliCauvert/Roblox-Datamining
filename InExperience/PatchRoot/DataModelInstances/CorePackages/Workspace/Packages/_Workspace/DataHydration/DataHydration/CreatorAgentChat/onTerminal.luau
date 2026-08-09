local createEffect = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createEffect
local _ = require(script.Parent.types)

return function(a, b, p0) --[[ line: 15 | named "onTerminal" ]]
	-- upvalues: createEffect (ref)
	local var0 = nil
	var0 = createEffect(function(p1) --[[ line: 21 ]]
		-- upvalues: a (ref), b (ref), p0 (ref), var0 (write)
		local var1 = a(p1)
		
		if var1.status == "pending" then return end
		if var1.status == "succeeded" and b then
			b(var1.result)
		elseif var1.status == "failed" and p0 then
			p0(var1.error or "request failed", var1.errorCode)
		end
		if var0 then
			var0()
		end
	end)
end