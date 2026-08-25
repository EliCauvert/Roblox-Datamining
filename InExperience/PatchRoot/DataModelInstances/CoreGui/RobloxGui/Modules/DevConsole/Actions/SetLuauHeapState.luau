local _ = require(script.Parent.Parent.Components.LuauHeap.LuauHeapTypes)

return require(script.Parent.Parent.Action)(script.Name, function(p0, p1)
	return { isClientState = p0, sessionState = p1 }
end)