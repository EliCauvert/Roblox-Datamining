local AVATAR_URLModule = require(script.Parent.Parent.AVATAR_URL)

return function(p0)
	-- upvalues: AVATAR_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetCurrentlyWearing" }, function(p1, p2)
		-- upvalues: AVATAR_URLModule (copy)
		return p1(AVATAR_URLModule):path("v1"):path("users"):id(p2):path("currently-wearing")
	end)
end