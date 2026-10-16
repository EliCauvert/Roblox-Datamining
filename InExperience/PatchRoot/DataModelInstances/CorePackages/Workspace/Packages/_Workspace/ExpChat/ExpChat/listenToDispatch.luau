return function(BindableEvent) --[[ Line: 1 ]]
	return function(Callback) --[[ Line: 2 ]]
		-- upvalues: BindableEvent (copy)
		BindableEvent.Event:Connect(Callback)
	end
end