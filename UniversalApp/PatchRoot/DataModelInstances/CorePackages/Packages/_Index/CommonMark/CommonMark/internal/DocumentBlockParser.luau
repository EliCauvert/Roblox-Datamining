local CommonMark = script:FindFirstAncestor("CommonMark")
local BlockContinueModule = require(CommonMark.parser.block.BlockContinue)
local _ = require(CommonMark.node.Node)
local NodesModule = require(CommonMark.node.Nodes)
local _ = require(CommonMark.parser.block.ParserState)
local self = setmetatable({}, {
	__index = require(CommonMark.parser.block.AbstractBlockParser)
})
self.__index = self

function self.new()
	-- upvalues: NodesModule (copy), self (copy)
	return (setmetatable({ _document = NodesModule.Document() }, self))
end

function self:isContainer(): boolean
	return true
end

function self:canContain(_): boolean
	return true
end

function self:getBlock()
	return self._document
end

function self:tryContinue(p1)
	-- upvalues: BlockContinueModule (copy)
	return BlockContinueModule.atIndex(p1:getIndex())
end

return self