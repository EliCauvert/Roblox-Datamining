local DevShellModule = require(script:FindFirstAncestor("Memory").Parent.DevShell)
local MemoryTrackerModule = require(script.Parent.Parent.Common.MemoryTracker)
local GarbageCollectorModule = require(script.Parent.Parent.Common.GarbageCollector)

local function _()
	-- upvalues: MemoryTrackerModule (copy)
	return MemoryTrackerModule()
end

local Methods = {
	getLuaHeap = function()
		-- upvalues: GarbageCollectorModule (copy), MemoryTrackerModule (copy)
		GarbageCollectorModule.collect()
		local MemoryTrackerModuleResult = MemoryTrackerModule()
		
		return if MemoryTrackerModuleResult then MemoryTrackerModuleResult.getLuaHeapOnly() else { luaHeapMb = "-1" }
	end,
	getSnapshot = function()
		-- upvalues: GarbageCollectorModule (copy), MemoryTrackerModule (copy)
		GarbageCollectorModule.collect()
		local MemoryTrackerModuleResult = MemoryTrackerModule()
		
		return if MemoryTrackerModuleResult then MemoryTrackerModuleResult.getSnapshot() else { luaHeapMb = "-1" }
	end,
	forceGC = function(): string
		-- upvalues: GarbageCollectorModule (copy)
		GarbageCollectorModule.collect()
		
		return "ok"
	end
}

return {
	methods = Methods,
	start = function(Context)
		-- upvalues: DevShellModule (copy), Methods (copy)
		DevShellModule.registerMethods("memory", Methods)
		DevShellModule.start({ context = Context })
	end
}