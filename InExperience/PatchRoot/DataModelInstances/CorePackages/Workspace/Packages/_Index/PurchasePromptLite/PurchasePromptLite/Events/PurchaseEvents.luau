local BindableEvent = Instance.new("BindableEvent")

return {
	purchaseCompletedEvent = BindableEvent.Event,
	firePurchaseCompleted = function() --[[ Line: 15 ]]
		-- upvalues: BindableEvent (copy)
		BindableEvent:Fire()
	end
}