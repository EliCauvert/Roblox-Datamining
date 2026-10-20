return function()
	local Count = 0
	
	return function(): number
		-- upvalues: Count (ref)
		Count += 1
		
		return Count
	end
end