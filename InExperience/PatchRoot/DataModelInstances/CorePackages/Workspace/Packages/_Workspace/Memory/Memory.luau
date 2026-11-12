local MemoryTrackerModule = require(script.Common.MemoryTracker)
local MemoryShellModule = require(script.Profiling.MemoryShell)
local FFlagEnableMemoryShellModule = require(script.Flags.FFlagEnableMemoryShell)

return {
	["jest.config"] = script["jest.config"],
	MemoryTracker = MemoryTrackerModule,
	MemoryScope = require(script.Common.MemoryScope),
	start = function(p1, p2, p3)
		-- upvalues: MemoryTrackerModule (copy), FFlagEnableMemoryShellModule (copy), MemoryShellModule (copy)
		if p1 then
			local MemoryTrackerModuleResult = MemoryTrackerModule(p2, p3)
			
			if MemoryTrackerModuleResult then
				MemoryTrackerModuleResult:start()
			end
		end
		if FFlagEnableMemoryShellModule then
			MemoryShellModule:start()
		end
	end
}