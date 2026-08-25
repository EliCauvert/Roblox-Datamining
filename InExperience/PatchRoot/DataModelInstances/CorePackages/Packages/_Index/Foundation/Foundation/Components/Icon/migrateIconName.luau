local migration = require(script:FindFirstAncestor("Foundation").Parent.BuilderIcons).Migration

return function(p0)
	-- upvalues: migration (ref)
	return migration.uiblox[p0]
end