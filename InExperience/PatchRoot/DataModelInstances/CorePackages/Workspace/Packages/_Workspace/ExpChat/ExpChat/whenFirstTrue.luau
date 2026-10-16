local SignalsModule = require(script:FindFirstAncestor("ExpChat").Parent.Signals)

return function(Callback, Callback1) --[[ Line: 6 | Named "whenFirstTrue" ]]
	-- upvalues: SignalsModule (copy)
	local Flag = false
	
	return SignalsModule.createEffect(function(p1) --[[ Line: 8 ]]
		-- upvalues: Flag (ref), Callback (copy), Callback1 (copy)
		if not Flag and Callback(p1) then
			Flag = true
			Callback1()
			
			return
		end
	end)
end