return function(p1)
	local Count = 1
	
	return {
		getNext = function()
			-- upvalues: p1 (copy), Count (ref)
			local v1 = p1[Count]
			Count += 1
			
			return v1
		end
	}
end