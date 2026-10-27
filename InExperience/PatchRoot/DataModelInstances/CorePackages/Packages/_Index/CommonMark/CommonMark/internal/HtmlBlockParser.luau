local CommonMark = script:FindFirstAncestor("CommonMark")
local AbstractBlockParserModule = require(CommonMark.parser.block.AbstractBlockParser)
local AsciiMatcherModule = require(CommonMark.text.AsciiMatcher)
local BlockContentModule = require(CommonMark.internal.BlockContent)
local BlockContinueModule = require(CommonMark.parser.block.BlockContinue)
local _ = require(CommonMark.parser.block.BlockParserFactory)
local BlockStartModule = require(CommonMark.parser.block.BlockStart)
local _ = require(CommonMark.text.CharMatcher)
local HtmlInlineParserModule = require(CommonMark.internal.inline.HtmlInlineParser)
local _ = require(CommonMark.parser.block.MatchedBlockParser)
local NodesModule = require(CommonMark.node.Nodes)
local _ = require(CommonMark.parser.block.ParserState)
local ScannerModule = require(CommonMark.parser.beta.Scanner)
local SourceLineModule = require(CommonMark.parser.SourceLine)
local ByteFunction = string.byte
local FindFunction = string.find
local GsubFunction = string.gsub
local LowerFunction = string.lower
local SubFunction = string.sub

local function _(p1): boolean
	return p1 == 32 or (p1 == 9 or (p1 == 10 or (p1 == 11 or (p1 == 12 or p1 == 13))))
end

local config = {
	["\n"] = true,
	["\r"] = true,
	["\r\n"] = true,
	[""] = true,
	[" "] = true,
	[" "] = true
}

local _ = function(p1, Count: number): boolean
	-- upvalues: ByteFunction (copy), config (copy), SubFunction (copy)
	return Count == #p1 or (ByteFunction(p1, Count + 1) ~= 10 or Count <= 0 or ByteFunction(p1, Count - 1 + 1) ~= 13) and config[SubFunction(p1, Count + 1)] == true
end

local _ = function(p1, p2: number)
	-- upvalues: FindFunction (copy), LowerFunction (copy), SubFunction (copy)
	local _, AZaZ092 = FindFunction(p1, "^[A-Za-z0-9]*", p2 + 1)
	
	return LowerFunction((SubFunction(p1, p2 + 1, AZaZ092))), AZaZ092
end

local config1 = { script = true, pre = true, style = true, textarea = true }

local function isType1Opener(p1): boolean
	-- upvalues: ByteFunction (copy), FindFunction (copy), LowerFunction (copy), SubFunction (copy), config1 (copy), config (copy)
	if ByteFunction(p1, 1) ~= 60 then
		return false
	end
	local _, AZaZ092 = FindFunction(p1, "^[A-Za-z0-9]*", 2)
	
	if not config1[LowerFunction((SubFunction(p1, 2, AZaZ092)))] then
		return false
	end
	local ByteResult = ByteFunction(p1, AZaZ092 + 1)
	local IsByteResultMatch: boolean = ByteResult == 32 or (ByteResult == 9 or (ByteResult == 10 or (ByteResult == 11 or (ByteResult == 12 or ByteResult == 13))))
	
	if not IsByteResultMatch then
		IsByteResultMatch = true
		
		if ByteResult ~= 62 then
			if AZaZ092 == #p1 then
				return true
			end
			if ByteFunction(p1, AZaZ092 + 1) == 10 and AZaZ092 > 0 and ByteFunction(p1, AZaZ092 - 1 + 1) == 13 then
				return false
			end
			IsByteResultMatch = config[SubFunction(p1, AZaZ092 + 1)] == true
		end
	end
	return IsByteResultMatch
end

