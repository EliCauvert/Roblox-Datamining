local t = { instanceProcessingLimit = 1000 }

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