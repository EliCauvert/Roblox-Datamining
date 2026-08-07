local memoryTrackerModule = require(script.Common.MemoryTracker)
local memoryScopeModule = require(script.Common.MemoryScope)
local memoryShellModule = require(script.Profiling.MemoryShell)
local fFlagEnableMemoryShellModule = require(script.Flags.FFlagEnableMemoryShell)

return {
	["jest.config"] = script["jest.config"],
	MemoryTracker = memoryTrackerModule,
	MemoryScope = memoryScopeModule,
	start = function(p0, p1, p2) --[[ line: 6 ]]
		-- upvalues: memoryTrackerModule (ref), fFlagEnableMemoryShellModule (ref), memoryShellModule (ref)
		if p0 then
			local var4 = memoryTrackerModule(p1, p2)
			
			if var4 then
				var4:start()
			end
		end
		if fFlagEnableMemoryShellModule then
			memoryShellModule:start()
		end
	end
}