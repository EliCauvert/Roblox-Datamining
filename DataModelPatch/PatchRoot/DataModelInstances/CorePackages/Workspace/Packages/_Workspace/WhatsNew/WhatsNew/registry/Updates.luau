local WhatsNew = script:FindFirstAncestor("WhatsNew")
local _ = require(WhatsNew.Types)

return {
	constants = require(WhatsNew.Constants).DEFAULT,
	scopeTours = {
		InExperience = { id = "InExperience", parentScopeId = nil },
		ExperienceMenu = {
			id = "ExperienceMenu",
			parentScopeId = "InExperience",
			anchorId = "gameMenuTilt",
			openActionKey = "OpenExperienceMenu",
			closeActionKey = "CloseExperienceMenu",
			onboardingTitle = "The menu lives here",
			onboardingText = "The game menu contains in-game actions along with game-specific controls.",
			updatesTitle = "Menu updates",
			updatesText = "Open the menu to see updates to the side sheet."
		}
	},
	whatsNew = {},
	onboarding = {
		{
			id = "ExperienceDetails",
			scopeId = "ExperienceMenu",
			anchorId = "experienceDetails",
			title = "Experience details",
			text = "View experience-related information like the in-game leaderboard, music controls, and more.",
			icon = "",
			enabled = true,
			publishedTime = "2026-05-01T00:00:00Z"
		},
		{
			id = "settings",
			scopeId = "ExperienceMenu",
			anchorId = "settings",
			title = "In game settings",
			text = "Edit game settings, view game-specific controls, and more.",
			icon = "",
			enabled = true,
			publishedTime = "2026-05-01T00:00:00Z"
		},
		{
			id = "leaveRespawn",
			scopeId = "ExperienceMenu",
			anchorId = "LeaveRespawn",
			title = "Leave and Respawn",
			text = "Leaving the experience or respawning your avatar is easily accessible from the bottom of the menu.",
			icon = "",
			enabled = true,
			publishedTime = "2026-05-01T00:00:00Z"
		}
	}
}