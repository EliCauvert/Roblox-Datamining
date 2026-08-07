local memoryTracker = require(script:FindFirstAncestor("TimeToInteractiveTracker").Parent.Memory).MemoryTracker

return function() --[[ line: 14 | named "getMemoryMb" ]]
	-- upvalues: memoryTracker (ref)
	local var0 = memoryTracker()
	
	if var0 then
		local snapshot = var0.getSnapshot()
		
		return {
			totalMemoryMB = if snapshot.totalMemory then tonumber(snapshot.totalMemory) else nil,
			luaHeapMB = tonumber(snapshot.luaHeapMb)
		}
	end
	return {}
end