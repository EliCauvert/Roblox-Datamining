local IndentedLineBufferModule = {}
IndentedLineBufferModule.__index = IndentedLineBufferModule

function IndentedLineBufferModule.new()
	-- upvalues: IndentedLineBufferModule (copy)
	local config = { linePrefix = "", lines = {} }
	setmetatable(config, IndentedLineBufferModule)
	
	return config
end

function IndentedLineBufferModule:addLine(p1)
	table.insert(self.lines, self.linePrefix .. (p1 or ""))
end

function IndentedLineBufferModule:indent()
	self.linePrefix ..= "   "
end

function IndentedLineBufferModule:unindent()
	self.linePrefix = self.linePrefix:sub(1 + ("   "):len())
end

function IndentedLineBufferModule:__tostring(): string
	return table.concat(self.lines, "\n") .. "\n"
end

return IndentedLineBufferModule