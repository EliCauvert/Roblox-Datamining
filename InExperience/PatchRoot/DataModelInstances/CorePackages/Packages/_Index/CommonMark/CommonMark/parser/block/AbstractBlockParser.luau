local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.parser.block.BlockParser)
local _ = require(CommonMark.node.DefinitionMap)
local _ = require(CommonMark.parser.InlineParser)
local _ = require(CommonMark.node.Node)
local _ = require(CommonMark.parser.SourceLine)
local _ = require(CommonMark.node.SourceSpan)
local Frozen = table.freeze({})

return {
	isContainer = function(_): boolean
		return false
	end,
	canHaveLazyContinuationLines = function(_): boolean
		return false
	end,
	canContain = function(_, _): boolean
		return false
	end,
	addLine = function(_, _) end,
	addSourceSpan = function(p1, p2)
		p1:getBlock():addSourceSpan(p2)
	end,
	getDefinitions = function(_)
		-- upvalues: Frozen (copy)
		return Frozen
	end,
	closeBlock = function(_) end,
	parseInlines = function(_, _) end
}