local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.parser.block.BlockParser)
local _ = require(CommonMark.parser.block.BlockParserFactory)
local _ = require(CommonMark.parser.block.BlockStart)
local CharactersModule = require(CommonMark.text.Characters)
local DefinitionsModule = require(CommonMark.internal.Definitions)
local _ = require(CommonMark.parser.delimiter.DelimiterProcessor)
local DocumentBlockParserModule = require(CommonMark.internal.DocumentBlockParser)
local IncludeSourceSpansModule = require(CommonMark.parser.IncludeSourceSpans)
local _ = require(CommonMark.parser.beta.InlineContentParserFactory)
local InlineParserContextImplModule = require(CommonMark.internal.InlineParserContextImpl)
local _ = require(CommonMark.parser.InlineParserFactory)
local IntegerModule = require(CommonMark.internal.port.Integer)
local LineReaderModule = require(CommonMark.internal.util.LineReader)
local _ = require(CommonMark.parser.beta.LinkProcessor)
local _ = require(CommonMark.parser.block.MatchedBlockParser)
local _ = require(CommonMark.node.Nodes)
local ParagraphParserModule = require(CommonMark.internal.ParagraphParser)
local _ = require(CommonMark.parser.block.ParserState)
local ParsingModule = require(CommonMark.internal.util.Parsing)
local SourceLineModule = require(CommonMark.parser.SourceLine)
local SourceLinesModule = require(CommonMark.parser.SourceLines)
local SourceSpanModule = require(CommonMark.node.SourceSpan)
local ByteFunction = string.byte
local FindFunction = string.find
local GsubFunction = string.gsub
local RepFunction = string.rep
local SubFunction = string.sub
local List = {
	"BlockQuote", "Heading", "FencedCodeBlock", "HtmlBlock", "ThematicBreak",
	"ListBlock", "IndentedCodeBlock"
}
local Frozen = table.freeze({
	BlockQuote = require(CommonMark.internal.BlockQuoteParser).Factory.new(),
	Heading = require(CommonMark.internal.HeadingParser).Factory.new(),
	FencedCodeBlock = require(CommonMark.internal.FencedCodeBlockParser).Factory.new(),
	HtmlBlock = require(CommonMark.internal.HtmlBlockParser).Factory.new(),
	ThematicBreak = require(CommonMark.internal.ThematicBreakParser).Factory.new(),
	ListBlock = require(CommonMark.internal.ListBlockParser).Factory.new(),
	IndentedCodeBlock = require(CommonMark.internal.IndentedCodeBlockParser).Factory.new()
})
local Module = {}
Module.__index = Module

function Module.new(_matchedBlockParser)
	-- upvalues: Module (copy)
	return (setmetatable({ _matchedBlockParser = _matchedBlockParser }, Module))
end

function Module:getMatchedBlockParser()
	return self._matchedBlockParser
end

local function _(p1): boolean
	-- upvalues: ParagraphParserModule (copy)
	return getmetatable(p1) == ParagraphParserModule
end

function Module.getParagraphLines(p1)
	-- upvalues: ParagraphParserModule (copy), SourceLinesModule (copy)
	return if getmetatable(p1._matchedBlockParser) == ParagraphParserModule then p1._matchedBlockParser:getParagraphLines() else SourceLinesModule.empty()
end

local Module1 = {}
Module1.__index = Module1

function Module1.new(_blockParser, Index)
	-- upvalues: Module1 (copy)
	return (setmetatable({ _blockParser = _blockParser, _sourceIndex = Index }, Module1))
end

local DocumentParserModule = {}
DocumentParserModule.__index = DocumentParserModule

