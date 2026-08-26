local parent = script:FindFirstAncestor("SduiCoreSystem").Parent
local signalsModule = require(parent.Signals)
local _ = require(parent.UniversalAppPolicy)

local function _()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	
	return { getAppPolicy = var1, setAppPolicy = var2 }
end

local var1 = nil

return function()
	-- upvalues: var1 (write), signalsModule (ref)
	if var1 == nil then
		local var2, var3 = signalsModule.createSignal(nil)
		var1 = { getAppPolicy = var2, setAppPolicy = var3 }
	end
	return var1
end