local _ = require(script.Parent.Types)
local FoundationModule = require(script:FindFirstAncestor("WhatsNew").Parent.Foundation)
local TourType = { WhatsNew = "whatsNew", Onboarding = "onboarding" }

return {
	TourType = TourType,
	TourTypeList = { TourType.WhatsNew, TourType.Onboarding },
	WhatsNewSurface = {
		Idle = "idle",
		TourTip = "tourTip",
		UpdateMenu = "updateMenu",
		WaitingForAnchor = "waitingForAnchor"
	},
	PopoverSide = FoundationModule.Enums.PopoverSide,
	PopoverAlign = FoundationModule.Enums.PopoverAlign,
	TourTipCtaKind = { None = "none", Menu = "menu", Nested = "nested" }
}