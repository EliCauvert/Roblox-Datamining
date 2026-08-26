local AVATAR_URLModule = require(script.Parent.Parent.AVATAR_URL)

return function(p1)
	-- upvalues: AVATAR_URLModule (ref)
	return p1.roduxNetworking.GET({ Name = "GetCurrentlyWearing" }, function(p2, p3)
		-- upvalues: AVATAR_URLModule (copy)
		return p2(AVATAR_URLModule):path("v1"):path("users"):id(p3):path("currently-wearing")
	end)
end