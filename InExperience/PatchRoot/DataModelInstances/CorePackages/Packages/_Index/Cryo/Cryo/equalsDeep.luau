local EqualObjectsModule = require(script.Parent.equalObjects)

local function compareDeep(List, List1): boolean --[[ Line: 4 ]]
	-- upvalues: compareDeep (copy)
	if type(List) ~= "table" or type(List1) ~= "table" then
		return List == List1
	end
	for i, value in List do
		if not compareDeep(List1[i], value) then
			return false
		end
	end
	for i1, value1 in List1 do
		if not compareDeep(List[i1], value1) then
			return false
		end
	end
	return true
end

return function(...): boolean --[[ Line: 24 | Named "equalsDeep" ]]
	-- upvalues: EqualObjectsModule (copy), compareDeep (copy)
	if EqualObjectsModule(...) then
		return true
	end
	local Selected = select(1, ...)
	
	for i = 2, select("#", ...) do
		if not compareDeep(Selected, (select(i, ...))) then
			return false
		end
	end
	return true
end