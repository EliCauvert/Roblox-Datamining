local BindableEvent = Instance.new("BindableEvent")

return {
	BindableEvent = BindableEvent,
	setAppChatVisible = function(p1) --[[ Line: 3 ]]
		-- upvalues: BindableEvent (copy)
		BindableEvent:Fire(p1)
	end
}