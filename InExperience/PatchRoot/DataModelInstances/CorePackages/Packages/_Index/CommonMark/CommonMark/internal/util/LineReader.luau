local CharactersModule = require(script:FindFirstAncestor("CommonMark").text.Characters)
local ByteFunction = string.byte
local SubFunction = string.sub
local LineReaderModule = {}
LineReaderModule.__index = LineReaderModule

function LineReaderModule.new(_input)
	-- upvalues: LineReaderModule (copy)
	return (setmetatable({
		_position = 0,
		_lineTerminator = nil,
		_input = _input,
		_limit = #_input
	}, LineReaderModule))
end

local Callback = nil

function LineReaderModule:readLine()
	-- upvalues: Callback (ref), CharactersModule (copy), SubFunction (copy), ByteFunction (copy)
	local Input = self._input
	
	if Input == nil then
		error("LineReader is closed")
	end
	local Position: number = self._position
	
	if self._limit <= Position then
		return Callback(self, nil, nil)
	end
	local LineBreak: number = CharactersModule.findLineBreak(Input, Position)
	
	if LineBreak == -1 then
		self._position = self._limit
		
		return Callback(self, SubFunction(Input, Position + 1, self._limit), nil)
	elseif ByteFunction(Input, LineBreak + 1) == 10 then
		self._position = LineBreak + 1
		
		return Callback(self, SubFunction(Input, Position + 1, LineBreak), "\n")
	elseif ByteFunction(Input, LineBreak + 1 + 1) == 10 then
		self._position = LineBreak + 2
		
		return Callback(self, SubFunction(Input, Position + 1, LineBreak), "\r\n")
	else
		self._position = LineBreak + 1
		
		return Callback(self, SubFunction(Input, Position + 1, LineBreak), "\r")
	end
end

function LineReaderModule:getLineTerminator()
	return self._lineTerminator
end

function LineReaderModule:close()
	if self._input ~= nil then
		self._input = nil
		
		return
	end
end

Callback = function(p1, p2, _lineTerminator)
	p1._lineTerminator = _lineTerminator
	
	return p2
end

return LineReaderModule