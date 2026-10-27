local CommonMark = script:FindFirstAncestor("CommonMark")
local AsciiMatcherModule = require(CommonMark.text.AsciiMatcher)
local _ = require(CommonMark.text.CharMatcher)
local Html5EntitiesModule = require(CommonMark.internal.util.Html5Entities)
local _ = require(CommonMark.parser.beta.InlineContentParser)
local _ = require(CommonMark.parser.beta.InlineContentParserFactory)
local _ = require(CommonMark.parser.beta.InlineParserState)
local NodesModule = require(CommonMark.node.Nodes)
local ParsedInlineModule = require(CommonMark.parser.beta.ParsedInline)
local _ = require(CommonMark.parser.beta.Position)
local _ = require(CommonMark.parser.beta.Scanner)
local _ = string.byte
local EntityInlineParserModule = {}
EntityInlineParserModule.__index = EntityInlineParserModule
local BuildResult = AsciiMatcherModule.builder():range(48, 57):range(65, 70):range(97, 102):build()
local BuildResult1 = AsciiMatcherModule.builder():range(48, 57):build()
local BuildResult2 = AsciiMatcherModule.builder():range(65, 90):range(97, 122):build()
local BuildResult3 = BuildResult2:newBuilder():range(48, 57):build()

function EntityInlineParserModule.new()
	-- upvalues: EntityInlineParserModule (copy)
	return (setmetatable({}, EntityInlineParserModule))
end

function EntityInlineParserModule:tryParse(p1)
	-- upvalues: BuildResult (copy), BuildResult1 (copy), BuildResult2 (copy), BuildResult3 (copy), ParsedInlineModule (copy)
	local ScannerResult = p1:scanner()
	local PositionResult = ScannerResult:position()
	ScannerResult:next()
	local PeekResult = ScannerResult:peek()
	
	if PeekResult == 35 then
		ScannerResult:next()
		
		if ScannerResult:nextChar(120) or ScannerResult:nextChar(88) then
			local MatchResult: number = ScannerResult:match(BuildResult)
			
			if MatchResult >= 1 and MatchResult <= 6 and ScannerResult:nextChar(59) then
				return self:entity(ScannerResult, PositionResult)
			end
		else
			local MatchResult: number = ScannerResult:match(BuildResult1)
			
			if MatchResult >= 1 and MatchResult <= 7 and ScannerResult:nextChar(59) then
				return self:entity(ScannerResult, PositionResult)
			end
		end
	elseif BuildResult2:matches(PeekResult) then
		ScannerResult:match(BuildResult3)
		
		if ScannerResult:nextChar(59) then
			return self:entity(ScannerResult, PositionResult)
		end
	end
	return ParsedInlineModule.none()
end

function EntityInlineParserModule:entity(ScannerResult, PositionResult)
	-- upvalues: ParsedInlineModule (copy), NodesModule (copy), Html5EntitiesModule (copy)
	return ParsedInlineModule.of(NodesModule.Text(Html5EntitiesModule.entityToString((ScannerResult:getSource(PositionResult, ScannerResult:position()):getContent()))), ScannerResult:position())
end

local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({}, Module))
end

function Module:getTriggerCharacters()
	return { [38] = true }
end

function Module:create()
	-- upvalues: EntityInlineParserModule (copy)
	return EntityInlineParserModule.new()
end

EntityInlineParserModule.Factory = Module

return EntityInlineParserModule