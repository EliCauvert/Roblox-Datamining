local bindableEvent = Instance.new("BindableEvent")

return {
	purchaseCompletedEvent = bindableEvent.Event,
	firePurchaseCompleted = function() --[[ line: 15 ]]
		-- upvalues: bindableEvent (ref)
		bindableEvent:Fire()
	end
}