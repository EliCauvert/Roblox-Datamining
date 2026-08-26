local _ = require(script:FindFirstAncestor("ReactUtils").Parent.GoodSignal)
local useEventConnectionModule = require(script.Parent.useEventConnection)

return function(p1)
	-- upvalues: useEventConnectionModule (ref)
	useEventConnectionModule(p1.event, p1.callback, { p1.event, p1.callback })
end