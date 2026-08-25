local parent = script.Parent.Parent
local _ = require(parent.networkingPresenceTypes)
local PRESENCE_URLModule = require(parent.PRESENCE_URL)

return function(p0)
	-- upvalues: PRESENCE_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "SetInvisibilityStatus" }, function(p1, p2)
		-- upvalues: PRESENCE_URLModule (copy)
		return p1(PRESENCE_URLModule):path("v1"):path("presence"):path("set-invisibility-status"):body({ isInvisible = p2 })
	end)
end