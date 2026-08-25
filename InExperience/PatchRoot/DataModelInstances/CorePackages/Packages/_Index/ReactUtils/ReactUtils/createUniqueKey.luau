return function()
	local t = {}
	
	return function(p0)
		-- upvalues: t (ref)
		if t[p0] == nil then
			t[p0] = 1
			
			return p0
		end
		while true do
			t[p0] += 1
			local var1 = `{p0}_{t[p0]}`
			if t[var1] == nil then
				return var1
			end
		end
	end
end