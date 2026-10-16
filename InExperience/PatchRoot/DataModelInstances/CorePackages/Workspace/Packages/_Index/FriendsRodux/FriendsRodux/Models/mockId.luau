local Count = 0

return function(): string --[[ Line: 3 ]]
	-- upvalues: Count (ref)
	Count += 1
	
	return (tostring(Count))
end