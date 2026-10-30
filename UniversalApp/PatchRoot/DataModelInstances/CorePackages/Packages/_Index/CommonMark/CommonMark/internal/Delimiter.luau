local _ = require(script:FindFirstAncestor("CommonMark").node.Text)
local DelimiterModule = {}
DelimiterModule.__index = DelimiterModule

function DelimiterModule.new(Characters, DelimiterChar, _canOpen, _canClose, Previous)
	-- upvalues: DelimiterModule (copy)
	return (setmetatable({
		next = nil,
		characters = Characters,
		delimiterChar = DelimiterChar,
		_canOpen = _canOpen,
		_canClose = _canClose,
		previous = Previous,
		_originalLength = #Characters
	}, DelimiterModule))
end

function DelimiterModule:canOpen()
	return self._canOpen
end

function DelimiterModule:canClose()
	return self._canClose
end

function DelimiterModule:length(): number
	return #self.characters
end

function DelimiterModule:originalLength()
	return self._originalLength
end

function DelimiterModule:getOpener()
	return self.characters[#self.characters]
end

function DelimiterModule:getCloser()
	return self.characters[1]
end

function DelimiterModule:getOpeners(p1: number)
	if p1 < 1 or p1 > self:length() then
		error(`length must be between 1 and {self:length()}, was {p1}`)
	end
	return table.move(self.characters, #self.characters - p1 + 1, #self.characters, 1, {})
end

function DelimiterModule:getClosers(p1: number)
	if p1 < 1 or p1 > self:length() then
		error(`length must be between 1 and {self:length()}, was {p1}`)
	end
	return table.move(self.characters, 1, p1, 1, {})
end

return DelimiterModule