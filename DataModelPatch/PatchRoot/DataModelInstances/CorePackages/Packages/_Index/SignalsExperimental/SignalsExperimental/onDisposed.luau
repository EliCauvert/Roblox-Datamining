local _ = require(script.Parent.Parent.Signals)

return function(Callback: (any) -> (), Callback1)
	Callback(function(_, p1): number
		-- upvalues: Callback1 (copy)
		if p1 then
			Callback1()
		end
		return 0
	end)
end