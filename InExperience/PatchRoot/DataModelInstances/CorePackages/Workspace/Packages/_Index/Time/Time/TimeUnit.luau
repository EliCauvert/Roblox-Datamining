local tbl = setmetatable({}, {
	__index = function(_, p0)
		error(("Invalid TimeUnit \"%s\""):format(tostring(p0)), 2)
	end
})
tbl.Seconds = "Seconds"
tbl.Minutes = "Minutes"
tbl.Hours = "Hours"
tbl.Days = "Days"
tbl.Months = "Months"
tbl.Years = "Years"
tbl.Weeks = "Weeks"

return tbl