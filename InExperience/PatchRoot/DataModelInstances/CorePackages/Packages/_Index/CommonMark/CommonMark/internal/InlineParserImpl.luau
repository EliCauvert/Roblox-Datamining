local CommonMark = script:FindFirstAncestor("CommonMark")
local AutolinkInlineParserModule = require(CommonMark.internal.inline.AutolinkInlineParser)
local BackslashInlineParserModule = require(CommonMark.internal.inline.BackslashInlineParser)
local BackticksInlineParserModule = require(CommonMark.internal.inline.BackticksInlineParser)
local BracketModule = require(CommonMark.internal.Bracket)
local CharactersModule = require(CommonMark.text.Characters)
local CoreLinkProcessorModule = require(CommonMark.internal.inline.CoreLinkProcessor)
local DelimiterModule = require(CommonMark.internal.Delimiter)
local _ = require(CommonMark.parser.delimiter.DelimiterProcessor)
local EmphasisDelimiterProcessorModule = require(CommonMark.internal.inline.EmphasisDelimiterProcessor)
local EntityInlineParserModule = require(CommonMark.internal.inline.EntityInlineParser)
local EscapingModule = require(CommonMark.internal.util.Escaping)
local HtmlInlineParserModule = require(CommonMark.internal.inline.HtmlInlineParser)
local _ = require(CommonMark.parser.beta.InlineContentParser)
local _ = require(CommonMark.parser.beta.InlineContentParserFactory)
local _ = require(CommonMark.parser.InlineParserContext)
local IntegerModule = require(CommonMark.internal.port.Integer)
local _ = require(CommonMark.parser.beta.LinkInfo)
local _ = require(CommonMark.parser.beta.LinkProcessor)
local LinkResultModule = require(CommonMark.parser.beta.LinkResult)
local LinkScannerModule = require(CommonMark.internal.util.LinkScanner)
local _ = require(CommonMark.node.Node)
local NodesModule = require(CommonMark.node.Nodes)
local _ = require(CommonMark.parser.beta.Position)
local ScannerModule = require(CommonMark.parser.beta.Scanner)
local _ = require(CommonMark.parser.SourceLines)
local SourceSpansModule = require(CommonMark.node.SourceSpans)
local StaggeredDelimiterProcessorModule = require(CommonMark.internal.StaggeredDelimiterProcessor)
local _ = string.byte
local GsubFunction = string.gsub
local SubFunction = string.sub
local END = ScannerModule.END
local InlineParserImplModule = {}
InlineParserImplModule.__index = InlineParserImplModule
local Frozen = table.freeze({
	"Code", "HtmlInline", "Autolink", "Entity", "BackslashEscape", "Emphasis",
	"Link", "Image", "HardLineBreak"
})
local Tbl = {}

for _, value in ipairs(Frozen) do
	Tbl[value] = true
end
table.freeze(Tbl)

function InlineParserImplModule.getDefaultInlineTypes()
	-- upvalues: Frozen (copy)
	return Frozen
end

function InlineParserImplModule.checkEnabledInlineTypes(List)
	-- upvalues: Tbl (copy), Frozen (copy)
	for _, value in ipairs(List) do
		if not Tbl[value] then
			error(`Can't enable inline type {value}, possible options are: [{table.concat(Frozen, ", ")}]`)
		end
	end
end

local function calculateEnabledInlineTypes(_context)
	-- upvalues: Tbl (copy), InlineParserImplModule (copy)
	local GetEnabledInlineTypesFunction = _context.getEnabledInlineTypes
	local EnabledInlineTypes = if GetEnabledInlineTypesFunction == nil then nil else GetEnabledInlineTypesFunction(_context)
	
	if EnabledInlineTypes == nil then
		return Tbl
	end
	InlineParserImplModule.checkEnabledInlineTypes(EnabledInlineTypes)
	local t = {}
	
	for _, enabledInlineType in ipairs(EnabledInlineTypes) do
		t[enabledInlineType] = true
	end
	return t
end

local function _(Key: number, p1, p2)
	p2[Key] = p1
	
	if p2[Key] ~= nil then
		error(`Delimiter processor conflict with delimiter char '{string.char(Key)}'`)
	end
end

