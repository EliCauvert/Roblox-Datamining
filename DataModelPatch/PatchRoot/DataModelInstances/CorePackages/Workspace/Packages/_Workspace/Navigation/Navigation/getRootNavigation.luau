local _ = require(script.Parent.types)

local function getRootNavigation(DangerouslyGetParentResult)
	-- upvalues: getRootNavigation (copy)
	local DangerouslyGetParentResult1 = DangerouslyGetParentResult._dangerouslyGetParent()
	
	return if DangerouslyGetParentResult1 then getRootNavigation(DangerouslyGetParentResult1) else DangerouslyGetParentResult
end

return getRootNavigation