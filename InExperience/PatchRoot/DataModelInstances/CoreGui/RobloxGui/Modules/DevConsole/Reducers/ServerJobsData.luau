local immutableModule = require(script.Parent.Parent.Immutable)
local serverJobsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ServerJobsUpdateSearchFilter)

return function(p1, p2)
	-- upvalues: serverJobsUpdateSearchFilterModule (ref), immutableModule (ref)
	p1 = p1 or { jobsSearchTerm = "" }
	
	return if p2.type == serverJobsUpdateSearchFilterModule.name then immutableModule.Set(p1, "jobsSearchTerm", p2.searchTerm) else p1
end