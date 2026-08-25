local bindableEvent = Instance.new("BindableEvent")

return {
	BindableEvent = bindableEvent,
	setAppChatVisible = function(value)
		-- upvalues: bindableEvent (ref)
		bindableEvent:Fire(value)
	end
}