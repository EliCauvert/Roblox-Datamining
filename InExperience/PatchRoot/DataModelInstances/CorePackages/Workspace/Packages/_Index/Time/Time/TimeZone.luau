local tbl = setmetatable({}, {
	__index = function(_, p0)
		error(("Invalid TimeZone \"%s\""):format(tostring(p0)), 2)
	end
})
tbl.UTC = -2
tbl.Current = -1

return tbl