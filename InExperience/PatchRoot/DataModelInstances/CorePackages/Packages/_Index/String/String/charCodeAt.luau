local naN = require(script.Parent.Parent.Number).NaN

return function(p0, p1)
	-- upvalues: naN (ref)
	if type(p1) ~= "number" then
		p1 = 1
	end
	local var0 = string.len(p0)
	
	if p1 < 1 or var0 < p1 then
		return naN
	end
	local byteOffset = utf8.offset(p0, p1)
	
	if byteOffset == nil or var0 < byteOffset then
		return naN
	end
	local codepoint = utf8.codepoint(p0, byteOffset, byteOffset)
	
	return if codepoint == nil then naN else codepoint
end