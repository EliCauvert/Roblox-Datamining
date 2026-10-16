return function() --[[ Line: 2 | Named "createNextOrder" ]]
	local Count = 0
	
	return function(): number --[[ Line: 5 ]]
		-- upvalues: Count (ref)
		Count += 1
		
		return Count
	end
end