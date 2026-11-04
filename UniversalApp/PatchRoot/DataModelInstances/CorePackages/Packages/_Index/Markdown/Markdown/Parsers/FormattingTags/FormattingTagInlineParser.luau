local CommonMarkModule = require(script:FindFirstAncestor("Markdown").Parent.CommonMark)
local FormattingTagModule = require(script.Parent.FormattingTag)
local _ = string.byte
local config = { [98] = true, [105] = true, [117] = true, [115] = true }
local FormattingTagInlineParserModule = {}
FormattingTagInlineParserModule.__index = FormattingTagInlineParserModule

function FormattingTagInlineParserModule.new()
	-- upvalues: FormattingTagInlineParserModule (copy)
	return (setmetatable({}, FormattingTagInlineParserModule))
end

function FormattingTagInlineParserModule:tryParse(p1)
	-- upvalues: config (copy), CommonMarkModule (copy), FormattingTagModule (copy)
	local ScannerResult = p1:scanner()
	local PositionResult = ScannerResult:position()
	ScannerResult:next()
	ScannerResult:nextChar(47)
	
	if config[ScannerResult:peek()] then
		ScannerResult:next()
		
		return if ScannerResult:nextChar(62) then CommonMarkModule.Parser.Beta.ParsedInline.of(FormattingTagModule.text((ScannerResult:getSource(PositionResult, ScannerResult:position()):getContent())), ScannerResult:position()) else CommonMarkModule.Parser.Beta.ParsedInline.none()
	else
		return CommonMarkModule.Parser.Beta.ParsedInline.none()
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
	-- upvalues: FormattingTagInlineParserModule (copy)
	return FormattingTagInlineParserModule.new()
end

FormattingTagInlineParserModule.Factory = Module

return FormattingTagInlineParserModule