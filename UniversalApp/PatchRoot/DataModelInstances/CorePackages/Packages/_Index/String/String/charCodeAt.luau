local NaN = require(script.Parent.Parent.Number).NaN

return function(Text: string, p1: number) --[[ Line: 24 ]]
	-- upvalues: NaN (copy)
	if type(p1) ~= "number" then
		p1 = 1
	end
	local Length = string.len(Text)
	
	if p1 < 1 or Length < p1 then
		return NaN
	end
	local OffsetResult = utf8.offset(Text, p1)
	
	if OffsetResult == nil or Length < OffsetResult then
		return NaN
	else
		local Codepoint = utf8.codepoint(Text, OffsetResult, OffsetResult)
		
		return if Codepoint == nil then NaN else Codepoint
	end
end