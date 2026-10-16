local AllCommands = {}

local function _(Value) --[[ Line: 2 | Named "setAllCommands" ]]
	-- upvalues: AllCommands (ref)
	AllCommands = Value
end

return function(p1) --[[ Line: 6 ]]
	-- upvalues: AllCommands (ref)
	if p1 then
		AllCommands = p1
	end
	return AllCommands
end