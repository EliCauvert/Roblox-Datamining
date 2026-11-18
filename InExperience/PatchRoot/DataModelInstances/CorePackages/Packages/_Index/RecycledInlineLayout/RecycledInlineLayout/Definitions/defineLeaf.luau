local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local PropSpecModule = require(RecycledInlineLayout.Definitions.PropSpec)
local _ = require(RecycledInlineLayout.Types)
local ElementsModule = require(RecycledInlineLayout.Definitions.Elements)
local PoolsModule = require(RecycledInlineLayout.Definitions.pools)

return function(p1)
	-- upvalues: PropSpecModule (copy), PoolsModule (copy), ElementsModule (copy)
	assert(type(p1.measure) == "function", `{p1.name}: measure is required`)
	local NormalizeResult = PropSpecModule.normalize(p1.name, p1.props)
	
	for i, value in NormalizeResult do
		assert(value.layout ~= "split" or p1.split ~= nil, `{p1.name}.{i}: a split prop needs split`)
	end
	local Frozen = table.freeze({
		type = "LeafDefinition",
		name = p1.name,
		view = p1.view,
		props = NormalizeResult,
		measure = p1.measure,
		split = p1.split,
		canForceSplit = p1.canForceSplit == true,
		trimStart = p1.trimStart,
		trimEnd = p1.trimEnd,
		merge = p1.merge,
		pool = p1.pool
	})
	
	if p1.pool ~= nil then
		PoolsModule.register(Frozen)
	end
	return function(p2)
		-- upvalues: ElementsModule (upval), Frozen (copy)
		return ElementsModule.createLeafElement(Frozen, p2)
	end, Frozen
end