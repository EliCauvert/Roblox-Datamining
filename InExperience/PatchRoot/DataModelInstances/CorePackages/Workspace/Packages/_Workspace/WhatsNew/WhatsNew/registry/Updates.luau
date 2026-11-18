local WhatsNew = script:FindFirstAncestor("WhatsNew")
local ConstantsModule = require(WhatsNew.Constants)
local _ = require(WhatsNew.Types)
local FoundationModule = require(WhatsNew.Parent.Foundation)
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local IsSideSheetEnabledModule = require(WhatsNew.Parent.InExperienceSideSheetUtils.isSideSheetEnabled)
local RoseWhatsNewTourPublishedTime = game:DefineFastString("RoseWhatsNewTourPublishedTime", "2026-11-18T00:00:00Z")
local RoseWhatsNewTourDisabledTime = game:DefineFastString("RoseWhatsNewTourDisabledTime", "2027-02-01T00:00:00Z")

return {
	constants = ConstantsModule.DEFAULT,
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
			align = PopoverAlign.Start
		}
	},
	whatsNew = {
		{
			id = "UnifiedMenu",
			scopeId = "InGame",
			anchorId = "nine_dot",
			completeOnOpenActionKey = "OpenTiltMenu",
			title = "CoreScripts.FTUX.Heading.UnifiedMenuEntrypointUpdate",
			text = "CoreScripts.FTUX.Label.UnifiedMenuEntrypointUpdate",
			icon = "",
			enabled = IsSideSheetEnabledModule,
			align = PopoverAlign.Start,
			publishedTime = RoseWhatsNewTourPublishedTime,
			disabledTime = RoseWhatsNewTourDisabledTime
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
			align = PopoverAlign.Start,
			publishedTime = RoseWhatsNewTourPublishedTime,
			disabledTime = RoseWhatsNewTourDisabledTime
		},
		{
			id = "SideSheet",
			scopeId = "TiltMenu",
			anchorId = "sideSheet",
			title = "CoreScripts.FTUX.Heading.SideSheetUpdate",
			text = "CoreScripts.FTUX.Label.SideSheetOnboarding",
			icon = "",
			enabled = IsSideSheetEnabledModule,
			side = PopoverSide.Right,
			align = PopoverAlign.Center,
			publishedTime = RoseWhatsNewTourPublishedTime,
			disabledTime = RoseWhatsNewTourDisabledTime
		},
		{
			id = "LeaveRespawn",
			scopeId = "TiltMenu",
			anchorId = "LeaveRespawn",
			title = "CoreScripts.FTUX.Heading.LeaveRespawn",
			text = "CoreScripts.FTUX.Label.LeaveRespawn",
			icon = "",
			enabled = IsSideSheetEnabledModule,
			side = PopoverSide.Right,
			align = PopoverAlign.End,
			publishedTime = RoseWhatsNewTourPublishedTime,
			disabledTime = RoseWhatsNewTourDisabledTime
		}
	}
}