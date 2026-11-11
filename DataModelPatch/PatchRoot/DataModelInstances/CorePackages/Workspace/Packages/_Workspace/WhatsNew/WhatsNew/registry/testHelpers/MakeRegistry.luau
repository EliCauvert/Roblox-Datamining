local WhatsNew = script:FindFirstAncestor("WhatsNew")
local ConstantsModule = require(WhatsNew.Constants)
local _ = require(WhatsNew.Types)

local function makeEntry(p1)
	local P0 = p1 or {}
	
	return {
		id = P0.id or "entryA",
		scopeId = P0.scopeId or "InExperience",
		anchorId = P0.anchorId or "anchorA",
		title = P0.title or "Title",
		text = P0.text or "Text",
		icon = P0.icon or "",
		enabled = P0.enabled == nil or P0.enabled,
		publishedTime = P0.publishedTime or "2026-05-01T00:00:00Z",
		disableTime = P0.disableTime
	}
end

return {
	makeEntry = makeEntry,
	makeRegistry = function(p1)
		-- upvalues: ConstantsModule (copy)
		local P1 = p1 or {}
		
		return {
			constants = P1.constants or ConstantsModule.DEFAULT,
			scopeTours = P1.scopeTours or {
				InExperience = { id = "InExperience", parentScopeId = nil }
			},
			whatsNew = P1.whatsNew or {},
			onboarding = P1.onboarding or {}
		}
	end,
	inExperienceNested = function()
		-- upvalues: ConstantsModule (copy), makeEntry (copy)
		return {
			constants = ConstantsModule.DEFAULT,
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
			whatsNew = {
				makeEntry({
					id = "settings",
					scopeId = "ExperienceMenu",
					anchorId = "inGameSideSheetA",
					title = "Settings",
					text = "View people in the game, edit game settings, and more."
				}),
				makeEntry({
					id = "inGame",
					scopeId = "ExperienceMenu",
					anchorId = "inGameSideSheetB",
					title = "In game settings",
					text = "Create a party, view the leaderboard, and more."
				}),
				(makeEntry({
					id = "leaveRespawn",
					scopeId = "ExperienceMenu",
					anchorId = "LeaveRespawn",
					title = "Leave and Respawn moved",
					text = "Leave the experience or respawn your avatar here."
				}))
			},
			onboarding = {}
		}
	end,
	inExperienceDoubleNested = function()
		-- upvalues: ConstantsModule (copy), makeEntry (copy)
		return {
			constants = ConstantsModule.DEFAULT,
			scopeTours = {
				InExperience = { id = "InExperience", parentScopeId = nil },
				ExperienceMenu = {
					id = "ExperienceMenu",
					parentScopeId = "InExperience",
					anchorId = "gameMenuTilt",
					openActionKey = "OpenExperienceMenu",
					closeActionKey = "CloseExperienceMenu",
					onboardingTitle = "The menu lives here",
					onboardingText = "Open the menu to continue.",
					updatesTitle = "Menu updates",
					updatesText = "Open the menu to see updates."
				},
				SettingsPanel = {
					id = "SettingsPanel",
					parentScopeId = "ExperienceMenu",
					anchorId = "settingsGatewayAnchor",
					openActionKey = "OpenSettings",
					closeActionKey = "CloseSettings",
					onboardingTitle = "Settings live here",
					onboardingText = "Open settings to continue.",
					updatesTitle = "Settings updates",
					updatesText = "Open settings to see updates."
				}
			},
			whatsNew = {
				(makeEntry({
					id = "audioSetting",
					scopeId = "SettingsPanel",
					anchorId = "settingsTipAnchor",
					title = "Audio settings",
					text = "Control volume and audio output here."
				}))
			},
			onboarding = {}
		}
	end,
	sameAnchorPair = function()
		-- upvalues: ConstantsModule (copy), makeEntry (copy)
		return {
			constants = ConstantsModule.DEFAULT,
			scopeTours = {
				InExperience = { id = "InExperience", parentScopeId = nil }
			},
			whatsNew = {
				makeEntry({
					id = "gameExperiences",
					scopeId = "InExperience",
					anchorId = "gameMenuTilt",
					title = "Game experiences",
					text = "Discover new game experiences."
				}),
				(makeEntry({
					id = "music",
					scopeId = "InExperience",
					anchorId = "gameMenuTilt",
					title = "Music",
					text = "Control music in the experience."
				}))
			},
			onboarding = {}
		}
	end,
	emptyNestedScopeTours = function()
		return {
			InExperience = { id = "InExperience", parentScopeId = nil },
			ExperienceMenu = {
				id = "ExperienceMenu",
				parentScopeId = "InExperience",
				anchorId = "gameMenuTilt",
				openActionKey = "OpenExperienceMenu",
				closeActionKey = "CloseExperienceMenu",
				onboardingTitle = "The menu lives here",
				onboardingText = "Open the menu to continue.",
				updatesTitle = "Menu updates",
				updatesText = "Open the menu to see updates."
			},
			SettingsPanel = {
				id = "SettingsPanel",
				parentScopeId = "InExperience",
				anchorId = "settingsAnchor",
				openActionKey = "OpenSettings",
				closeActionKey = "CloseSettings",
				onboardingTitle = "Settings live here",
				onboardingText = "Open settings to continue.",
				updatesTitle = "Settings updates",
				updatesText = "Open settings to see updates."
			}
		}
	end
}