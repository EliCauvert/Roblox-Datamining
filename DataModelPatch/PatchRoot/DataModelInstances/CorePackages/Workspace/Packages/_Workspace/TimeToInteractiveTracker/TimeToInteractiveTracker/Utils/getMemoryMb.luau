local MemoryTrackerFunction = require(script:FindFirstAncestor("TimeToInteractiveTracker").Parent.Memory).MemoryTracker

return function()
	-- upvalues: MemoryTrackerFunction (copy)
	local MemoryTrackerResult = MemoryTrackerFunction()
	
	if MemoryTrackerResult then
		local Snapshot = MemoryTrackerResult.getSnapshot()
		
		return {
			totalMemoryMB = if Snapshot.totalMemory then tonumber(Snapshot.totalMemory) else nil,
			luaHeapMB = tonumber(Snapshot.luaHeapMb)
		}
	else
		return {}
	end
end