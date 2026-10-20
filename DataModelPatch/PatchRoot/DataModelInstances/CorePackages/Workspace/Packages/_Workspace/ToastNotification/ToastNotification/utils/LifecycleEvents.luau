return {
	ToastEvents = {
		AttemptDisplay = "ToastNotifications.displayToastNotification",
		Display = "ToastNotifications.displayedToastNotification",
		Update = "ToastNotifications.updatedToastNotification",
		UserAction = "ToastNotifications.UserActionOnToastNotification"
	},
	RegisteredCallbacks = {},
	DispatchEvent = function(p1, p2, p3, p4)
		local RegisteredCallbackEntry = p1.RegisteredCallbacks[p3] and p1.RegisteredCallbacks[p3][p2]
		
		if RegisteredCallbackEntry then
			for i in RegisteredCallbackEntry do
				task.spawn(i, p4)
			end
		end
	end,
	RemoveCallback = function(p5, p6, p7, Key)
		local RegisteredCallbackEntry = p5.RegisteredCallbacks[p7] and p5.RegisteredCallbacks[p7][p6]
		
		if not RegisteredCallbackEntry then return end
		RegisteredCallbackEntry[Key] = nil
		
		if not next(RegisteredCallbackEntry) then
			p5.RegisteredCallbacks[p7][p6] = nil
			
			if not next(p5.RegisteredCallbacks[p7]) then
				p5.RegisteredCallbacks[p7] = nil
			end
		end
	end,
	RegisterCallback = function(p5, p6, p7, p8)
		if not p5.RegisteredCallbacks[p7] then
			p5.RegisteredCallbacks[p7] = {}
		end
		if not p5.RegisteredCallbacks[p7][p6] then
			p5.RegisteredCallbacks[p7][p6] = {}
		end
		p5.RegisteredCallbacks[p7][p6][p8] = true
		
		return function()
			-- upvalues: p5 (copy), p6 (copy), p7 (copy), p8 (copy)
			p5:RemoveCallback(p6, p7, p8)
		end
	end
}