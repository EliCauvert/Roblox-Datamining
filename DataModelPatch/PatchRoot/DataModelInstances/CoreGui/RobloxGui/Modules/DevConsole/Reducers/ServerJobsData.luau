local ImmutableModule = require(script.Parent.Parent.Immutable)
local ServerJobsUpdateSearchFilterModule = require(script.Parent.Parent.Actions.ServerJobsUpdateSearchFilter)

return function(p1, p2)
	-- upvalues: ServerJobsUpdateSearchFilterModule (copy), ImmutableModule (copy)
	local P0 = p1 or { jobsSearchTerm = "" }
	
	return if p2.type == ServerJobsUpdateSearchFilterModule.name then ImmutableModule.Set(P0, "jobsSearchTerm", p2.searchTerm) else P0
end