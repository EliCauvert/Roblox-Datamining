local AllCommands = {}

local function _(Value)
	-- upvalues: AllCommands (ref)
	AllCommands = Value
end

return function(p1)
	-- upvalues: AllCommands (ref)
	if p1 then
		AllCommands = p1
	end
	return AllCommands
end