local function addDelimiterProcessors(List, NewResults)
	-- upvalues: StaggeredDelimiterProcessorModule (copy)
	for _, value in ipairs(List) do
		local OpeningCharacter: number = value:getOpeningCharacter()
		local ClosingCharacter: number = value:getClosingCharacter()
		
		if OpeningCharacter == ClosingCharacter then
			local NewResult = NewResults[OpeningCharacter]
			
			if NewResult == nil or NewResult:getOpeningCharacter() ~= NewResult:getClosingCharacter() then
				NewResults[OpeningCharacter] = value
				
				if NewResults[OpeningCharacter] ~= nil then
					error(`Delimiter processor conflict with delimiter char '{string.char(OpeningCharacter)}'`)
					continue
				end
			else
				local NewResult1 = nil
				if getmetatable(NewResult) == StaggeredDelimiterProcessorModule then
					NewResult1 = NewResult
				else
					NewResult1 = StaggeredDelimiterProcessorModule.new(OpeningCharacter)
					NewResult1:add(NewResult)
				end
				NewResult1:add(value)
				NewResults[OpeningCharacter] = NewResult1
				continue
			end
		else
			NewResults[OpeningCharacter] = value
			
			if NewResults[OpeningCharacter] ~= nil then
				error(`Delimiter processor conflict with delimiter char '{string.char(OpeningCharacter)}'`)
			end
			NewResults[ClosingCharacter] = value
			
			if NewResults[ClosingCharacter] ~= nil then
				error(`Delimiter processor conflict with delimiter char '{string.char(ClosingCharacter)}'`)
			end
		end
	end
end

local function calculateDelimiterProcessors(CustomDelimiterProcessors, _enabledInlineTypes)
	-- upvalues: addDelimiterProcessors (copy), EmphasisDelimiterProcessorModule (copy)
	local t = {}
	
	if _enabledInlineTypes.Emphasis then
		addDelimiterProcessors({
			EmphasisDelimiterProcessorModule.new(42),
			EmphasisDelimiterProcessorModule.new(95)
		}, t)
	end
	addDelimiterProcessors(CustomDelimiterProcessors, t)
	
	return t
end

local _ = function(List, p1)
	local t = {}
	
	for i in pairs(List) do
		t[i] = true
	end
	if p1.Image then
		t[33] = true
	end
	return t
end

local function calculateSpecialCharacters(Tbl, DelimiterProcessors, InlineContentParserFactories, BracketsEnabled)
	local Copy = table.clone(Tbl)
	
	for delimiterProcessor in pairs(DelimiterProcessors) do
		Copy[delimiterProcessor] = true
	end
	for _, inlineContentParserFactory in ipairs(InlineContentParserFactories) do
		for triggerCharacter in pairs(inlineContentParserFactory:getTriggerCharacters()) do
			Copy[triggerCharacter] = true
		end
	end
	if BracketsEnabled then
		Copy[91] = true
		Copy[93] = true
	end
	Copy[33] = true
	Copy[10] = true
	
	return Copy
end

