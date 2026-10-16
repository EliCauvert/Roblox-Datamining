local _ = require(script.Parent.Parent.Components.LuauHeap.LuauHeapTypes)

return require(script.Parent.Parent.Action)(script.Name, function(IsClientState, SessionState) --[[ Line: 8 ]]
	return {
		isClientState = IsClientState,
		sessionState = SessionState
	}
end)