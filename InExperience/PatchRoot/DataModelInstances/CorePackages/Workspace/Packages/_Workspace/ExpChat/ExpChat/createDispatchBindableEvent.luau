local dispatchBindableEventModule = require(script.Parent.DispatchBindableEvent)

return function(p0)
	-- upvalues: dispatchBindableEventModule (ref)
	dispatchBindableEventModule.Event:Connect(function(p1)
		-- upvalues: p0 (ref)
		p0:dispatch(p1)
	end)
	dispatchBindableEventModule:SetAttribute("isConnected", true)
	
	return dispatchBindableEventModule
end