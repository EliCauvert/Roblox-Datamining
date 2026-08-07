local t = {}
t.__index = t

function t.new(p0) --[[ line: 56 ]]
	-- upvalues: t (ref)
	return setmetatable({
		type = p0.type or "default",
		category = p0.category,
		message = p0.message,
		data = p0.data,
		level = p0.level or "info",
		timestamp = p0.timestamp or os.time(),
		origin = p0.origin
	}, t)
end

return t