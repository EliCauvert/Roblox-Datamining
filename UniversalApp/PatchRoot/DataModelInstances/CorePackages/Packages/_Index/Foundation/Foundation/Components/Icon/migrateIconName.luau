local Migration = require(script:FindFirstAncestor("Foundation").Parent.BuilderIcons).Migration

return function(p1) --[[ Line: 7 | Named "migrateIconName" ]]
	-- upvalues: Migration (copy)
	return Migration.uiblox[p1]
end