local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.parser.SourceLine)
local _ = require(CommonMark.node.SourceSpan)
local SourceLinesModule = {}
SourceLinesModule.__index = SourceLinesModule

function SourceLinesModule.new()
	-- upvalues: SourceLinesModule (copy)
	return (setmetatable({ _lines = {} }, SourceLinesModule))
end

function SourceLinesModule.empty()
	-- upvalues: SourceLinesModule (copy)
	return SourceLinesModule.new()
end

function SourceLinesModule.of(p1)
	-- upvalues: SourceLinesModule (copy)
	local NewSourceLines = SourceLinesModule.new()
	NewSourceLines:addLine(p1)
	
	return NewSourceLines
end

function SourceLinesModule.ofList(p1)
	-- upvalues: SourceLinesModule (copy)
	local NewSourceLines = SourceLinesModule.new()
	table.move(p1, 1, #p1, 1, NewSourceLines._lines)
	
	return NewSourceLines
end

function SourceLinesModule:addLine(p1)
	table.insert(self._lines, p1)
end

function SourceLinesModule:getLines()
	return self._lines
end

function SourceLinesModule:isEmpty(): boolean
	return #self._lines == 0
end

function SourceLinesModule:getContent(): string
	local Buffer = table.create(#self._lines)
	
	for i, line in ipairs(self._lines) do
		Buffer[i] = line:getContent()
	end
	return table.concat(Buffer, "\n")
end

function SourceLinesModule.getSourceSpans(p1)
	local List = {}
	
	for _, line in ipairs(p1._lines) do
		local SourceSpan = line:getSourceSpan()
		
		if SourceSpan ~= nil then
			table.insert(List, SourceSpan)
		end
	end
	return List
end

return SourceLinesModule