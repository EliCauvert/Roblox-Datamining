local _ = require(script:FindFirstAncestor("ReactUtils").Parent.GoodSignal)
local useEventConnectionModule = require(script.Parent.useEventConnection)

return function(p0)
	-- upvalues: useEventConnectionModule (ref)
	useEventConnectionModule(p0.event, p0.callback, { p0.event, p0.callback })
end