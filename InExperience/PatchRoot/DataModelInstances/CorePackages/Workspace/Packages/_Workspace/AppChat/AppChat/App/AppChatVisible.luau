local bindableEvent = Instance.new("BindableEvent")

return {
	BindableEvent = bindableEvent,
	setAppChatVisible = function(value) --[[ line: 3 ]]
		-- upvalues: bindableEvent (ref)
		bindableEvent:Fire(value)
	end
}