function DocumentParserModule.new(_blockParserFactories, _inlineParserFactory, _inlineContentParserFactories, _delimiterProcessors, _linkProcessors, _linkMarkers, _includeSourceSpans, _maxOpenBlockParsers, _maxInlineNesting, _enabledInlineTypes, Enabled)
	-- upvalues: DocumentBlockParserModule (copy), DefinitionsModule (copy), DocumentParserModule (copy), Module1 (copy)
	local self = setmetatable({
		_line = nil,
		_lineIndex = -1,
		_index = 0,
		_column = 0,
		_columnIsInTab = false,
		_nextNonSpace = 0,
		_nextNonSpaceColumn = 0,
		_indent = 0,
		_blank = false,
		_blockParserFactories = _blockParserFactories,
		_inlineParserFactory = _inlineParserFactory,
		_inlineContentParserFactories = _inlineContentParserFactories,
		_delimiterProcessors = _delimiterProcessors,
		_linkProcessors = _linkProcessors,
		_linkMarkers = _linkMarkers,
		_includeSourceSpans = _includeSourceSpans,
		_maxOpenBlockParsers = _maxOpenBlockParsers,
		_maxInlineNesting = _maxInlineNesting,
		_enabledInlineTypes = _enabledInlineTypes,
		_linkReferenceDefinitions = Enabled ~= false,
		_documentBlockParser = DocumentBlockParserModule.new(),
		_definitions = DefinitionsModule.new(),
		_openBlockParsers = {},
		_allBlockParsers = {}
	}, DocumentParserModule)
	self:activateBlockParser(Module1.new(self._documentBlockParser, 0))
	
	return self
end

function DocumentParserModule.getDefaultBlockParserTypes()
	-- upvalues: List (copy)
	return List
end

function DocumentParserModule.calculateBlockParserFactories(Tbl, List)
	-- upvalues: Frozen (copy)
	local Copy = table.clone(Tbl)
	
	for _, value in ipairs(List) do
		table.insert(Copy, Frozen[value])
	end
	return Copy
end

function DocumentParserModule.checkEnabledBlockTypes(List1)
	-- upvalues: Frozen (copy), List (copy)
	for _, value in ipairs(List1) do
		if Frozen[value] == nil then
			error(`Can't enable block type {value}, possible options are: [{table.concat(List, ", ")}]`)
		end
	end
end

