local memoryTracker = require(script:FindFirstAncestor("TimeToInteractiveTracker").Parent.Memory).MemoryTracker

return function()
	-- upvalues: memoryTracker (ref)
	local var1 = memoryTracker()
	
	if var1 then
		local snapshot = var1.getSnapshot()
		
		return {
			totalMemoryMB = if snapshot.totalMemory then tonumber(snapshot.totalMemory) else nil,
			luaHeapMB = tonumber(snapshot.luaHeapMb)
		}
	end
	return {}
end