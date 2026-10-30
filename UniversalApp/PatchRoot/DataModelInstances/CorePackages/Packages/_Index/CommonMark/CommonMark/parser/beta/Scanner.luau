local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.text.CharMatcher)
local PositionModule = require(CommonMark.parser.beta.Position)
local SourceLineModule = require(CommonMark.parser.SourceLine)
local SourceLinesModule = require(CommonMark.parser.SourceLines)
local _ = require(CommonMark.node.SourceSpan)
local Utf8Module = require(CommonMark.internal.port.Utf8)
local ByteFunction = string.byte
local CharFunction = string.char
local FindFunction = string.find
local SubFunction = string.sub
local ScannerModule = {}
ScannerModule.__index = ScannerModule
ScannerModule.END = 0

function ScannerModule.new(_lines, _lineIndex: number, _index)
	-- upvalues: SourceLineModule (copy), ScannerModule (copy)
	local self = setmetatable({
		_lineLength = 0,
		_lines = _lines,
		_lineIndex = _lineIndex,
		_index = _index,
		_line = SourceLineModule.of("", nil)
	}, ScannerModule)
	
	if #_lines > 0 then
		self:checkPosition(_lineIndex, _index)
		self:setLine(_lines[_lineIndex + 1])
	end
	return self
end

function ScannerModule:of()
	-- upvalues: ScannerModule (copy)
	return ScannerModule.new(self:getLines(), 0, 0)
end

function ScannerModule.peek(p1)
	-- upvalues: ByteFunction (copy)
	return if p1._index < p1._lineLength then ByteFunction(p1._line:getContent(), p1._index + 1) elseif p1._lineIndex < #p1._lines - 1 then 10 else 0
end

function ScannerModule.peekCodePoint(p1)
	-- upvalues: Utf8Module (copy)
	return if p1._index < p1._lineLength then Utf8Module.codePointAt(p1._line:getContent(), p1._index) elseif p1._lineIndex < #p1._lines - 1 then 10 else 0
end

function ScannerModule.peekPreviousCodePoint(p1)
	-- upvalues: Utf8Module (copy)
	return if p1._index > 0 then Utf8Module.codePointBefore(p1._line:getContent(), p1._index) elseif p1._lineIndex > 0 then 10 else 0
end

function ScannerModule:hasNext(): boolean
	return self._index < self._lineLength or self._lineIndex < #self._lines - 1
end

function ScannerModule:next()
	-- upvalues: SourceLineModule (copy)
	self._index += 1
	
	if self._lineLength < self._index then
		self._lineIndex += 1
		
		if self._lineIndex < #self._lines then
			self:setLine(self._lines[self._lineIndex + 1])
		else
			self:setLine(SourceLineModule.of("", nil))
		end
		self._index = 0
	end
end

function ScannerModule:nextChar(p1): boolean
	if self:peek() == p1 then
		self:next()
		
		return true
	else
		return false
	end
end

