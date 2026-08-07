local getPresenceTextFromUserModule = require(script.Parent.getPresenceTextFromUser)
local presenceImageByPresenceModule = require(script.Parent.presenceImageByPresence)

return function(p0) --[[ line: 4 ]]
	-- upvalues: getPresenceTextFromUserModule (ref), presenceImageByPresenceModule (ref)
	return {
		text = getPresenceTextFromUserModule(p0),
		image = presenceImageByPresenceModule[p0.presence]
	}
end