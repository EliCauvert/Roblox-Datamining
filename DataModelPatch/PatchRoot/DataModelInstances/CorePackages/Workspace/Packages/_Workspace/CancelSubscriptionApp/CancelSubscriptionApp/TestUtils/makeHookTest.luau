local ReactModule = require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.React)

return function(Callback1, Callback)
	-- upvalues: ReactModule (copy)
	return function()
		-- upvalues: Callback1 (copy), Callback (copy), ReactModule (upval)
		Callback((Callback1()))
		
		return ReactModule.createElement("Frame")
	end
end