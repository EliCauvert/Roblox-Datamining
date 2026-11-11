local CryoModule = require(script:FindFirstAncestor("NotApprovedPage").Parent.Cryo)

return function(List, p1)
	-- upvalues: CryoModule (copy)
	local t = {}
	
	for _, value in List do
		local v1 = if p1 then p1[value] else value
		
		if v1 and v1 ~= "" then
			t[v1] = true
		end
	end
	return CryoModule.Dictionary.keys(t)
end