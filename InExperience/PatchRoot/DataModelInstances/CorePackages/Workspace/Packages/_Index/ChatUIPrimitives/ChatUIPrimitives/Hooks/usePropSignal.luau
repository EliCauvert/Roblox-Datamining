local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local useStableSignalModule = require(script.Parent.useStableSignal)

return function(value)
	-- upvalues: useStableSignalModule (ref), reactModule (ref)
	local var1, var2 = useStableSignalModule(value)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), value (ref), var2 (ref)
		if var1(false) ~= value then
			var2(value)
		end
	end, { value, var1, var2 })
	
	return var1
end