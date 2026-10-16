local EqualObjectsModule = require(script.Parent.Parent.equalObjects)

local function compare(p1, p2): boolean --[[ Line: 3 ]]
	if type(p1) ~= "table" or type(p2) ~= "table" then
		return p1 == p2
	end
	if #p1 ~= #p2 then
		return false
	end
	for i = 1, #p1 do
		if p1[i] ~= p2[i] then
			return false
		end
	end
	return true
end

return function(...): boolean --[[ Line: 21 | Named "equals" ]]
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