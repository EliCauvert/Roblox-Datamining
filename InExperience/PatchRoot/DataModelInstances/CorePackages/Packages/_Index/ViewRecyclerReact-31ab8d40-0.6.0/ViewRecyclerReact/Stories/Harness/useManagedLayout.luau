return function(p1, p2, p3)
	local var1 = p1.useMemo(p2, p3)
	p1.useEffect(function()
		-- upvalues: var1 (ref)
		return var1.destroy
	end, { var1 })
	
	return var1
end