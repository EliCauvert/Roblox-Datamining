local t = {
	ask_for_logs = {
		completed = "Requested logs",
		failed = "Couldn't request logs",
		running = "Requesting logs"
	},
	ask_user = {
		completed = "Asked a question",
		failed = "Couldn't ask a question",
		running = "Asking a question"
	},
	execute_luau = {
		completed = "Executed Luau",
		failed = "Couldn't execute Luau",
		running = "Executing Luau"
	},
	generate_image = {
		completed = "Generated image",
		failed = "Couldn't generate image",
		running = "Generating image"
	},
	generate_model = {
		completed = "Generated 3D model",
		failed = "Couldn't generate 3D model",
		running = "Generating 3D model"
	},
	generate_primitive = {
		completed = "Generated primitive shape",
		failed = "Couldn't generate primitive shape",
		running = "Generating primitive shape"
	},
	insert_asset = {
		completed = "Inserted asset",
		failed = "Couldn't insert asset",
		running = "Inserting asset"
	},
	invoke_script = {
		completed = "Ran script",
		failed = "Couldn't run script",
		running = "Running script"
	},
	list_skills = {
		completed = "Listed available skills",
		failed = "Couldn't list available skills",
		running = "Listing available skills"
	},
	load_skill = {
		completed = "Loaded skill",
		failed = "Couldn't load skill",
		running = "Loading skill"
	},
	manage_plan = {
		completed = "Updated plan",
		failed = "Couldn't update plan",
		running = "Updating plan"
	},
	manage_requirements = {
		completed = "Updated requirements",
		failed = "Couldn't update requirements",
		running = "Updating requirements"
	},
	manage_tasks = {
		completed = "Tasks planned",
		failed = "Couldn't plan tasks",
		running = "Planning your tasks"
	},
	present_plan = {
		completed = "Presented plan",
		failed = "Couldn't present plan",
		running = "Presenting plan"
	},
	save_and_publish = {
		completed = "Saved game",
		failed = "Couldn't save game",
		running = "Saving game"
	},
	search_assets = {
		completed = "Searched asset library",
		failed = "Couldn't search asset library",
		running = "Searching asset library"
	},
	set_game_thumbnail = {
		completed = "Set game thumbnail",
		failed = "Couldn't set game thumbnail",
		running = "Setting game thumbnail"
	},
	update_game_info = {
		completed = "Updated game info",
		failed = "Couldn't update game info",
		running = "Updating game info"
	}
}

