local bindableEvent = Instance.new("BindableEvent")

return {
	purchaseCompletedEvent = bindableEvent.Event,
	firePurchaseCompleted = function()
		-- upvalues: bindableEvent (ref)
		bindableEvent:Fire()
	end
}