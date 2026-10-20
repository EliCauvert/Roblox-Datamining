local Count = 0

return function(): string
	-- upvalues: Count (ref)
	Count += 1
	
	return (tostring(Count))
end