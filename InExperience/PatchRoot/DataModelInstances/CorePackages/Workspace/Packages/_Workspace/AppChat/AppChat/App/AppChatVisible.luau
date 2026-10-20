local BindableEvent = Instance.new("BindableEvent")

return {
	BindableEvent = BindableEvent,
	setAppChatVisible = function(p1)
		-- upvalues: BindableEvent (copy)
		BindableEvent:Fire(p1)
	end
}