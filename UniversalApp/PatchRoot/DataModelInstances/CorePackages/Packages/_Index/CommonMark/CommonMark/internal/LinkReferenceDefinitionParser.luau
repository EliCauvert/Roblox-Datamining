local CommonMark = script:FindFirstAncestor("CommonMark")
local EscapingModule = require(CommonMark.internal.util.Escaping)
local LinkScannerModule = require(CommonMark.internal.util.LinkScanner)
local NodesModule = require(CommonMark.node.Nodes)
local _ = require(CommonMark.parser.beta.Position)
local ScannerModule = require(CommonMark.parser.beta.Scanner)
local _ = require(CommonMark.parser.SourceLine)
local SourceLinesModule = require(CommonMark.parser.SourceLines)
local _ = require(CommonMark.node.SourceSpan)
local ByteFunction = string.byte
local GsubFunction = string.gsub
local SubFunction = string.sub
local LinkReferenceDefinitionParserModule = {}
LinkReferenceDefinitionParserModule.__index = LinkReferenceDefinitionParserModule
LinkReferenceDefinitionParserModule.State = table.freeze({
	START_DEFINITION = "START_DEFINITION",
	LABEL = "LABEL",
	DESTINATION = "DESTINATION",
	START_TITLE = "START_TITLE",
	TITLE = "TITLE",
	PARAGRAPH = "PARAGRAPH"
})
local State = LinkReferenceDefinitionParserModule.State

function LinkReferenceDefinitionParserModule.new(Enabled)
	-- upvalues: State (copy), LinkReferenceDefinitionParserModule (copy)
	return (setmetatable({
		_label = nil,
		_destination = nil,
		_titleDelimiter = 0,
		_title = nil,
		_referenceValid = false,
		_state = if Enabled == false then State.PARAGRAPH else State.START_DEFINITION,
		_paragraphLines = {},
		_definitions = {},
		_sourceSpans = {}
	}, LinkReferenceDefinitionParserModule))
end

function LinkReferenceDefinitionParserModule:parse(p1)
	-- upvalues: State (copy), ScannerModule (copy), SourceLinesModule (copy)
	table.insert(self._paragraphLines, p1)
	
	if self._state == State.PARAGRAPH then return end
	local OfResult = ScannerModule.of(SourceLinesModule.of(p1))
	while OfResult:hasNext() do
		local DestinationResult = nil
		local State1 = self._state
		
		if State1 == State.START_DEFINITION then
			DestinationResult = self:startDefinition(OfResult)
		elseif State1 == State.LABEL then
			DestinationResult = self:label(OfResult)
		elseif State1 == State.DESTINATION then
			DestinationResult = self:destination(OfResult)
		elseif State1 == State.START_TITLE then
			DestinationResult = self:startTitle(OfResult)
		elseif State1 == State.TITLE then
			DestinationResult = self:title(OfResult)
		else
			error(`Unknown parsing state: {State1}`)
		end
		if DestinationResult then continue end
		self._state = State.PARAGRAPH
		self:finishReference()
		break
	end
end

function LinkReferenceDefinitionParserModule:addSourceSpan(p2)
	table.insert(self._sourceSpans, p2)
end

function LinkReferenceDefinitionParserModule:getParagraphLines()
	-- upvalues: SourceLinesModule (copy)
	return SourceLinesModule.ofList(self._paragraphLines)
end

function LinkReferenceDefinitionParserModule:getParagraphSourceSpans()
	return self._sourceSpans
end

function LinkReferenceDefinitionParserModule:getDefinitions()
	self:finishReference()
	
	return self._definitions
end

function LinkReferenceDefinitionParserModule:getState()
	return self._state
end

local function removeLast(p2: number, Tbl)
	if #Tbl <= p2 then
		table.clear(Tbl)
		
		return
	end
	for _ = 0, p2 - 1 do
		table.remove(Tbl)
	end
end

