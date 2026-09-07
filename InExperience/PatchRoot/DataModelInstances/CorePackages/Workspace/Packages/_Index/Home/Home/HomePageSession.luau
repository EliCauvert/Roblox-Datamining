local httpService = game:GetService("HttpService")
local signalsModule = require(script:FindFirstAncestor("Home").Parent.Signals)

local function _()
	-- upvalues: httpService (ref)
	return httpService:GenerateGUID(false):lower()
end

local var1 = ""
local var2, var3 = signalsModule.createSignal(nil)

return {
	Get = function(_)
		-- upvalues: var1 (write), httpService (ref)
		if var1 == "" then
			var1 = httpService:GenerateGUID(false):lower()
		end
		return var1
	end,
	Refresh = function(_)
		-- upvalues: var1 (write), httpService (ref)
		var1 = httpService:GenerateGUID(false):lower()
		
		return var1
	end,
	Commit = function(p1, p2)
		-- upvalues: var2 (ref), var3 (ref)
		local var4 = p1:Get()
		local var5 = var2(false)
		
		if var5 == nil or var5.sessionId ~= var4 then
			var3({ sessionId = var4, requestId = p2 })
			
			return true
		end
		return false
	end,
	GetCommitted = function(_)
		-- upvalues: var2 (ref)
		return var2(false)
	end,
	GetCommittedSignal = function(_)
		-- upvalues: var2 (ref)
		return var2
	end
}