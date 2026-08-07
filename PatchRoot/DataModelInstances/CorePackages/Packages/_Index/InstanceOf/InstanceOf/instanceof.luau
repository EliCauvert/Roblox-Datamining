-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:41 2026 Pacific Standard Time.

local dEV = _G.__DEV__

return function(p0, p1) --[[ line: 20 | named "instanceof" ]]
	-- upvalues: dEV (ref)
	if dEV then
		assert(typeof(p1) == "table", "Received a non-table as the second argument for instanceof")
	end
	if typeof(p0) ~= "table" then
		return false
	end
	local ok, status = pcall(function() --[[ line: 29 ]]
		-- upvalues: p1 (ref), p0 (write)
		return p1.new ~= nil and p0.new == p1.new
	end)
	
	if ok and status then
		return true
	end
	local t = { [p0] = true }
	while p0 and typeof(p0) == "table" do
		p0 = getmetatable(p0)
		
		if typeof(p0) == "table" then
			p0 = p0.__index
			
			if p0 ~= p1 then
				if typeof(p0) ~= "table" then continue end
				if not t[p0] then
					t[p0] = true
					continue
				end
				return false
			end
			return true
		end
	end
	return false
end