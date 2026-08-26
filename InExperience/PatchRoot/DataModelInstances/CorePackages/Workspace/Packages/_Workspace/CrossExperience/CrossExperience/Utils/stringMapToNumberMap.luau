local cryo = require(script:FindFirstAncestor("CrossExperience").dependencies).Cryo

return function(p1)
	-- upvalues: cryo (ref)
	local t = {}
	
	if p1 ~= nil then
		for i, v in ipairs(cryo.Dictionary.keys(p1)) do
			local var1 = tonumber(v)
			
			if var1 then
				t[var1] = p1[v]
			end
		end
	end
	return t
end