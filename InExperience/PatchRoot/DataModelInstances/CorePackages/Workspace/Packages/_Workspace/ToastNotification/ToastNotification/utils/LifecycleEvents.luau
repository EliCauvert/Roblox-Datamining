return {
	ToastEvents = {
		AttemptDisplay = "ToastNotifications.displayToastNotification",
		Display = "ToastNotifications.displayedToastNotification",
		Update = "ToastNotifications.updatedToastNotification",
		UserAction = "ToastNotifications.UserActionOnToastNotification"
	},
	RegisteredCallbacks = {},
	DispatchEvent = function(p0, p1, p2, p3) --[[ line: 12 ]]
		local var0 = p0.RegisteredCallbacks[p2] and p0.RegisteredCallbacks[p2][p1]
		
		if var0 then
			for i in var0 do
				task.spawn(i, p3)
			end
		end
	end,
	RemoveCallback = function(p4, p5, p6, p7) --[[ line: 22 ]]
		local var1 = p4.RegisteredCallbacks[p6] and p4.RegisteredCallbacks[p6][p5]
		
		if not var1 then return end
		var1[p7] = nil
		
		if not next(var1) then
			p4.RegisteredCallbacks[p6][p5] = nil
			
			if not next(p4.RegisteredCallbacks[p6]) then
				p4.RegisteredCallbacks[p6] = nil
			end
		end
	end,
	RegisterCallback = function(p8, p9, p10, p11) --[[ line: 37 ]]
		if not p8.RegisteredCallbacks[p10] then
			p8.RegisteredCallbacks[p10] = {}
		end
		if not p8.RegisteredCallbacks[p10][p9] then
			p8.RegisteredCallbacks[p10][p9] = {}
		end
		p8.RegisteredCallbacks[p10][p9][p11] = true
		
		return function() --[[ line: 45 ]]
			-- upvalues: p8 (ref), p9 (ref), p10 (ref), p11 (ref)
			p8:RemoveCallback(p9, p10, p11)
		end
	end
}