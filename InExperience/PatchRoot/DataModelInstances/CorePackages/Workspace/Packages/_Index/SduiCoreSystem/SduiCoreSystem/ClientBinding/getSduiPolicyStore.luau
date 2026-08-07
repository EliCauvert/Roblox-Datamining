local parent = script:FindFirstAncestor("SduiCoreSystem").Parent
local signalsModule = require(parent.Signals)
local _ = require(parent.UniversalAppPolicy)

local function _() --[[ line: 13 | named "createSduiPolicyStore" ]]
	-- upvalues: signalsModule (ref)
	local var2, var3 = signalsModule.createSignal(nil)
	
	return { getAppPolicy = var2, setAppPolicy = var3 }
end

local var1 = nil

return function() --[[ line: 24 | named "getSduiPolicyStore" ]]
	-- upvalues: var1 (write), signalsModule (ref)
	if var1 == nil then
		local var4, var5 = signalsModule.createSignal(nil)
		var1 = { getAppPolicy = var4, setAppPolicy = var5 }
	end
	return var1
end