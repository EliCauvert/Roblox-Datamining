local CommonMark = script:FindFirstAncestor("CommonMark")
local BlockContinueModule = require(CommonMark.parser.block.BlockContinue)
local _ = require(CommonMark.parser.block.BlockParserFactory)
local BlockStartModule = require(CommonMark.parser.block.BlockStart)
local CharactersModule = require(CommonMark.text.Characters)
local _ = require(CommonMark.parser.InlineParser)
local _ = require(CommonMark.parser.block.MatchedBlockParser)
local _ = require(CommonMark.node.Node)
local NodesModule = require(CommonMark.node.Nodes)
local _ = require(CommonMark.parser.block.ParserState)
local ParsingModule = require(CommonMark.internal.util.Parsing)
local ScannerModule = require(CommonMark.parser.beta.Scanner)
local _ = require(CommonMark.parser.SourceLine)
local SourceLinesModule = require(CommonMark.parser.SourceLines)
local ByteFunction = string.byte
local self = setmetatable({}, {
	__index = require(CommonMark.parser.block.AbstractBlockParser)
})
self.__index = self

function self.new(MatchMultipleResult, EmptyResult)
	-- upvalues: NodesModule (copy), self (copy)
	local HeadingResult = NodesModule.Heading()
	HeadingResult.level = MatchMultipleResult
	
	return (setmetatable({ _block = HeadingResult, _content = EmptyResult }, self))
end

function self:getBlock()
	return self._block
end

function self:tryContinue(_)
	-- upvalues: BlockContinueModule (copy)
	return BlockContinueModule.none()
end

function self:parseInlines(p1)
	p1:parse(self._content, self._block)
end

local function getAtxHeading(SubstringResult)
	-- upvalues: ScannerModule (copy), SourceLinesModule (copy), self (copy)
	local OfResult = ScannerModule.of(SourceLinesModule.of(SubstringResult))
	local MatchMultipleResult: number = OfResult:matchMultiple(35)
	
	if MatchMultipleResult == 0 or MatchMultipleResult > 6 then
		return nil
	end
	if not OfResult:hasNext() then
		return self.new(MatchMultipleResult, SourceLinesModule.empty())
	end
	local PeekResult = OfResult:peek()
	
	if PeekResult ~= 32 and PeekResult ~= 9 then
		return nil
	end
	OfResult:whitespace()
	local PositionResult = OfResult:position()
	local PositionResult1 = PositionResult
	local Flag = true
	while OfResult:hasNext() do
		local PeekResult1 = OfResult:peek()
		
		if PeekResult1 == 35 then
			if Flag then
				OfResult:matchMultiple(35)
				local WhitespaceResult: number = OfResult:whitespace()
				
				if OfResult:hasNext() then
					PositionResult1 = OfResult:position()
				end
				Flag = WhitespaceResult > 0
			else
				OfResult:next()
				PositionResult1 = OfResult:position()
			end
		elseif PeekResult1 == 32 or PeekResult1 == 9 then
			Flag = true
			OfResult:next()
		else
			Flag = false
			OfResult:next()
			PositionResult1 = OfResult:position()
		end
	end
	local Source = OfResult:getSource(PositionResult, PositionResult1)
	
	return if Source:getContent() == "" then self.new(MatchMultipleResult, SourceLinesModule.empty()) else self.new(MatchMultipleResult, Source)
end

local function _(p1, p2, p3): boolean
	-- upvalues: CharactersModule (copy)
	return #p1 <= CharactersModule.skipSpaceTab(p1, CharactersModule.skip(p3, p1, p2, #p1), #p1)
end

local _ = function(p1, p2: number): number
	-- upvalues: ByteFunction (copy), CharactersModule (copy)
	local ByteResult = ByteFunction(p1, p2 + 1)
	
	if ByteResult == 61 then
		if CharactersModule.skipSpaceTab(p1, CharactersModule.skip(61, p1, p2 + 1, #p1), #p1) >= #p1 then
			return 1
		end
	elseif ByteResult == 45 and CharactersModule.skipSpaceTab(p1, CharactersModule.skip(45, p1, p2 + 1, #p1), #p1) >= #p1 then
		return 2
	end
	return 0
end

local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({}, Module))
end

function Module:tryStart(p1, p2)
	-- upvalues: ParsingModule (copy), BlockStartModule (copy), ByteFunction (copy), getAtxHeading (copy), CharactersModule (copy), self (copy)
	if ParsingModule.CODE_BLOCK_INDENT <= p1:getIndent() then
		return BlockStartModule.none()
	end
	local Line = p1:getLine()
	local NextNonSpaceIndex: number = p1:getNextNonSpaceIndex()
	
	if ByteFunction(Line:getContent(), NextNonSpaceIndex + 1) == 35 then
		local AtxHeading = getAtxHeading(Line:substring(NextNonSpaceIndex, #Line:getContent()))
		
		if AtxHeading ~= nil then
			return BlockStartModule.of(AtxHeading):atIndex(#Line:getContent())
		end
	end
	local Content = Line:getContent()
	local ByteResult = ByteFunction(Content, NextNonSpaceIndex + 1)
	local Level = nil
	repeat
		if ByteResult == 61 then
			if CharactersModule.skipSpaceTab(Content, CharactersModule.skip(61, Content, NextNonSpaceIndex + 1, #Content), #Content) >= #Content then
				Level = 1
				break
			end
		elseif ByteResult == 45 and CharactersModule.skipSpaceTab(Content, CharactersModule.skip(45, Content, NextNonSpaceIndex + 1, #Content), #Content) >= #Content then
			Level = 2
			break
		end
		Level = 0
	until true
	if Level > 0 then
		local ParagraphLines = p2:getParagraphLines()
		
		if not ParagraphLines:isEmpty() then
			return BlockStartModule.of(self.new(Level, ParagraphLines)):atIndex(#Line:getContent()):replaceParagraphLines(#ParagraphLines:getLines())
		end
	end
	return BlockStartModule.none()
end

self.Factory = Module

return self