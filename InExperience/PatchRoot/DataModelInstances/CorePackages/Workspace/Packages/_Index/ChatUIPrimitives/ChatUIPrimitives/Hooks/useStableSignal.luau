local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)

return function(value) --[[ line: 21 | named "useStableSignal" ]]
	-- upvalues: reactModule (ref), signalsModule (ref)
	local var2 = reactModule.useRef(nil)
	
	if var2.current == nil then
		local var3, var4 = signalsModule.createSignal(value)
		var2.current = { get = var3, set = var4 }
	end
	local current = var2.current
	
	return current.get, current.set
end