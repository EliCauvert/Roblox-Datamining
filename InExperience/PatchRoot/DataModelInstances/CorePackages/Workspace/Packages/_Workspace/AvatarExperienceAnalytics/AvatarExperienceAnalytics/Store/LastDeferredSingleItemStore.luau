local Snapshot = nil

return {
	setSnapshot = function(Value) --[[ Line: 10 ]]
		-- upvalues: Snapshot (ref)
		Snapshot = Value
	end,
	getSnapshot = function() --[[ Line: 14 ]]
		-- upvalues: Snapshot (ref)
		return Snapshot
	end,
	clearSnapshot = function() --[[ Line: 18 ]]
		-- upvalues: Snapshot (ref)
		Snapshot = nil
	end
}