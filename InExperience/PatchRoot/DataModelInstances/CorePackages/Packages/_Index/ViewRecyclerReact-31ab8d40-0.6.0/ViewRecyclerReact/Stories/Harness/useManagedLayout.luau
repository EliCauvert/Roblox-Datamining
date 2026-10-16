return function(p1, p2, p3) --[[ Line: 1 | Named "useManagedLayout" ]]
	local UseMemoResult = p1.useMemo(p2, p3)
	p1.useEffect(function() --[[ Line: 3 ]]
		-- upvalues: UseMemoResult (copy)
		return UseMemoResult.destroy
	end, { UseMemoResult })
	
	return UseMemoResult
end