local function findType1Closer(p1): boolean
	-- upvalues: LowerFunction (copy), FindFunction (copy)
	local LowerResult = LowerFunction(p1)
	
	return FindFunction(LowerResult, "</script>", 1, true) ~= nil or (FindFunction(LowerResult, "</pre>", 1, true) ~= nil or FindFunction(LowerResult, "</style>", 1, true) ~= nil) or FindFunction(LowerResult, "</textarea>", 1, true) ~= nil
end

local function isType2Opener(p1): boolean
	-- upvalues: SubFunction (copy)
	return SubFunction(p1, 1, 4) == "<!--"
end

local function findType2Closer(p1): boolean
	-- upvalues: FindFunction (copy)
	return FindFunction(p1, "-->", 1, true) ~= nil
end

local function isType3Opener(p1): boolean
	-- upvalues: SubFunction (copy)
	return SubFunction(p1, 1, 2) == "<?"
end

local function findType3Closer(p1): boolean
	-- upvalues: FindFunction (copy)
	return FindFunction(p1, "?>", 1, true) ~= nil
end

local function isType4Opener(p1): boolean
	-- upvalues: FindFunction (copy)
	return FindFunction(p1, "^<![A-Z]") ~= nil
end

local function findType4Closer(p1): boolean
	-- upvalues: FindFunction (copy)
	return FindFunction(p1, ">", 1, true) ~= nil
end

local function isType5Opener(p1): boolean
	-- upvalues: SubFunction (copy)
	return SubFunction(p1, 1, 9) == "<![CDATA["
end

local function findType5Closer(p1): boolean
	-- upvalues: FindFunction (copy)
	return FindFunction(p1, "]]>", 1, true) ~= nil
end

local t = {}

for _, value in {
	"address", "article", "aside", "base", "basefont", "blockquote", "body",
	"caption", "center", "col", "colgroup", "dd", "details", "dialog", "dir",
	"div", "dl", "dt", "fieldset", "figcaption", "figure", "footer", "form",
	"frame", "frameset", "h1", "h2", "h3", "h4", "h5", "h6", "head", "header",
	"hr", "html", "iframe", "legend", "li", "link", "main", "menu", "menuitem",
	"nav", "noframes", "ol", "optgroup", "option", "p", "param", "search",
	"section", "summary", "table", "tbody", "td", "tfoot", "th", "thead", "title",
	"tr", "track", "ul"
} do
	t[value] = true
