local Snapshot = nil

return {
	setSnapshot = function(Value)
		-- upvalues: Snapshot (ref)
		Snapshot = Value
	end,
	getSnapshot = function()
		-- upvalues: Snapshot (ref)
		return Snapshot
	end,
	clearSnapshot = function()
		-- upvalues: Snapshot (ref)
		Snapshot = nil
	end
}