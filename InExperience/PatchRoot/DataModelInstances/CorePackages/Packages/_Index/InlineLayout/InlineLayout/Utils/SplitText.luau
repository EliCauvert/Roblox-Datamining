local textSplitByModule = require(script:FindFirstAncestor("Utils").Parent.Enums.TextSplitBy)

local function _(p0) --[[ line: 9 | named "isWhitespace" ]]
	return p0:match("%s") ~= nil
end

local _ = function(p1, p2) --[[ line: 14 | named "codepointEnd" ]]
	local byteOffset = utf8.offset(p1, p2 + 1)
	
	return if byteOffset == nil then #p1 else byteOffset - 1
end

local t = {}
t.__index = t

function t.new(p3, p4, p5, p6) --[[ line: 32 ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl._text = p3
	tbl._initialGuess = tbl:_guessInitialBreak(p4, p5, p6)
	tbl._index = tbl._initialGuess
	tbl:setDirection(1)
	
	return tbl
end

function t:_guessInitialBreak(_, p7, p8) --[[ line: 44 ]]
	return math.max(math.floor(#self._text * p8 / p7), 1)
end

function t:findPossibleBreak() --[[ line: 48 ]]
	local index = self._index
	while self.direction == 1 and index <= #self._text or self.direction == -1 and index > 0 do
		if self._text:sub(index, index):match("%s") == nil then
			index += self._step
			continue
		end
		self._index = index + self._step
		
		return index - 1
	end
	return index
end

function t:setDirection(p9) --[[ line: 63 ]]
	self.direction = p9
	
	if p9 ~= 1 then
		self._index = self._initialGuess
	end
	self._step = if p9 == 1 then 1 else -1
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p10, p11, p12, p13) --[[ line: 75 ]]
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl._text = p10
	tbl._initialGuess = tbl:_guessInitialBreak(p11, p12, p13)
	tbl._codepointIndex = tbl._initialGuess
	tbl._step = 0
	
	return tbl
end

function t_1._guessInitialBreak(_, p14, p15, p16) --[[ line: 84 ]]
	return math.max(math.floor(p14 * p16 / p15), 1)
end

function t_1:findPossibleBreak() --[[ line: 88 ]]
	self._codepointIndex += self._step
	local text = self._text
	local byteOffset = utf8.offset(text, self._codepointIndex + 1)
	
	return if byteOffset == nil then #text else byteOffset - 1
end

function t_1:setDirection(p17) --[[ line: 93 ]]
	self.direction = p17
	self._step = if p17 == 1 then 1 else -1
end

local function splitWith(p18, p19, p20, p21, p22, p23) --[[ line: 98 ]]
	local var8 = p18.new(p20, p21, p22, p23)
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var9 = var8:findPossibleBreak()
	local var10 = p20:sub(1, var9)
	local var11 = if p23 < p19(var10) then -1 else 1
	local var12 = var9
	var8:setDirection(var11)
	local var13 = 0
	while var13 < p21 do
		var9 = var8:findPossibleBreak()
		var10 = p20:sub(1, var9)
		local var14 = if p23 < p19(var10) then -1 else 1
		
		if var11 == var14 then
			var11 = var14
			var12 = var9
			var13 += 1
			continue
		end
		if var11 ~= 1 then break end
		var9 = var12
		var10 = p20:sub(1, var9)
		
		return var10, var9
	end
	return var10, var9
end

return function(p24, p25, p26, p27) --[[ line: 174 | named "split" ]]
	-- upvalues: textSplitByModule (ref), t (ref), t_1 (ref), splitWith (ref)
	local charCount = utf8.len(p26)
	
	if charCount == nil then
		warn("Failed to get string length, it is probably malformed or non utf8")
		
		return p26
	end
	local var16 = p25(p26)
	
	if var16 <= p27 then
		return p26
	end
	local var17, var18 = splitWith(if p24 == textSplitByModule.Word then t else t_1, p25, p26, charCount, var16, p27)
	
	if var18 == 0 or var18 == #p26 then
		return p26
	end
	return var17, p26:sub(var18 + 1)
end