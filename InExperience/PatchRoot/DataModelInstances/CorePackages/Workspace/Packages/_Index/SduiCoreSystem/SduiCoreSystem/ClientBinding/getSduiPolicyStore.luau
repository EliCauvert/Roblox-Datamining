local Parent = script:FindFirstAncestor("SduiCoreSystem").Parent
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.UniversalAppPolicy)

local function _() --[[ Line: 13 | Named "createSduiPolicyStore" ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	
	return { getAppPolicy = Signal, setAppPolicy = Signal2 }
end

local Config = nil

return function() --[[ Line: 24 | Named "getSduiPolicyStore" ]]
	-- upvalues: Config (ref), SignalsModule (copy)
	if Config == nil then
		local Signal, Signal2 = SignalsModule.createSignal(nil)
		Config = { getAppPolicy = Signal, setAppPolicy = Signal2 }
	end
	return Config
end