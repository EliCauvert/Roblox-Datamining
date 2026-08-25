local _ = require(script.Parent.types)

local function getRootNavigation(p0)
	-- upvalues: getRootNavigation (ref)
	local var1 = p0._dangerouslyGetParent()
	
	return if var1 then getRootNavigation(var1) else p0
end

return getRootNavigation