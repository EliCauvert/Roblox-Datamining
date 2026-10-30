local CommonMark = script:FindFirstAncestor("CommonMark")
local BlockContinueModule = require(CommonMark.parser.block.BlockContinue)
local _ = require(CommonMark.parser.block.BlockParserFactory)
local BlockStartModule = require(CommonMark.parser.block.BlockStart)
local ListItemParserModule = require(CommonMark.internal.ListItemParser)
local _ = require(CommonMark.parser.block.MatchedBlockParser)
local _ = require(CommonMark.node.Node)
local NodesModule = require(CommonMark.node.Nodes)
local _ = require(CommonMark.parser.block.ParserState)
local ParsingModule = require(CommonMark.internal.util.Parsing)
local ByteFunction = string.byte
local CharFunction = string.char
local SubFunction = string.sub
local self = setmetatable({}, {
	__index = require(CommonMark.parser.block.AbstractBlockParser)
})
self.__index = self

function self.new(_block)
	-- upvalues: self (copy)
	return (setmetatable({
		_hadBlankLine = false,
		_linesAfterBlank = 0,
		_block = _block
	}, self))
end

function self:isContainer(): boolean
	return true
end

function self:canContain(p1): boolean
	if p1.kind ~= "ListItem" then
		return false
	end
	if self._hadBlankLine and self._linesAfterBlank == 1 then
		self._block.tight = false
		self._hadBlankLine = false
	end
	return true
end

function self:getBlock()
	return self._block
end

function self:tryContinue(p1)
	-- upvalues: BlockContinueModule (copy)
	if p1:isBlank() then
		self._hadBlankLine = true
		self._linesAfterBlank = 0
	elseif self._hadBlankLine then
		self._linesAfterBlank += 1
	end
	return BlockContinueModule.atIndex(p1:getIndex())
end

local Module = {}
Module.__index = Module

function Module.new(ListBlock, ContentColumn)
	-- upvalues: Module (copy)
	return (setmetatable({ listBlock = ListBlock, contentColumn = ContentColumn }, Module))
end

local Module1 = {}
Module1.__index = Module1

function Module1.new(ListBlock, IndexAfterMarker)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		listBlock = ListBlock,
		indexAfterMarker = IndexAfterMarker
	}, Module1))
end

local function _(p1, p2: number): boolean
	-- upvalues: ByteFunction (copy)
	if p2 < #p1 then
		local ByteResult = ByteFunction(p1, p2 + 1)
		
		return ByteResult == 32 or ByteResult == 9
	else
		return true
	end
end

local function parseOrderedList(p1, p2: number)
	-- upvalues: ByteFunction (copy), SubFunction (copy), NodesModule (copy), CharFunction (copy), Module1 (copy)
	local Count = 0
	local ByteResult = nil
	
	for i = p2, #p1 - 1 do
		ByteResult = ByteFunction(p1, i + 1)
		
		if ByteResult >= 48 and ByteResult <= 57 then
			Count += 1
			
			if Count > 9 then
				return nil
			end
		else
			if ByteResult ~= 46 and ByteResult ~= 41 then
				return nil
			end
			if Count >= 1 then
				local NewI = i + 1
				local IsByteResultMatch = nil
				
				if NewI < #p1 then
					local ByteResult1 = ByteFunction(p1, NewI + 1)
					IsByteResultMatch = ByteResult1 == 32 or ByteResult1 == 9
				else
					IsByteResultMatch = true
				end
				if IsByteResultMatch then
					local OrderedListResult = NodesModule.OrderedList()
					OrderedListResult.markerStartNumber = tonumber((SubFunction(p1, p2 + 1, i)))
					OrderedListResult.markerDelimiter = CharFunction(ByteResult)
					
					return Module1.new(OrderedListResult, i + 1)
				end
			end
			return nil
		end
	end
	return nil
end

