local Migration = require(script:FindFirstAncestor("Foundation").Parent.BuilderIcons).Migration

return function(p1)
	-- upvalues: Migration (copy)
	return Migration.uiblox[p1]
end