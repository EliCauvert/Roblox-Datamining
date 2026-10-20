return function(BindableEvent)
	return function(Callback)
		-- upvalues: BindableEvent (copy)
		BindableEvent.Event:Connect(Callback)
	end
end