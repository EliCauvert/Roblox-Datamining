local isNillish = require(script.Parent.Parent.luaUtils.isNillish).isNillish

local function instanceOf(p1, p2)
	-- upvalues: isNillish (ref)
	if isNillish(p1) then
		return false
	elseif typeof(p1) ~= "table" or typeof(p2) ~= "table" then
		return false
	elseif p2.new ~= nil and p1.new == p2.new then
		return true
	end
	local var1 = getmetatable(p1)
	while true do
		if typeof(var1) == "table" then
			if var1.__index ~= p2 then
				local var2 = var1
				var1 = getmetatable(var1.__index)
				
				if var2 == var1 then
					return false
				end
			end
			return true
		end
		return false
	end
end

return function(p3, p4)
	-- upvalues: instanceOf (ref)
	return instanceOf(p3, p4)
end