function InlineParserImplModule.new(_context)
	-- upvalues: InlineParserImplModule (copy), calculateEnabledInlineTypes (copy), calculateDelimiterProcessors (copy), IntegerModule (copy), calculateSpecialCharacters (copy)
	local self = setmetatable({
		_nestingDepths = {},
		_delimiterIndexes = {},
		_disallowWalked = {}
	}, InlineParserImplModule)
	self._context = _context
	local EnabledInlineTypes = calculateEnabledInlineTypes(_context)
	self._enabledInlineTypes = EnabledInlineTypes
	local CustomLinkProcessors = _context:getCustomLinkProcessors()
	local CustomLinkMarkers = _context:getCustomLinkMarkers()
	self._bracketsEnabled = EnabledInlineTypes.Link == true or (EnabledInlineTypes.Image == true or (#CustomLinkProcessors > 0 or next(CustomLinkMarkers) ~= nil))
	self._inlineContentParserFactories = self:calculateInlineContentParserFactories(_context:getCustomInlineContentParserFactories())
	self._delimiterProcessors = calculateDelimiterProcessors(_context:getCustomDelimiterProcessors(), EnabledInlineTypes)
	self._linkProcessors = self:calculateLinkProcessors(CustomLinkProcessors)
	local _linkMarkers = {}
	
	for customLinkMarker in pairs(CustomLinkMarkers) do
		_linkMarkers[customLinkMarker] = true
	end
	if EnabledInlineTypes.Image then
		_linkMarkers[33] = true
	end
	self._linkMarkers = _linkMarkers
	self._maxInlineNesting = _context:getMaxInlineNesting()
	self._limitInlineNesting = self._maxInlineNesting ~= IntegerModule.MAX_VALUE
	self._specialCharacters = calculateSpecialCharacters(self._linkMarkers, self._delimiterProcessors, self._inlineContentParserFactories, self._bracketsEnabled)
	
	return self
end

function InlineParserImplModule:calculateInlineContentParserFactories(Tbl)
	-- upvalues: BackslashInlineParserModule (copy), BackticksInlineParserModule (copy), EntityInlineParserModule (copy), AutolinkInlineParserModule (copy), HtmlInlineParserModule (copy)
	local Copy = table.clone(Tbl)
	local EnabledInlineTypes = self._enabledInlineTypes
	
	if EnabledInlineTypes.BackslashEscape then
		table.insert(Copy, BackslashInlineParserModule.Factory.new(EnabledInlineTypes.HardLineBreak == true))
	end
	if EnabledInlineTypes.Code then
		table.insert(Copy, BackticksInlineParserModule.Factory.new())
	end
	if EnabledInlineTypes.Entity then
		table.insert(Copy, EntityInlineParserModule.Factory.new())
	end
	if EnabledInlineTypes.Autolink then
		table.insert(Copy, AutolinkInlineParserModule.Factory.new())
	end
	if EnabledInlineTypes.HtmlInline then
		table.insert(Copy, HtmlInlineParserModule.Factory.new())
	end
	return Copy
end

function InlineParserImplModule:calculateLinkProcessors(Tbl)
	-- upvalues: CoreLinkProcessorModule (copy)
	local Copy = table.clone(Tbl)
	local EnabledInlineTypes = self._enabledInlineTypes
	
	if EnabledInlineTypes.Link or EnabledInlineTypes.Image then
		table.insert(Copy, CoreLinkProcessorModule.new(EnabledInlineTypes.Link == true, EnabledInlineTypes.Image == true))
	end
	return Copy
end

function InlineParserImplModule.createInlineContentParsers(p2)
	local t = {}
	
	for _, inlineContentParserFactory in ipairs(p2._inlineContentParserFactories) do
		local CreateResult = inlineContentParserFactory:create()
		
		for triggerCharacter in pairs(inlineContentParserFactory:getTriggerCharacters()) do
			local List = t[triggerCharacter]
			
			if List == nil then
				List = {}
				t[triggerCharacter] = List
			end
			table.insert(List, CreateResult)
		end
	end
	return t
end

function InlineParserImplModule:scanner()
	return self._scanner
end

function InlineParserImplModule:parse(p3, p4)
	self:reset(p3)
	while true do
		local ParseInlineResult = self:parseInline()
		if ParseInlineResult == nil then break end
		for _, value in ipairs(ParseInlineResult) do
			p4:appendChild(value)
		end
	end
	self:processDelimiters(nil)
	self:mergeChildTextNodes(p4)
end

function InlineParserImplModule:reset(p5)
	-- upvalues: ScannerModule (copy)
	self._scanner = ScannerModule.of(p5)
	self._includeSourceSpans = #p5:getSourceSpans() > 0
	self._trailingSpaces = 0
	self._lastDelimiter = nil
	self._lastBracket = nil
	table.clear(self._disallowWalked)
	table.clear(self._nestingDepths)
	table.clear(self._delimiterIndexes)
	self._delimiterCount = 0
	self._inlineParsers = self:createInlineContentParsers()
end

function InlineParserImplModule:text(p5)
	-- upvalues: NodesModule (copy)
	local TextResult = NodesModule.Text(p5:getContent())
	TextResult:setSourceSpans(p5:getSourceSpans())
	
	return TextResult
end

function InlineParserImplModule:parseInline()
	-- upvalues: END (copy)
	local Scanner = self._scanner
	local PeekResult = Scanner:peek()
	
	if PeekResult == 91 and self._bracketsEnabled then
		return { self:parseOpenBracket() }
	end
	if PeekResult == 93 and self._bracketsEnabled then
		return { self:parseCloseBracket() }
	end
	if PeekResult == 10 then
		return { self:parseLineBreak() }
	end
	if PeekResult == END then
		return nil
	end
	if self._linkMarkers[PeekResult] then
		local PositionResult = Scanner:position()
		local ParseLinkMarkerResult = self:parseLinkMarker()
		
		if ParseLinkMarkerResult ~= nil then
			return ParseLinkMarkerResult
		end
		Scanner:setPosition(PositionResult)
	end
	if not self._specialCharacters[PeekResult] then
		return { self:parseText() }
	end
	local InlineParser = self._inlineParsers[PeekResult]
	
	if InlineParser ~= nil then
		local PositionResult = Scanner:position()
		local TryParseResult = nil
		
		for _, value in ipairs(InlineParser) do
			TryParseResult = value:tryParse(self)
			
			if TryParseResult == nil then
				Scanner:setPosition(PositionResult)
				continue
			else
				local Node = TryParseResult:getNode()
				Scanner:setPosition(TryParseResult:getPosition())
				
				if self._includeSourceSpans and #Node:getSourceSpans() == 0 then
					Node:setSourceSpans(Scanner:getSource(PositionResult, Scanner:position()):getSourceSpans())
				end
				return { Node }
			end
		end
	end
	local DelimiterProcessor = self._delimiterProcessors[PeekResult]
	
	if DelimiterProcessor ~= nil then
		local ParseDelimitersResult = self:parseDelimiters(DelimiterProcessor, PeekResult)
		
		if ParseDelimitersResult ~= nil then
			return ParseDelimitersResult
		end
	end
	return { self:parseText() }
end

function InlineParserImplModule:parseDelimiters(DelimiterProcessor, PeekResult)
	-- upvalues: DelimiterModule (copy)
	local ScanDelimitersResult = self:scanDelimiters(DelimiterProcessor, PeekResult)
	
	if ScanDelimitersResult == nil then
		return nil
	end
	local Characters = ScanDelimitersResult.characters
	local NewDelimiter = DelimiterModule.new(Characters, PeekResult, ScanDelimitersResult.canOpen, ScanDelimitersResult.canClose, self._lastDelimiter)
	self._lastDelimiter = NewDelimiter
	self._delimiterCount += 1
	self._delimiterIndexes[NewDelimiter] = self._delimiterCount
	
	if NewDelimiter.previous ~= nil then
		NewDelimiter.previous.next = NewDelimiter
	end
	return Characters
end

function InlineParserImplModule:parseOpenBracket()
	-- upvalues: BracketModule (copy)
	local Scanner = self._scanner
	local PositionResult = Scanner:position()
	Scanner:next()
	local PositionResult1 = Scanner:position()
	local TextResult = self:text(Scanner:getSource(PositionResult, PositionResult1))
	self:addBracket(BracketModule.link(TextResult, PositionResult, PositionResult1, self._lastBracket, self._lastDelimiter))
	
	return TextResult
end

function InlineParserImplModule:parseLinkMarker()
	-- upvalues: BracketModule (copy)
	local Scanner = self._scanner
	local PositionResult = Scanner:position()
	Scanner:next()
	local PositionResult1 = Scanner:position()
	
	if Scanner:nextChar(91) then
		local PositionResult2 = Scanner:position()
		local TextResult = self:text(Scanner:getSource(PositionResult, PositionResult1))
		local TextResult1 = self:text(Scanner:getSource(PositionResult1, PositionResult2))
		self:addBracket(BracketModule.withMarker(TextResult, PositionResult, TextResult1, PositionResult1, PositionResult2, self._lastBracket, self._lastDelimiter))
		
		return { TextResult, TextResult1 }
	else
		return nil
	end
end

function InlineParserImplModule:parseCloseBracket()
	local Scanner = self._scanner
	local PositionResult = Scanner:position()
	Scanner:next()
	local PositionResult1 = Scanner:position()
	local LastBracket = self._lastBracket
	
	if LastBracket == nil then
		return self:text(Scanner:getSource(PositionResult, PositionResult1))
	elseif not LastBracket.allowed then
		self:removeLastBracket()
		
		return self:text(Scanner:getSource(PositionResult, PositionResult1))
	else
		local ParseLinkOrImageResult = self:parseLinkOrImage(LastBracket, PositionResult)
		
		if ParseLinkOrImageResult == nil then
			Scanner:setPosition(PositionResult1)
			self:removeLastBracket()
			
			return self:text(Scanner:getSource(PositionResult, PositionResult1))
		else
			return ParseLinkOrImageResult
		end
	end
end

function InlineParserImplModule:parseLinkOrImage(LastBracket, PositionResult)
	-- upvalues: LinkResultModule (copy)
	local Scanner = self._scanner
	local ParseLinkInfoResult = self:parseLinkInfo(LastBracket, PositionResult)
	
	if ParseLinkInfoResult == nil then
		return nil
	end
	local PositionResult1 = Scanner:position()
	local Node = nil
	local Position = nil
	local IsIncludeMarker = nil
	
	for _, linkProcessor in ipairs(self._linkProcessors) do
		local ProcessResult = linkProcessor:process(ParseLinkInfoResult, Scanner, self._context)
		
		if ProcessResult == nil then
			Scanner:setPosition(PositionResult1)
		else
			Node = ProcessResult:getNode()
			Position = ProcessResult:getPosition()
			IsIncludeMarker = ProcessResult:isIncludeMarker()
			local Type = ProcessResult:getType()
			
			if Type == LinkResultModule.Type.WRAP then
				Scanner:setPosition(Position)
				
				return self:wrapBracket(LastBracket, Node, IsIncludeMarker)
			elseif Type == LinkResultModule.Type.REPLACE then
				Scanner:setPosition(Position)
				
				return self:replaceBracket(LastBracket, Node, IsIncludeMarker)
			end
			continue
		end
	end
	return nil
end

local Module = {}
Module.__index = Module

function Module.new(Destination, Title)
	-- upvalues: Module (copy)
	return (setmetatable({ destination = Destination, title = Title }, Module))
end

local Module1 = {}
Module1.__index = Module1

function Module1.new(MarkerNode, BracketNode, Scanner, ContentPosition, TextEnd, _label, _destination, _title, PositionResult)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		_text = nil,
		_marker = MarkerNode,
		_openingBracket = BracketNode,
		_scanner = Scanner,
		_textStart = ContentPosition,
		_textEnd = TextEnd,
		_label = _label,
		_destination = _destination,
		_title = _title,
		_afterTextBracket = PositionResult
	}, Module1))
