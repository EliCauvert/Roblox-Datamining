local GetInventorySearchKeyModule = require(script.Parent.getInventorySearchKey)

return function(p1, p2): string
	-- upvalues: GetInventorySearchKeyModule (copy)
	return `{GetInventorySearchKeyModule(p1)}-{p2}`
end