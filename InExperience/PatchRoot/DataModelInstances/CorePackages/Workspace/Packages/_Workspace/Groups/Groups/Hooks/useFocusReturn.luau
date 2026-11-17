local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)

return function(Enabled)
	-- upvalues: ReactModule (copy), SignalsModule (copy)
	local UseRefResult = ReactModule.useRef(Enabled)
	local UseStateResult = ReactModule.useState(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(0)
		
		return { get = Signal, set = Signal2 }
	end)
	ReactModule.useEffect(function()
		-- upvalues: Enabled (copy), UseRefResult (copy), UseStateResult (copy)
		if Enabled == true and UseRefResult.current == false then
			UseStateResult.set(UseStateResult.get(false) + 1)
		end
		UseRefResult.current = Enabled
	end, { Enabled, UseStateResult })
	
	return UseStateResult.get
end