function DocumentParserModule:parse(p1)
	-- upvalues: CharactersModule (copy), SubFunction (copy), ByteFunction (copy)
	local v1 = 0
	local LineBreak = CharactersModule.findLineBreak(p1, v1)
	while LineBreak ~= -1 do
		self:parseLine(SubFunction(p1, v1 + 1, LineBreak), v1)
		v1 = if LineBreak + 1 < #p1 and ByteFunction(p1, LineBreak + 1) == 13 and ByteFunction(p1, LineBreak + 1 + 1) == 10 then LineBreak + 2 else LineBreak + 1
		LineBreak = CharactersModule.findLineBreak(p1, v1)
	end
	if p1 ~= "" and (v1 == 0 or v1 < #p1) then
		self:parseLine(SubFunction(p1, v1 + 1), v1)
	end
	return self:finalizeAndProcess()
end

function DocumentParserModule:parseReader(p2)
	-- upvalues: LineReaderModule (copy)
	local NewLineReader = LineReaderModule.new(p2)
	local Total = 0
	local Line = NewLineReader:readLine()
	while Line ~= nil do
		self:parseLine(Line, Total)
		Total += #Line
		local LineTerminator = NewLineReader:getLineTerminator()
		
		if LineTerminator ~= nil then
			Total += #LineTerminator
		end
		Line = NewLineReader:readLine()
	end
	return self:finalizeAndProcess()
end

function DocumentParserModule:getLine()
	return self._line
end

function DocumentParserModule:getIndex()
	return self._index
end

function DocumentParserModule:getNextNonSpaceIndex()
	return self._nextNonSpace
end

function DocumentParserModule:getColumn()
	return self._column
end

function DocumentParserModule:getIndent()
	return self._indent
end

function DocumentParserModule:isBlank()
	return self._blank
end

function DocumentParserModule:getActiveBlockParser()
	local OpenBlockParsers = self._openBlockParsers
	
	return OpenBlockParsers[#OpenBlockParsers - 1 + 1]._blockParser
end

function DocumentParserModule:parseLine(Line, Total)
	-- upvalues: ParsingModule (copy), CharactersModule (copy), ParagraphParserModule (copy), IntegerModule (copy), Module1 (copy)
	self:setLine(Line, Total)
	local OpenBlockParsers = self._openBlockParsers
	local Count = 1
	
	for i = 1, #OpenBlockParsers - 1 do
		local OpenBlockParser = OpenBlockParsers[i + 1]
		local BlockParser = OpenBlockParser._blockParser
		self:findNextNonSpace()
		local TryContinueResult = BlockParser:tryContinue(self)
		
		if TryContinueResult == nil then break end
		OpenBlockParser._sourceIndex = self:getIndex()
		
		if TryContinueResult:isFinalize() then
			self:addSourceSpans()
			self:closeBlockParsers(#OpenBlockParsers - i)
			
			return
		end
		if TryContinueResult:getNewIndex() == -1 then
			if TryContinueResult:getNewColumn() ~= -1 then
				self:setNewColumn(TryContinueResult:getNewColumn())
			end
		else
			self:setNewIndex(TryContinueResult:getNewIndex())
		end
		Count += 1
	end
	local v2 = #OpenBlockParsers - Count
	local BlockParser = OpenBlockParsers[Count - 1 + 1]._blockParser
	local Flag = false
	local Index = self._index
	local IsParagraph = BlockParser:getBlock().kind == "Paragraph" or BlockParser:isContainer()
	while IsParagraph do
		Index = self._index
		self:findNextNonSpace()
		
		if self:isBlank() or self._indent < ParsingModule.CODE_BLOCK_INDENT and CharactersModule.isLetter(self._line:getContent(), self._nextNonSpace) then
			self:setNewIndex(self._nextNonSpace)
			break
		end
		local BlockStart = self:findBlockStart(BlockParser)
		
		if BlockStart == nil then
			self:setNewIndex(self._nextNonSpace)
			break
		end
		Flag = true
		local Index1 = self:getIndex()
		
		if v2 > 0 then
			self:closeBlockParsers(v2)
			v2 = 0
		end
		if BlockStart:getNewIndex() == -1 then
			if BlockStart:getNewColumn() ~= -1 then
				self:setNewColumn(BlockStart:getNewColumn())
			end
		else
			self:setNewIndex(BlockStart:getNewIndex())
		end
		local PrepareActiveBlockParserForReplacementResult = nil
		
		if BlockStart:getReplaceParagraphLines() >= 1 or BlockStart:isReplaceActiveBlockParser() then
			local ActiveBlockParser = self:getActiveBlockParser()
			
			if getmetatable(ActiveBlockParser) == ParagraphParserModule then
				PrepareActiveBlockParserForReplacementResult = self:replaceParagraphLines(if BlockStart:isReplaceActiveBlockParser() then IntegerModule.MAX_VALUE else BlockStart:getReplaceParagraphLines(), ActiveBlockParser)
			elseif BlockStart:isReplaceActiveBlockParser() then
				PrepareActiveBlockParserForReplacementResult = self:prepareActiveBlockParserForReplacement(ActiveBlockParser)
			end
		end
		for _, blockParser in ipairs(BlockStart:getBlockParsers()) do
			self:addChild(Module1.new(blockParser, Index1))
			
			if PrepareActiveBlockParserForReplacementResult ~= nil then
				blockParser:getBlock():setSourceSpans(PrepareActiveBlockParserForReplacementResult)
			end
			BlockParser = blockParser
			IsParagraph = blockParser:isContainer()
		end
	end
	if not Flag and not self:isBlank() and self:getActiveBlockParser():canHaveLazyContinuationLines() then
		OpenBlockParsers[#OpenBlockParsers - 1 + 1]._sourceIndex = Index
		self:addLine()
		
		return
	end
	if v2 > 0 then
		self:closeBlockParsers(v2)
	end
	if not BlockParser:isContainer() then
		self:addLine()
		
		return
	end
	if self:isBlank() then
		self:addSourceSpans()
		
		return
	else
		self:addChild(Module1.new(ParagraphParserModule.new(self._linkReferenceDefinitions), Index))
		self:addLine()
	end
end

local _ = function(p3)
	-- upvalues: FindFunction (copy), GsubFunction (copy)
	return if FindFunction(p3, "\0", 1, true) == nil then p3 else GsubFunction(p3, "%z", "�")
end

function DocumentParserModule:setLine(p3, p4)
	-- upvalues: FindFunction (copy), GsubFunction (copy), IncludeSourceSpansModule (copy), SourceSpanModule (copy), SourceLineModule (copy)
	self._lineIndex += 1
	self._index = 0
	self._column = 0
	self._columnIsInTab = false
	local Z = if FindFunction(p3, "\0", 1, true) == nil then p3 else GsubFunction(p3, "%z", "�")
	self._line = SourceLineModule.of(Z, if self._includeSourceSpans == IncludeSourceSpansModule.NONE then nil else SourceSpanModule.of(self._lineIndex, 0, p4, #Z))
end

function DocumentParserModule:findNextNonSpace()
	-- upvalues: ByteFunction (copy)
	local Index = self._index
	local Column = self._column
	self._blank = true
	local Content = self._line:getContent()
	local CountContent = #Content
	while Index < CountContent do
		local ByteResult = ByteFunction(Content, Index + 1)
		
		if ByteResult == 32 then
			Index += 1
			Column += 1
		else
			if ByteResult ~= 9 then
				self._blank = false
				break
			end
			Index += 1
			Column += 4 - Column % 4
		end
	end
	self._nextNonSpace = Index
	self._nextNonSpaceColumn = Column
	self._indent = self._nextNonSpaceColumn - self._column
end

function DocumentParserModule:setNewIndex(NewIndex)
	if self._nextNonSpace <= NewIndex then
		self._index = self._nextNonSpace
		self._column = self._nextNonSpaceColumn
	end
	local Count = #self._line:getContent()
	while self._index < NewIndex and self._index ~= Count do
		self:advance()
	end
	self._columnIsInTab = false
end

function DocumentParserModule:setNewColumn(NewColumn)
	if self._nextNonSpaceColumn <= NewColumn then
		self._index = self._nextNonSpace
		self._column = self._nextNonSpaceColumn
	end
	local Count = #self._line:getContent()
	while self._column < NewColumn and self._index ~= Count do
		self:advance()
	end
	if NewColumn < self._column then
		self._index -= 1
		self._column = NewColumn
		self._columnIsInTab = true
		
		return
	else
		self._columnIsInTab = false
	end
end

function DocumentParserModule:advance()
	-- upvalues: ByteFunction (copy), ParsingModule (copy)
	local ByteResult = ByteFunction(self._line:getContent(), self._index + 1)
	self._index += 1
	
	if ByteResult == 9 then
		self._column += ParsingModule.columnsToNextTabStop(self._column)
		
		return
	else
		self._column += 1
	end
end

function DocumentParserModule:addLine()
	-- upvalues: SubFunction (copy), ParsingModule (copy), RepFunction (copy), IncludeSourceSpansModule (copy), SourceLineModule (copy)
	local Line = self._line
	local Index: number = self._index
	local Text = if self._columnIsInTab then RepFunction(" ", (ParsingModule.columnsToNextTabStop(self._column))) .. SubFunction(Line:getContent(), Index + 1 + 1, #Line:getContent()) elseif Index == 0 then Line:getContent() else SubFunction(Line:getContent(), Index + 1, #Line:getContent())
	local SubSpanResult = nil
	
	if self._includeSourceSpans == IncludeSourceSpansModule.BLOCKS_AND_INLINES then
		local SourceSpan = Line:getSourceSpan()
		
		if Index < SourceSpan:getLength() then
			SubSpanResult = SourceSpan:subSpan(Index)
		end
	end
	self:getActiveBlockParser():addLine(SourceLineModule.of(Text, SubSpanResult))
	self:addSourceSpans()
end

function DocumentParserModule:addSourceSpans()
	-- upvalues: IncludeSourceSpansModule (copy)
	if self._includeSourceSpans ~= IncludeSourceSpansModule.NONE then
		local OpenBlockParsers = self._openBlockParsers
		local Line = self._line
		
		for i = 1, #OpenBlockParsers - 1 do
			local OpenBlockParser = OpenBlockParsers[i + 1]
			local Smallest = math.min(OpenBlockParser._sourceIndex, self._index)
			
			if #Line:getContent() - Smallest ~= 0 then
				OpenBlockParser._blockParser:addSourceSpan(Line:getSourceSpan():subSpan(Smallest))
			end
		end
	end
end

function DocumentParserModule:findBlockStart(BlockParser)
	-- upvalues: Module (copy)
	if self._maxOpenBlockParsers < #self._openBlockParsers then
		return nil
	end
	local NewModule = Module.new(BlockParser)
	local TryStartResult = nil
	
	for _, blockParserFactory in ipairs(self._blockParserFactories) do
		TryStartResult = blockParserFactory:tryStart(self, NewModule)
		
		if TryStartResult ~= nil then
			return TryStartResult
		end
	end
	return nil
end

function DocumentParserModule:processInlines()
	-- upvalues: InlineParserContextImplModule (copy)
	local CreateResult = self._inlineParserFactory:create((InlineParserContextImplModule.new(self._inlineContentParserFactories, self._delimiterProcessors, self._linkProcessors, self._linkMarkers, self._maxInlineNesting, self._definitions, self._enabledInlineTypes)))
	
	for _, allBlockParser in ipairs(self._allBlockParsers) do
		allBlockParser:parseInlines(CreateResult)
	end
end

function DocumentParserModule:addChild(NewResult)
	while not self:getActiveBlockParser():canContain(NewResult._blockParser:getBlock()) do
		self:closeBlockParsers(1)
	end
	self:getActiveBlockParser():getBlock():appendChild(NewResult._blockParser:getBlock())
	self:activateBlockParser(NewResult)
end

function DocumentParserModule:activateBlockParser(NewResult)
	table.insert(self._openBlockParsers, NewResult)
end

function DocumentParserModule:deactivateBlockParser()
	return (table.remove(self._openBlockParsers))
end

function DocumentParserModule:replaceParagraphLines(MAXVALUE, ActiveBlockParser)
	local RemoveLinesResult = ActiveBlockParser:removeLines(MAXVALUE)
	self:closeBlockParsers(1)
	
	return RemoveLinesResult
end

function DocumentParserModule:prepareActiveBlockParserForReplacement(ActiveBlockParser)
	self:deactivateBlockParser()
	ActiveBlockParser:closeBlock()
	ActiveBlockParser:getBlock():unlink()
	
	return ActiveBlockParser:getBlock():getSourceSpans()
end

function DocumentParserModule:finalizeAndProcess()
	self:closeBlockParsers(#self._openBlockParsers)
	self:processInlines()
	
	return self._documentBlockParser:getBlock()
end

function DocumentParserModule:closeBlockParsers(CountOpenBlockParsers: number)
	for _ = 0, CountOpenBlockParsers - 1 do
		local BlockParser = self:deactivateBlockParser()._blockParser
		self:finalize(BlockParser)
		table.insert(self._allBlockParsers, BlockParser)
	end
end

function DocumentParserModule:finalize(BlockParser)
	self:addDefinitionsFrom(BlockParser)
	BlockParser:closeBlock()
end

function DocumentParserModule:addDefinitionsFrom(p3)
	for _, definition in ipairs(p3:getDefinitions()) do
		self._definitions:addDefinitions(definition)
	end
end

return DocumentParserModule