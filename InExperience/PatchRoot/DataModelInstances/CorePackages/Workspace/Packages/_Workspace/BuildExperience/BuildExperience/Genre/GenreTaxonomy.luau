local buildExperience = script:FindFirstAncestor("BuildExperience")
local localizationStringsModule = require(buildExperience.LocalizationStrings)

return {
	version = require(buildExperience.Parent.DataHydration.ExperienceGenre).ExperienceGenreStoreTypes.DEFAULT_TAXONOMY_VERSION,
	genres = {
		{
			id = "action",
			displayName = localizationStringsModule.GENRE_ACTION_NAME,
			description = localizationStringsModule.GENRE_ACTION_DESCRIPTION,
			subgenres = {
				{
					id = "battle_royale",
					displayName = localizationStringsModule.GENRE_BATTLE_ROYALE_NAME,
					description = localizationStringsModule.GENRE_BATTLE_ROYALE_DESCRIPTION
				},
				{
					id = "fighting",
					displayName = localizationStringsModule.GENRE_FIGHTING_NAME,
					description = localizationStringsModule.GENRE_FIGHTING_DESCRIPTION
				},
				{
					id = "shooter",
					displayName = localizationStringsModule.GENRE_ACTION_SHOOTER_NAME,
					description = localizationStringsModule.GENRE_ACTION_SHOOTER_DESCRIPTION
				}
			}
		},
		{
			id = "adventure",
			displayName = localizationStringsModule.GENRE_ADVENTURE_NAME,
			description = localizationStringsModule.GENRE_ADVENTURE_DESCRIPTION,
			subgenres = {
				{
					id = "exploration",
					displayName = localizationStringsModule.GENRE_EXPLORATION_NAME,
					description = localizationStringsModule.GENRE_EXPLORATION_DESCRIPTION
				},
				{
					id = "story",
					displayName = localizationStringsModule.GENRE_STORY_NAME,
					description = localizationStringsModule.GENRE_STORY_DESCRIPTION
				},
				{
					id = "scavenger_hunt",
					displayName = localizationStringsModule.GENRE_SCAVENGER_HUNT_NAME,
					description = localizationStringsModule.GENRE_SCAVENGER_HUNT_DESCRIPTION
				}
			}
		},
		{
			id = "comedy",
			displayName = localizationStringsModule.GENRE_COMEDY_NAME,
			description = localizationStringsModule.GENRE_COMEDY_DESCRIPTION,
			subgenres = {
				{
					id = "memes",
					displayName = localizationStringsModule.GENRE_MEMES_NAME,
					description = localizationStringsModule.GENRE_MEMES_DESCRIPTION
				},
				{
					id = "funny_animations",
					displayName = localizationStringsModule.GENRE_FUNNY_ANIMATIONS_NAME,
					description = localizationStringsModule.GENRE_FUNNY_ANIMATIONS_DESCRIPTION
				}
			}
		},
		{
			id = "horror",
			displayName = localizationStringsModule.GENRE_HORROR_NAME,
			description = localizationStringsModule.GENRE_HORROR_DESCRIPTION,
			subgenres = {
				{
					id = "survival_horror",
					displayName = localizationStringsModule.GENRE_SURVIVAL_HORROR_NAME,
					description = localizationStringsModule.GENRE_SURVIVAL_HORROR_DESCRIPTION
				},
				{
					id = "jumpscare",
					displayName = localizationStringsModule.GENRE_JUMPSCARE_NAME,
					description = localizationStringsModule.GENRE_JUMPSCARE_DESCRIPTION
				}
			}
		},
		{
			id = "life",
			displayName = localizationStringsModule.GENRE_LIFE_NAME,
			description = localizationStringsModule.GENRE_LIFE_DESCRIPTION,
			subgenres = {
				{
					id = "roleplay",
					displayName = localizationStringsModule.GENRE_ROLEPLAY_NAME,
					description = localizationStringsModule.GENRE_ROLEPLAY_DESCRIPTION
				},
				{
					id = "avatar_sim",
					displayName = localizationStringsModule.GENRE_AVATAR_SIMULATOR_NAME,
					description = localizationStringsModule.GENRE_AVATAR_SIMULATOR_DESCRIPTION
				},
				{
					id = "social_hangout",
					displayName = localizationStringsModule.GENRE_SOCIAL_HANGOUT_NAME,
					description = localizationStringsModule.GENRE_SOCIAL_HANGOUT_DESCRIPTION
				}
			}
		},
		{
			id = "party",
			displayName = localizationStringsModule.GENRE_PARTY_NAME,
			description = localizationStringsModule.GENRE_PARTY_DESCRIPTION,
			subgenres = {
				{
					id = "minigames",
					displayName = localizationStringsModule.GENRE_MINIGAMES_NAME,
					description = localizationStringsModule.GENRE_MINIGAMES_DESCRIPTION
				},
				{
					id = "obby",
					displayName = localizationStringsModule.GENRE_OBBY_NAME,
					description = localizationStringsModule.GENRE_OBBY_DESCRIPTION
				}
			}
		},
		{
			id = "puzzle",
			displayName = localizationStringsModule.GENRE_PUZZLE_NAME,
			description = localizationStringsModule.GENRE_PUZZLE_DESCRIPTION,
			subgenres = {
				{
					id = "escape",
					displayName = localizationStringsModule.GENRE_ESCAPE_ROOM_NAME,
					description = localizationStringsModule.GENRE_ESCAPE_ROOM_DESCRIPTION
				},
				{
					id = "trivia",
					displayName = localizationStringsModule.GENRE_TRIVIA_NAME,
					description = localizationStringsModule.GENRE_TRIVIA_DESCRIPTION
				}
			}
		},
		{
			id = "rpg",
			displayName = localizationStringsModule.GENRE_RPG_NAME,
			description = localizationStringsModule.GENRE_RPG_DESCRIPTION,
			subgenres = {
				{
					id = "mmo",
					displayName = localizationStringsModule.GENRE_MMORPG_NAME,
					description = localizationStringsModule.GENRE_MMORPG_DESCRIPTION
				},
				{
					id = "action_rpg",
					displayName = localizationStringsModule.GENRE_ACTION_RPG_NAME,
					description = localizationStringsModule.GENRE_ACTION_RPG_DESCRIPTION
				},
				{
					id = "turn_based_rpg",
					displayName = localizationStringsModule.GENRE_TURN_BASED_RPG_NAME,
					description = localizationStringsModule.GENRE_TURN_BASED_RPG_DESCRIPTION
				}
			}
		},
		{
			id = "shooter",
			displayName = localizationStringsModule.GENRE_SHOOTER_NAME,
			description = localizationStringsModule.GENRE_SHOOTER_DESCRIPTION,
			subgenres = {
				{
					id = "fps",
					displayName = localizationStringsModule.GENRE_FPS_NAME,
					description = localizationStringsModule.GENRE_FPS_DESCRIPTION
				},
				{
					id = "tps",
					displayName = localizationStringsModule.GENRE_TPS_NAME,
					description = localizationStringsModule.GENRE_TPS_DESCRIPTION
				}
			}
		},
		{
			id = "simulator",
			displayName = localizationStringsModule.GENRE_SIMULATOR_NAME,
			description = localizationStringsModule.GENRE_SIMULATOR_DESCRIPTION,
			subgenres = {
				{
					id = "incremental",
					displayName = localizationStringsModule.GENRE_INCREMENTAL_NAME,
					description = localizationStringsModule.GENRE_INCREMENTAL_DESCRIPTION
				},
				{
					id = "tycoon",
					displayName = localizationStringsModule.GENRE_TYCOON_NAME,
					description = localizationStringsModule.GENRE_TYCOON_DESCRIPTION
				}
			}
		},
		{
			id = "social",
			displayName = localizationStringsModule.GENRE_SOCIAL_NAME,
			description = localizationStringsModule.GENRE_SOCIAL_DESCRIPTION,
			subgenres = {
				{
					id = "dance_club",
					displayName = localizationStringsModule.GENRE_DANCE_CLUB_NAME,
					description = localizationStringsModule.GENRE_DANCE_CLUB_DESCRIPTION
				},
				{
					id = "showcase",
					displayName = localizationStringsModule.GENRE_SHOWCASE_NAME,
					description = localizationStringsModule.GENRE_SHOWCASE_DESCRIPTION
				}
			}
		},
		{
			id = "sports",
			displayName = localizationStringsModule.GENRE_SPORTS_NAME,
			description = localizationStringsModule.GENRE_SPORTS_DESCRIPTION,
			subgenres = {
				{
					id = "racing",
					displayName = localizationStringsModule.GENRE_RACING_NAME,
					description = localizationStringsModule.GENRE_RACING_DESCRIPTION
				},
				{
					id = "team_sports",
					displayName = localizationStringsModule.GENRE_TEAM_SPORTS_NAME,
					description = localizationStringsModule.GENRE_TEAM_SPORTS_DESCRIPTION
				}
			}
		},
		{
			id = "strategy",
			displayName = localizationStringsModule.GENRE_STRATEGY_NAME,
			description = localizationStringsModule.GENRE_STRATEGY_DESCRIPTION,
			subgenres = {
				{
					id = "rts",
					displayName = localizationStringsModule.GENRE_RTS_NAME,
					description = localizationStringsModule.GENRE_RTS_DESCRIPTION
				},
				{
					id = "tower_defense",
					displayName = localizationStringsModule.GENRE_TOWER_DEFENSE_NAME,
					description = localizationStringsModule.GENRE_TOWER_DEFENSE_DESCRIPTION
				}
			}
		},
		{
			id = "survival",
			displayName = localizationStringsModule.GENRE_SURVIVAL_NAME,
			description = localizationStringsModule.GENRE_SURVIVAL_DESCRIPTION,
			subgenres = {
				{
					id = "open_world_survival",
					displayName = localizationStringsModule.GENRE_OPEN_WORLD_SURVIVAL_NAME,
					description = localizationStringsModule.GENRE_OPEN_WORLD_SURVIVAL_DESCRIPTION
				},
				{
					id = "zombie_survival",
					displayName = localizationStringsModule.GENRE_ZOMBIE_SURVIVAL_NAME,
					description = localizationStringsModule.GENRE_ZOMBIE_SURVIVAL_DESCRIPTION
				}
			}
		},
		{
			id = "utility",
			displayName = localizationStringsModule.GENRE_UTILITY_NAME,
			description = localizationStringsModule.GENRE_UTILITY_DESCRIPTION,
			subgenres = {
				{
					id = "education",
					displayName = localizationStringsModule.GENRE_EDUCATION_NAME,
					description = localizationStringsModule.GENRE_EDUCATION_DESCRIPTION
				},
				{
					id = "showroom",
					displayName = localizationStringsModule.GENRE_SHOWROOM_NAME,
					description = localizationStringsModule.GENRE_SHOWROOM_DESCRIPTION
				}
			}
		},
		{
			id = "vehicle",
			displayName = localizationStringsModule.GENRE_VEHICLE_NAME,
			description = localizationStringsModule.GENRE_VEHICLE_DESCRIPTION,
			subgenres = {
				{
					id = "driving",
					displayName = localizationStringsModule.GENRE_DRIVING_NAME,
					description = localizationStringsModule.GENRE_DRIVING_DESCRIPTION
				},
				{
					id = "flight",
					displayName = localizationStringsModule.GENRE_FLIGHT_NAME,
					description = localizationStringsModule.GENRE_FLIGHT_DESCRIPTION
				}
			}
		},
		{
			id = "na",
			displayName = localizationStringsModule.GENRE_NONE_NAME,
			description = localizationStringsModule.GENRE_NONE_DESCRIPTION,
			subgenres = {}
		}
	}
}