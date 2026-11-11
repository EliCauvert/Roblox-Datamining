local IsNillishFunction = require(script.Parent.Parent.luaUtils.isNillish).isNillish

local function instanceOf(p1, Index): boolean
	-- upvalues: IsNillishFunction (copy)
	if IsNillishFunction(p1) then
		return false
	end
	if typeof(p1) ~= "table" or typeof(Index) ~= "table" then
		return false
	end
	if Index.new ~= nil and p1.new == Index.new then
		return true
	end
	local Meta = getmetatable(p1)
	while true do
		if typeof(Meta) ~= "table" then
			return false
		elseif Meta.__index == Index then
			return true
		else
			local Meta1 = Meta
			Meta = getmetatable(Meta.__index)
			
			if Meta1 == Meta then
				return false
			end
			continue
		end
	end
end

return function(p2, p3)
	-- upvalues: instanceOf (copy)
	return instanceOf(p2, p3)
end