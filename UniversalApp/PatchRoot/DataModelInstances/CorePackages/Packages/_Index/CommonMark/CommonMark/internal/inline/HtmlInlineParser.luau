local CommonMark = script:FindFirstAncestor("CommonMark")
local AsciiMatcherModule = require(CommonMark.text.AsciiMatcher)
local _ = require(CommonMark.text.CharMatcher)
local _ = require(CommonMark.parser.beta.InlineContentParser)
local _ = require(CommonMark.parser.beta.InlineContentParserFactory)
local _ = require(CommonMark.parser.beta.InlineParserState)
local NodesModule = require(CommonMark.node.Nodes)
local ParsedInlineModule = require(CommonMark.parser.beta.ParsedInline)
local _ = require(CommonMark.parser.beta.Position)
local _ = require(CommonMark.parser.beta.Scanner)
local _ = string.byte
local HtmlInlineParserModule = {}
HtmlInlineParserModule.__index = HtmlInlineParserModule
local BuildResult = AsciiMatcherModule.builder():range(65, 90):range(97, 122):build()
local BuildResult1 = BuildResult:newBuilder():range(48, 57):c(45):build()
local BuildResult2 = BuildResult:newBuilder():c(95):c(58):build()
local BuildResult3 = BuildResult2:newBuilder():range(48, 57):c(46):c(45):build()
local BuildResult4 = AsciiMatcherModule.builder():c(32):c(9):c(10):c(11):c(12):c(13):c(34):c(39):c(61):c(60):c(62):c(96):build()

local function htmlInline(PositionResult, ScannerResult)
	-- upvalues: NodesModule (copy), ParsedInlineModule (copy)
	local HtmlInlineResult = NodesModule.HtmlInline()
	HtmlInlineResult.literal = ScannerResult:getSource(PositionResult, ScannerResult:position()):getContent()
	
	return ParsedInlineModule.of(HtmlInlineResult, ScannerResult:position())
end

local function tryOpenTag(ScannerResult, BuildResult)
	-- upvalues: BuildResult1 (copy), BuildResult2 (copy), BuildResult3 (copy)
	ScannerResult:next()
	ScannerResult:match(BuildResult1)
	local IsWhitespaceResultAbove = ScannerResult:whitespace() >= 1
	while IsWhitespaceResultAbove and ScannerResult:match(BuildResult2) >= 1 do
		ScannerResult:match(BuildResult3)
		IsWhitespaceResultAbove = ScannerResult:whitespace() >= 1
		
		if not ScannerResult:nextChar(61) then continue end
		ScannerResult:whitespace()
		local PeekResult = ScannerResult:peek()
		
		if PeekResult == 39 then
			ScannerResult:next()
			
			if ScannerResult:findChar(39) < 0 then
				return false
			end
			ScannerResult:next()
		elseif PeekResult == 34 then
			ScannerResult:next()
			
			if ScannerResult:findChar(34) < 0 then
				return false
			end
			ScannerResult:next()
		elseif ScannerResult:findMatcher(BuildResult) <= 0 then
			return false
		end
		IsWhitespaceResultAbove = ScannerResult:whitespace() >= 1
	end
	ScannerResult:nextChar(47)
	
	return ScannerResult:nextChar(62)
end

local function tryClosingTag(p1)
	-- upvalues: BuildResult (copy), BuildResult1 (copy)
	p1:next()
	
	if p1:match(BuildResult) >= 1 then
		p1:match(BuildResult1)
		p1:whitespace()
		
		return p1:nextChar(62)
	else
		return false
	end
end

function HtmlInlineParserModule.new()
	-- upvalues: HtmlInlineParserModule (copy)
	return (setmetatable({
		_noProcessingInstructionEnd = false,
		_noCommentEnd = false,
		_noCdataEnd = false,
		_noDeclarationEnd = false
	}, HtmlInlineParserModule))
end

