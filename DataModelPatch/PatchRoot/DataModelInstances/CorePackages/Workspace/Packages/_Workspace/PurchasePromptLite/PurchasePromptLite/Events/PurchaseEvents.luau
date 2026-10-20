local BindableEvent = Instance.new("BindableEvent")

return {
	purchaseCompletedEvent = BindableEvent.Event,
	firePurchaseCompleted = function()
		-- upvalues: BindableEvent (copy)
		BindableEvent:Fire()
	end
}