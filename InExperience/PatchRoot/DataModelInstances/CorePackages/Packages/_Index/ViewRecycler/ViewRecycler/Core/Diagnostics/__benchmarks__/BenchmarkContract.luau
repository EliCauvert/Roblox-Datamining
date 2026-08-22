local responsibilityCatalogModule = require(script.Parent.ResponsibilityCatalog)
local t = { core = true, roblox = true, react = true }
local t_1 = {
	isolated = true,
	integrated = true,
	phased = true,
	hostBoundary = true
}

return {
	create = function(p0) --[[ line: 46 ]]
		-- upvalues: t (ref), responsibilityCatalogModule (ref), t_1 (ref)
		assert(p0.suite ~= "", "benchmark suite must not be empty")
		assert(p0.workload ~= "", "benchmark workload must not be empty")
		assert(t[p0.owner] == true, "benchmark owner must be explicit")
		assert(responsibilityCatalogModule.isKnown(p0.responsibility), "benchmark responsibility must be cataloged")
		assert(string.sub(p0.responsibility, 1, #p0.owner + 1) == p0.owner .. ".", "benchmark owner must match its responsibility")
		assert(t_1[p0.timingClass] == true, "benchmark timing class must be explicit")
		assert(p0.timing.operationsPerSample >= 1, "operationsPerSample must be positive")
		assert(type(p0.timing.includesSchedulerWaits) == "boolean", "benchmark scheduler-wait ownership must be explicit")
		assert(next(p0.arms) ~= nil, "benchmark record must contain at least one arm")
		
		for i, v in p0.arms do
			assert(type(v.medianMs) == "number", `benchmark arm {i} must contain a median`)
			assert(type(v.p95Ms) == "number", `benchmark arm {i} must contain a p95`)
		end
		assert(next(p0.evidence) ~= nil, "benchmark record must contain deterministic evidence")
		
		return {
			schemaVersion = 2,
			suite = p0.suite,
			layer = p0.layer,
			owner = p0.owner,
			responsibility = p0.responsibility,
			timingClass = p0.timingClass,
			workload = p0.workload,
			description = p0.description,
			scale = p0.scale,
			timing = p0.timing,
			arms = p0.arms,
			evidence = p0.evidence
		}
	end
}