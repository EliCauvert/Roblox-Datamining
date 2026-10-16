local AVATARURLModule = require(script.Parent.Parent.AVATAR_URL)

return function(p1) --[[ Line: 8 ]]
	-- upvalues: AVATARURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetCurrentlyWearing" }, function(Callback, p2) --[[ Line: 11 ]]
		-- upvalues: AVATARURLModule (upval)
		return Callback(AVATARURLModule):path("v1"):path("users"):id(p2):path("currently-wearing")
	end)
end