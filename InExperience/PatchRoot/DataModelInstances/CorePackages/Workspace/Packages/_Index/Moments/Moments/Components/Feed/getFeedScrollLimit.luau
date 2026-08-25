return function(p0, p1, p2)
	if p0 and not p1 then
		return nil
	end
	local var0 = p2()
	
	return if var0.getIsInfiniteScrollEnabled(false) then nil else var0.getMaxMomentsBeforeEndState(false)
end