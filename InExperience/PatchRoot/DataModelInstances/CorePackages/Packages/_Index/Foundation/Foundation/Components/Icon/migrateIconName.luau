local migration = require(script:FindFirstAncestor("Foundation").Parent.BuilderIcons).Migration

return function(p1)
	-- upvalues: migration (ref)
	return migration.uiblox[p1]
end