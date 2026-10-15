local signalsModule = require(script:FindFirstAncestor("ExpChat").Parent.Signals)

return function(p1, p2)
	-- upvalues: signalsModule (ref)
	local var1 = false
	
	return signalsModule.createEffect(function(p3)
		-- upvalues: var1 (write), p1 (ref), p2 (ref)
		if var1 or not p1(p3) then
			return
		end
		var1 = true
		p2()
	end)
end