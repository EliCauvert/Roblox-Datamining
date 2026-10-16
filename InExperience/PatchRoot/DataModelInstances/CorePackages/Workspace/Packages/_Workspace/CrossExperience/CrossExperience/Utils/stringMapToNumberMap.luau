local Cryo = require(script:FindFirstAncestor("CrossExperience").dependencies).Cryo

return function(p1) --[[ Line: 6 ]]
	-- upvalues: Cryo (copy)
	local t = {}
	
	if p1 ~= nil then
		for _, value in ipairs((Cryo.Dictionary.keys(p1))) do
			local Number: number? = tonumber(value)
			
			if Number then
				t[Number] = p1[value]
			end
		end
	end
	return t
end