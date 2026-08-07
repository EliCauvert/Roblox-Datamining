-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:21 2026 Pacific Standard Time.

local function _(p0, p1) --[[ line: 6 | named "getProperty" ]]
	local ok, status = pcall(function() --[[ line: 7 ]]
		-- upvalues: p0 (ref), p1 (ref)
		return p0[p1]
	end)
	
	return if ok == true then status else nil
end

local function propertyMatch(p2, p3) --[[ line: 14 ]]
	for i, v in pairs(p3) do
		local ok, status = pcall(function() --[[ line: 7 ]]
			-- upvalues: p2 (ref), i (ref)
			return p2[i]
		end)
		
		if (if ok == true then status else nil) ~= v then
			return false
		end
	end
	return true
end

return function(p4, p5) --[[ line: 24 | named "findFirstInstance" ]]
	-- upvalues: propertyMatch (ref)
	for i, v in ipairs(p4:GetDescendants()) do
		if propertyMatch(v, p5) then
			return v
		end
	end
	return nil
end