function HtmlInlineParserModule:tryParse(p1)
	-- upvalues: BuildResult (copy), tryOpenTag (copy), BuildResult4 (copy), htmlInline (copy), BuildResult1 (copy), BuildResult (copy), ParsedInlineModule (copy)
	local ScannerResult = p1:scanner()
	local PositionResult = ScannerResult:position()
	ScannerResult:next()
	local PeekResult = ScannerResult:peek()
	
	if not BuildResult:matches(PeekResult) then
		if PeekResult == 47 then
			ScannerResult:next()
			local NextCharResult = nil
			
			if ScannerResult:match(BuildResult) >= 1 then
				ScannerResult:match(BuildResult1)
				ScannerResult:whitespace()
				NextCharResult = ScannerResult:nextChar(62)
			else
				NextCharResult = false
			end
			if NextCharResult then
				return htmlInline(PositionResult, ScannerResult)
			end
		elseif PeekResult ~= 63 then
			if PeekResult == 33 then
				ScannerResult:next()
				local PeekResult1 = ScannerResult:peek()
				
				if PeekResult1 == 45 then
					if self:tryComment(ScannerResult) then
						return htmlInline(PositionResult, ScannerResult)
					end
				elseif PeekResult1 == 91 then
					if self:tryCdata(ScannerResult) then
						return htmlInline(PositionResult, ScannerResult)
					end
				elseif BuildResult:matches(PeekResult1) and self:tryDeclaration(ScannerResult) then
					return htmlInline(PositionResult, ScannerResult)
				end
			end
		elseif self:tryProcessingInstruction(ScannerResult) then
			return htmlInline(PositionResult, ScannerResult)
		end
	elseif tryOpenTag(ScannerResult, BuildResult4) then
		return htmlInline(PositionResult, ScannerResult)
	end
	return ParsedInlineModule.none()
end

function HtmlInlineParserModule:tryProcessingInstruction(ScannerResult): boolean
	if self._noProcessingInstructionEnd then
		return false
	end
	ScannerResult:next()
	local Char = nil
	while true do
		Char = ScannerResult:findChar(63)
		if Char <= 0 then break end
		ScannerResult:next()
		
		if ScannerResult:nextChar(62) then
			return true
		end
	end
	self._noProcessingInstructionEnd = Char < 0
	
	return false
end

function HtmlInlineParserModule:tryComment(ScannerResult): boolean
	if self._noCommentEnd then
		return false
	end
	ScannerResult:next()
	
	if not ScannerResult:nextChar(45) then
		return false
	elseif ScannerResult:nextChar(62) or ScannerResult:nextString("->") then
		return true
	else
		while ScannerResult:findChar(45) >= 0 do
			if ScannerResult:nextString("-->") then
				return true
			end
			ScannerResult:next()
		end
		self._noCommentEnd = true
		
		return false
	end
end

function HtmlInlineParserModule:tryCdata(ScannerResult): boolean
	if self._noCdataEnd then
		return false
	end
	ScannerResult:next()
	
	if ScannerResult:nextString("CDATA[") then
		while ScannerResult:findChar(93) >= 0 do
			if ScannerResult:nextString("]]>") then
				return true
			end
			ScannerResult:next()
		end
		self._noCdataEnd = true
	end
	return false
end

function HtmlInlineParserModule:tryDeclaration(ScannerResult): boolean
	-- upvalues: BuildResult (copy)
	if self._noDeclarationEnd then
		return false
	end
	ScannerResult:match(BuildResult)
	
	if ScannerResult:whitespace() <= 0 then
		return false
	elseif ScannerResult:findChar(62) >= 0 then
		ScannerResult:next()
		
		return true
	else
		self._noDeclarationEnd = true
		
		return false
	end
end

local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({}, Module))
end

function Module:getTriggerCharacters()
	return { [60] = true }
end

function Module:create()
	-- upvalues: HtmlInlineParserModule (copy)
	return HtmlInlineParserModule.new()
end

HtmlInlineParserModule.Factory = Module
HtmlInlineParserModule.tryOpenTag = tryOpenTag
HtmlInlineParserModule.tryClosingTag = tryClosingTag

return HtmlInlineParserModule