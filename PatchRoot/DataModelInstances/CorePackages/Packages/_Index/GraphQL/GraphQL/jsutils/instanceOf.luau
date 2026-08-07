-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:34 2026 Pacific Standard Time.

local isNillish = require(script.Parent.Parent.luaUtils.isNillish).isNillish

local function instanceOf(p0, p1) --[[ line: 10 ]]
	-- upvalues: isNillish (ref)
	if isNillish(p0) then
		return false
	elseif typeof(p0) ~= "table" or typeof(p1) ~= "table" then
		return false
	elseif p1.new ~= nil and p0.new == p1.new then
		return true
	end
	local var1 = getmetatable(p0)
	while true do
		if typeof(var1) == "table" then
			if var1.__index ~= p1 then
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

return function(p2, p3) --[[ line: 41 ]]
	-- upvalues: instanceOf (ref)
	return instanceOf(p2, p3)
end