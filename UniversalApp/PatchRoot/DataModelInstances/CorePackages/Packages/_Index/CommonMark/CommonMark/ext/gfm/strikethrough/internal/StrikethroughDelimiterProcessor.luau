local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.parser.delimiter.DelimiterProcessor)
local _ = require(CommonMark.parser.delimiter.DelimiterRun)
local NodesModule = require(CommonMark.node.Nodes)
local SourceSpansModule = require(CommonMark.node.SourceSpans)
local StrikethroughModule = require(CommonMark.ext.gfm.strikethrough.Strikethrough)
local StrikethroughDelimiterProcessorModule = {}
StrikethroughDelimiterProcessorModule.__index = StrikethroughDelimiterProcessorModule

function StrikethroughDelimiterProcessorModule.new(Enabled)
	-- upvalues: StrikethroughDelimiterProcessorModule (copy)
	return (setmetatable({ _requireTwoTildes = Enabled == true }, StrikethroughDelimiterProcessorModule))
end

function StrikethroughDelimiterProcessorModule:getOpeningCharacter(): number
	return 126
end

function StrikethroughDelimiterProcessorModule:getClosingCharacter(): number
	return 126
end

function StrikethroughDelimiterProcessorModule.getMinLength(p1): number
	return if p1._requireTwoTildes then 2 else 1
end

function StrikethroughDelimiterProcessorModule:process(p1, p2)
	-- upvalues: StrikethroughModule (copy), SourceSpansModule (copy), NodesModule (copy)
	if p1:length() ~= p2:length() or p1:length() > 2 then
		return 0
	end
	local Opener = p1:getOpener()
	local Literal = Opener.literal
	local StrikethroughModuleResult = StrikethroughModule(if p1:length() == 1 then Literal else Literal .. Literal)
	local NewSourceSpans = SourceSpansModule.new()
	NewSourceSpans:addAllFrom((p1:getOpeners(p1:length())))
	
	for i in NodesModule.between(Opener, p2:getCloser()) do
		StrikethroughModuleResult:appendChild(i)
		NewSourceSpans:addAll(i:getSourceSpans())
	end
	NewSourceSpans:addAllFrom((p2:getClosers(p2:length())))
	StrikethroughModuleResult:setSourceSpans(NewSourceSpans:getSourceSpans())
	Opener:insertAfter(StrikethroughModuleResult)
	
	return p1:length()
end

return StrikethroughDelimiterProcessorModule