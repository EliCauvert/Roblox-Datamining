return {
	ToastEvents = {
		AttemptDisplay = "ToastNotifications.displayToastNotification",
		Display = "ToastNotifications.displayedToastNotification",
		Update = "ToastNotifications.updatedToastNotification",
		UserAction = "ToastNotifications.UserActionOnToastNotification"
	},
	RegisteredCallbacks = {},
	DispatchEvent = function(p1, p2, p3, p4)
		local var1 = p1.RegisteredCallbacks[p3] and p1.RegisteredCallbacks[p3][p2]
		
		if var1 then
			for i in var1 do
				task.spawn(i, p4)
			end
		end
	end,
	RemoveCallback = function(p5, p6, p7, p8)
		local var2 = p5.RegisteredCallbacks[p7] and p5.RegisteredCallbacks[p7][p6]
		
		if not var2 then return end
		var2[p8] = nil
		
		if not next(var2) then
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
			-- upvalues: p5 (ref), p6 (ref), p7 (ref), p8 (ref)
			p5:RemoveCallback(p6, p7, p8)
		end
	end
}