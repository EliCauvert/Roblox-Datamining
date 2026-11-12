local InventorySearchConstantsModule = require(script.Parent.Parent.InventorySearchConstants)

return function(Text): string
	-- upvalues: InventorySearchConstantsModule (copy)
	return InventorySearchConstantsModule.KeyPrefix .. Text
end