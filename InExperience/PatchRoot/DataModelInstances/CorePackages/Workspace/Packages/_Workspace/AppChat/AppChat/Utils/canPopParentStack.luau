return function(p1)
	if not p1 or not p1._dangerouslyGetParent then
		return false
	end
	local var1 = p1._dangerouslyGetParent()
	local state = var1 and var1.state
	
	return if state and state.routes then #state.routes > 1 else false
end