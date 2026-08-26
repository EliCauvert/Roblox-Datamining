local naN = require(script.Parent.Parent.Number).NaN

return function(p1, p2)
	-- upvalues: naN (ref)
	if type(p2) ~= "number" then
		p2 = 1
	end
	local var1 = string.len(p1)
	
	if p2 < 1 or var1 < p2 then
		return naN
	end
	local byteOffset = utf8.offset(p1, p2)
	
	if byteOffset == nil or var1 < byteOffset then
		return naN
	end
	local codepoint = utf8.codepoint(p1, byteOffset, byteOffset)
	
	return if codepoint == nil then naN else codepoint
end