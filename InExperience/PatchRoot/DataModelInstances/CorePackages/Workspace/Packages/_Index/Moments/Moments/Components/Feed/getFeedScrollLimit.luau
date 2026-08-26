return function(p1, p2, p3)
	if p1 and not p2 then
		return nil
	end
	local var1 = p3()
	
	return if var1.getIsInfiniteScrollEnabled(false) then nil else var1.getMaxMomentsBeforeEndState(false)
end