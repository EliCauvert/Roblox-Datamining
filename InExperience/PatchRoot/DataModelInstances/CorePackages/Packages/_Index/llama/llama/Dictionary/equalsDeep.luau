local equalObjectsModule = require(script.Parent.Parent.equalObjects)

local function equalsDeepOneWay(p1, p2)
	-- upvalues: equalsDeepOneWay (ref)
	if type(p1) == "table" and type(p2) == "table" then
		for i, v in pairs(p1) do
			if not equalsDeepOneWay(v, p2[i]) then
				return false
			end
		end
	else
		return p1 == p2
	end
end

return function(...)
	-- upvalues: equalObjectsModule (ref), equalsDeepOneWay (ref)
	if equalObjectsModule(...) then
		return true
	end
	local var1 = select("#", ...)
	
	for i_1 = 1, var1 do
		local var2 = select(i_1, ...)
		
		for i = 1, var1 do
			if i == i_1 or equalsDeepOneWay(var2, select(i, ...)) then
				continue
			end
			return false
		end
	end
	return true
end