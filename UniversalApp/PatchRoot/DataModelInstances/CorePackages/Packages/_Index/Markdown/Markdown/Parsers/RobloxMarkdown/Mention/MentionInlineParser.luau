local CommonMarkModule = require(script:FindFirstAncestor("Markdown").Parent.CommonMark)
local MentionModule = require(script.Parent.Mention)
local _ = string.byte
local BuildResult = CommonMarkModule.Text.AsciiMatcher.builder():range(48, 57):build()
local BuildResult1 = CommonMarkModule.Text.AsciiMatcher.builder():range(65, 90):range(97, 122):range(48, 57):c(95):build()
local MentionInlineParserModule = {}
MentionInlineParserModule.__index = MentionInlineParserModule

function MentionInlineParserModule.new()
	-- upvalues: MentionInlineParserModule (copy)
	return (setmetatable({}, MentionInlineParserModule))
end

function MentionInlineParserModule:tryParse(p1)
	-- upvalues: CommonMarkModule (copy), BuildResult (copy), BuildResult1 (copy), MentionModule (copy)
	local ScannerResult = p1:scanner()
	ScannerResult:next()
	
	if not ScannerResult:nextChar(64) then
		return CommonMarkModule.Parser.Beta.ParsedInline.none()
	end
	local PositionResult = ScannerResult:position()
	
	if ScannerResult:match(BuildResult) == 0 then
		return CommonMarkModule.Parser.Beta.ParsedInline.none()
	end
	local Content = ScannerResult:getSource(PositionResult, ScannerResult:position()):getContent()
	local Content1 = nil
	
	if ScannerResult:nextChar(58) then
		local PositionResult1 = ScannerResult:position()
		
		if ScannerResult:match(BuildResult1) == 0 then
			return CommonMarkModule.Parser.Beta.ParsedInline.none()
		end
		Content1 = ScannerResult:getSource(PositionResult1, ScannerResult:position()):getContent()
	end
	return if ScannerResult:nextChar(62) then CommonMarkModule.Parser.Beta.ParsedInline.of(MentionModule(Content, Content1), ScannerResult:position()) else CommonMarkModule.Parser.Beta.ParsedInline.none()
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
	-- upvalues: MentionInlineParserModule (copy)
	return MentionInlineParserModule.new()
end

MentionInlineParserModule.Factory = Module

return MentionInlineParserModule