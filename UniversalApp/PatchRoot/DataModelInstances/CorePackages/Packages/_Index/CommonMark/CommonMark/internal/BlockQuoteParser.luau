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
local ByteFunction = string.byte
local self = setmetatable({}, {
	__index = require(CommonMark.parser.block.AbstractBlockParser)
})
self.__index = self

function self.new()
	-- upvalues: NodesModule (copy), self (copy)
	return (setmetatable({ _block = NodesModule.BlockQuote() }, self))
end

local function _(p1, p2: number): boolean
	-- upvalues: ParsingModule (copy), ByteFunction (copy)
	local Content = p1:getLine():getContent()
	
	return p1:getIndent() < ParsingModule.CODE_BLOCK_INDENT and p2 < #Content and ByteFunction(Content, p2 + 1) == 62
end

function self:isContainer(): boolean
	return true
end

function self:canContain(_): boolean
	return true
end

function self:getBlock()
	return self._block
end

function self:tryContinue(p1)
	-- upvalues: ParsingModule (copy), ByteFunction (copy), CharactersModule (copy), BlockContinueModule (copy)
	local NextNonSpaceIndex: number = p1:getNextNonSpaceIndex()
	local Content = p1:getLine():getContent()
	
	if p1:getIndent() >= ParsingModule.CODE_BLOCK_INDENT or (NextNonSpaceIndex >= #Content or ByteFunction(Content, NextNonSpaceIndex + 1) ~= 62) then
		return BlockContinueModule.none()
	end
	local NewColumn = p1:getColumn() + p1:getIndent() + 1
	
	if CharactersModule.isSpaceOrTab(p1:getLine():getContent(), NextNonSpaceIndex + 1) then
		NewColumn += 1
	end
	return BlockContinueModule.atColumn(NewColumn)
end

local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({}, Module))
end

function Module:tryStart(p1, _)
	-- upvalues: ParsingModule (copy), ByteFunction (copy), CharactersModule (copy), BlockStartModule (copy), self (copy)
	local NextNonSpaceIndex: number = p1:getNextNonSpaceIndex()
	local Content = p1:getLine():getContent()
	
	if p1:getIndent() >= ParsingModule.CODE_BLOCK_INDENT or (NextNonSpaceIndex >= #Content or ByteFunction(Content, NextNonSpaceIndex + 1) ~= 62) then
		return BlockStartModule.none()
	end
	local NewColumn = p1:getColumn() + p1:getIndent() + 1
	
	if CharactersModule.isSpaceOrTab(p1:getLine():getContent(), NextNonSpaceIndex + 1) then
		NewColumn += 1
	end
	return BlockStartModule.of(self.new()):atColumn(NewColumn)
end

self.Factory = Module

return self