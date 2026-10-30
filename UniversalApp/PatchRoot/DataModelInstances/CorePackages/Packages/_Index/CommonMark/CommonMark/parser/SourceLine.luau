local SourceSpanModule = require(script:FindFirstAncestor("CommonMark").node.SourceSpan)
local SubFunction = string.sub
local SourceLineModule = {}
SourceLineModule.__index = SourceLineModule

local function _(_content, _sourceSpan)
	-- upvalues: SourceLineModule (copy)
	return (setmetatable({ _content = _content, _sourceSpan = _sourceSpan }, SourceLineModule))
end

function SourceLineModule.of(_content, _sourceSpan)
	-- upvalues: SourceLineModule (copy)
	return (setmetatable({ _content = _content, _sourceSpan = _sourceSpan }, SourceLineModule))
end

function SourceLineModule.getContent(p1)
	return p1._content
end

function SourceLineModule.getSourceSpan(p1)
	return p1._sourceSpan
end

function SourceLineModule.substring(p1, p2: number, p3: number)
	-- upvalues: SubFunction (copy), SourceSpanModule (copy), SourceLineModule (copy)
	local Content = p1._content
	
	if p2 < 0 or p3 < p2 or #Content < p3 then
		error(`begin {p2}, end {p3}, length {#Content}`)
	end
	local SubResult = SubFunction(Content, p7 + 1, p8)
	local OfResult = nil
	local SourceSpan = p6._sourceSpan
	
	if SourceSpan ~= nil then
		local v1 = p8 - p7
		
		if v1 ~= 0 then
			OfResult = SourceSpanModule.of(SourceSpan:getLineIndex(), SourceSpan:getColumnIndex() + p7, SourceSpan:getInputIndex() + p7, v1)
		end
	end
	return SourceLineModule.of(SubResult, OfResult)
end

return SourceLineModule