end

function Module1:marker()
	return self._marker
end

function Module1:openingBracket()
	return self._openingBracket
end

function Module1:text()
	local Text = self._text
	
	if Text == nil then
		local Content = self._scanner:getSource(self._textStart, self._textEnd):getContent()
		self._text = Content
		
		return Content
	else
		return Text
	end
end

function Module1:label()
	return self._label
end

function Module1:destination()
	return self._destination
end

function Module1:title()
	return self._title
end

function Module1:afterTextBracket()
	return self._afterTextBracket
end

local function parseLinkDestination(p5)
	-- upvalues: LinkScannerModule (copy), SubFunction (copy), EscapingModule (copy)
	local PeekResult = p5:peek()
	local PositionResult = p5:position()
	
	if not LinkScannerModule.scanLinkDestination(p5) then
		return nil
	end
	local SubResult = nil
	if PeekResult == 60 then
		local Content = p5:getSource(PositionResult, p5:position()):getContent()
		SubResult = SubFunction(Content, 2, #Content - 1)
	else
		SubResult = p5:getSource(PositionResult, p5:position()):getContent()
	end
	return EscapingModule.unescapeString(SubResult)
end

local function parseLinkTitle(p5)
	-- upvalues: LinkScannerModule (copy), SubFunction (copy), EscapingModule (copy)
	local PositionResult = p5:position()
	
	if LinkScannerModule.scanLinkTitle(p5) then
		local Content = p5:getSource(PositionResult, p5:position()):getContent()
		
		return EscapingModule.unescapeString((SubFunction(Content, 2, #Content - 1)))
	else
		return nil
	end
end

local function parseInlineDestinationTitle(Scanner)
	-- upvalues: parseLinkDestination (copy), parseLinkTitle (copy), Module (copy)
	if not Scanner:nextChar(40) then
		return nil
	end
	Scanner:whitespace()
	local ParseLinkDestinationResult = parseLinkDestination(Scanner)
	
	if ParseLinkDestinationResult == nil then
		return nil
	end
	local Title = nil
	
	if Scanner:whitespace() >= 1 then
		Title = parseLinkTitle(Scanner)
		Scanner:whitespace()
	end
	return if Scanner:nextChar(41) then Module.new(ParseLinkDestinationResult, Title) else nil
end

function InlineParserImplModule:parseLinkInfo(p5, TextEnd)
	-- upvalues: parseInlineDestinationTitle (copy), Module1 (copy), InlineParserImplModule (copy)
	local Scanner = self._scanner
	local PositionResult = Scanner:position()
	local ParseInlineDestinationTitleResult = parseInlineDestinationTitle(Scanner)
	
	if ParseInlineDestinationTitleResult ~= nil then
		return Module1.new(p5.markerNode, p5.bracketNode, Scanner, p5.contentPosition, TextEnd, nil, ParseInlineDestinationTitleResult.destination, ParseInlineDestinationTitleResult.title, PositionResult)
	end
	Scanner:setPosition(PositionResult)
	local ParseLinkLabelResult = InlineParserImplModule.parseLinkLabel(Scanner)
	
	if ParseLinkLabelResult == nil then
		Scanner:setPosition(PositionResult)
	end
	local NoParseLinkLabelResult: boolean = ParseLinkLabelResult == nil or ParseLinkLabelResult == ""
	
	return if p5.bracketAfter and NoParseLinkLabelResult and p5.markerNode == nil then nil else Module1.new(p5.markerNode, p5.bracketNode, Scanner, p5.contentPosition, TextEnd, ParseLinkLabelResult, nil, nil, PositionResult)
end

function InlineParserImplModule:wrapBracket(p5, Node, IsIncludeMarker)
	local Scanner = self._scanner
	
	if self._limitInlineNesting and self._maxInlineNesting <= p5.contentNestingDepth then
		return nil
	end
	local Next1 = p5.bracketNode:getNext()
	while Next1 ~= nil do
		local Next2 = Next1:getNext()
		Node:appendChild(Next1)
		Next1 = Next2
	end
	if self._includeSourceSpans then
		Node:setSourceSpans(Scanner:getSource(if IsIncludeMarker and p5.markerPosition ~= nil then p5.markerPosition else p5.bracketPosition, Scanner:position()):getSourceSpans())
	end
	self:processDelimiters(p5.previousDelimiter)
	self:mergeChildTextNodes(Node)
	
	if IsIncludeMarker and p5.markerNode ~= nil then
		p5.markerNode:unlink()
	end
	p5.bracketNode:unlink()
	self:removeLastBracket()
	self:recordNestingDepth(Node, p5.contentNestingDepth + 1)
	
	if p5.markerNode == nil then
		self:disallowPreviousLinks()
	end
	return Node
end

function InlineParserImplModule:replaceBracket(p6, Node, IsIncludeMarker)
	local Scanner = self._scanner
	while self._lastDelimiter ~= nil and self._lastDelimiter ~= p6.previousDelimiter do
		self:removeDelimiterKeepNode(self._lastDelimiter)
	end
	if self._includeSourceSpans then
		Node:setSourceSpans(Scanner:getSource(if IsIncludeMarker and p6.markerPosition ~= nil then p6.markerPosition else p6.bracketPosition, Scanner:position()):getSourceSpans())
	end
	self:removeLastBracket()
	local MarkerNode = if IsIncludeMarker and p6.markerNode ~= nil then p6.markerNode else p6.bracketNode
	while MarkerNode ~= nil do
		local Next1 = MarkerNode:getNext()
		MarkerNode:unlink()
		MarkerNode = Next1
	end
	self:recordNestingDepth(Node, self:nestingDepthOfSiblings(Node:getFirstChild(), nil) + 1)
	
	if p6.markerNode == nil or not IsIncludeMarker then
		self:disallowPreviousLinks()
	end
	return Node
end

function InlineParserImplModule:addBracket(_lastBracket)
	if self._lastBracket ~= nil then
		self._lastBracket.bracketAfter = true
	end
	self._lastBracket = _lastBracket
end

function InlineParserImplModule:removeLastBracket()
	local LastBracket = self._lastBracket
	self._lastBracket = LastBracket.previous
	
	if self._lastBracket ~= nil and self._lastBracket.contentNestingDepth < LastBracket.contentNestingDepth then
		self._lastBracket.contentNestingDepth = LastBracket.contentNestingDepth
	end
end

function InlineParserImplModule:disallowPreviousLinks()
	local LastBracket = self._lastBracket
	while LastBracket ~= nil and not self._disallowWalked[LastBracket] do
		self._disallowWalked[LastBracket] = true
		
		if LastBracket.markerNode == nil then
			LastBracket.allowed = false
		end
		LastBracket = LastBracket.previous
	end
end

local _ = function(p7)
	-- upvalues: GsubFunction (copy)
	local _, v1 = GsubFunction(p7, "[^\128-\191]", "")
	
	return v1
end

function InlineParserImplModule:parseLinkLabel()
	-- upvalues: LinkScannerModule (copy), GsubFunction (copy)
	if not self:nextChar(91) then
		return nil
	end
	local PositionResult = self:position()
	
	if not LinkScannerModule.scanLinkLabelContent(self) then
		return nil
	end
	local PositionResult1 = self:position()
	
	if self:nextChar(93) then
		local Content = self:getSource(PositionResult, PositionResult1):getContent()
		local _, v1 = GsubFunction(Content, "[^\128-\191]", "")
		
		return if v1 > 999 then nil else Content
	else
		return nil
	end
end

function InlineParserImplModule:parseLineBreak()
	-- upvalues: NodesModule (copy)
	self._scanner:next()
	local IsHardLineBreak: boolean = self._trailingSpaces >= 2 and self._enabledInlineTypes.HardLineBreak == true
	self._trailingSpaces = 0
	
	return if IsHardLineBreak then NodesModule.HardLineBreak() else NodesModule.SoftLineBreak()
end

function InlineParserImplModule:parseText()
	-- upvalues: END (copy), CharactersModule (copy), SubFunction (copy), NodesModule (copy)
	local Scanner = self._scanner
	local SpecialCharacters = self._specialCharacters
	local PositionResult = Scanner:position()
	Scanner:next()
	local PeekResult = nil
	while true do
		PeekResult = Scanner:peek()
		if PeekResult == END or SpecialCharacters[PeekResult] then break end
		Scanner:next()
	end
	local Source = Scanner:getSource(PositionResult, Scanner:position())
	local Content = Source:getContent()
	
	if PeekResult == 10 then
		local NewSkipBackwardsResult = CharactersModule.skipBackwards(32, Content, #Content - 1, 0) + 1
		self._trailingSpaces = #Content - NewSkipBackwardsResult
		Content = SubFunction(Content, 1, NewSkipBackwardsResult)
	elseif PeekResult == END then
		Content = SubFunction(Content, 1, CharactersModule.skipSpaceTabBackwards(Content, #Content - 1, 0) + 1)
	end
	local TextResult = NodesModule.Text(Content)
	TextResult:setSourceSpans(Source:getSourceSpans())
	
	return TextResult
end

local config = {
	new = function(p7: number, p8): number
		return p7 * 6 + p8
	end
}
local Module2 = {}
Module2.__index = Module2

function Module2.new(Characters, CanOpen, CanClose)
	-- upvalues: Module2 (copy)
	return (setmetatable({
		characters = Characters,
		canOpen = CanOpen,
		canClose = CanClose
	}, Module2))
end

function InlineParserImplModule:scanDelimiters(p7, ClosingCharacter)
	-- upvalues: END (copy), CharactersModule (copy), Module2 (copy)
	local Scanner = self._scanner
	local PeekPreviousCodePointResult = Scanner:peekPreviousCodePoint()
	local PositionResult = Scanner:position()
	
	if Scanner:matchMultiple(ClosingCharacter) < p7:getMinLength() then
		Scanner:setPosition(PositionResult)
		
		return nil
	end
	local Characters = {}
	Scanner:setPosition(PositionResult)
	local PositionResult1 = PositionResult
	while Scanner:nextChar(ClosingCharacter) do
		table.insert(Characters, self:text(Scanner:getSource(PositionResult1, Scanner:position())))
		PositionResult1 = Scanner:position()
	end
	local PeekCodePointResult = Scanner:peekCodePoint()
	local IsPeekPreviousCodePointResultMatch = PeekPreviousCodePointResult == END or CharactersModule.isPunctuationCodePoint(PeekPreviousCodePointResult)
	local IsPeekPreviousCodePointResultMatch1 = PeekPreviousCodePointResult == END or CharactersModule.isWhitespaceCodePoint(PeekPreviousCodePointResult)
	local IsPeekCodePointResultMatch = PeekCodePointResult == END or CharactersModule.isPunctuationCodePoint(PeekCodePointResult)
	local IsPeekCodePointResultMatch1 = PeekCodePointResult == END or CharactersModule.isWhitespaceCodePoint(PeekCodePointResult)
	local NoIsPeekCodePointResultMatch = not IsPeekCodePointResultMatch1 and (not IsPeekCodePointResultMatch or (IsPeekPreviousCodePointResultMatch1 or IsPeekPreviousCodePointResultMatch))
	local NoIsPeekPreviousCodePointResultMatch = not IsPeekPreviousCodePointResultMatch1 and (not IsPeekPreviousCodePointResultMatch or (IsPeekCodePointResultMatch1 or IsPeekCodePointResultMatch))
	local NoNoIsPeekPreviousCodePointResultMatch = nil
	local NoNoIsPeekCodePointResultMatch = nil
	
	if ClosingCharacter == 95 then
		NoNoIsPeekPreviousCodePointResultMatch = NoIsPeekCodePointResultMatch and (not NoIsPeekPreviousCodePointResultMatch or IsPeekPreviousCodePointResultMatch)
		NoNoIsPeekCodePointResultMatch = NoIsPeekPreviousCodePointResultMatch and (not NoIsPeekCodePointResultMatch or IsPeekCodePointResultMatch)
	else
		NoNoIsPeekPreviousCodePointResultMatch = NoIsPeekCodePointResultMatch and ClosingCharacter == p7:getOpeningCharacter()
		NoNoIsPeekCodePointResultMatch = NoIsPeekPreviousCodePointResultMatch and ClosingCharacter == p7:getClosingCharacter()
	end
	return Module2.new(Characters, NoNoIsPeekPreviousCodePointResultMatch, NoNoIsPeekCodePointResultMatch)
end

function InlineParserImplModule:processDelimiters(Previous)
	-- upvalues: config (copy)
	local Previouses = {}
	local LastDelimiter = self._lastDelimiter
	local ContentNestingDepth = nil
	local Flag = nil
	local Next1 = nil
	local Previous2 = nil
	local Largest = nil
	while LastDelimiter ~= nil and LastDelimiter.previous ~= Previous do
		LastDelimiter = LastDelimiter.previous
	end
	while LastDelimiter ~= nil do
		local DelimiterProcessor = self._delimiterProcessors[LastDelimiter.delimiterChar]
		
		if not LastDelimiter:canClose() or DelimiterProcessor == nil then
			LastDelimiter = LastDelimiter.next
			continue
		end
		local NewConfig = config.new(LastDelimiter.delimiterChar, LastDelimiter:originalLength() % 3 + (if LastDelimiter:canOpen() then 3 else 0))
		local Previous1 = Previouses[NewConfig]
		local DelimiterIndex = if Previous1 == nil or DelimiterProcessor._rejectsByMultipleOf3Rule ~= true then nil else self._delimiterIndexes[Previous1]
		local OpeningCharacter = DelimiterProcessor:getOpeningCharacter()
		local ProcessResult = 0
		Flag = false
		ContentNestingDepth = 0
		Next1 = nil
		Previous2 = LastDelimiter.previous
		local Closer = LastDelimiter:getCloser()
		Largest = 0
		while Previous2 ~= nil and (Previous2 ~= Previous and Previous2 ~= Previous1 and (DelimiterIndex == nil or DelimiterIndex < self._delimiterIndexes[Previous2])) do
			if self._limitInlineNesting then
				Largest = math.max(Largest, self:nestingDepthOfSiblings(Previous2:getOpener():getNext(), Closer))
				Closer = Previous2:getOpener()
				
				if self._maxInlineNesting <= Largest then break end
			end
			if Previous2:canOpen() and Previous2.delimiterChar == OpeningCharacter then
				ProcessResult = DelimiterProcessor:process(Previous2, LastDelimiter)
				
				if ProcessResult > 0 then
					Flag = true
					ContentNestingDepth = Largest + 1
					Next1 = Previous2:getOpener():getNext()
					break
				end
			end
			Previous2 = Previous2.previous
		end
		if Flag then
			local Previous3 = Previous2
			
			for _ = 0, ProcessResult - 1 do
				table.remove(Previous3.characters):unlink()
			end
			for _ = 0, ProcessResult - 1 do
				table.remove(LastDelimiter.characters, 1):unlink()
			end
			self:removeDelimitersBetween(Previous3, LastDelimiter)
			
			if Next1 ~= nil then
				self:recordNestingDepth(Next1, ContentNestingDepth)
			end
			if Previous3:length() == 0 then
				self:removeDelimiterAndNodes(Previous3)
			end
			if LastDelimiter:length() ~= 0 then continue end
			local Next2 = LastDelimiter.next
			self:removeDelimiterAndNodes(LastDelimiter)
			LastDelimiter = Next2
			continue
		else
			Previouses[NewConfig] = LastDelimiter.previous
			
			if not LastDelimiter:canOpen() then
				self:removeDelimiterKeepNode(LastDelimiter)
			end
			LastDelimiter = LastDelimiter.next
		end
	end
	while self._lastDelimiter ~= nil and self._lastDelimiter ~= Previous do
		self:removeDelimiterKeepNode(self._lastDelimiter)
	end
end

function InlineParserImplModule:recordNestingDepth(Next1, ContentNestingDepth)
	if not self._limitInlineNesting then return end
	self._nestingDepths[Next1] = ContentNestingDepth
	
	if self._lastBracket ~= nil and self._lastBracket.contentNestingDepth < ContentNestingDepth then
		self._lastBracket.contentNestingDepth = ContentNestingDepth
	end
end

function InlineParserImplModule:nestingDepthOfSiblings(Next1, Closer): number
	local v1 = 0
	local Next2 = Next1
	while Next2 ~= nil and Next2 ~= Closer do
		local NestingDepth = self._nestingDepths[Next2]
		
		if NestingDepth ~= nil and v1 < NestingDepth then
			v1 = NestingDepth
		end
		Next2 = Next2:getNext()
	end
	return v1
end

function InlineParserImplModule:removeDelimitersBetween(Previous, LastDelimiter)
	local Previous1 = LastDelimiter.previous
	while Previous1 ~= nil and Previous1 ~= Previous do
		local Previous2 = Previous1.previous
		self:removeDelimiterKeepNode(Previous1)
		Previous1 = Previous2
	end
end

function InlineParserImplModule:removeDelimiterAndNodes(LastDelimiter)
	self:removeDelimiter(LastDelimiter)
end

function InlineParserImplModule:removeDelimiterKeepNode(LastDelimiter)
	self:removeDelimiter(LastDelimiter)
end

function InlineParserImplModule:removeDelimiter(p8)
	if p8.previous ~= nil then
		p8.previous.next = p8.next
	end
	if p8.next == nil then
		self._lastDelimiter = p8.previous
		
		return
	else
		p8.next.previous = p8.previous
	end
end

function InlineParserImplModule:mergeChildTextNodes(p8)
	if p8:getFirstChild() == nil then return end
	local List = { p8 }
	while #List > 0 do
		self:mergeTextNodesInclusive(table.remove(List), List)
	end
end

function InlineParserImplModule:mergeTextNodesInclusive(Removed, List)
	local v2 = nil
	local v3 = nil
	local Total = 0
	local FirstChild = Removed:getFirstChild()
	local LastChild = Removed:getLastChild()
	while FirstChild ~= nil do
		if FirstChild.kind == "Text" then
			local FirstChild1 = FirstChild
			
			if v2 == nil then
				v2 = FirstChild1
			end
			Total += #FirstChild1.literal
			v3 = FirstChild1
		else
			self:mergeIfNeeded(v2, v3, Total)
			v2 = nil
			v3 = nil
			Total = 0
			
			if FirstChild:getFirstChild() ~= nil then
				table.insert(List, FirstChild)
			end
		end
		if FirstChild == LastChild then break end
		FirstChild = FirstChild:getNext()
	end
	self:mergeIfNeeded(v2, v3, Total)
end

function InlineParserImplModule:mergeIfNeeded(p9, p10, _)
	-- upvalues: SourceSpansModule (copy)
	if p9 ~= nil and p10 ~= nil and p9 ~= p10 then
		local List = { p9.literal }
		local Count = 1
		local v4 = nil
		
		if self._includeSourceSpans then
			local NewSourceSpans = SourceSpansModule.new()
			NewSourceSpans:addAll(p9:getSourceSpans())
			v4 = NewSourceSpans
		end
		local Next1 = p9:getNext()
		local Next2 = p10:getNext()
		while Next1 ~= Next2 do
			local Next3 = Next1
			Count += 1
			List[Count] = Next3.literal
			
			if v4 ~= nil then
				v4:addAll(Next3:getSourceSpans())
			end
			Next1 = Next3:getNext()
			Next3:unlink()
		end
		p9.literal = table.concat(List)
		
		if v4 ~= nil then
			p9:setSourceSpans(v4:getSourceSpans())
		end
	end
end

return InlineParserImplModule