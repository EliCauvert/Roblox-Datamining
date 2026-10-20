return function(p1, p2, Callback)
	if p1 and not p2 then
		return nil
	else
		local CallbackResult = Callback()
		
		return if CallbackResult.getIsInfiniteScrollEnabled(false) then nil else CallbackResult.getMaxMomentsBeforeEndState(false)
	end
end