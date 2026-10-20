return {
	version = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.ExperienceGenre).ExperienceGenreStoreTypes.DEFAULT_TAXONOMY_VERSION,
	genres = {
		{
			id = "action",
			displayName = "Action",
			description = "Combat, shooting, brawling, and action-oriented gameplay.",
			subgenres = {
				{
					id = "battle_royale",
					displayName = "Battle Royale",
					description = "Last-player-standing matches."
				},
				{
					id = "fighting",
					displayName = "Fighting",
					description = "One-on-one or team combat."
				},
				{
					id = "shooter",
					displayName = "Shooter",
					description = "First- or third-person shooting."
				}
			}
		},
		{
			id = "adventure",
			displayName = "Adventure",
			description = "Exploration-driven gameplay with narrative or world goals.",
			subgenres = {
				{
					id = "exploration",
					displayName = "Exploration",
					description = "Discover worlds and lore."
				},
				{
					id = "story",
					displayName = "Story",
					description = "Narrative-driven adventures."
				},
				{
					id = "scavenger_hunt",
					displayName = "Scavenger Hunt",
					description = "Find-and-collect quests."
				}
			}
		},
		{
			id = "comedy",
			displayName = "Comedy",
			description = "Humour-first experiences and party games.",
			subgenres = {
				{
					id = "memes",
					displayName = "Memes",
					description = "Memetic, parodic content."
				},
				{
					id = "funny_animations",
					displayName = "Funny Animations",
					description = "Animation showcases."
				}
			}
		},
		{
			id = "horror",
			displayName = "Horror",
			description = "Scary, suspenseful, or thriller content.",
			subgenres = {
				{
					id = "survival_horror",
					displayName = "Survival Horror",
					description = "Escape monsters or threats."
				},
				{
					id = "jumpscare",
					displayName = "Jumpscare",
					description = "Reactive scare-driven gameplay."
				}
			}
		},
		{
			id = "life",
			displayName = "Life",
			description = "Roleplay, avatar simulation, and slice-of-life experiences.",
			subgenres = {
				{
					id = "roleplay",
					displayName = "Roleplay",
					description = "Player-driven roleplay scenarios."
				},
				{
					id = "avatar_sim",
					displayName = "Avatar Simulator",
					description = "Avatar customisation and showcases."
				},
				{
					id = "social_hangout",
					displayName = "Social Hangout",
					description = "Chat and hangout spaces."
				}
			}
		},
		{
			id = "party",
			displayName = "Party",
			description = "Minigames and casual social play.",
			subgenres = {
				{
					id = "minigames",
					displayName = "Minigames",
					description = "Collections of quick-play games."
				},
				{
					id = "obby",
					displayName = "Obby",
					description = "Obstacle courses and parkour."
				}
			}
		},
		{
			id = "puzzle",
			displayName = "Puzzle",
			description = "Logic, escape-room, and puzzle-solving gameplay.",
			subgenres = {
				{
					id = "escape",
					displayName = "Escape Room",
					description = "Locked-room puzzles."
				},
				{
					id = "trivia",
					displayName = "Trivia",
					description = "Quiz-style questions."
				}
			}
		},
		{
			id = "rpg",
			displayName = "RPG",
			description = "Character progression, classes, and stats.",
			subgenres = {
				{
					id = "mmo",
					displayName = "MMORPG",
					description = "Massively multiplayer RPGs."
				},
				{
					id = "action_rpg",
					displayName = "Action RPG",
					description = "Real-time combat RPGs."
				},
				{
					id = "turn_based_rpg",
					displayName = "Turn-Based RPG",
					description = "Strategic, turn-taking combat."
				}
			}
		},
		{
			id = "shooter",
			displayName = "Shooter",
			description = "Dedicated shooting-mechanic experiences.",
			subgenres = {
				{
					id = "fps",
					displayName = "FPS",
					description = "First-person shooting."
				},
				{
					id = "tps",
					displayName = "Third-Person Shooter",
					description = "Third-person shooting."
				}
			}
		},
		{
			id = "simulator",
			displayName = "Simulator",
			description = "Progression and collection-driven simulators.",
			subgenres = {
				{
					id = "incremental",
					displayName = "Incremental",
					description = "Tap-and-grow gameplay."
				},
				{
					id = "tycoon",
					displayName = "Tycoon",
					description = "Build-and-manage tycoons."
				}
			}
		},
		{
			id = "social",
			displayName = "Social",
			description = "Hangouts, dancing, and social-focused experiences.",
			subgenres = {
				{
					id = "dance_club",
					displayName = "Dance Club",
					description = "Dance and music venues."
				},
				{
					id = "showcase",
					displayName = "Showcase",
					description = "Showcase or gallery worlds."
				}
			}
		},
		{
			id = "sports",
			displayName = "Sports & Racing",
			description = "Sports, racing, and athletics.",
			subgenres = {
				{
					id = "racing",
					displayName = "Racing",
					description = "Vehicle or foot races."
				},
				{
					id = "team_sports",
					displayName = "Team Sports",
					description = "Football, basketball, etc."
				}
			}
		},
		{
			id = "strategy",
			displayName = "Strategy",
			description = "Real-time and turn-based strategy games.",
			subgenres = {
				{
					id = "rts",
					displayName = "RTS",
					description = "Real-time strategy."
				},
				{
					id = "tower_defense",
					displayName = "Tower Defense",
					description = "Defend against waves."
				}
			}
		},
		{
			id = "survival",
			displayName = "Survival",
			description = "Resource management and survival gameplay.",
			subgenres = {
				{
					id = "open_world_survival",
					displayName = "Open World Survival",
					description = "Sandbox survival."
				},
				{
					id = "zombie_survival",
					displayName = "Zombie Survival",
					description = "Survive waves of enemies."
				}
			}
		},
		{
			id = "utility",
			displayName = "Utility",
			description = "Non-game experiences (showrooms, education).",
			subgenres = {
				{
					id = "education",
					displayName = "Education",
					description = "Learning-focused experiences."
				},
				{
					id = "showroom",
					displayName = "Showroom",
					description = "Brand or product showcases."
				}
			}
		},
		{
			id = "vehicle",
			displayName = "Vehicle Sim",
			description = "Vehicle-centric simulation gameplay.",
			subgenres = {
				{
					id = "driving",
					displayName = "Driving",
					description = "Open-world driving sims."
				},
				{
					id = "flight",
					displayName = "Flight",
					description = "Aircraft simulators."
				}
			}
		},
		{
			id = "na",
			displayName = "None",
			description = "No genre selected.",
			subgenres = {}
		}
	}
}