local CommonMark = script:FindFirstAncestor("CommonMark")
local BlockContinueModule = require(CommonMark.parser.block.BlockContinue)
local DefinitionMapModule = require(CommonMark.node.DefinitionMap)
local _ = require(CommonMark.parser.InlineParser)
local LinkReferenceDefinitionParserModule = require(CommonMark.internal.LinkReferenceDefinitionParser)
local _ = require(CommonMark.node.Node)
local NodesModule = require(CommonMark.node.Nodes)
local _ = require(CommonMark.parser.block.ParserState)
local _ = require(CommonMark.parser.SourceLine)
local _ = require(CommonMark.parser.SourceLines)
local _ = require(CommonMark.node.SourceSpan)
local self = setmetatable({}, {
	__index = require(CommonMark.parser.block.AbstractBlockParser)
})
self.__index = self

function self.new(p1)
	-- upvalues: NodesModule (copy), LinkReferenceDefinitionParserModule (copy), self (copy)
	return (setmetatable({
		_block = NodesModule.Paragraph(),
		_linkReferenceDefinitionParser = LinkReferenceDefinitionParserModule.new(p1)
	}, self))
end

function self:canHaveLazyContinuationLines(): boolean
	return true
end

function self:getBlock()
	return self._block
end

function self:tryContinue(p1)
	-- upvalues: BlockContinueModule (copy)
	return if p1:isBlank() then BlockContinueModule.none() else BlockContinueModule.atIndex(p1:getIndex())
end

function self:addLine(p1)
	self._linkReferenceDefinitionParser:parse(p1)
end

function self:addSourceSpan(p1)
	self._linkReferenceDefinitionParser:addSourceSpan(p1)
end

function self.getDefinitions(p1)
	-- upvalues: DefinitionMapModule (copy)
	local LinkReferenceDefinition = DefinitionMapModule.new("LinkReferenceDefinition")
	
	for _, definition in ipairs(p1._linkReferenceDefinitionParser:getDefinitions()) do
		LinkReferenceDefinition:putIfAbsent(definition.label, definition)
	end
	return table.freeze({ LinkReferenceDefinition })
end

function self:closeBlock()
	for _, definition in ipairs(self._linkReferenceDefinitionParser:getDefinitions()) do
		self._block:insertBefore(definition)
	end
	if self._linkReferenceDefinitionParser:getParagraphLines():isEmpty() then
		self._block:unlink()
		
		return
	else
		self._block:setSourceSpans(self._linkReferenceDefinitionParser:getParagraphSourceSpans())
	end
end

function self:parseInlines(p2)
	local ParagraphLines = self._linkReferenceDefinitionParser:getParagraphLines()
	
	if not ParagraphLines:isEmpty() then
		p2:parse(ParagraphLines, self._block)
	end
end

function self:getParagraphLines()
	return self._linkReferenceDefinitionParser:getParagraphLines()
end

function self:removeLines(p2)
	return self._linkReferenceDefinitionParser:removeLines(p2)
end

return self