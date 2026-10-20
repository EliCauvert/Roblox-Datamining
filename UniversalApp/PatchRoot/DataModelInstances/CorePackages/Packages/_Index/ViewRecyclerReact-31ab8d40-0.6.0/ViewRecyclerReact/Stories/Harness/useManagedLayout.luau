return function(p1, p2, p3)
	local UseMemoResult = p1.useMemo(p2, p3)
	p1.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return UseMemoResult.destroy
	end, { UseMemoResult })
	
	return UseMemoResult
end