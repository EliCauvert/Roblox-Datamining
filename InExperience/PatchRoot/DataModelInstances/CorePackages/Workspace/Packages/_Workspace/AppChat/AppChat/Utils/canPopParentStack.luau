return function(p1): boolean --[[ Line: 6 | Named "canPopParentStack" ]]
	if p1 and p1._dangerouslyGetParent then
		local DangerouslyGetParentResult = p1._dangerouslyGetParent()
		local State = DangerouslyGetParentResult and DangerouslyGetParentResult.state
		
		return if State and State.routes then #State.routes > 1 else false
	else
		return false
	end
end