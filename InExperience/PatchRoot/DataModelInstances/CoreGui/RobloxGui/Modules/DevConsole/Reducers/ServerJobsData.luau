local immutableModule = require(script.Parent.Parent.Immutable)
local serverJobsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ServerJobsUpdateSearchFilter)

return function(p0, p1)
	-- upvalues: serverJobsUpdateSearchFilterModule (ref), immutableModule (ref)
	p0 = p0 or { jobsSearchTerm = "" }
	
	return if p1.type == serverJobsUpdateSearchFilterModule.name then immutableModule.Set(p0, "jobsSearchTerm", p1.searchTerm) else p0
end