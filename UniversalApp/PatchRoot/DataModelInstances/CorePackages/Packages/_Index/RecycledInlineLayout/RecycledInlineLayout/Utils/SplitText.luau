local Frozen = table.freeze({ Word = "Word", Symbol = "Symbol" })

local function _(p1): boolean
	return p1:match("%s") ~= nil
end

local _ = function(p1, p2: number): number
	local OffsetResult = utf8.offset(p1, p2 + 1)
	
	return if OffsetResult == nil then #p1 else OffsetResult - 1
end

local _ = function(_text)
	return {
		_initialGuess = 1,
		_index = 1,
		_codepointIndex = 1,
		_step = 0,
		direction = 1,
		_text = _text
	}
end

local t = {}

function t.new(_text, p1, p2, p3)
	-- upvalues: t (copy)
	local config = {
		_initialGuess = 1,
		_index = 1,
		_codepointIndex = 1,
		_step = 0,
		direction = 1,
		_text = _text
	}
	config._initialGuess = t._guessInitialBreak(config, p1, p2, p3)
	config._index = config._initialGuess
	t.setDirection(config, 1)
	
	return config
end

function t._guessInitialBreak(p1, _, p2, p3): number
	return (math.max(math.floor(#p1._text * p3 / p2), 1))
end

function t.findPossibleBreak(State)
	local Index = State._index
	while State.direction == 1 and Index <= #State._text or State.direction == -1 and Index > 0 do
		if State._text:sub(Index, Index):match("%s") ~= nil then
			State._index = Index + State._step
			
			return Index - 1
		end
		Index += State._step
	end
	return Index
end

function t.setDirection(State, Direction)
	State.direction = Direction
	
	if Direction ~= 1 then
		State._index = State._initialGuess
	end
	State._step = if Direction == 1 then 1 else -1
end

local t1 = {}

function t1.new(_text, p1, p2, p3)
	-- upvalues: t1 (copy)
	local config = {
		_initialGuess = 1,
		_index = 1,
		_codepointIndex = 1,
		_step = 0,
		direction = 1,
		_text = _text
	}
	config._initialGuess = t1._guessInitialBreak(config, p1, p2, p3)
	config._codepointIndex = config._initialGuess
	
	return config
end

function t1:_guessInitialBreak(p1, p2, p3): number
	return (math.max(math.floor(p1 * p3 / p2), 1))
end

function t1.findPossibleBreak(State): number
	State._codepointIndex += State._step
	local Text = State._text
	local OffsetResult = utf8.offset(Text, State._codepointIndex + 1)
	
	return if OffsetResult == nil then #Text else OffsetResult - 1
end

function t1.setDirection(State, Direction)
	State.direction = Direction
	State._step = if Direction == 1 then 1 else -1
end

local function splitWith(p1, Callback, Text: string, Length, p2, p3)
	local NewResult = p1.new(Text, Length, p2, p3)
	local PossibleBreak = p1.findPossibleBreak(NewResult)
	local Segment = Text:sub(1, PossibleBreak)
	local v1: number = if p3 < Callback(Segment) then -1 else 1
	local PossibleBreak1: number = PossibleBreak
	p1.setDirection(NewResult, v1)
	local Count = 0
	while Count < Length do
		PossibleBreak = p1.findPossibleBreak(NewResult)
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

return {
	split = function(Word, Callback, Text: string, p4)
		-- upvalues: Frozen (copy), t (copy), t1 (copy), splitWith (copy)
		local Length = utf8.len(Text)
		
		if Length == nil then
			warn("Failed to get string length, it is probably malformed or non utf8")
			
			return Text
		end
		local CallbackResult = Callback(Text)
		
		if CallbackResult <= p4 then
			return Text
		end
		local SplitWithResult, SplitWithResult2 = splitWith(if Word == Frozen.Word then t else t1, Callback, Text, Length, CallbackResult, p4)
		
		if SplitWithResult2 == 0 or SplitWithResult2 == #Text then
			return Text
		else
			return SplitWithResult, (Text:sub(SplitWithResult2 + 1))
		end
	end,
	SplitBy = Frozen
}