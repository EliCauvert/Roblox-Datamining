local cryo = require(script:FindFirstAncestor("CrossExperience").dependencies).Cryo

return function(p0)
	-- upvalues: cryo (ref)
	local t = {}
	
	if p0 ~= nil then
		for i, v in ipairs(cryo.Dictionary.keys(p0)) do
			local var1 = tonumber(v)
			
			if var1 then
				t[var1] = p0[v]
			end
		end
	end
	return t
end