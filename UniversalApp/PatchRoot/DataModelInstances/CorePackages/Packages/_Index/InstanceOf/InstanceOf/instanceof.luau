local dEV = _G.__DEV__

return function(p1, p2)
	-- upvalues: dEV (ref)
	if dEV then
		assert(typeof(p2) == "table", "Received a non-table as the second argument for instanceof")
	end
	if typeof(p1) ~= "table" then
		return false
	end
	local ok, status = pcall(function()
		-- upvalues: p2 (ref), p1 (write)
		return p2.new ~= nil and p1.new == p2.new
	end)
	
	if ok and status then
		return true
	end
	local t = { [p1] = true }
	while p1 and typeof(p1) == "table" do
		p1 = getmetatable(p1)
		
		if typeof(p1) == "table" then
			p1 = p1.__index
			
			if p1 ~= p2 then
				if typeof(p1) ~= "table" then continue end
				if not t[p1] then
					t[p1] = true
					continue
				end
				return false
			end
			return true
		end
	end
	return false
end