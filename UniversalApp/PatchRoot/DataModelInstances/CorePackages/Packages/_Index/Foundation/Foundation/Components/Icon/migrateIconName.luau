local migration = require(script:FindFirstAncestor("Foundation").Parent.BuilderIcons).Migration

return function(p0) --[[ line: 7 | named "migrateIconName" ]]
	-- upvalues: migration (ref)
	return migration.uiblox[p0]
end