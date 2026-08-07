local whatsNew = script:FindFirstAncestor("WhatsNew")
local constantsModule = require(whatsNew.Constants)
local _ = require(whatsNew.Types)
local foundationModule = require(whatsNew.Parent.Foundation)
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide

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
			enabled = true,
			publishedTime = "2026-05-01T00:00:00Z",
			side = popoverSide.Right,
			align = popoverAlign.Center
		},
		{
			id = "LeaveRespawn",
			scopeId = "TiltMenu",
			anchorId = "LeaveRespawn",
			title = "CoreScripts.FTUX.Heading.LeaveRespawn",
			text = "CoreScripts.FTUX.Label.LeaveRespawn",
			icon = "",
			enabled = true,
			publishedTime = "2026-05-01T00:00:00Z",
			side = popoverSide.Right,
			align = popoverAlign.End
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
			publishedTime = "2026-05-01T00:00:00Z",
			align = popoverAlign.Start
		},
		{
			id = "SideSheet",
			scopeId = "TiltMenu",
			anchorId = "sideSheet",
			title = "CoreScripts.FTUX.Heading.SideSheetUpdate",
			text = "CoreScripts.FTUX.Label.SideSheetOnboarding",
			icon = "",
			enabled = true,
			publishedTime = "2026-05-01T00:00:00Z",
			side = popoverSide.Right,
			align = popoverAlign.Center
		},
		{
			id = "LeaveRespawn",
			scopeId = "TiltMenu",
			anchorId = "LeaveRespawn",
			title = "CoreScripts.FTUX.Heading.LeaveRespawn",
			text = "CoreScripts.FTUX.Label.LeaveRespawn",
			icon = "",
			enabled = true,
			publishedTime = "2026-05-01T00:00:00Z",
			side = popoverSide.Right,
			align = popoverAlign.End
		}
	}
}