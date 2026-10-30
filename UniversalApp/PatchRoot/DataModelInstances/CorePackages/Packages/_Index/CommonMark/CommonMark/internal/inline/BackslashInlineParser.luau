local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.parser.beta.InlineContentParser)
local _ = require(CommonMark.parser.beta.InlineContentParserFactory)
local _ = require(CommonMark.parser.beta.InlineParserState)
local NodesModule = require(CommonMark.node.Nodes)
local ParsedInlineModule = require(CommonMark.parser.beta.ParsedInline)
local _ = string.byte
local CharFunction = string.char
local FindFunction = string.find
local BackslashInlineParserModule = {}
BackslashInlineParserModule.__index = BackslashInlineParserModule
local Text = "^" .. require(CommonMark.internal.util.Escaping).ESCAPABLE .. "$"

function BackslashInlineParserModule.new(Enabled)
	-- upvalues: BackslashInlineParserModule (copy)
	return (setmetatable({ _hardLineBreakEnabled = Enabled ~= false }, BackslashInlineParserModule))
end

function BackslashInlineParserModule:tryParse(p1)
	-- upvalues: ParsedInlineModule (copy), NodesModule (copy), FindFunction (copy), CharFunction (copy), Text (copy)
	local ScannerResult = p1:scanner()
	ScannerResult:next()
	local PeekResult = ScannerResult:peek()
	
	if PeekResult == 10 and self._hardLineBreakEnabled then
		ScannerResult:next()
		
		return ParsedInlineModule.of(NodesModule.HardLineBreak(), ScannerResult:position())
	elseif FindFunction(CharFunction(PeekResult), Text) == nil then
		return ParsedInlineModule.of(NodesModule.Text("\\"), ScannerResult:position())
	else
		ScannerResult:next()
		
		return ParsedInlineModule.of(NodesModule.Text((CharFunction(PeekResult))), ScannerResult:position())
	end
end

local Module = {}
Module.__index = Module

function Module.new(_hardLineBreakEnabled)
	-- upvalues: Module (copy)
	return (setmetatable({ _hardLineBreakEnabled = _hardLineBreakEnabled }, Module))
end

function Module:getTriggerCharacters()
	return { [92] = true }
end

function Module:create()
	-- upvalues: BackslashInlineParserModule (copy)
	return BackslashInlineParserModule.new(self._hardLineBreakEnabled)
end

BackslashInlineParserModule.Factory = Module

return BackslashInlineParserModule