function LinkReferenceDefinitionParserModule:removeLines(p3)
	-- upvalues: removeLast (copy)
	local SourceSpans = self._sourceSpans
	local Frozen = table.freeze(table.move(SourceSpans, math.max(#SourceSpans - p3, 0) + 1, #SourceSpans, 1, {}))
	removeLast(p3, self._paragraphLines)
	removeLast(p3, SourceSpans)
	
	return Frozen
end

function LinkReferenceDefinitionParserModule:startDefinition(OfResult): boolean
	-- upvalues: State (copy)
	self:finishReference()
	OfResult:whitespace()
	
	if not OfResult:nextChar(91) then
		return false
	end
	self._state = State.LABEL
	local _label = {}
	self._label = _label
	
	if not OfResult:hasNext() then
		table.insert(_label, "\n")
	end
	return true
end

local function _(p3)
	-- upvalues: GsubFunction (copy)
	local _, v1 = GsubFunction(p3, "[^\128-\191]", "")
	
	return v1
end

function LinkReferenceDefinitionParserModule:label(OfResult): boolean
	-- upvalues: LinkScannerModule (copy), GsubFunction (copy), EscapingModule (copy), State (copy)
	local PositionResult = OfResult:position()
	
	if not LinkScannerModule.scanLinkLabelContent(OfResult) then
		return false
	end
	local Label = self._label
	table.insert(Label, OfResult:getSource(PositionResult, OfResult:position()):getContent())
	
	if not OfResult:hasNext() then
		table.insert(Label, "\n")
		
		return true
	elseif not OfResult:nextChar(93) then
		return false
	elseif not OfResult:nextChar(58) then
		return false
	else
		local Joined = table.concat(Label)
		local _, v1 = GsubFunction(Joined, "[^\128-\191]", "")
		
		if v1 > 999 then
			return false
		elseif EscapingModule.normalizeLabelContent(Joined) == "" then
			return false
		else
			self._state = State.DESTINATION
			OfResult:whitespace()
			
			return true
		end
	end
end

function LinkReferenceDefinitionParserModule:destination(OfResult): boolean
	-- upvalues: LinkScannerModule (copy), ByteFunction (copy), SubFunction (copy), State (copy)
	OfResult:whitespace()
	local PositionResult = OfResult:position()
	
	if not LinkScannerModule.scanLinkDestination(OfResult) then
		return false
	end
	local Content = OfResult:getSource(PositionResult, OfResult:position()):getContent()
	self._destination = if ByteFunction(Content, 1) == 60 then SubFunction(Content, 2, #Content - 1) else Content
	local WhitespaceResult = OfResult:whitespace()
	
	if not OfResult:hasNext() then
		self._referenceValid = true
		table.clear(self._paragraphLines)
	elseif WhitespaceResult == 0 then
		return false
	end
	self._state = State.START_TITLE
	
	return true
end

function LinkReferenceDefinitionParserModule:startTitle(OfResult): boolean
	-- upvalues: State (copy)
	OfResult:whitespace()
	
	if not OfResult:hasNext() then
		self._state = State.START_DEFINITION
		
		return true
	end
	self._titleDelimiter = 0
	local PeekResult = OfResult:peek()
	
	if PeekResult == 34 or PeekResult == 39 then
		self._titleDelimiter = PeekResult
	elseif PeekResult == 40 then
		self._titleDelimiter = 41
	end
	if self._titleDelimiter == 0 then
		self._state = State.START_DEFINITION
	else
		self._state = State.TITLE
		local _title = {}
		self._title = _title
		OfResult:next()
		
		if not OfResult:hasNext() then
			table.insert(_title, "\n")
		end
	end
	return true
end

function LinkReferenceDefinitionParserModule:title(OfResult): boolean
	-- upvalues: LinkScannerModule (copy), State (copy)
	local PositionResult = OfResult:position()
	
	if not LinkScannerModule.scanLinkTitleContent(OfResult, self._titleDelimiter) then
		self._title = nil
		
		return false
	end
	local Title = self._title
	table.insert(Title, OfResult:getSource(PositionResult, OfResult:position()):getContent())
	
	if not OfResult:hasNext() then
		table.insert(Title, "\n")
		
		return true
	end
	OfResult:next()
	OfResult:whitespace()
	
	if OfResult:hasNext() then
		self._title = nil
		
		return false
	else
		self._referenceValid = true
		table.clear(self._paragraphLines)
		self._state = State.START_DEFINITION
		
		return true
	end
end

function LinkReferenceDefinitionParserModule:finishReference()
	-- upvalues: EscapingModule (copy), NodesModule (copy)
	if self._referenceValid then
		local LinkReferenceDefinitionResult = NodesModule.LinkReferenceDefinition(table.concat(self._label), EscapingModule.unescapeString(self._destination), if self._title == nil then nil else EscapingModule.unescapeString(table.concat(self._title)))
		LinkReferenceDefinitionResult:setSourceSpans(self._sourceSpans)
		table.clear(self._sourceSpans)
		table.insert(self._definitions, LinkReferenceDefinitionResult)
		self._label = nil
		self._referenceValid = false
		self._destination = nil
		self._title = nil
		
		return
	end
end

return LinkReferenceDefinitionParserModule