local t = { maxDistance = 100, limit = 1e999 }

return {
	new = function(p0) --[[ line: 30 ]]
		-- upvalues: t (ref)
		local cloned = table.clone(t)
		
		if p0 then
			for i, v in p0 do
				cloned[i] = v
			end
		end
		return cloned
	end
}