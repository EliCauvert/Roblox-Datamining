local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)

return function(p1) --[[ Line: 21 | Named "useStableSignal" ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		local Signal, Signal2 = SignalsModule.createSignal(p1)
		UseRefResult.current = { get = Signal, set = Signal2 }
	end
	local Current = UseRefResult.current
	
	return Current.get, Current.set
end