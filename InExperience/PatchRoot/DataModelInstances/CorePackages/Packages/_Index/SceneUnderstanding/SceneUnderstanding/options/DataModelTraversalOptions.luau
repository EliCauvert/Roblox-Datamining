local t = { instanceProcessingLimit = 1000 }

return {
	new = function(p0) --[[ line: 24 ]]
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