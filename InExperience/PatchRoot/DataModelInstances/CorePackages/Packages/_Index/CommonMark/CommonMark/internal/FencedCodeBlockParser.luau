local CommonMark = script:FindFirstAncestor("CommonMark")
local BlockContinueModule = require(CommonMark.parser.block.BlockContinue)
local _ = require(CommonMark.parser.block.BlockParserFactory)
local BlockStartModule = require(CommonMark.parser.block.BlockStart)
local CharactersModule = require(CommonMark.text.Characters)
local _ = require(CommonMark.parser.block.MatchedBlockParser)
local NodesModule = require(CommonMark.node.Nodes)
local _ = require(CommonMark.parser.block.ParserState)
local ParsingModule = require(CommonMark.internal.util.Parsing)
local _ = require(CommonMark.parser.SourceLine)
local ByteFunction = string.byte
local CharFunction = string.char
local SubFunction = string.sub
local UnescapeStringFunction = require(CommonMark.internal.util.Escaping).unescapeString
local self = setmetatable({}, {
	__index = require(CommonMark.parser.block.AbstractBlockParser)
})
self.__index = self

function self.new(_fenceChar, Count, FenceIndent)
	-- upvalues: NodesModule (copy), CharFunction (copy), self (copy)
	local FencedCodeBlockResult = NodesModule.FencedCodeBlock()
	FencedCodeBlockResult.fenceCharacter = CharFunction(_fenceChar)
	FencedCodeBlockResult:setOpeningFenceLength(Count)
	FencedCodeBlockResult.fenceIndent = FenceIndent
	
	return (setmetatable({
		_firstLine = nil,
		_block = FencedCodeBlockResult,
		_fenceChar = _fenceChar,
		_openingFenceLength = Count,
		_otherLines = {}
	}, self))
end

function self:getBlock()
	return self._block
end

function self:tryContinue(p1)
	-- upvalues: ParsingModule (copy), BlockContinueModule (copy), ByteFunction (copy)
	local NextNonSpaceIndex = p1:getNextNonSpaceIndex()
	local Index = p1:getIndex()
	local Content = p1:getLine():getContent()
	
	if p1:getIndent() < ParsingModule.CODE_BLOCK_INDENT and NextNonSpaceIndex < #Content and self:tryClosing(Content, NextNonSpaceIndex) then
		return BlockContinueModule.finished()
	end
	local FenceIndent = self._block.fenceIndent
	local CountContent = #Content
	while FenceIndent > 0 and (Index < CountContent and ByteFunction(Content, Index + 1) == 32) do
		Index += 1
		FenceIndent -= 1
	end
	return BlockContinueModule.atIndex(Index)
end

function self:addLine(p2)
	if self._firstLine == nil then
		self._firstLine = p2:getContent()
		
		return
	else
		table.insert(self._otherLines, p2:getContent())
		table.insert(self._otherLines, "\n")
	end
end

local function trim(FirstLine)
	-- upvalues: ByteFunction (copy), SubFunction (copy)
	local Count = 0
	local CountFirstLine = #FirstLine
	while Count < CountFirstLine and ByteFunction(FirstLine, Count + 1) <= 32 do
		Count += 1
	end
	while Count < CountFirstLine and ByteFunction(FirstLine, CountFirstLine - 1 + 1) <= 32 do
		CountFirstLine -= 1
	end
	return (SubFunction(FirstLine, Count + 1, CountFirstLine))
end

function self:closeBlock()
	-- upvalues: UnescapeStringFunction (copy), trim (copy)
	self._block.info = UnescapeStringFunction((trim(self._firstLine)))
	self._block.literal = table.concat(self._otherLines)
end

local function checkOpener(Content, NextNonSpaceIndex: number, FenceIndent)
	-- upvalues: ByteFunction (copy), CharactersModule (copy), self (copy)
	local Count = 0
	local Count1 = 0
	
	for i = NextNonSpaceIndex, #Content - 1 do
		local ByteResult = ByteFunction(Content, i + 1)
		
		if ByteResult == 96 then
			Count += 1
		else
			if ByteResult ~= 126 then break end
			Count1 += 1
		end
	end
	return if Count >= 3 and Count1 == 0 then if CharactersModule.find(96, Content, NextNonSpaceIndex + Count) == -1 then self.new(96, Count, FenceIndent) else nil elseif Count1 >= 3 and Count == 0 then self.new(126, Count1, FenceIndent) else nil
end

local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({}, Module))
end

function Module:tryStart(p2, _)
	-- upvalues: ParsingModule (copy), BlockStartModule (copy), checkOpener (copy)
	local Indent = p2:getIndent()
	
	if ParsingModule.CODE_BLOCK_INDENT <= Indent then
		return BlockStartModule.none()
	else
		local NextNonSpaceIndex = p2:getNextNonSpaceIndex()
		local CheckOpenerResult = checkOpener(p2:getLine():getContent(), NextNonSpaceIndex, Indent)
		
		return if CheckOpenerResult == nil then BlockStartModule.none() else BlockStartModule.of(CheckOpenerResult):atIndex(NextNonSpaceIndex + CheckOpenerResult._block:getOpeningFenceLength())
	end
end

self.Factory = Module

function self:tryClosing(Content, NextNonSpaceIndex): boolean
	-- upvalues: CharactersModule (copy)
	local SkipResultDelta = CharactersModule.skip(self._fenceChar, Content, NextNonSpaceIndex, #Content) - NextNonSpaceIndex
	
	if SkipResultDelta < self._openingFenceLength then
		return false
	elseif CharactersModule.skipSpaceTab(Content, NextNonSpaceIndex + SkipResultDelta, #Content) == #Content then
		self._block:setClosingFenceLength(SkipResultDelta)
		
		return true
	else
		return false
	end
end

return self