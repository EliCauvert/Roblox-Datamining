local self = setmetatable({}, {
	__index = function(_, p1)
		error(("Invalid TimeZone \"%s\""):format((tostring(p1))), 2)
	end
})
self.UTC = -2
self.Current = -1

return self