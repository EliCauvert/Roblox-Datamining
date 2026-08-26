local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)

return function(value)
	-- upvalues: reactModule (ref), signalsModule (ref)
	local var1 = reactModule.useRef(nil)
	
	if var1.current == nil then
		local var2, var3 = signalsModule.createSignal(value)
		var1.current = { get = var2, set = var3 }
	end
	local current = var1.current
	
	return current.get, current.set
end