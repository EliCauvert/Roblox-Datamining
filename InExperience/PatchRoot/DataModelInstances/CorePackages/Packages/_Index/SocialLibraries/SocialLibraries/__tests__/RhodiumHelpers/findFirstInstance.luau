local function _(p1, p2) --[[ Line: 6 | Named "getProperty" ]]
	local Success, Result = pcall(function() --[[ Line: 7 ]]
		-- upvalues: p1 (copy), p2 (copy)
		return p1[p2]
	end)
	
	return Success == true and Result or nil
end

local function propertyMatch(p1, List): boolean --[[ Line: 14 ]]
	for i, value in pairs(List) do
		local Success, Result = pcall(function() --[[ Line: 7 ]]
			-- upvalues: p1 (copy), i (copy)
			return p1[i]
		end)
		
		if (Success == true and Result or nil) ~= value then
			return false
		end
	end
	return true
end

return function(Object, p2) --[[ Line: 24 | Named "findFirstInstance" ]]
	-- upvalues: propertyMatch (copy)
	for _, descendant in ipairs(Object:GetDescendants()) do
		if propertyMatch(descendant, p2) then
			return descendant
		end
	end
	return nil
end