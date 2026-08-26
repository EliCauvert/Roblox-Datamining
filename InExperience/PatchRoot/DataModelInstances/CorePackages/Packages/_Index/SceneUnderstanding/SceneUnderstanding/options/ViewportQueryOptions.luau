local t = {
	maxDistance = 5000,
	maxScreenDivisions = 16,
	limit = 1e999
}

return {
	new = function(p1)
		-- upvalues: t (ref)
		local cloned = table.clone(t)
		
		if p1 then
			for i, v in p1 do
				cloned[i] = v
			end
		end
		return cloned
	end
}