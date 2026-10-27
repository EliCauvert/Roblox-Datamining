local SourceSpanModule = require(script:FindFirstAncestor("CommonMark").node.SourceSpan)
local SourceSpansModule = {}
SourceSpansModule.__index = SourceSpansModule

function SourceSpansModule.new()
	-- upvalues: SourceSpansModule (copy)
	return (setmetatable({ _sourceSpans = nil }, SourceSpansModule))
end

function SourceSpansModule.empty()
	-- upvalues: SourceSpansModule (copy)
	return SourceSpansModule.new()
end

function SourceSpansModule.getSourceSpans(p1)
	return if p1._sourceSpans == nil then {} else p1._sourceSpans
end

function SourceSpansModule:addAllFrom(List)
	for _, value in ipairs(List) do
		self:addAll(value:getSourceSpans())
	end
end

function SourceSpansModule:addAll(Entry)
	-- upvalues: SourceSpanModule (copy)
	if #Entry == 0 then return end
	if self._sourceSpans == nil then
		self._sourceSpans = {}
	end
	local SourceSpans = self._sourceSpans
	
	if #SourceSpans == 0 then
		table.move(Entry, 1, #Entry, 1, SourceSpans)
		
		return
	end
	local v1 = #SourceSpans - 1
	local SourceSpan = SourceSpans[v1 + 1]
	local Entry1 = Entry[1]
	
	if SourceSpan:getInputIndex() + SourceSpan:getLength() == Entry1:getInputIndex() then
		SourceSpans[v1 + 1] = SourceSpanModule.of(SourceSpan:getLineIndex(), SourceSpan:getColumnIndex(), SourceSpan:getInputIndex(), SourceSpan:getLength() + Entry1:getLength())
		table.move(Entry, 2, #Entry, #SourceSpans + 1, SourceSpans)
		
		return
	else
		table.move(Entry, 1, #Entry, #SourceSpans + 1, SourceSpans)
	end
end

return SourceSpansModule