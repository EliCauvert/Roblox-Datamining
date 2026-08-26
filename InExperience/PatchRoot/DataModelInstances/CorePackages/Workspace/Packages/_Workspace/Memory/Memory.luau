local memoryTrackerModule = require(script.Common.MemoryTracker)
local memoryScopeModule = require(script.Common.MemoryScope)
local memoryShellModule = require(script.Profiling.MemoryShell)
local fFlagEnableMemoryShellModule = require(script.Flags.FFlagEnableMemoryShell)

return {
	["jest.config"] = script["jest.config"],
	MemoryTracker = memoryTrackerModule,
	MemoryScope = memoryScopeModule,
	start = function(p1, p2, p3)
		-- upvalues: memoryTrackerModule (ref), fFlagEnableMemoryShellModule (ref), memoryShellModule (ref)
		if p1 then
			local var1 = memoryTrackerModule(p2, p3)
			
			if var1 then
				var1:start()
			end
		end
		if fFlagEnableMemoryShellModule then
			memoryShellModule:start()
		end
	end
}