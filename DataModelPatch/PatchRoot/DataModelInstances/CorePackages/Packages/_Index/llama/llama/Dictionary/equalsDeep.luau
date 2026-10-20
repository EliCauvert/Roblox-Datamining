local EqualObjectsModule = require(script.Parent.Parent.equalObjects)

local function equalsDeepOneWay(List, p1): boolean
	-- upvalues: equalsDeepOneWay (copy)
	if type(List) == "table" and type(p1) == "table" then
		for i, value in pairs(List) do
			if not equalsDeepOneWay(value, p1[i]) then
				return false
			end
		end
	elseif List ~= p1 then
		return false
	end
	return true
end

return function(...): boolean
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