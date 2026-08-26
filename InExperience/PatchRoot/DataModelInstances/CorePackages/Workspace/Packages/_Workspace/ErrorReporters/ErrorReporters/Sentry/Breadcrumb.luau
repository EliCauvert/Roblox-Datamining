local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	return setmetatable({
		type = p1.type or "default",
		category = p1.category,
		message = p1.message,
		data = p1.data,
		level = p1.level or "info",
		timestamp = p1.timestamp or os.time(),
		origin = p1.origin
	}, t)
end

return t