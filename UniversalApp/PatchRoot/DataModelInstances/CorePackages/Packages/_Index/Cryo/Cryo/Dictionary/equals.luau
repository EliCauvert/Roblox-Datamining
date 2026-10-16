local EqualObjectsModule = require(script.Parent.Parent.equalObjects)

local function compare(List, List1): boolean --[[ Line: 3 ]]
	if type(List) ~= "table" or type(List1) ~= "table" then
		return List == List1
	end
	for i, value in List do
		if List1[i] ~= value then
			return false
		end
	end
	for i1, value1 in List1 do
		if List[i1] ~= value1 then
			return false
		end
	end
	return true
end

return function(...): boolean --[[ Line: 23 | Named "equals" ]]
	-- upvalues: EqualObjectsModule (copy), compare (copy)
	if EqualObjectsModule(...) then
		return true
	end
	local Selected = select(1, ...)
	
	for i = 2, select("#", ...) do
		if not compare(Selected, (select(i, ...))) then
			return false
		end
	end
	return true
end