local function parseListMarker(p3, p4: number)
	-- upvalues: ByteFunction (copy), NodesModule (copy), CharFunction (copy), Module1 (copy), parseOrderedList (copy)
	local ByteResult = ByteFunction(p3, p4 + 1)
	
	if ByteResult ~= 45 and ByteResult ~= 43 and ByteResult ~= 42 then
		return parseOrderedList(p3, p4)
	end
	local v1 = p4 + 1
	local IsByteResultMatch = nil
	
	if v1 < #p3 then
		local ByteResult1 = ByteFunction(p3, v1 + 1)
		IsByteResultMatch = ByteResult1 == 32 or ByteResult1 == 9
	else
		IsByteResultMatch = true
	end
	if IsByteResultMatch then
		local BulletListResult = NodesModule.BulletList()
		BulletListResult.marker = CharFunction(ByteResult)
		
		return Module1.new(BulletListResult, p4 + 1)
	else
		return nil
	end
end

local function parseList(Content, NextNonSpaceIndex, NewColumn, p3)
	-- upvalues: parseListMarker (copy), ByteFunction (copy), ParsingModule (copy), Module (copy)
	local ParseListMarkerResult = parseListMarker(Content, NextNonSpaceIndex)
	
	if ParseListMarkerResult == nil then
		return nil
	end
	local ListBlock = ParseListMarkerResult.listBlock
	local IndexAfterMarker = ParseListMarkerResult.indexAfterMarker
	local NewNewColumn = NewColumn + (IndexAfterMarker - NextNonSpaceIndex)
	local NewColumnsToNextTabStopResult: number = NewNewColumn
	local Flag = false
	
	for i = IndexAfterMarker, #Content - 1 do
		local ByteResult = ByteFunction(Content, i + 1)
		
		if ByteResult == 9 then
			NewColumnsToNextTabStopResult += ParsingModule.columnsToNextTabStop(NewColumnsToNextTabStopResult)
		else
			if ByteResult ~= 32 then
				Flag = true
				break
			end
			NewColumnsToNextTabStopResult += 1
		end
	end
	if p3 then
		if ListBlock.kind == "OrderedList" and ListBlock.markerStartNumber ~= 1 then
			return nil
		end
		if not Flag then
			return nil
		end
	end
	if not Flag or ParsingModule.CODE_BLOCK_INDENT < NewColumnsToNextTabStopResult - NewNewColumn then
		NewColumnsToNextTabStopResult = NewNewColumn + 1
	end
	return Module.new(ListBlock, NewColumnsToNextTabStopResult)
end

local _ = function(p4, p5): boolean
	return if p4.kind == "BulletList" and p5.kind == "BulletList" then p4.marker == p5.marker else p4.kind == "OrderedList" and p5.kind == "OrderedList" and p4.markerDelimiter == p5.markerDelimiter
end

local Module2 = {}
Module2.__index = Module2

function Module2.new()
	-- upvalues: Module2 (copy)
	return (setmetatable({}, Module2))
end

function Module2:tryStart(p4, p5)
	-- upvalues: ParsingModule (copy), BlockStartModule (copy), parseList (copy), ListItemParserModule (copy), self (copy)
	local MatchedBlockParser = p5:getMatchedBlockParser()
	
	if ParsingModule.CODE_BLOCK_INDENT <= p4:getIndent() then
		return BlockStartModule.none()
	end
	local ParseListResult = parseList(p4:getLine():getContent(), p4:getNextNonSpaceIndex(), p4:getColumn() + p4:getIndent(), not p5:getParagraphLines():isEmpty())
	
	if ParseListResult == nil then
		return BlockStartModule.none()
	end
	local ContentColumn = ParseListResult.contentColumn
	local NewListItemParser = ListItemParserModule.new(p4:getIndent(), ContentColumn - p4:getColumn())
	
	if getmetatable(MatchedBlockParser) == self then
		local Block = MatchedBlockParser:getBlock()
		local ListBlock = ParseListResult.listBlock
		
		if if Block.kind == "BulletList" and ListBlock.kind == "BulletList" then Block.marker == ListBlock.marker else Block.kind == "OrderedList" and ListBlock.kind == "OrderedList" and Block.markerDelimiter == ListBlock.markerDelimiter then
			return BlockStartModule.of(NewListItemParser):atColumn(ContentColumn)
		end
	end
	ParseListResult.listBlock.tight = true
	
	return BlockStartModule.of(self.new(ParseListResult.listBlock), NewListItemParser):atColumn(ContentColumn)
end

self.Factory = Module2

return self