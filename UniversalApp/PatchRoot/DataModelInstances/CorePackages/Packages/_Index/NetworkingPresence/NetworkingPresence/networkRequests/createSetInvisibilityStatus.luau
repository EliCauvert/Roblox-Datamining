local parent = script.Parent.Parent
local _ = require(parent.networkingPresenceTypes)
local PRESENCE_URLModule = require(parent.PRESENCE_URL)

return function(p1)
	-- upvalues: PRESENCE_URLModule (ref)
	return p1.roduxNetworking.POST({ Name = "SetInvisibilityStatus" }, function(p2, p3)
		-- upvalues: PRESENCE_URLModule (copy)
		return p2(PRESENCE_URLModule):path("v1"):path("presence"):path("set-invisibility-status"):body({ isInvisible = p3 })
	end)
end