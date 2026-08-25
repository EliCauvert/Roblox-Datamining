local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local useStableSignalModule = require(script.Parent.useStableSignal)

return function(value)
	-- upvalues: useStableSignalModule (ref), reactModule (ref)
	local var2, var3 = useStableSignalModule(value)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), value (ref), var3 (ref)
		if var2(false) ~= value then
			var3(value)
		end
	end, { value, var2, var3 })
	
	return var2
end