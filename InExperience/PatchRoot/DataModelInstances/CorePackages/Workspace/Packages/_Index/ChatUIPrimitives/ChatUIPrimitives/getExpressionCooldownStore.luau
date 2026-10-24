local CreateExpressionCooldownStoreModule = require(script.Parent.createExpressionCooldownStore)
local ExpressionCooldownStoreModule = require(script.Parent.expressionCooldownStore)
local Tbl = {}

return {
	getExpressionCooldownStore = function(Key)
		-- upvalues: ExpressionCooldownStoreModule (copy), Tbl (copy), CreateExpressionCooldownStoreModule (copy)
		if Key == nil then
			return ExpressionCooldownStoreModule
		end
		local Entry = Tbl[Key]
		
		if Entry == nil then
			Entry = CreateExpressionCooldownStoreModule()
			Tbl[Key] = Entry
		end
		return Entry
	end,
	_resetForTesting = function()
		-- upvalues: ExpressionCooldownStoreModule (copy), Tbl (copy)
		ExpressionCooldownStoreModule._resetForTesting()
		table.clear(Tbl)
	end
}