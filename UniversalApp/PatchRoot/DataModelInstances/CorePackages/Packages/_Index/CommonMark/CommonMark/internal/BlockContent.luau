local BlockContentModule = {}
BlockContentModule.__index = BlockContentModule

function BlockContentModule.new()
	-- upvalues: BlockContentModule (copy)
	return (setmetatable({ _lineCount = 0, _sb = {} }, BlockContentModule))
end

function BlockContentModule.newString(p1)
	-- upvalues: BlockContentModule (copy)
	return (setmetatable({ _lineCount = 0, _sb = { p1 } }, BlockContentModule))
end

function BlockContentModule:add(p1)
	if self._lineCount ~= 0 then
		table.insert(self._sb, "\n")
	end
	table.insert(self._sb, p1)
	self._lineCount += 1
end

function BlockContentModule:getString(): string
	return table.concat(self._sb)
end

return BlockContentModule