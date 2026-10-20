local ReactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)

return function(Callback, Callback1, p1)
	-- upvalues: ReactModule (copy)
	return function()
		-- upvalues: Callback (copy), Callback1 (copy), ReactModule (upval), p1 (copy)
		local CallbackResult = Callback()
		Callback1(CallbackResult)
		
		return ReactModule.createElement("Frame", {
			Name = "HookFrame",
			Position = UDim2.fromOffset(100, 100),
			Size = UDim2.fromOffset(100, 100),
			ref = if p1 then CallbackResult[p1] else nil
		})
	end
end