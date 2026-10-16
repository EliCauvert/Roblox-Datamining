local Parent = script.Parent

return function(p1: number, p2): string --[[ Line: 19 | Named "formatValue" ]]
	-- upvalues: Parent (copy)
	local P1 = p2 or ""
	local StartIndex, EndIndex = P1:find("[A-Za-z#?]+")
	
	if StartIndex then
		local Segment: string = P1:sub(StartIndex, EndIndex)
		local Text = "%" .. P1:sub(1, StartIndex - 1) .. P1:sub(EndIndex + 1) .. "s"
		local PrettyModule = require(Parent.pretty)
		
		return if Segment == "#?" then Text:format(PrettyModule(p1, { multiline = true })) elseif Segment == "?" then Text:format(PrettyModule(p1)) else ("%" .. P1):format(p1)
	end
	local D = "s"
	
	if type(p1) == "number" then
		local _, FractionalPart = math.modf(p1)
		D = if FractionalPart == 0 then "d" else "f"
	end
	return ("%" .. P1 .. D):format((tostring(p1)))
end