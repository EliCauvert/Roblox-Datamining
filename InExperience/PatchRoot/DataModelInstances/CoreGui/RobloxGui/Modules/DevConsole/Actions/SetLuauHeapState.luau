local _ = require(script.Parent.Parent.Components.LuauHeap.LuauHeapTypes)

return require(script.Parent.Parent.Action)(script.Name, function(p1, p2)
	return { isClientState = p1, sessionState = p2 }
end)