local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local PropSpecModule = require(RecycledInlineLayout.Definitions.PropSpec)
local _ = require(RecycledInlineLayout.Types)
local ElementsModule = require(RecycledInlineLayout.Definitions.Elements)

return function(p1)
	-- upvalues: PropSpecModule (copy), ElementsModule (copy)
	local Frozen = table.freeze({
		type = "SpanDefinition",
		name = p1.name,
		props = PropSpecModule.normalize(p1.name, p1.props or {}),
		inherit = table.freeze(table.clone(p1.inherit or {})),
		state = table.freeze(table.clone(p1.state or {})),
		decoration = p1.decoration
	})
	
	return function(p2, p3)
		-- upvalues: ElementsModule (upval), Frozen (copy)
		return ElementsModule.createSpanElement(Frozen, p2, p3)
	end, Frozen
end