local httpService = game:GetService("HttpService")
local signalsModule = require(script:FindFirstAncestor("Home").Parent.Signals)

local function _()
	-- upvalues: httpService (ref)
	return httpService:GenerateGUID(false):lower()
end

local var2 = ""
local var3, var4 = signalsModule.createSignal(nil)

return {
	Get = function(_)
		-- upvalues: var2 (write), httpService (ref)
		if var2 == "" then
			var2 = httpService:GenerateGUID(false):lower()
		end
		return var2
	end,
	Refresh = function(_)
		-- upvalues: var2 (write), httpService (ref)
		var2 = httpService:GenerateGUID(false):lower()
		
		return var2
	end,
	Commit = function(p0, p1)
		-- upvalues: var3 (ref), var4 (ref)
		local var5 = p0:Get()
		local var6 = var3(false)
		
		if var6 == nil or var6.sessionId ~= var5 then
			var4({ sessionId = var5, requestId = p1 })
			
			return true
		end
		return false
	end,
	GetCommitted = function(_)
		-- upvalues: var3 (ref)
		return var3(false)
	end,
	GetCommittedSignal = function(_)
		-- upvalues: var3 (ref)
		return var3
	end
}