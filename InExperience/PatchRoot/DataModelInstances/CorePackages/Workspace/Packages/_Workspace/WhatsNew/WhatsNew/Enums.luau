local _ = require(script.Parent.Types)
local FoundationModule = require(script:FindFirstAncestor("WhatsNew").Parent.Foundation)
local TourType = { WhatsNew = "whatsNew", Onboarding = "onboarding" }

return {
	TourType = TourType,
	TourTypeList = { TourType.Onboarding, TourType.WhatsNew },
	WhatsNewSurface = {
		Idle = "idle",
		TourTip = "tourTip",
		WaitingForAnchor = "waitingForAnchor"
	},
	PopoverSide = FoundationModule.Enums.PopoverSide,
	PopoverAlign = FoundationModule.Enums.PopoverAlign
}