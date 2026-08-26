local dispatchBindableEventModule = require(script.Parent.DispatchBindableEvent)

return function(p1)
	-- upvalues: dispatchBindableEventModule (ref)
	dispatchBindableEventModule.Event:Connect(function(p2)
		-- upvalues: p1 (ref)
		p1:dispatch(p2)
	end)
	dispatchBindableEventModule:SetAttribute("isConnected", true)
	
	return dispatchBindableEventModule
end