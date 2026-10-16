local EqualObjectsModule = require(script.Parent.Parent.equalObjects)

local function equalsDeepOneWay(p1, p2): boolean --[[ Line: 4 ]]
	-- upvalues: equalsDeepOneWay (copy)
	if type(p1) == "table" and type(p2) == "table" then
		for i = 1, #p1 do
			if not equalsDeepOneWay(p1[i], p2[i]) then
				return false
			end
		end
	elseif p1 ~= p2 then
		return false
	end
	return true
end

return function(...): boolean --[[ Line: 20 | Named "equalsDeep" ]]
	-- upvalues: EqualObjectsModule (copy), equalsDeepOneWay (copy)
	if EqualObjectsModule(...) then
		return true
	end
	local Selected = select("#", ...)
	
	for i = 1, Selected do
		local Selected1 = select(i, ...)
		
		for i1 = 1, Selected do
			if i1 ~= i and not equalsDeepOneWay(Selected1, (select(i1, ...))) then
				return false
			end
		end
	end
	return true
end