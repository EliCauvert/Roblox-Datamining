return function()
	local t = {}
	
	return function(p1)
		-- upvalues: t (ref)
		if t[p1] == nil then
			t[p1] = 1
			
			return p1
		end
		while true do
			t[p1] += 1
			local var1 = `{p1}_{t[p1]}`
			if t[var1] == nil then
				return var1
			end
		end
	end
end