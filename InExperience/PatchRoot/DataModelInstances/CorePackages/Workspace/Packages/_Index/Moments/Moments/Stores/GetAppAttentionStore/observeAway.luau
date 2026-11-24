local SignalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)

return function(Callback, p1)
	-- upvalues: SignalsModule (copy)
	local CallbackResult = Callback(false)
	
	return SignalsModule.createEffect(function(p2)
		-- upvalues: Callback (copy), CallbackResult (ref), p1 (copy)
		local CallbackResult1 = Callback(p2)
		
		if CallbackResult1 == CallbackResult then return end
		CallbackResult = CallbackResult1
		
		if CallbackResult1 then
			p1.onLeave()
			
			return
		else
			p1.onReturn()
		end
	end)
end