local whatsNew = script:FindFirstAncestor("WhatsNew")
local constantsModule = require(whatsNew.Constants)
local _ = require(whatsNew.Types)
local foundationModule = require(whatsNew.Parent.Foundation)
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local isSideSheetEnabledModule = require(whatsNew.Parent.InExperienceSideSheetUtils.isSideSheetEnabled)
local roseWhatsNewTourPublishedTime = game:DefineFastString("RoseWhatsNewTourPublishedTime", "2026-08-12T00:00:00Z")
local roseWhatsNewTourDisabledTime = game:DefineFastString("RoseWhatsNewTourDisabledTime", "2026-09-30T00:00:00Z")

return {
	constants = constantsModule.DEFAULT,
	scopeTours = {
		InGame = { id = "InGame", parentScopeId = nil },
		TiltMenu = {
			id = "TiltMenu",
			parentScopeId = "InGame",
			anchorId = "nine_dot",
			openActionKey = "OpenTiltMenu",
			closeActionKey = "CloseTiltMenu",
			onboardingTitle = "CoreScripts.FTUX.Heading.NewTiltOnboarding",
			onboardingText = "CoreScripts.FTUX.Label.NewTiltOnboarding",
			updatesTitle = "CoreScripts.FTUX.Heading.NewTiltUpdate",
			updatesText = "CoreScripts.FTUX.Label.NewTiltUpdate",
			align = popoverAlign.Start
		}
	},
	whatsNew = {
		{
			id = "SideSheet",
			scopeId = "TiltMenu",
			anchorId = "sideSheet",
			title = "CoreScripts.FTUX.Heading.SideSheetUpdate",
			text = "CoreScripts.FTUX.Label.SideSheetUpdate",
			icon = "",
			enabled = isSideSheetEnabledModule,
			side = popoverSide.Right,
			align = popoverAlign.Center,
			publishedTime = roseWhatsNewTourPublishedTime,
			disabledTime = roseWhatsNewTourDisabledTime
		},
		{
			id = "LeaveRespawn",
			scopeId = "TiltMenu",
			anchorId = "LeaveRespawn",
			title = "CoreScripts.FTUX.Heading.LeaveRespawn",
			text = "CoreScripts.FTUX.Label.LeaveRespawn",
			icon = "",
			enabled = isSideSheetEnabledModule,
			side = popoverSide.Right,
			align = popoverAlign.End,
			publishedTime = roseWhatsNewTourPublishedTime,
			disabledTime = roseWhatsNewTourDisabledTime
		}
	},
	onboarding = {
		{
			id = "TopBar",
			scopeId = "InGame",
			anchorId = "chat",
			title = "CoreScripts.FTUX.Heading.SocialOnboarding",
			text = "CoreScripts.FTUX.Label.SocialOnboarding",
			icon = "",
			enabled = true,
			align = popoverAlign.Start,
			publishedTime = roseWhatsNewTourPublishedTime,
			disabledTime = roseWhatsNewTourDisabledTime
		},
		{
			id = "SideSheet",
			scopeId = "TiltMenu",
			anchorId = "sideSheet",
			title = "CoreScripts.FTUX.Heading.SideSheetUpdate",
			text = "CoreScripts.FTUX.Label.SideSheetOnboarding",
			icon = "",
			enabled = isSideSheetEnabledModule,
			side = popoverSide.Right,
			align = popoverAlign.Center,
			publishedTime = roseWhatsNewTourPublishedTime,
			disabledTime = roseWhatsNewTourDisabledTime
		},
		{
			id = "LeaveRespawn",
			scopeId = "TiltMenu",
			anchorId = "LeaveRespawn",
			title = "CoreScripts.FTUX.Heading.LeaveRespawn",
			text = "CoreScripts.FTUX.Label.LeaveRespawn",
			icon = "",
			enabled = isSideSheetEnabledModule,
			side = popoverSide.Right,
			align = popoverAlign.End,
			publishedTime = roseWhatsNewTourPublishedTime,
			disabledTime = roseWhatsNewTourDisabledTime
		}
	}
}