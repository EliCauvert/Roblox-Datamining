local function _(p1, p2)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), p2 (ref)
		return p1[p2]
	end)
	
	return if ok == true then status else nil
end

local function propertyMatch(p1, p2)
	for i, v in pairs(p2) do
		local ok, status = pcall(function()
			-- upvalues: p1 (ref), i (ref)
			return p1[i]
		end)
		
		if (if ok == true then status else nil) ~= v then
			return false
		end
	end
	return true
end

return function(p3, p4)
	-- upvalues: propertyMatch (ref)
	for i, v in ipairs(p3:GetDescendants()) do
		if propertyMatch(v, p4) then
			return v
		end
	end
	return nil
end