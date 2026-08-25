return function(p0)
	if not p0 or not p0._dangerouslyGetParent then
		return false
	end
	local var0 = p0._dangerouslyGetParent()
	local state = var0 and var0.state
	
	return if state and state.routes then #state.routes > 1 else false
end