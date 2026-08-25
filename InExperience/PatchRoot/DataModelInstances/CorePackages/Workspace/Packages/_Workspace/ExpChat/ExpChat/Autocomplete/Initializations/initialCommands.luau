local t = {}

local function _(value)
	-- upvalues: t (write)
	t = value
end

return function(p0)
	-- upvalues: t (write)
	if p0 then
		t = p0
	end
	return t
end