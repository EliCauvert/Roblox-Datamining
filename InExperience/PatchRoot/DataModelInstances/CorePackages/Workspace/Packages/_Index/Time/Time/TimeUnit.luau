local self = setmetatable({}, {
	__index = function(_, p1) --[[ Line: 2 ]]
		error(("Invalid TimeUnit \"%s\""):format((tostring(p1))), 2)
	end
})
self.Seconds = "Seconds"
self.Minutes = "Minutes"
self.Hours = "Hours"
self.Days = "Days"
self.Months = "Months"
self.Years = "Years"
self.Weeks = "Weeks"

return self