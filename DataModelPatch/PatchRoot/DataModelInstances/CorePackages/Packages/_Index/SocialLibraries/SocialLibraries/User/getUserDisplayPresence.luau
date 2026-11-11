local GetPresenceTextFromUserModule = require(script.Parent.getPresenceTextFromUser)
local PresenceImageByPresenceModule = require(script.Parent.presenceImageByPresence)

return function(p1)
	-- upvalues: GetPresenceTextFromUserModule (copy), PresenceImageByPresenceModule (copy)
	return {
		text = GetPresenceTextFromUserModule(p1),
		image = PresenceImageByPresenceModule[p1.presence]
	}
end