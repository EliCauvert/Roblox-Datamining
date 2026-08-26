local withCursorMigration = require(script.Parent.Parent.Parent.Parent.Foundation).UNSTABLE.withCursorMigration

return function(p1)
	-- upvalues: withCursorMigration (ref)
	return withCursorMigration(p1)
end