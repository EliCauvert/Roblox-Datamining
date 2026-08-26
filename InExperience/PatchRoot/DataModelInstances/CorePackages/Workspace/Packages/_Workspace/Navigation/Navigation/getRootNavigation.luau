local _ = require(script.Parent.types)

local function getRootNavigation(p1)
	-- upvalues: getRootNavigation (ref)
	local var1 = p1._dangerouslyGetParent()
	
	return if var1 then getRootNavigation(var1) else p1
end

return getRootNavigation