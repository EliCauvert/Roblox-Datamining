local CommonMark = script:FindFirstAncestor("CommonMark")
local CharactersModule = require(CommonMark.text.Characters)
local _ = require(CommonMark.parser.beta.InlineContentParser)
local _ = require(CommonMark.parser.beta.InlineContentParserFactory)
local _ = require(CommonMark.parser.beta.InlineParserState)
local NodesModule = require(CommonMark.node.Nodes)
local ParsedInlineModule = require(CommonMark.parser.beta.ParsedInline)
local _ = require(CommonMark.parser.beta.Position)
local ByteFunction = string.byte
local GsubFunction = string.gsub
local SubFunction = string.sub
local BackticksInlineParserModule = {}
BackticksInlineParserModule.__index = BackticksInlineParserModule

function BackticksInlineParserModule.new()
	-- upvalues: BackticksInlineParserModule (copy)
	return (setmetatable({ _scannedToEnd = false, _backtickPositions = {} }, BackticksInlineParserModule))
end

function BackticksInlineParserModule:tryParse(p1)
	-- upvalues: NodesModule (copy), ParsedInlineModule (copy), GsubFunction (copy), ByteFunction (copy), CharactersModule (copy), SubFunction (copy)
	local ScannerResult = p1:scanner()
	local PositionResult = ScannerResult:position()
	local MatchMultipleResult = ScannerResult:matchMultiple(96)
	local PositionResult1 = ScannerResult:position()
	local PositionResult2 = nil
	
	if self._scannedToEnd then
		local BacktickPosition = self._backtickPositions[MatchMultipleResult]
		
		if BacktickPosition == nil or BacktickPosition:compareTo(PositionResult) <= 0 then
			return ParsedInlineModule.of(NodesModule.Text(ScannerResult:getSource(PositionResult, PositionResult1):getContent()), PositionResult1)
		end
	end
	while ScannerResult:findChar(96) > 0 do
		PositionResult2 = ScannerResult:position()
		local MatchMultipleResult1 = ScannerResult:matchMultiple(96)
		self._backtickPositions[MatchMultipleResult1] = PositionResult2
		
		if MatchMultipleResult1 ~= MatchMultipleResult then continue end
		local CodeResult = NodesModule.Code()
		local Literal = GsubFunction(ScannerResult:getSource(PositionResult1, PositionResult2):getContent(), "\n", " ")
		
		if #Literal >= 3 and ByteFunction(Literal, 1) == 32 and ByteFunction(Literal, #Literal) == 32 and CharactersModule.hasNonSpace(Literal) then
			Literal = SubFunction(Literal, 2, #Literal - 1)
		end
		CodeResult.literal = Literal
		
		return ParsedInlineModule.of(CodeResult, ScannerResult:position())
	end
	self._scannedToEnd = true
	
	return ParsedInlineModule.of(NodesModule.Text(ScannerResult:getSource(PositionResult, PositionResult1):getContent()), PositionResult1)
end

local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({}, Module))
end

function Module:getTriggerCharacters()
	return { [96] = true }
end

function Module:create()
	-- upvalues: BackticksInlineParserModule (copy)
	return BackticksInlineParserModule.new()
end

BackticksInlineParserModule.Factory = Module

return BackticksInlineParserModule