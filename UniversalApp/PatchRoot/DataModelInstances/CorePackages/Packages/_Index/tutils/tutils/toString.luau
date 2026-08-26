local checkListConsistencyModule = require(script.Parent.checkListConsistency)

local function recursiveToString(p1, p2)
	-- upvalues: checkListConsistencyModule (ref), recursiveToString (ref)
	p2 = p2 or ""
	
	if type(p1) ~= "table" then
		return tostring(p1)
	end
	local var1 = ""
	
	if not checkListConsistencyModule(p1) then
		var1 ..= "-- WARNING: this table fails the list consistency test\n"
	end
	var1 ..= "{\n"
	
	for i, v in pairs(p1) do
		if type(i) == "string" then
			var1 ..= "  " .. p1 .. tostring(i) .. " = " .. recursiveToString(v, "  " .. p1) .. ";\n"
		end
		if type(i) == "number" then
			var1 ..= "  " .. p1 .. recursiveToString(v, "  " .. p1) .. ",\n"
		end
	end
	return var1 .. p1 .. "}"
end

return recursiveToString