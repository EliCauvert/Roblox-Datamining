local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.parser.delimiter.DelimiterProcessor)
local _ = require(CommonMark.parser.delimiter.DelimiterRun)
local NodesModule = require(CommonMark.node.Nodes)
local SourceSpansModule = require(CommonMark.node.SourceSpans)
local EmphasisDelimiterProcessorModule = {}
EmphasisDelimiterProcessorModule.__index = EmphasisDelimiterProcessorModule

function EmphasisDelimiterProcessorModule.new(_delimiterChar, p1)
	-- upvalues: NodesModule (copy), EmphasisDelimiterProcessorModule (copy)
	local MinLength = if p1 == nil or p1.minLength == nil then 1 else p1.minLength
	
	if MinLength ~= 1 and MinLength ~= 2 then
		error(`EmphasisLikeDelimiterProcessor minLength must be 1 or 2, got {MinLength}`)
	end
	return (setmetatable({
		_rejectsByMultipleOf3Rule = true,
		_delimiterChar = _delimiterChar,
		_minLength = MinLength,
		_createEmphasis = if p1 == nil or p1.createEmphasis == nil then NodesModule.Emphasis else p1.createEmphasis,
		_createStrongEmphasis = if p1 == nil or p1.createStrongEmphasis == nil then NodesModule.StrongEmphasis else p1.createStrongEmphasis
	}, EmphasisDelimiterProcessorModule))
end

function EmphasisDelimiterProcessorModule:getOpeningCharacter()
	return self._delimiterChar
end

function EmphasisDelimiterProcessorModule:getClosingCharacter()
	return self._delimiterChar
end

function EmphasisDelimiterProcessorModule:getMinLength()
	return self._minLength
end

function EmphasisDelimiterProcessorModule:process(p1, p2): number
	-- upvalues: SourceSpansModule (copy), NodesModule (copy)
	if (p1:canClose() or p2:canOpen()) and (p2:originalLength() % 3 ~= 0 and (p1:originalLength() + p2:originalLength()) % 3 == 0) then
		return 0
	end
	local v1 = nil
	local Emphasis = nil
	if p1:length() >= 2 and p2:length() >= 2 then
		v1 = 2
		Emphasis = self._createStrongEmphasis((string.char(self._delimiterChar, self._delimiterChar)))
	else
		v1 = 1
		Emphasis = self._createEmphasis((string.char(self._delimiterChar)))
	end
	local EmptyResult = SourceSpansModule.empty()
	EmptyResult:addAllFrom((p1:getOpeners(v1)))
	local Opener = p1:getOpener()
	
	for i in NodesModule.between(Opener, p2:getCloser()) do
		Emphasis:appendChild(i)
		EmptyResult:addAll(i:getSourceSpans())
	end
	EmptyResult:addAllFrom((p2:getClosers(v1)))
	Emphasis:setSourceSpans(EmptyResult:getSourceSpans())
	Opener:insertAfter(Emphasis)
	
	return v1
end

return EmphasisDelimiterProcessorModule