return {
	AGENT_PLAN_BUILD = "Build",
	AGENT_PLAN_OVERVIEW = "Overview",
	AGENT_PLAN_VIEW = "View",
	ANSWER_STACK_CUSTOM_ANSWER = "Custom answer",
	ANSWER_STACK_NEXT = "Next",
	ANSWER_STACK_SELECT_AN_OPTION = "Select an option",
	ANSWER_STACK_SUBMIT = "Submit",
	ARCHIVE_GAME_ARCHIVE = "Archive",
	ARCHIVE_GAME_CANCEL = "Cancel",
	ARCHIVE_GAME_DESCRIPTION = "If you archive this game, it will be removed from Build. You can still access and restore it from Creator Hub or Roblox Studio.",
	ARCHIVE_GAME_TITLE = "Archive this game?",
	BUILD_ASSISTANT_FALLBACK_NAME = "Build",
	BUILD_ELIGIBILITY_DIALOG_ACTION = "OK",
	BUILD_ELIGIBILITY_ERROR_DESCRIPTION = "Try again.",
	BUILD_ELIGIBILITY_ERROR_TITLE = "Something went wrong",
	BUILD_ELIGIBILITY_INELIGIBLE_DESCRIPTION = "Your account doesn't meet the requirements to use Build.",
	BUILD_ELIGIBILITY_INELIGIBLE_TITLE = "Build isn't available",
	BUILD_GREETING = "Hi",
	BUILD_HEADER_TITLE = "Build",
	BUILD_SEARCH_PLACEHOLDER = "Search games",
	BUILD_SUBLINE = "What do you want to create today?",
	BUILD_MENU_AGENTS = "Tasks",
	BUILD_MENU_AUDIENCE = "Audience",
	BUILD_MENU_BACK_TO_BUILD = "Back to Build",
	BUILD_MENU_INVITE_TO_PLAYTEST = "Add to playtest",
	BUILD_MENU_LOADING = "Loading...",
	BUILD_MENU_PLAYTEST = "Playtest",
	BUILD_MENU_PUBLISH = "Publish",
	BUILD_MENU_PUBLISH_LATEST = "Publish latest",
	CREATOR_CREDIT_BUY = "Buy",
	CREATOR_CREDIT_DAILY_CAPTION = "Build usage resets daily",
	CREATOR_CREDIT_DAILY_LABEL = "Daily Build usage",
	CREATOR_CREDIT_EXTRA_DESCRIPTION = "Additional Build usage starts after your free daily usage runs out.",
	CREATOR_CREDIT_EXTRA_LABEL = "Additional Build usage",
	CREATOR_CREDIT_INSUFFICIENT_FUNDS = "You need more Build usage to continue.",
	CREATOR_CREDIT_LOADING = "Loading Build usage\226\128\166",
	CREATOR_CREDIT_MENU_ITEM = "Usage",
	CREATOR_CREDIT_PAGE_TITLE = "Build usage",
	CREATOR_CREDIT_FREE_USAGE_LABEL = "Free Build usage",
	CREATOR_CREDIT_FREE_USAGE_CAPTION = "Resets daily",
	CREATOR_CREDIT_ADDITIONAL_USAGE_LABEL = "Get more Build usage",
	CREATOR_CREDIT_ADDITIONAL_DAILY_USAGE_LABEL = "Additional Build usage",
	CREATOR_CREDIT_AVAILABLE_SUFFIX = "available",
	CREATOR_CREDIT_ADDITIONAL_USAGE_DESCRIPTION = "Use your Robux to automatically buy additional Build usage as you create. You can set a daily spend limit anytime.",
	CREATOR_CREDIT_SET_DAILY_LIMIT = "Set a daily limit",
	CREATOR_CREDIT_MANAGE_LIMIT = "Manage limit",
	CREATOR_CREDIT_SETTINGS_SAVE_ERROR = "Couldn't save changes. Try again.",
	CREATOR_CREDIT_LIMIT_SHEET_TITLE = "Set a daily limit",
	CREATOR_CREDIT_LIMIT_SHEET_CONFIRM = "Set limit",
	CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT = "No limit",
	CREATOR_CREDIT_BUY_ROBUX_BUTTON = "Buy Robux",
	CREATOR_CREDIT_BUY_MORE_ROBUX_TITLE = "No Robux left for Build usage",
	CREATOR_CREDIT_BUY_MORE_ROBUX_DESCRIPTION = "Buy more Robux to keep creating, or wait for your free Build usage to reset tomorrow.",
	CREATOR_CREDIT_FREE_TRIAL_EXHAUSTED_TITLE = "Free Build usage limit reached",
	CREATOR_CREDIT_FREE_TRIAL_EXHAUSTED_DESCRIPTION = "Buy more Build usage with Robux, or wait for your daily limit to reset.",
	CREATOR_CREDIT_DAILY_LIMIT_REACHED_TITLE = "Daily Robux limit reached",
	CREATOR_CREDIT_DAILY_LIMIT_REACHED_DESCRIPTION = "Increase your daily Robux limit to keep creating, or wait for it to reset tomorrow.",
	CREATOR_CREDIT_ADJUST_LIMIT_BUTTON = "Manage limit",
	CREATOR_CREDIT_VIEW_USAGE_BUTTON = "View usage",
	CREATOR_CREDIT_NOT_NOW_BUTTON = "Not now",
	CREATOR_CREDIT_BUY_ROBUX_SHEET_TITLE = "Buy Robux",
	CREATOR_CREDIT_BUY_ROBUX_SHEET_CONFIRM = "Buy",
	BUILD_MENU_SETTINGS = "Settings",
	BUILD_MENU_SHARE = "Share",
	BUILD_MENU_VERSION_HISTORY = "Version history",
	CHAT_ASSIGNING_TASKS = "Working on your tasks",
	CHAT_ASSISTANT_DISABLED = "Build unavailable.",
	CHAT_ASSISTANT_LOADING = "Thinking",
	CHAT_ASSISTANT_RESPONSE_FAILED = "Build couldn't respond. Try again.",
	CHAT_ASSISTANT_STILL_WORKING = "Working on it. You can leave the app, play Roblox, or start another project while you wait.",
	CHAT_ASSISTANT_STOPPED = "You stopped Build.",
	CHAT_BUILD_CHAT_PAGE_TITLE = "New Game",
	CHAT_COMPLETED_GAME_CREATION_DESCRIPTION = "I've completed creating and publishing your game. You can open it to playtest.",
	CHAT_COMPLETED_GAME_CREATION_TITLE = "Completed game creation",
	CHAT_COMPOSER_PLACEHOLDER = "Describe an idea",
	CHAT_CREATE_UNIVERSE_ERROR = "Your game wasn't created. Try again.",
	CHAT_DEFAULT_FAILURE = "Build couldn't connect. Try again.",
	CHAT_ERROR_CONFLICT = "Build is busy. Wait a minute and try again.",
	CHAT_ERROR_FORBIDDEN = "Build isn't available for your account right now.",
	CHAT_ERROR_GONE = "This conversation is no longer available. Start a new one.",
	CHAT_ERROR_INTERNAL = "Build ran into a problem. Try again.",
	CHAT_ERROR_INVALID_PARAMS = "Something went wrong with your message. Edit it and try again.",
	CHAT_ERROR_NOT_FOUND = "This conversation couldn't be found. Start a new one.",
	CHAT_ERROR_OUT_OF_CREDITS = "You're out of Build usage. View your options to use Robux to keep creating.",
	CHAT_ERROR_UNAUTHORIZED = "You're signed out. Sign in and try again.",
	CHAT_ERROR_UPSTREAM_UNAVAILABLE = "Build is temporarily unavailable. Try again in a minute.",
	CHAT_MISSING_PROJECT = "Create a new game to start using Build.",
	CHAT_NOTIFICATION_DISABLED_DESCRIPTION = "Turn on notifications in your device settings to get updates from Build.",
	CHAT_NOTIFICATION_PROMPT_DESCRIPTION = "Get notified when Build has a reply for you.",
	CHAT_NOTIFICATION_PROMPT_TITLE = "Push notifications",
	CHAT_NOT_NOW = "Not now",
	CHAT_NOTIFY_ME = "Notify me",
	CHAT_OPEN_SETTINGS = "Open settings",
	CHAT_PLAYTEST = "Playtest",
	CHAT_POLICY_REJECTION = "This message goes against our safety policy. Edit it and try again.",
	CHAT_PORTRAIT_REQUIRED = "Turn your device to portrait mode to continue working on your game.",
	CHAT_QUESTION_COMPOSER_ANSWER = "Answer Build's question below.",
	CHAT_QUESTION_MULTIPLE = "Build has some questions",
	CHAT_QUESTION_SINGLE = "Build has a question",
	CHAT_REVERT_CONFIRMATION_DESCRIPTION = "This version will become your latest published version.",
	CHAT_REVERT_FAILURE = "Your publish wasn't reverted. Try again.",
	CHAT_REVERT_SUCCESS = "Reverted publish.",
	CHAT_TOOL = "tool",
	CHAT_TURN_ACTIVITY = "Turn activity",
	CHAT_UPDATE_WITH_CHANGES = "Update with changes",
	GAME_CONFIGURATION_ACCESS = "Access",
	GAME_CONFIGURATION_ACCESS_AND_SHARING = "Access & sharing",
	GAME_CONFIGURATION_ACCESS_BODY = "Choose who can play after you publish this experience.",
	GAME_CONFIGURATION_ARCHIVE_GAME = "Archive game",
	GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER = "This game was edited outside of Build. Complete the content questionnaire to publish.",
	GAME_CONFIGURATION_AUDIENCE = "Audience",
	GAME_CONFIGURATION_AUDIENCE_BANNER = "Expand your audience eligibility on Creator Hub",
	GAME_CONFIGURATION_AUDIENCE_BODY = "Choose who can play after you publish this experience.",
	GAME_CONFIGURATION_AUDIENCE_FRIENDS = "Friends",
	GAME_CONFIGURATION_AUDIENCE_FRIENDS_ONLY = "Friends only",
	GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE = "Not eligible for this audience",
	GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION = "Expand your audience eligibility on Creator Hub",
	GAME_CONFIGURATION_AUDIENCE_PAGE_TITLE = "Experience audience",
	GAME_CONFIGURATION_AUDIENCE_PRIVATE = "Private",
	GAME_CONFIGURATION_AUDIENCE_PUBLIC = "Public",
	GAME_CONFIGURATION_AUDIENCE_UNKNOWN = "Unknown",
	GAME_CONFIGURATION_CONTENT_RATING = "Content rating",
	GAME_CONFIGURATION_CREATOR_HUB = "Creator Hub",
	GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION = "Manage all settings on Creator Hub",
	GAME_CONFIGURATION_GAME_DETAILS = "Game details",
	GAME_CONFIGURATION_GAME_DETAILS_BODY = "Manage how your game appears to others.",
	GAME_CONFIGURATION_ICON_AND_THUMBNAILS = "Icon & thumbnails",
	GAME_CONFIGURATION_LINK_COPIED = if not require(script:FindFirstAncestor("BuildExperience").Parent.SharedFlags).FFlagEnableShareSheet then "Link copied to clipboard." else nil,
	GAME_CONFIGURATION_LOADING = "Loading...",
	GAME_CONFIGURATION_PREVIEW = "Preview",
	GAME_CONFIGURATION_PUBLISH = "Publish",
	GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR = "Your game was published, but couldn't be made public. Try again.",
	GAME_CONFIGURATION_PUBLISH_ERROR = "Your game couldn't be published. Try again.",
	GAME_CONFIGURATION_PUBLISH_SUCCESS = "Your game is ready to play on Roblox!",
	GAME_CONFIGURATION_SHARE = "Share",
	GAME_CONFIGURATION_UPDATE_RATING = "Update rating",
	GAME_CONFIGURATION_TITLE_AND_DESCRIPTION = "Title & description",
	GENRE_ACTION_NAME = "Action",
	GENRE_ACTION_DESCRIPTION = "Combat, shooting, brawling, and action-oriented gameplay.",
	GENRE_BATTLE_ROYALE_NAME = "Battle Royale",
	GENRE_BATTLE_ROYALE_DESCRIPTION = "Last-player-standing matches.",
	GENRE_FIGHTING_NAME = "Fighting",
	GENRE_FIGHTING_DESCRIPTION = "One-on-one or team combat.",
	GENRE_ACTION_SHOOTER_NAME = "Shooter",
	GENRE_ACTION_SHOOTER_DESCRIPTION = "First- or third-person shooting.",
	GENRE_ADVENTURE_NAME = "Adventure",
	GENRE_ADVENTURE_DESCRIPTION = "Exploration-driven gameplay with narrative or world goals.",
	GENRE_EXPLORATION_NAME = "Exploration",
	GENRE_EXPLORATION_DESCRIPTION = "Discover worlds and lore.",
	GENRE_STORY_NAME = "Story",
	GENRE_STORY_DESCRIPTION = "Narrative-driven adventures.",
	GENRE_SCAVENGER_HUNT_NAME = "Scavenger Hunt",
	GENRE_SCAVENGER_HUNT_DESCRIPTION = "Find-and-collect quests.",
	GENRE_COMEDY_NAME = "Comedy",
	GENRE_COMEDY_DESCRIPTION = "Humour-first experiences and party games.",
	GENRE_MEMES_NAME = "Memes",
	GENRE_MEMES_DESCRIPTION = "Memetic, parodic content.",
	GENRE_FUNNY_ANIMATIONS_NAME = "Funny Animations",
	GENRE_FUNNY_ANIMATIONS_DESCRIPTION = "Animation showcases.",
	GENRE_HORROR_NAME = "Horror",
	GENRE_HORROR_DESCRIPTION = "Scary, suspenseful, or thriller content.",
	GENRE_SURVIVAL_HORROR_NAME = "Survival Horror",
	GENRE_SURVIVAL_HORROR_DESCRIPTION = "Escape monsters or threats.",
	GENRE_JUMPSCARE_NAME = "Jumpscare",
	GENRE_JUMPSCARE_DESCRIPTION = "Reactive scare-driven gameplay.",
	GENRE_LIFE_NAME = "Life",
	GENRE_LIFE_DESCRIPTION = "Roleplay, avatar simulation, and slice-of-life experiences.",
	GENRE_ROLEPLAY_NAME = "Roleplay",
	GENRE_ROLEPLAY_DESCRIPTION = "Player-driven roleplay scenarios.",
	GENRE_AVATAR_SIMULATOR_NAME = "Avatar Simulator",
	GENRE_AVATAR_SIMULATOR_DESCRIPTION = "Avatar customisation and showcases.",
	GENRE_SOCIAL_HANGOUT_NAME = "Social Hangout",
	GENRE_SOCIAL_HANGOUT_DESCRIPTION = "Chat and hangout spaces.",
	GENRE_PARTY_NAME = "Party",
	GENRE_PARTY_DESCRIPTION = "Minigames and casual social play.",
	GENRE_MINIGAMES_NAME = "Minigames",
	GENRE_MINIGAMES_DESCRIPTION = "Collections of quick-play games.",
	GENRE_OBBY_NAME = "Obby",
	GENRE_OBBY_DESCRIPTION = "Obstacle courses and parkour.",
	GENRE_PUZZLE_NAME = "Puzzle",
	GENRE_PUZZLE_DESCRIPTION = "Logic, escape-room, and puzzle-solving gameplay.",
	GENRE_ESCAPE_ROOM_NAME = "Escape Room",
	GENRE_ESCAPE_ROOM_DESCRIPTION = "Locked-room puzzles.",
	GENRE_TRIVIA_NAME = "Trivia",
	GENRE_TRIVIA_DESCRIPTION = "Quiz-style questions.",
	GENRE_RPG_NAME = "RPG",
	GENRE_RPG_DESCRIPTION = "Character progression, classes, and stats.",
	GENRE_MMORPG_NAME = "MMORPG",
	GENRE_MMORPG_DESCRIPTION = "Massively multiplayer RPGs.",
	GENRE_ACTION_RPG_NAME = "Action RPG",
	GENRE_ACTION_RPG_DESCRIPTION = "Real-time combat RPGs.",
	GENRE_TURN_BASED_RPG_NAME = "Turn-Based RPG",
	GENRE_TURN_BASED_RPG_DESCRIPTION = "Strategic, turn-taking combat.",
	GENRE_SHOOTER_NAME = "Shooter",
	GENRE_SHOOTER_DESCRIPTION = "Dedicated shooting-mechanic experiences.",
	GENRE_FPS_NAME = "FPS",
	GENRE_FPS_DESCRIPTION = "First-person shooting.",
	GENRE_TPS_NAME = "Third-Person Shooter",
	GENRE_TPS_DESCRIPTION = "Third-person shooting.",
	GENRE_SIMULATOR_NAME = "Simulator",
	GENRE_SIMULATOR_DESCRIPTION = "Progression and collection-driven simulators.",
	GENRE_INCREMENTAL_NAME = "Incremental",
	GENRE_INCREMENTAL_DESCRIPTION = "Tap-and-grow gameplay.",
	GENRE_TYCOON_NAME = "Tycoon",
	GENRE_TYCOON_DESCRIPTION = "Build-and-manage tycoons.",
	GENRE_SOCIAL_NAME = "Social",
	GENRE_SOCIAL_DESCRIPTION = "Hangouts, dancing, and social-focused experiences.",
	GENRE_DANCE_CLUB_NAME = "Dance Club",
	GENRE_DANCE_CLUB_DESCRIPTION = "Dance and music venues.",
	GENRE_SHOWCASE_NAME = "Showcase",
	GENRE_SHOWCASE_DESCRIPTION = "Showcase or gallery worlds.",
	GENRE_SPORTS_NAME = "Sports & Racing",
	GENRE_SPORTS_DESCRIPTION = "Sports, racing, and athletics.",
	GENRE_RACING_NAME = "Racing",
	GENRE_RACING_DESCRIPTION = "Vehicle or foot races.",
	GENRE_TEAM_SPORTS_NAME = "Team Sports",
	GENRE_TEAM_SPORTS_DESCRIPTION = "Football, basketball, etc.",
	GENRE_STRATEGY_NAME = "Strategy",
	GENRE_STRATEGY_DESCRIPTION = "Real-time and turn-based strategy games.",
	GENRE_RTS_NAME = "RTS",
	GENRE_RTS_DESCRIPTION = "Real-time strategy.",
	GENRE_TOWER_DEFENSE_NAME = "Tower Defense",
	GENRE_TOWER_DEFENSE_DESCRIPTION = "Defend against waves.",
	GENRE_SURVIVAL_NAME = "Survival",
	GENRE_SURVIVAL_DESCRIPTION = "Resource management and survival gameplay.",
	GENRE_OPEN_WORLD_SURVIVAL_NAME = "Open World Survival",
	GENRE_OPEN_WORLD_SURVIVAL_DESCRIPTION = "Sandbox survival.",
	GENRE_ZOMBIE_SURVIVAL_NAME = "Zombie Survival",
	GENRE_ZOMBIE_SURVIVAL_DESCRIPTION = "Survive waves of enemies.",
	GENRE_UTILITY_NAME = "Utility",
	GENRE_UTILITY_DESCRIPTION = "Non-game experiences (showrooms, education).",
	GENRE_EDUCATION_NAME = "Education",
	GENRE_EDUCATION_DESCRIPTION = "Learning-focused experiences.",
	GENRE_SHOWROOM_NAME = "Showroom",
	GENRE_SHOWROOM_DESCRIPTION = "Brand or product showcases.",
	GENRE_VEHICLE_NAME = "Vehicle Sim",
	GENRE_VEHICLE_DESCRIPTION = "Vehicle-centric simulation gameplay.",
	GENRE_DRIVING_NAME = "Driving",
	GENRE_DRIVING_DESCRIPTION = "Open-world driving sims.",
	GENRE_FLIGHT_NAME = "Flight",
	GENRE_FLIGHT_DESCRIPTION = "Aircraft simulators.",
	GENRE_NONE_NAME = "None",
	GENRE_NONE_DESCRIPTION = "No genre selected.",
	MEDIA_SELECTION_CAPTURE_LIBRARY = "Capture library",
	MEDIA_SELECTION_DELETE = "Delete",
	MEDIA_SELECTION_TITLE = "Icon & thumbnails",
	MEDIA_SELECTION_VIDEO = "Video",
	MY_CREATIONS_BUILD_WITH_AI = "Turn your ideas into a game",
	MY_CREATIONS_BUILDING = "Building...",
	MY_CREATIONS_INPUT_NEEDED = "Input needed",
	MY_CREATIONS_LOAD_ERROR = "Couldn't load experiences",
	MY_CREATIONS_NEW_GAME = "New game",
	MY_CREATIONS_PRIVATE = "Private",
	MY_CREATIONS_PUBLIC = "Public",
	MY_CREATIONS_PUBLICLY_UNAVAILABLE = "Publicly unavailable",
	MY_CREATIONS_READY = "Ready",
	MY_CREATIONS_RESTRICTED = "Limited",
	PLAYTEST_DISABLED_TOOLTIP = "You can start playtesting after you create your first game.",
	PLAYTEST_TITLE = "Playtest",
	PRIVATE_INVITES_ADD_PLAYTESTER = "Add playtester",
	PRIVATE_INVITES_ADD_PLAYTESTERS = "Add playtesters",
	PRIVATE_INVITES_ALL_FRIENDS_ADDED = "You've added all your friends as playtesters.",
	PRIVATE_INVITES_FRIENDS_LOAD_ERROR = "Couldn't load friends. Try again.",
	PRIVATE_INVITES_INVITE_BUTTON = "Add friends",
	PRIVATE_INVITES_NO_FRIENDS = "You don't have any friends to add yet. Find people to connect with on Roblox first.",
	PRIVATE_INVITES_PAGE_TITLE = "Playtesters",
	PRIVATE_INVITES_ROW_DESCRIPTION = "Choose friends to help you playtest.",
	PRIVATE_INVITES_ROW_LOAD_ERROR = "Couldn't load invites",
	PRIVATE_INVITES_ROW_TITLE = "Playtesters",
	PRIVATE_INVITES_ROW_TITLE_EMPTY = "Add to playtest",
	PRIVATE_INVITES_SEARCH_PLACEHOLDER = "Search",
	PRIVATE_INVITES_SEND = "Send invites separately",
	PRIVATE_INVITES_SHARE_LINK = "Share link",
	PRIVATE_INVITES_SHARE_LINK_ERROR = "Couldn't create the share link. Try again.",
	PRIVATE_INVITES_SHARE_WITH_FRIENDS = "Share with friends you added",
	PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON = "Share",
	PRIVATE_INVITES_TITLE = "Add friends to help you playtest",
	PRIVATE_INVITES_UNKNOWN_USER = "Unknown",
	PUBLISH_CONTENT_BODY = "By publishing, you agree that this content rating is accurate.",
	PUBLISH_CONTENT_MATURITY = "Content maturity",
	PUBLISH_CONTENT_TITLE = "Content",
	PUBLISH_GAME_SHEET_CAPTION = "Who can play your game depends on our account verification criteria.",
	PUBLISH_GAME_SHEET_PUBLISH = "Publish",
	PUBLISH_GAME_SHEET_TITLE = "Configure game",
	PUBLISH_VERSION_INFORMATION_BODY = "Tell players what's changed in this version.",
	PUBLISH_VERSION_INFORMATION_TITLE = "Version Information",
	PUBLISH_VERSION_TITLE_DESCRIPTION = "Version title & description",
	SHARE_AUDIENCE_CANCEL = "Cancel",
	SHARE_AUDIENCE_FRIENDS_ONLY_DESCRIPTION = "Only your friends can access this link. Change your game's Audience setting if you want more people to play.",
	SHARE_AUDIENCE_FRIENDS_ONLY_TITLE = "Only friends can play",
	SHARE_AUDIENCE_PLAYTESTERS_ONLY_DESCRIPTION = "Add friends as playtesters or change your game's Audience setting to let more people play.",
	SHARE_AUDIENCE_PLAYTESTERS_ONLY_TITLE = "Only playtesters can play",
	SHARE_AUDIENCE_PRIVATE_DESCRIPTION = "Change your game's Audience setting to share it.",
	SHARE_AUDIENCE_PRIVATE_TITLE = "This game is private",
	SHARE_AUDIENCE_SHARE = "Share",
	SUBAGENT_STATUS_AGENTS = "Tasks",
	SUBAGENT_STATUS_ALL = "All",
	SUBAGENT_STATUS_BUILDING = "Building...",
	SUBAGENT_STATUS_DELETED = "Deleted",
	SUBAGENT_STATUS_DONE = "Done",
	SUBAGENT_STATUS_ERROR = "Error",
	SUBAGENT_STATUS_IN_PROGRESS = "In progress",
	SUBAGENT_STATUS_NOT_STARTED = "Not started",
	SUBAGENT_STATUS_PENDING = "Pending",
	SUBAGENT_STATUS_SEARCH_TASKS = "Search tasks",
	SUBAGENT_STATUS_VERSION = "Version",
	TITLE_DESCRIPTION_DESCRIPTION_LABEL = "Description",
	TITLE_DESCRIPTION_TITLE_LABEL = "Title",
	TITLE_DESCRIPTION_TITLE = "Title & description",
	USER_PICKER_NO_RESULTS = "No results",
	VERSION_HISTORY_AUTOSAVED = "Autosaved",
	VERSION_HISTORY_CANCEL = "Cancel",
	VERSION_HISTORY_EMPTY = "No version history yet.",
	VERSION_HISTORY_FALLBACK_DESCRIPTION = "No description provided.",
	VERSION_HISTORY_HIDE_AUTOSAVED = "Hide autosaved",
	VERSION_HISTORY_LOAD_FAILED = "Version history couldn't load.",
	VERSION_HISTORY_LOADING = "Loading version history...",
	VERSION_HISTORY_PREVIOUSLY_PUBLISHED = "Previously published",
	VERSION_HISTORY_PUBLISHED = "Published",
	VERSION_HISTORY_RESTORE = "Restore",
	VERSION_HISTORY_RESTORE_FAILED = "Couldn't restore this version. Try again.",
	VERSION_HISTORY_TITLE = "Version history",
	formatBuildGreeting = function(p0) --[[ line: 107 ]]
		return if p0 == "" then "Hi" else `Hi, {p0}`
	end,
	formatGameSharedWithTarget = function(p1) --[[ line: 115 ]]
		return if p1 == "" then "Game shared" else `Game shared with {p1}`
	end,
	formatShareExperience = function(p2) --[[ line: 111 ]]
		return `Share {p2}`
	end,
	formatChatFailedTool = function(p3) --[[ line: 157 ]]
		return `Failed {p3}`
	end,
	formatChatFinishedTool = function(p4) --[[ line: 153 ]]
		return `Finished {p4}`
	end,
	formatChatRunningTool = function(p5) --[[ line: 161 ]]
		return `Running {p5}`
	end,
	formatChatTaskCount = function(p6) --[[ line: 134 ]]
		return if p6 == 1 then "1 task completed" else `{p6} tasks completed`
	end,
	formatChatThinkingDuration = function(p7) --[[ line: 148 ]]
		return `Thinking for {math.max(0, math.floor(p7))}s`
	end,
	formatChatTurnFailureMessage = function(p8, p9) --[[ line: 130 ]]
		return if p9 == nil then p8 else `({p9}) {p8}`
	end,
	formatChatWorkedDuration = function(p10) --[[ line: 138 ]]
		local maxValue = math.max(0, math.floor(p10 + 0.5))
		
		return if maxValue < 60 then `Worked for {maxValue}s` else `Worked for {math.floor(maxValue / 60)}m{maxValue % 60}s`
	end,
	getChatToolActivityLabel = function(p11, p12) --[[ line: 165 ]]
		-- upvalues: t (ref)
		local var2 = t[p11]
		
		return if var2 == nil then nil elseif p12 == "completed" then var2.completed elseif p12 == "failed" then var2.failed else var2.running
	end,
	formatMyCreationsUniverseName = function(p13) --[[ line: 122 ]]
		return `Universe {p13}`
	end,
	formatPrivateInvitesCount = function(p14, p15) --[[ line: 210 ]]
		return `{p14}/{p15}`
	end,
	formatPrivateInvitesSent = function(p16, p17) --[[ line: 206 ]]
		return `{p16} of {p17} playtesters added`
	end,
	formatPrivateInvitesSubtitle = function(p18) --[[ line: 202 ]]
		return `Choose up to {p18} friends, then share the link to the game.`
	end,
	formatSubagentStatusCompletedTasks = function(p19) --[[ line: 126 ]]
		return `{p19} completed tasks`
	end,
	formatUserPickerUsername = function(p20) --[[ line: 214 ]]
		return `@{p20}`
	end,
	formatVersionHistoryCreatedDate = function(p21, p22, p23) --[[ line: 190 ]]
		return `{p21} {p22}, {p23}`
	end,
	formatVersionHistoryRestoredBadge = function(p24) --[[ line: 186 ]]
		return `Restored {if p24 < 10 then `v0{p24}` else `v{p24}`}`
	end,
	formatVersionHistoryVersionLabel = function(p25, p26) --[[ line: 198 ]]
		return `{if p25 < 10 then `v0{p25}` else `v{p25}`} \194\183 {p26}`
	end,
	formatVersionHistoryVersionNumber = function(p27) --[[ line: 179 ]]
		return if p27 < 10 then `v0{p27}` else `v{p27}`
	end,
	formatVersionHistoryVersionTitle = function(p28) --[[ line: 194 ]]
		return `Version {p28}`
	end,
	formatCreatorCreditAdditionalUsed = function(p29, p30) --[[ line: 248 ]]
		return `{p29} of {p30} used`
	end,
	formatCreatorCreditAdditionalUsedNoLimit = function(p31) --[[ line: 252 ]]
		return `{p31} used \226\128\162 No limit`
	end,
	formatCreatorCreditLimitBelowSpend = function(p32) --[[ line: 256 ]]
		return `Limit can't be below the {p32} Robux already spent today.`
	end,
	formatCreatorCreditPercentUsed = function(p33) --[[ line: 222 ]]
		local floored = math.floor(p33 + 0.5)
		
		if floored < 0 then
			floored = 0
		end
		if floored > 100 then
			floored = 100
		end
		return `{floored}% used`
	end,
	formatCreatorCreditRobuxUsage = function(p34, p35) --[[ line: 233 ]]
		return `{p34}/{p35}`
	end,
	formatCreatorCreditRobuxUsageUnlimited = function(p36) --[[ line: 237 ]]
		return `{p36} used`
	end,
	formatCreatorCreditResetHours = function(value) --[[ line: 241 ]]
		return if value == 1 then "Resets in 1 hour" else `Resets in {value} hours`
	end,
	formatCreatorCreditUsageTrailing = function(p37, p38) --[[ line: 218 ]]
		return `{p37} of {p38}`
	end
}