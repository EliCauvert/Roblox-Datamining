return function()
	local Events = {}
	
	return {
		mockEventReceiver = {
			observeEvent = function(_, Key, p1)
				-- upvalues: Events (copy)
				Events[Key] = p1
			end
		},
		events = Events
	}
end