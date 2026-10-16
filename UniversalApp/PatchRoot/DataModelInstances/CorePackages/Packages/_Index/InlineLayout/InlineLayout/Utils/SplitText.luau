local TextSplitByModule = require(script:FindFirstAncestor("Utils").Parent.Enums.TextSplitBy)

local function _(p1): boolean --[[ Line: 9 | Named "isWhitespace" ]]
	return p1:match("%s") ~= nil
end

local _ = function(p1, p2: number): number --[[ Line: 14 | Named "codepointEnd" ]]
	local OffsetResult = utf8.offset(p1, p2 + 1)
	
	return if OffsetResult == nil then #p1 else OffsetResult - 1
end

local Module = {}
Module.__index = Module

function Module.new(_text, p1, p2, p3) --[[ Line: 32 ]]
	-- upvalues: Module (copy)
	local self = setmetatable({}, Module)
	self._text = _text
	self._initialGuess = self:_guessInitialBreak(p1, p2, p3)
	self._index = self._initialGuess
	self:setDirection(1)
	
	return self
end

function Module:_guessInitialBreak(_, p1, p2): number --[[ Line: 44 ]]
	return (math.max(math.floor(#self._text * p2 / p1), 1))
end

function Module:findPossibleBreak() --[[ Line: 48 ]]
	local Index = self._index
	while self.direction == 1 and Index <= #self._text or self.direction == -1 and Index > 0 do
		if self._text:sub(Index, Index):match("%s") ~= nil then
			self._index = Index + self._step
			
			return Index - 1
		end
		Index += self._step
	end
	return Index
end

function Module:setDirection(Direction) --[[ Line: 63 ]]
	self.direction = Direction
	
	if Direction ~= 1 then
		self._index = self._initialGuess
	end
	self._step = if Direction == 1 then 1 else -1
end

local Module1 = {}
Module1.__index = Module1

function Module1.new(_text, p1, p2, p3) --[[ Line: 75 ]]
	-- upvalues: Module1 (copy)
	local self = setmetatable({}, Module1)
	self._text = _text
	self._initialGuess = self:_guessInitialBreak(p1, p2, p3)
	self._codepointIndex = self._initialGuess
	self._step = 0
	
	return self
end

function Module1:_guessInitialBreak(p1, p2, p3): number --[[ Line: 84 ]]
	return (math.max(math.floor(p1 * p3 / p2), 1))
end

function Module1:findPossibleBreak(): number --[[ Line: 88 ]]
	self._codepointIndex += self._step
	local Text = self._text
	local OffsetResult = utf8.offset(Text, self._codepointIndex + 1)
	
	return if OffsetResult == nil then #Text else OffsetResult - 1
end

function Module1:setDirection(Direction) --[[ Line: 93 ]]
	self.direction = Direction
	self._step = if Direction == 1 then 1 else -1
end

local function splitWith(p1, Callback, Text: string, Length, p2, p3) --[[ Line: 98 ]]
	local NewResult = p1.new(Text, Length, p2, p3)
	local PossibleBreak = NewResult:findPossibleBreak()
	local Segment = Text:sub(1, PossibleBreak)
	local v1: number = if p3 < Callback(Segment) then -1 else 1
	local PossibleBreak1: number = PossibleBreak
	NewResult:setDirection(v1)
	local Count = 0
	while Count < Length do
		PossibleBreak = NewResult:findPossibleBreak()
		Segment = Text:sub(1, PossibleBreak)
		local v2: number = if p3 < Callback(Segment) then -1 else 1
		
		if v1 == v2 then
			v1 = v2
			PossibleBreak1 = PossibleBreak
			Count += 1
			continue
		elseif v1 == 1 then
			PossibleBreak = PossibleBreak1
			Segment = Text:sub(1, PossibleBreak)
			
			return Segment, PossibleBreak
		else
			break
		end
	end
	return Segment, PossibleBreak
end

return function(Word, Callback, Text: string, p4) --[[ Line: 174 | Named "split" ]]
	-- upvalues: TextSplitByModule (copy), Module (copy), Module1 (copy), splitWith (copy)
	local Length = utf8.len(Text)
	
	if Length == nil then
		warn("Failed to get string length, it is probably malformed or non utf8")
		
		return Text
	end
	local CallbackResult = Callback(Text)
	
	if CallbackResult <= p4 then
		return Text
	end
	local SplitWithResult, SplitWithResult2 = splitWith(if Word == TextSplitByModule.Word then Module else Module1, Callback, Text, Length, CallbackResult, p4)
	
	if SplitWithResult2 == 0 or SplitWithResult2 == #Text then
		return Text
	else
		return SplitWithResult, (Text:sub(SplitWithResult2 + 1))
	end
end