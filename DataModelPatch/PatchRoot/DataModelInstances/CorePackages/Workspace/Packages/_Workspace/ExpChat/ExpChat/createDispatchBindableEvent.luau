local DispatchBindableEventModule = require(script.Parent.DispatchBindableEvent)

return function(p1)
	-- upvalues: DispatchBindableEventModule (copy)
	DispatchBindableEventModule.Event:Connect(function(p2)
		-- upvalues: p1 (copy)
		p1:dispatch(p2)
	end)
	DispatchBindableEventModule:SetAttribute("isConnected", true)
	
	return DispatchBindableEventModule
end