local checkListConsistencyModule = require(script.Parent.checkListConsistency)

local function recursiveToString(p0, p1) --[[ line: 6 ]]
	-- upvalues: checkListConsistencyModule (ref), recursiveToString (ref)
	p1 = p1 or ""
	
	if type(p0) ~= "table" then
		return tostring(p0)
	end
	local var2 = ""
	
	if not checkListConsistencyModule(p0) then
		var2 ..= "-- WARNING: this table fails the list consistency test\n"
	end
	var2 ..= "{\n"
	
	for i, v in pairs(p0) do
		if type(i) == "string" then
			var2 ..= "  " .. p1 .. tostring(i) .. " = " .. recursiveToString(v, "  " .. p1) .. ";\n"
		end
		if type(i) == "number" then
			var2 ..= "  " .. p1 .. recursiveToString(v, "  " .. p1) .. ",\n"
		end
	end
	return var2 .. p1 .. "}"
end

return recursiveToString