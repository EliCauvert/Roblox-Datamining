local getPresenceTextFromUserModule = require(script.Parent.getPresenceTextFromUser)
local presenceImageByPresenceModule = require(script.Parent.presenceImageByPresence)

return function(p1)
	-- upvalues: getPresenceTextFromUserModule (ref), presenceImageByPresenceModule (ref)
	return {
		text = getPresenceTextFromUserModule(p1),
		image = presenceImageByPresenceModule[p1.presence]
	}
end