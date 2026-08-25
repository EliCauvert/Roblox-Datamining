return function(p0, p1, p2)
	local var0 = p0.useMemo(p1, p2)
	p0.useEffect(function()
		-- upvalues: var0 (ref)
		return var0.destroy
	end, { var0 })
	
	return var0
end