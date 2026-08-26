local createSignal = require(script.Parent.Parent.Signals).createSignal
local _ = require(script.Parent.types)
local httpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: createSignal (ref), httpService (ref)
	local var1, var2 = createSignal(function()
		return { status = "pending" }
	end)
	local var3 = httpService:RequestInternal(p1)
	var3:Start(function(p2, p3)
		-- upvalues: var2 (ref)
		if p2 then
			var2({ status = "success", data = p3 })
			
			return
		end
		var2({ status = "error", error = p3 })
	end)
	
	return var1, function()
		-- upvalues: var3 (ref)
		var3:Cancel()
	end
end