end
local BuildResult = AsciiMatcherModule.builder():range(65, 90):range(97, 122):build()
local BuildResult1 = AsciiMatcherModule.builder():range(0, 32):anyOf("\"'=<>`"):build()
local list = {
	{ opener = isType1Opener, closer = findType1Closer },
	{ opener = isType2Opener, closer = findType2Closer },
	{ opener = isType3Opener, closer = findType3Closer },
	{ opener = isType4Opener, closer = findType4Closer },
	{ opener = isType5Opener, closer = findType5Closer },
	{
		closer = nil,
		opener = function(p1): boolean
			-- upvalues: ByteFunction (copy), FindFunction (copy), LowerFunction (copy), SubFunction (copy), t (copy), config (copy)
			if ByteFunction(p1, 1) ~= 60 then
				return false
			end
			local v1: number = if ByteFunction(p1, 2) == 47 then 2 else 1
			local _, AZaZ092 = FindFunction(p1, "^[A-Za-z0-9]*", v1 + 1)
			
			if not t[LowerFunction((SubFunction(p1, v1 + 1, AZaZ092)))] then
				return false
			end
			local ByteResult = ByteFunction(p1, AZaZ092 + 1)
			local IsByteResultMatch: boolean = ByteResult == 32 or (ByteResult == 9 or (ByteResult == 10 or (ByteResult == 11 or (ByteResult == 12 or ByteResult == 13))))
			repeat
				if IsByteResultMatch then break end
				IsByteResultMatch = true
				
				if ByteResult == 62 then break end
				if ByteResult == 47 then
					IsByteResultMatch = true
					
					if ByteFunction(p1, AZaZ092 + 1 + 1) == 62 then break end
				end
				if AZaZ092 == #p1 then
					return true
				end
				if ByteFunction(p1, AZaZ092 + 1) == 10 and AZaZ092 > 0 and ByteFunction(p1, AZaZ092 - 1 + 1) == 13 then
					return false
				end
				IsByteResultMatch = config[SubFunction(p1, AZaZ092 + 1)] == true
			until true
			return IsByteResultMatch
		end
	},
	{
		closer = nil,
		opener = function(p1): boolean
			-- upvalues: ByteFunction (copy), FindFunction (copy), GsubFunction (copy), ScannerModule (copy), SourceLineModule (copy), BuildResult (copy), HtmlInlineParserModule (copy), BuildResult1 (copy), config (copy), SubFunction (copy)
			if ByteFunction(p1, 1) ~= 60 then
				return false
			end
			local Z = if FindFunction(p1, "\0", 1, true) == nil then p1 else GsubFunction(p1, "%z", "\1")
			local NewScanner = ScannerModule.new({ SourceLineModule.of(Z, nil) }, 0, 1)
			local PeekResult = NewScanner:peek()
			
			if if BuildResult:matches(PeekResult) then HtmlInlineParserModule.tryOpenTag(NewScanner, BuildResult1) else PeekResult == 47 and HtmlInlineParserModule.tryClosingTag(NewScanner) then
				NewScanner:whitespace()
				local Index: number = NewScanner:position().index
				
				return Index == #Z or (ByteFunction(Z, Index + 1) ~= 10 or Index <= 0 or ByteFunction(Z, Index - 1 + 1) ~= 13) and config[SubFunction(Z, Index + 1)] == true
			else
				return false
			end
		end
	}
}
local self = setmetatable({}, { __index = AbstractBlockParserModule })
self.__index = self

function self.new(_closingPattern)
	-- upvalues: NodesModule (copy), BlockContentModule (copy), self (copy)
	return (setmetatable({
		_finished = false,
		_block = NodesModule.HtmlBlock(),
		_closingPattern = _closingPattern,
		_content = BlockContentModule.new()
	}, self))
end

function self:getBlock()
	return self._block
end

function self.tryContinue(p1, p2)
	-- upvalues: BlockContinueModule (copy)
	return if p1._finished then BlockContinueModule.none() elseif p2:isBlank() and p1._closingPattern == nil then BlockContinueModule.none() else BlockContinueModule.atIndex(p2:getIndex())
end

function self:addLine(p1)
	self._content:add(p1:getContent())
	local ClosingPatternFunction = self._closingPattern
	
	if ClosingPatternFunction ~= nil and ClosingPatternFunction(p1:getContent()) then
		self._finished = true
	end
end

function self:closeBlock()
	self._block.literal = self._content:getString()
	self._content = nil
end

local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({}, Module))
end

function Module:tryStart(p1, p2)
	-- upvalues: ByteFunction (copy), list (copy), SubFunction (copy), BlockStartModule (copy), self (copy)
	local NextNonSpaceIndex: number = p1:getNextNonSpaceIndex()
	local Content = p1:getLine():getContent()
	
	if p1:getIndent() < 4 and ByteFunction(Content, NextNonSpaceIndex + 1) == 60 then
		local Closer = nil
		for i = 1, 7 do
			if i ~= 7 or p2:getMatchedBlockParser():getBlock().kind ~= "Paragraph" and not p1:getActiveBlockParser():canHaveLazyContinuationLines() then
				Closer = list[i].closer
				
				if list[i].opener((SubFunction(Content, NextNonSpaceIndex + 1))) then
					return BlockStartModule.of(self.new(Closer)):atIndex(p1:getIndex())
				end
			end
		end
	end
	return BlockStartModule.none()
end

self.Factory = Module
self._BLOCK_PATTERNS = list

return self