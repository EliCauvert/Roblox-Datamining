local CreateHeadShapeInventoryStoreModule = require(script.createHeadShapeInventoryStore)

return (require(game:GetService("CorePackages").Packages.Signals).createComputed(function(_)
	-- upvalues: CreateHeadShapeInventoryStoreModule (copy)
	return CreateHeadShapeInventoryStoreModule()
end))