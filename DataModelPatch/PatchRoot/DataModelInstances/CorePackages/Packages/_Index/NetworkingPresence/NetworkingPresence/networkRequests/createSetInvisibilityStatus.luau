local Parent = script.Parent.Parent
local _ = require(Parent.networkingPresenceTypes)
local PRESENCEURLModule = require(Parent.PRESENCE_URL)

return function(p1)
	-- upvalues: PRESENCEURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "SetInvisibilityStatus" }, function(Callback, IsInvisible)
		-- upvalues: PRESENCEURLModule (upval)
		return Callback(PRESENCEURLModule):path("v1"):path("presence"):path("set-invisibility-status"):body({ isInvisible = IsInvisible })
	end)
end