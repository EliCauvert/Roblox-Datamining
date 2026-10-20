local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local Constants = {
	EventContext = "HomePageRemindersEvent",
	EventName = "HomePageRemindersEvent",
	Platform = "PLATFORM_UNIVERSAL_APP",
	EventTypes = {
		CtaClicked = "REMINDER_INTERACTION_CTA_CLICKED",
		Dimissed = "REMINDER_INTERACTION_REMINDER_DISMISSED"
	}
}

return {
	sendEvent = function(p1, p2)
		-- upvalues: Constants (copy), CryoModule (copy)
		p1:sendEventDeferred(Constants.EventContext, Constants.EventName, CryoModule.Dictionary.join({ platform = Constants.Platform }, p2))
	end,
	Constants = Constants
}