local responsibilityCatalogModule = require(script.Parent.ResponsibilityCatalog)
local t = { core = true, roblox = true, react = true }
local t_1 = {
	isolated = true,
	integrated = true,
	phased = true,
	hostBoundary = true
}

return {
	create = function(p1)
		-- upvalues: t (ref), responsibilityCatalogModule (ref), t_1 (ref)
		assert(p1.suite ~= "", "benchmark suite must not be empty")
		assert(p1.workload ~= "", "benchmark workload must not be empty")
		assert(t[p1.owner] == true, "benchmark owner must be explicit")
		assert(responsibilityCatalogModule.isKnown(p1.responsibility), "benchmark responsibility must be cataloged")
		assert(string.sub(p1.responsibility, 1, #p1.owner + 1) == p1.owner .. ".", "benchmark owner must match its responsibility")
		assert(t_1[p1.timingClass] == true, "benchmark timing class must be explicit")
		assert(p1.timing.operationsPerSample >= 1, "operationsPerSample must be positive")
		assert(type(p1.timing.includesSchedulerWaits) == "boolean", "benchmark scheduler-wait ownership must be explicit")
		assert(next(p1.arms) ~= nil, "benchmark record must contain at least one arm")
		
		for i, v in p1.arms do
			assert(type(v.medianMs) == "number", `benchmark arm {i} must contain a median`)
			assert(type(v.p95Ms) == "number", `benchmark arm {i} must contain a p95`)
		end
		assert(next(p1.evidence) ~= nil, "benchmark record must contain deterministic evidence")
		
		return {
			schemaVersion = 2,
			suite = p1.suite,
			layer = p1.layer,
			owner = p1.owner,
			responsibility = p1.responsibility,
			timingClass = p1.timingClass,
			workload = p1.workload,
			description = p1.description,
			scale = p1.scale,
			timing = p1.timing,
			arms = p1.arms,
			evidence = p1.evidence
		}
	end
}