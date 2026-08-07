local t = {}

local function _(value) --[[ line: 2 | named "setAllCommands" ]]
	-- upvalues: t (write)
	t = value
end

return function(p0) --[[ line: 6 ]]
	-- upvalues: t (write)
	if p0 then
		t = p0
	end
	return t
end