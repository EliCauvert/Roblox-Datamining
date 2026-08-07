local useEventConnectionModule = require(script.Parent.useEventConnection)

return function(p0) --[[ line: 20 | named "EventConnection" ]]
	-- upvalues: useEventConnectionModule (ref)
	useEventConnectionModule(p0.event, p0.callback, { p0.event, p0.callback })
end