local _ = require(script.Parent.Parent.Signals)

return function(Callback: (any) -> (), Callback1) --[[ Line: 7 | Named "onDisposed" ]]
	Callback(function(_, p1): number --[[ Line: 8 | Named "source" ]]
		-- upvalues: Callback1 (copy)
		if p1 then
			Callback1()
		end
		return 0
	end)
end