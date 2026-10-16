local Count = 0

return function(): string --[[ Line: 7 ]]
	-- upvalues: Count (ref)
	Count += 1
	
	return (tostring(Count))
end