function ScannerModule:nextString(p1): boolean
	-- upvalues: SubFunction (copy)
	if self._index >= self._lineLength or self._index + #p1 > self._lineLength then
		return false
	elseif SubFunction(self._line:getContent(), self._index + 1, self._index + #p1) == p1 then
		self._index += #p1
		
		return true
	else
		return false
	end
end

function ScannerModule:matchMultiple(p1): number
	local Count = 0
	while self:peek() == p1 do
		Count += 1
		self:next()
	end
	return Count
end

function ScannerModule:match(p2): number
	local Count = 0
	while p2:matches(self:peek()) do
		Count += 1
		self:next()
	end
	return Count
end

function ScannerModule:whitespace(): number
	local Count = 0
	while true do
		local PeekResult = self:peek()
		if PeekResult ~= 32 and (PeekResult ~= 9 and PeekResult ~= 10 and PeekResult ~= 11 and PeekResult ~= 12 and PeekResult ~= 13) then
			break
		end
		Count += 1
		self:next()
	end
	return Count
end

local t = {}

local function _(Key: number)
	-- upvalues: t (copy), CharFunction (copy)
	local Entry = t[Key]
	
	if Entry == nil then
		local IsKeyBelow: boolean = Key >= 48 and Key <= 57 or (Key >= 65 and Key <= 90 or Key >= 97 and Key <= 122)
		Entry = "[\0" .. (if IsKeyBelow then "" else "%") .. CharFunction(Key) .. "]"
		t[Key] = Entry
	end
	return Entry
end

function ScannerModule:findChar(Key: number): number
	-- upvalues: FindFunction (copy), t (copy), CharFunction (copy)
	local NewIndex = 0
	while true do
		if self._index < self._lineLength then
			local Content = self._line:getContent()
			local Entry = t[Key]
			
			if Entry == nil then
				local IsKeyBelow: boolean = Key >= 48 and Key <= 57 or (Key >= 65 and Key <= 90 or Key >= 97 and Key <= 122)
				Entry = "[\0" .. (if IsKeyBelow then "" else "%") .. CharFunction(Key) .. "]"
				t[Key] = Entry
			end
			local FindResult: number = FindFunction(Content, Entry, self._index + 1)
			local LineLength = if FindResult == nil then self._lineLength else FindResult - 1
			NewIndex += LineLength - self._index
			self._index = LineLength
		end
		local PeekResult = self:peek()
		
		if PeekResult == 0 then
			return -1
		elseif PeekResult == Key then
			return NewIndex
		else
			NewIndex += 1
			self:next()
		end
	end
end

function ScannerModule:findMatcher(p3): number
	local Count = 0
	while true do
		local PeekResult = self:peek()
		if PeekResult == 0 then
			return -1
		elseif not p3:matches(PeekResult) then
			Count += 1
			self:next()
		else
			return Count
		end
	end
end

function ScannerModule:position()
	-- upvalues: PositionModule (copy)
	return PositionModule.new(self._lineIndex, self._index)
end

function ScannerModule:setPosition(p4)
	self:checkPosition(p4.lineIndex, p4.index)
	self._lineIndex = p4.lineIndex
	self._index = p4.index
	self:setLine(self._lines[self._lineIndex + 1])
end

function ScannerModule:getSource(p4, p5)
	-- upvalues: SubFunction (copy), SourceLinesModule (copy), SourceLineModule (copy)
	if p4.lineIndex == p5.lineIndex then
		local Line = self._lines[p4.lineIndex + 1]
		local Content = Line:getContent()
		
		if p4.index < 0 or p5.index < p4.index or #Content < p5.index then
			error(`begin {p4.index}, end {p5.index}, length {#Content}`)
		end
		local SubResult = SubFunction(Content, p4.index + 1, p5.index)
		local SubSpanResult = nil
		local SourceSpan = Line:getSourceSpan()
		
		if SourceSpan ~= nil then
			SubSpanResult = SourceSpan:subSpan(p4.index, p5.index)
		end
		return SourceLinesModule.of(SourceLineModule.of(SubResult, SubSpanResult))
	else
		local EmptyResult = SourceLinesModule.empty()
		local Line1 = self._lines[p4.lineIndex + 1]
		EmptyResult:addLine(Line1:substring(p4.index, #Line1:getContent()))
		
		for i = p4.lineIndex + 1, p5.lineIndex - 1 do
			EmptyResult:addLine(self._lines[i + 1])
		end
		EmptyResult:addLine(self._lines[p5.lineIndex + 1]:substring(0, p5.index))
		
		return EmptyResult
	end
end

function ScannerModule:setLine(Line)
	self._line = Line
	self._lineLength = #Line:getContent()
end

function ScannerModule:checkPosition(LineIndex: number, Index: number)
	if LineIndex < 0 or #self._lines <= LineIndex then
		error(`Line index {LineIndex} out of range, number of lines: {#self._lines}`)
	end
	local Line = self._lines[LineIndex + 1]
	
	if Index < 0 or #Line:getContent() < Index then
		error(`Index {Index} out of range, line length: {#Line:getContent()}`)
	end
end

return ScannerModule