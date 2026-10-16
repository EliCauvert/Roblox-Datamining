local _ = require(script:FindFirstAncestor("ReactUtils").Parent.GoodSignal)
local UseEventConnectionModule = require(script.Parent.useEventConnection)

return function(p1) --[[ Line: 26 | Named "EventConnection" ]]
	-- upvalues: UseEventConnectionModule (copy)
	UseEventConnectionModule(p1.event, p1.callback, { p1.event, p1.callback })
end