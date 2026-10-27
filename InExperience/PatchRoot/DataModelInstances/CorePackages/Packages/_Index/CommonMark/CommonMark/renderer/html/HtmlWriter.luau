local CommonMark = script:FindFirstAncestor("CommonMark")
local EscapingModule = require(CommonMark.internal.util.Escaping)
local _ = require(CommonMark.internal.port.LinkedHashMap)
local ByteFunction = string.byte
local HtmlWriterModule = {}
HtmlWriterModule.__index = HtmlWriterModule

function HtmlWriterModule.new(_buffer)
	-- upvalues: HtmlWriterModule (copy)
	return (setmetatable({ _lastChar = 0, _buffer = _buffer, _n = #_buffer }, HtmlWriterModule))
end

function HtmlWriterModule:raw(p1)
	self:append(p1)
end

function HtmlWriterModule:text(p1)
	-- upvalues: EscapingModule (copy)
	self:append(EscapingModule.escapeHtml(p1))
end

function HtmlWriterModule:tag(p1, p2, p3)
	-- upvalues: EscapingModule (copy)
	self:append("<")
	self:append(p1)
	
	if p2 ~= nil and not p2:isEmpty() then
		for i, value in p2:entrySet() do
			self:append(" ")
			self:append(EscapingModule.escapeHtml(i))
			
			if value ~= nil then
				self:append("=\"")
				self:append(EscapingModule.escapeHtml(value))
				self:append("\"")
			end
		end
	end
	if p3 then
		self:append(" /")
	end
	self:append(">")
end

function HtmlWriterModule:line()
	if self._lastChar ~= 0 and self._lastChar ~= 10 then
		self:append("\n")
	end
end

function HtmlWriterModule:append(EscapeHtmlResult)
	-- upvalues: ByteFunction (copy)
	self._n += 1
	self._buffer[self._n] = EscapeHtmlResult
	local CountEscapeHtmlResult = #EscapeHtmlResult
	
	if CountEscapeHtmlResult ~= 0 then
		self._lastChar = ByteFunction(EscapeHtmlResult, CountEscapeHtmlResult)
	end
end

return HtmlWriterModule