local function _(p1, p2)
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy), p2 (copy)
		return p1[p2]
	end)
	
	return if Success == true then Result else nil
end

local function propertyMatch(p1, List): boolean
	for i, value in pairs(List) do
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy), i (copy)
			return p1[i]
		end)
		
		if (if Success == true then Result else nil) ~= value then
			return false
		end
	end
	return true
end

return function(Object, p2)
	-- upvalues: propertyMatch (copy)
	for _, descendant in ipairs(Object:GetDescendants()) do
		if propertyMatch(descendant, p2) then
			return descendant
		end
	end
	return nil
end