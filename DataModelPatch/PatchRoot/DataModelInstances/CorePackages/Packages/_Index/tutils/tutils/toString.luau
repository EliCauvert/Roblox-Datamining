local CheckListConsistencyModule = require(script.Parent.checkListConsistency)

local function recursiveToString(List, p1): string
	-- upvalues: CheckListConsistencyModule (copy), recursiveToString (copy)
	local P1 = p1 or ""
	
	if type(List) ~= "table" then
		return (tostring(List))
	end
	local Text = ""
	
	if not CheckListConsistencyModule(List) then
		Text ..= "-- WARNING: this table fails the list consistency test\n"
	end
	local Text1 = Text .. "{\n"
	
	for i, value in pairs(List) do
		if type(i) == "string" then
			Text1 ..= "  " .. P1 .. tostring(i) .. " = " .. recursiveToString(value, "  " .. P1) .. ";\n"
		end
		if type(i) == "number" then
			Text1 ..= "  " .. P1 .. recursiveToString(value, "  " .. P1) .. ",\n"
		end
	end
	return Text1 .. P1 .. "}"
end

return recursiveToString