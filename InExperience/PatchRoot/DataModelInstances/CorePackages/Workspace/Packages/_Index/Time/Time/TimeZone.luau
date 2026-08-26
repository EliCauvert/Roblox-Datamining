local tbl = setmetatable({}, {
	__index = function(_, p1)
		error(("Invalid TimeZone \"%s\""):format(tostring(p1)), 2)
	end
})
tbl.UTC = -2
tbl.Current = -1

return tbl