local SourceSpanModule = {}
SourceSpanModule.__index = SourceSpanModule

local function new(LineIndex: number, _columnIndex: number, _inputIndex: number, _length: number)
	-- upvalues: SourceSpanModule (copy)
	if LineIndex < 0 then
		error(`lineIndex {LineIndex} must be >= 0`)
	end
	if _columnIndex < 0 then
		error(`columnIndex {_columnIndex} must be >= 0`)
	end
	if _inputIndex < 0 then
		error(`inputIndex {_inputIndex} must be >= 0`)
	end
	if _length < 0 then
		error(`length {_length} must be >= 0`)
	end
	return (setmetatable({
		_lineIndex = LineIndex,
		_columnIndex = _columnIndex,
		_inputIndex = _inputIndex,
		_length = _length
	}, SourceSpanModule))
end

function SourceSpanModule.of(LineIndex, ColumnIndex, InputIndex, Length)
	-- upvalues: new (copy)
	return (new(LineIndex, ColumnIndex, InputIndex, Length))
end

function SourceSpanModule.getLineIndex(p1)
	return p1._lineIndex
end

function SourceSpanModule.getColumnIndex(p1)
	return p1._columnIndex
end

function SourceSpanModule.getInputIndex(p1)
	return p1._inputIndex
end

function SourceSpanModule.getLength(p1)
	return p1._length
end

function SourceSpanModule.subSpan(p1, p2: number, Length: number)
	-- upvalues: new (copy)
	local Length1 = p1._length
	
	if Length == nil then
		return p1:subSpan(p2, Length1)
	end
	if p2 < 0 then
		error(`beginIndex {p2} + must be >= 0`)
	end
	if Length1 < p2 then
		error(`beginIndex {p2} must be <= length {Length1}`)
	end
	if Length < 0 then
		error(`endIndex {Length} + must be >= 0`)
	end
	if Length1 < Length then
		error(`endIndex {Length} must be <= length {Length1}`)
	end
	if Length < p2 then
		error(`beginIndex {p2} must be <= endIndex {Length}`)
	end
	return if p2 == 0 and Length == Length1 then p1 else new(p1._lineIndex, p1._columnIndex + p2, p1._inputIndex + p2, Length - p2)
end

function SourceSpanModule.equals(p1, p2): boolean
	return p1 == p2 or p2 ~= nil and (p1._lineIndex == p2._lineIndex and (p1._columnIndex == p2._columnIndex and p1._inputIndex == p2._inputIndex) and p1._length == p2._length)
end

function SourceSpanModule.toString(p1): string
	return `SourceSpan\{line={p1._lineIndex}, column={p1._columnIndex}, input={p1._inputIndex}, length={p1._length}}`
end

return SourceSpanModule