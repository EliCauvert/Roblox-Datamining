local CommonMark = script:FindFirstAncestor("CommonMark")
local BlockContinueModule = require(CommonMark.parser.block.BlockContinue)
local _ = require(CommonMark.parser.block.BlockParserFactory)
local BlockStartModule = require(CommonMark.parser.block.BlockStart)
local CharactersModule = require(CommonMark.text.Characters)
local _ = require(CommonMark.parser.block.MatchedBlockParser)
local _ = require(CommonMark.node.Node)
local NodesModule = require(CommonMark.node.Nodes)
local _ = require(CommonMark.parser.block.ParserState)
local ParsingModule = require(CommonMark.internal.util.Parsing)
local _ = require(CommonMark.parser.SourceLine)
local self = setmetatable({}, {
	__index = require(CommonMark.parser.block.AbstractBlockParser)
})
self.__index = self

function self.new()
	-- upvalues: NodesModule (copy), self (copy)
	return (setmetatable({ _block = NodesModule.IndentedCodeBlock(), _lines = {} }, self))
end

function self:getBlock()
	return self._block
end

function self:tryContinue(p1)
	-- upvalues: ParsingModule (copy), BlockContinueModule (copy)
	return if ParsingModule.CODE_BLOCK_INDENT <= p1:getIndent() then BlockContinueModule.atColumn(p1:getColumn() + ParsingModule.CODE_BLOCK_INDENT) elseif p1:isBlank() then BlockContinueModule.atIndex(p1:getNextNonSpaceIndex()) else BlockContinueModule.none()
end

function self:addLine(p1)
	table.insert(self._lines, p1:getContent())
end

function self:closeBlock()
	-- upvalues: CharactersModule (copy)
	local Lines = self._lines
	local Count = #Lines - 1
	while Count >= 0 and CharactersModule.isBlank(Lines[Count + 1]) do
		Count -= 1
	end
	local List = {}
	local v1 = 0
	
	for i = 0, Count do
		local v2 = v1 + 1
		List[v2] = Lines[i + 1]
		v1 = v2 + 1
		List[v1] = "\n"
	end
	self._block.literal = table.concat(List)
end

local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({}, Module))
end

function Module:tryStart(p1, _)
	-- upvalues: ParsingModule (copy), BlockStartModule (copy), self (copy)
	return if ParsingModule.CODE_BLOCK_INDENT <= p1:getIndent() and not p1:isBlank() and p1:getActiveBlockParser():getBlock().kind ~= "Paragraph" then BlockStartModule.of(self.new()):atColumn(p1:getColumn() + ParsingModule.CODE_BLOCK_INDENT) else BlockStartModule.none()
end

self.Factory = Module

return self