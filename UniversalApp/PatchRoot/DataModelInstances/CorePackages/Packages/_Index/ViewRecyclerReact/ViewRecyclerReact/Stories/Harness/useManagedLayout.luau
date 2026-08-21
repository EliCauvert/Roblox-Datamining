return function(p0, p1, p2) --[[ line: 1 | named "useManagedLayout" ]]
	local var0 = p0.useMemo(p1, p2)
	p0.useEffect(function() --[[ line: 3 ]]
		-- upvalues: var0 (ref)
		return var0.destroy
	end, { var0 })
	
	return var0
end