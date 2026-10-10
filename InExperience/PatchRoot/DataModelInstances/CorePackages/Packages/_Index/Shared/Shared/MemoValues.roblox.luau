local t = {}

return {
	pack = function(...)
		-- upvalues: t (ref)
		return if select("#", ...) == 1 then ... else setmetatable(table.pack(...), t)
	end,
	unpack = function(p1)
		-- upvalues: t (ref)
		return if type(p1) == "table" and rawequal(getmetatable(p1), t) then table.unpack(p1, 1, p1.n) else p1
	end
}