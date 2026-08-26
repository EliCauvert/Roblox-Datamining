local t = {}

local function _(value)
	-- upvalues: t (write)
	t = value
end

return function(p1)
	-- upvalues: t (write)
	if p1 then
		t = p1
	end
	return t
end