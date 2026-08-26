local textSplitByModule = require(script:FindFirstAncestor("Utils").Parent.Enums.TextSplitBy)

local function _(p1)
	return p1:match("%s") ~= nil
end

local _ = function(p1, p2)
	local byteOffset = utf8.offset(p1, p2 + 1)
	
	return if byteOffset == nil then #p1 else byteOffset - 1
end

local t = {}
t.__index = t

function t.new(p1, p2, p3, p4)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl._text = p1
	tbl._initialGuess = tbl:_guessInitialBreak(p2, p3, p4)
	tbl._index = tbl._initialGuess
	tbl:setDirection(1)
	
	return tbl
end

function t:_guessInitialBreak(_, p1, p2)
	return math.max(math.floor(#self._text * p2 / p1), 1)
end

function t:findPossibleBreak()
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

function t:setDirection(p1)
	self.direction = p1
	
	if p1 ~= 1 then
		self._index = self._initialGuess
	end
	self._step = if p1 == 1 then 1 else -1
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p1, p2, p3, p4)
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl._text = p1
	tbl._initialGuess = tbl:_guessInitialBreak(p2, p3, p4)
	tbl._codepointIndex = tbl._initialGuess
	tbl._step = 0
	
	return tbl
end

function t_1._guessInitialBreak(_, p1, p2, p3)
	return math.max(math.floor(p1 * p3 / p2), 1)
end

function t_1:findPossibleBreak()
	self._codepointIndex += self._step
	local text = self._text
	local byteOffset = utf8.offset(text, self._codepointIndex + 1)
	
	return if byteOffset == nil then #text else byteOffset - 1
end

function t_1:setDirection(p1)
	self.direction = p1
	self._step = if p1 == 1 then 1 else -1
end

local function splitWith(p1, p2, p3, p4, p5, p6)
	local var1 = p1.new(p3, p4, p5, p6)
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var2 = var1:findPossibleBreak()
	local var3 = p3:sub(1, var2)
	local var4 = if p6 < p2(var3) then -1 else 1
	local var5 = var2
	var1:setDirection(var4)
	local var6 = 0
	while var6 < p4 do
		var2 = var1:findPossibleBreak()
		var3 = p3:sub(1, var2)
		local var7 = if p6 < p2(var3) then -1 else 1
		
		if var4 == var7 then
			var4 = var7
			var5 = var2
			var6 += 1
			continue
		end
		if var4 ~= 1 then break end
		var2 = var5
		var3 = p3:sub(1, var2)
		
		return var3, var2
	end
	return var3, var2
end

return function(p7, p8, p9, p10)
	-- upvalues: textSplitByModule (ref), t (ref), t_1 (ref), splitWith (ref)
	local charCount = utf8.len(p9)
	
	if charCount == nil then
		warn("Failed to get string length, it is probably malformed or non utf8")
		
		return p9
	end
	local var8 = p8(p9)
	
	if var8 <= p10 then
		return p9
	end
	local var9, var10 = splitWith(if p7 == textSplitByModule.Word then t else t_1, p8, p9, charCount, var8, p10)
	
	if var10 == 0 or var10 == #p9 then
		return p9
	end
	return var9, p9:sub(var10 + 1)
end