local _ = require(script.Parent.Types)
local foundationModule = require(script:FindFirstAncestor("WhatsNew").Parent.Foundation)
local t = { WhatsNew = "whatsNew", Onboarding = "onboarding" }

return {
	TourType = t,
	TourTypeList = { t.Onboarding, t.WhatsNew },
	WhatsNewSurface = {
		Idle = "idle",
		TourTip = "tourTip",
		WaitingForAnchor = "waitingForAnchor"
	},
	PopoverSide = foundationModule.Enums.PopoverSide,
	PopoverAlign = foundationModule.Enums.PopoverAlign
}