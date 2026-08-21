local sharedFlagsModule = require(script:FindFirstAncestor("BuildExperience").Parent.SharedFlags)
local fFlagEnableShareSheet = sharedFlagsModule.FFlagEnableShareSheet
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua
local fFlagBuildExperienceClientDataModelTools = sharedFlagsModule.FFlagBuildExperienceClientDataModelTools
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
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

if fFlagBuildExperienceClientDataModelTools then
	t.inspect_client_instance = {
		completed = "Inspected client instance",
		failed = "Couldn't inspect client instance",
		running = "Inspecting client instance"
	}
	t.search_client_datamodel = {
		completed = "Searched client DataModel",
		failed = "Couldn't search client DataModel",
		running = "Searching client DataModel"
	}
end
local function formatBuildGreeting(p0) --[[ line: 124 ]]
	return if p0 == "" then "Hi" else `Hi, {p0}`
end

local function formatShareExperience(p1) --[[ line: 128 ]]
	return `Share {p1}`
end

local function formatGameSharedWithTarget(p2) --[[ line: 132 ]]
	return if p2 == "" then "Game shared" else `Game shared with {p2}`
end

local function formatMyCreationsUniverseName(p3) --[[ line: 139 ]]
	return `Universe {p3}`
end

local function formatSubagentStatusCompletedTasks(p4) --[[ line: 143 ]]
	return `{p4} completed tasks`
end

local function formatChatTurnFailureMessage(p5, p6) --[[ line: 147 ]]
	return if p6 == nil then p5 else `({p6}) {p5}`
end

local function formatChatTaskCount(p7) --[[ line: 151 ]]
	return if p7 == 1 then "1 task completed" else `{p7} tasks completed`
end

local function formatChatWorkedDuration(p8) --[[ line: 155 ]]
	local maxValue = math.max(0, math.floor(p8 + 0.5))
	
	return if maxValue < 60 then `Worked for {maxValue}s` else `Worked for {math.floor(maxValue / 60)}m{maxValue % 60}s`
end

local function formatChatThinkingDuration(p9) --[[ line: 165 ]]
	return `Thinking for {math.max(0, math.floor(p9))}s`
end

local function formatChatFinishedTool(p10) --[[ line: 170 ]]
	return `Finished {p10}`
end

local function formatChatFailedTool(p11) --[[ line: 174 ]]
	return `Failed {p11}`
end

local function formatChatRunningTool(p12) --[[ line: 178 ]]
	return `Running {p12}`
end

local function getChatToolActivityLabel(p13, p14) --[[ line: 182 ]]
	-- upvalues: t (ref)
	local var35 = t[p13]
	
	return if var35 == nil then nil elseif p14 == "completed" then var35.completed elseif p14 == "failed" then var35.failed else var35.running
end

local function formatVersionHistoryVersionNumber(p15) --[[ line: 196 ]]
	return if p15 < 10 then `v0{p15}` else `v{p15}`
end

local function formatChatRevertConfirmationDescription(p16) --[[ line: 203 ]]
	return `Confirm to revert the latest change and go back to {if p16 < 10 then `v0{p16}` else `v{p16}`}.`
end

local function formatVersionHistoryRestoredBadge(p17) --[[ line: 207 ]]
	return `Restored {if p17 < 10 then `v0{p17}` else `v{p17}`}`
end

local function formatVersionHistoryCreatedDate(p18, p19, p20) --[[ line: 211 ]]
	return `{p18} {p19}, {p20}`
end

local function formatVersionHistoryVersionTitle(p21) --[[ line: 215 ]]
	return `Version {p21}`
end

local function formatVersionHistoryVersionLabel(p22, p23) --[[ line: 219 ]]
	return `{if p22 < 10 then `v0{p22}` else `v{p22}`} \194\183 {p23}`
end

local function formatPrivateInvitesSubtitle(p24) --[[ line: 223 ]]
	return `Choose up to {p24} friends, then share the link to the game.`
end

local function formatPrivateInvitesSent(p25, p26) --[[ line: 227 ]]
	return `{p25} of {p26} playtesters added`
end

local function formatPrivateInvitesCount(p27, p28) --[[ line: 231 ]]
	return `{p27}/{p28}`
end

local function formatUserPickerUsername(p29) --[[ line: 235 ]]
	return `@{p29}`
end

local function formatCreatorCreditPercentUsed(p30) --[[ line: 239 ]]
	local floored = math.floor(p30 + 0.5)
	
	if floored < 0 then
		floored = 0
	end
	if floored > 100 then
		floored = 100
	end
	return `{floored}% used`
end

local function formatCreatorCreditRobuxUsage(p31, p32) --[[ line: 250 ]]
	return `{p31}/{p32}`
end

local function formatCreatorCreditRobuxUsageUnlimited(p33) --[[ line: 254 ]]
	return `{p33} used`
end

local function formatCreatorCreditResetHours(value) --[[ line: 258 ]]
	return if value == 1 then "Resets in 1 hour" else `Resets in {value} hours`
end

local function formatCreatorCreditAdditionalUsed(p34, p35) --[[ line: 265 ]]
	return `{p34} of {p35} used`
end

local function formatCreatorCreditAdditionalUsedNoLimit(p36) --[[ line: 269 ]]
	return `{p36} used \226\128\162 No limit`
end

local function formatCreatorCreditLimitBelowSpend(p37) --[[ line: 273 ]]
	return `Limit can't be below the {p37} Robux already spent today.`
end

local t_1 = {
	AD_UPSELL_CARD_CREATE = "Create",
	AD_UPSELL_CARD_DESC = "Boost your game's audience",
	AD_UPSELL_CARD_TITLE = "Promote your game for free",
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
	BUILD_HEADER_TITLE = "Build",
	BUILD_SEARCH_PLACEHOLDER = "Search games",
	BUILD_SUBLINE = "What do you want to create today?",
	BUILD_MENU_AUDIENCE = "Audience",
	BUILD_MENU_BACK_TO_BUILD = "Back to Build",
	BUILD_MENU_INVITE_TO_PLAYTEST = "Add to playtest",
	BUILD_MENU_LOADING = "Loading...",
	BUILD_MENU_PLAYTEST = "Playtest",
	BUILD_MENU_PUBLISH = "Publish",
	BUILD_MENU_PUBLISH_LATEST = "Publish latest",
	CREATOR_CREDIT_BUY = "Buy",
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
	CHAT_COMPLETED_GAME_CREATION_DESCRIPTION = if fFlagEnableTeamTestLua then "I've completed creating your game and saved a new version. You can open it to playtest." else "I've completed creating and publishing your game. You can open it to playtest.",
	CHAT_COMPLETED_GAME_CREATION_TITLE = "Completed game creation",
	CHAT_COMPOSER_PLACEHOLDER = "Describe an idea",
	CHAT_COPY_TEXT = "Copy text",
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
	CHAT_REVERT_CONFIRMATION_ACTION = "Revert",
	CHAT_REVERT_CONFIRMATION_DESCRIPTION = "This version will become your latest published version.",
	CHAT_REVERT_CONFIRMATION_TITLE = "Revert last change?",
	CHAT_REVERT_FAILURE = if fFlagEnableTeamTestLua then "A reverted version wasn't created. Try again." else "Your publish wasn't reverted. Try again.",
	CHAT_REVERT_SUCCESS = if fFlagEnableTeamTestLua then "Created a reverted version." else "Reverted publish.",
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
	GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED = "Publish to expand your audience",
	GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION = "Publish your experience to make it available to this audience.",
	GAME_CONFIGURATION_AUDIENCE_UNKNOWN = "Unknown",
	GAME_CONFIGURATION_CONTENT_RATING = "Content rating",
	GAME_CONFIGURATION_CREATOR_HUB = "Creator Hub",
	GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION = "Manage all settings on Creator Hub",
	GAME_CONFIGURATION_GAME_DETAILS = "Game details",
	GAME_CONFIGURATION_GAME_DETAILS_BODY = "Manage how your game appears to others.",
	GAME_CONFIGURATION_ICON_AND_THUMBNAILS = "Icon & thumbnails",
	GAME_CONFIGURATION_LINK_COPIED = if not fFlagEnableShareSheet then "Link copied to clipboard." else nil,
	GAME_CONFIGURATION_LOADING = "Loading...",
	GAME_CONFIGURATION_PREVIEW = "Preview",
	GAME_CONFIGURATION_PUBLISH = "Publish",
	GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR = "Your account is too new to publish. Try again when it's 2 days old.",
	GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR = "Your game was published, but couldn't be made public. Try again.",
	GAME_CONFIGURATION_PUBLISH_ERROR = "Your game couldn't be published. Try again.",
	GAME_CONFIGURATION_PUBLISH_SUCCESS = "Your game is ready to play on Roblox!",
	GAME_CONFIGURATION_SHARE = "Share",
	GAME_CONFIGURATION_UPDATE_RATING = "Update rating",
	GAME_CONFIGURATION_TITLE_AND_DESCRIPTION = "Title & description",
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
	PRIVATE_INVITES_SHARE_LINK = "Share link",
	PRIVATE_INVITES_SHARE_LINK_ERROR = "Couldn't create the share link. Try again.",
	PRIVATE_INVITES_SHARE_WITH_FRIENDS = "Share with friends you added",
	PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON = "Share",
	PRIVATE_INVITES_TITLE = "Add friends to help you playtest",
	PRIVATE_INVITES_UNKNOWN_USER = "Unknown",
	PUBLISH_CONTENT_BODY = "By publishing, you agree that this content rating is accurate.",
	PUBLISH_CONTENT_MATURITY = "Content maturity",
	PUBLISH_CONTENT_TITLE = "Content",
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
	UNPUBLISHED_PLAYTEST_MODE_TOOLTIP_DESCRIPTION = "You're playtesting your latest version. Publish it when you're ready to share.",
	UNPUBLISHED_PLAYTEST_MODE_TOOLTIP_TITLE = "Your changes aren\226\128\153t live yet",
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
	formatBuildGreeting = formatBuildGreeting,
	formatChatRevertConfirmationDescription = formatChatRevertConfirmationDescription,
	formatGameSharedWithTarget = formatGameSharedWithTarget,
	formatShareExperience = formatShareExperience,
	formatChatFailedTool = formatChatFailedTool,
	formatChatFinishedTool = formatChatFinishedTool,
	formatChatRunningTool = formatChatRunningTool,
	formatChatTaskCount = formatChatTaskCount,
	formatChatThinkingDuration = formatChatThinkingDuration,
	formatChatTurnFailureMessage = formatChatTurnFailureMessage,
	formatChatWorkedDuration = formatChatWorkedDuration,
	getChatToolActivityLabel = getChatToolActivityLabel,
	formatMyCreationsUniverseName = formatMyCreationsUniverseName,
	formatPrivateInvitesCount = formatPrivateInvitesCount,
	formatPrivateInvitesSent = formatPrivateInvitesSent,
	formatPrivateInvitesSubtitle = formatPrivateInvitesSubtitle,
	formatSubagentStatusCompletedTasks = formatSubagentStatusCompletedTasks,
	formatUserPickerUsername = formatUserPickerUsername,
	formatVersionHistoryCreatedDate = formatVersionHistoryCreatedDate,
	formatVersionHistoryRestoredBadge = formatVersionHistoryRestoredBadge,
	formatVersionHistoryVersionLabel = formatVersionHistoryVersionLabel,
	formatVersionHistoryVersionNumber = formatVersionHistoryVersionNumber,
	formatVersionHistoryVersionTitle = formatVersionHistoryVersionTitle,
	formatCreatorCreditAdditionalUsed = formatCreatorCreditAdditionalUsed,
	formatCreatorCreditAdditionalUsedNoLimit = formatCreatorCreditAdditionalUsedNoLimit,
	formatCreatorCreditLimitBelowSpend = formatCreatorCreditLimitBelowSpend,
	formatCreatorCreditPercentUsed = formatCreatorCreditPercentUsed,
	formatCreatorCreditRobuxUsage = formatCreatorCreditRobuxUsage,
	formatCreatorCreditRobuxUsageUnlimited = formatCreatorCreditRobuxUsageUnlimited,
	formatCreatorCreditResetHours = formatCreatorCreditResetHours
}

if fFlagBuildLocalization then
	local t_2 = {
		ask_for_logs = {
			completed = "Feature.Build.Label.ToolLogsDone",
			failed = "Feature.Build.Label.ToolLogsFailed",
			running = "Feature.Build.Label.ToolLogsRunning"
		},
		ask_user = {
			completed = "Feature.Build.Label.ToolQuestionDone",
			failed = "Feature.Build.Label.ToolQuestionFailed",
			running = "Feature.Build.Label.ToolQuestionRunning"
		},
		execute_luau = {
			completed = "Feature.Build.Label.ToolLuauDone",
			failed = "Feature.Build.Label.ToolLuauFailed",
			running = "Feature.Build.Label.ToolLuauRunning"
		},
		generate_image = {
			completed = "Feature.Build.Label.ToolImageDone",
			failed = "Feature.Build.Label.ToolImageFailed",
			running = "Feature.Build.Label.ToolImageRunning"
		},
		generate_model = {
			completed = "Feature.Build.Label.ToolModelDone",
			failed = "Feature.Build.Label.ToolModelFailed",
			running = "Feature.Build.Label.ToolModelRunning"
		},
		generate_primitive = {
			completed = "Feature.Build.Label.ToolPrimitiveDone",
			failed = "Feature.Build.Label.ToolPrimitiveFailed",
			running = "Feature.Build.Label.ToolPrimitiveRunning"
		},
		insert_asset = {
			completed = "Feature.Build.Label.ToolAssetDone",
			failed = "Feature.Build.Label.ToolAssetFailed",
			running = "Feature.Build.Label.ToolAssetRunning"
		},
		invoke_script = {
			completed = "Feature.Build.Label.ToolScriptDone",
			failed = "Feature.Build.Label.ToolScriptFailed",
			running = "Feature.Build.Label.ToolScriptRunning"
		},
		list_skills = {
			completed = "Feature.Build.Label.ToolSkillsDone",
			failed = "Feature.Build.Label.ToolSkillsFailed",
			running = "Feature.Build.Label.ToolSkillsRunning"
		},
		load_skill = {
			completed = "Feature.Build.Label.ToolSkillLoadDone",
			failed = "Feature.Build.Label.ToolSkillLoadFailed",
			running = "Feature.Build.Label.ToolSkillLoadRunning"
		},
		manage_plan = {
			completed = "Feature.Build.Label.ToolPlanUpdateDone",
			failed = "Feature.Build.Label.ToolPlanUpdateFailed",
			running = "Feature.Build.Label.ToolPlanUpdateRunning"
		},
		manage_requirements = {
			completed = "Feature.Build.Label.ToolReqUpdateDone",
			failed = "Feature.Build.Label.ToolReqUpdateFailed",
			running = "Feature.Build.Label.ToolReqUpdateRunning"
		},
		manage_tasks = {
			completed = "Feature.Build.Label.ToolTasksPlanDone",
			failed = "Feature.Build.Label.ToolTasksPlanFailed",
			running = "Feature.Build.Label.ToolTasksPlanRunning"
		},
		present_plan = {
			completed = "Feature.Build.Label.ToolPlanPresentDone",
			failed = "Feature.Build.Label.ToolPlanPresentFailed",
			running = "Feature.Build.Label.ToolPlanPresentRunning"
		},
		save_and_publish = {
			completed = "Feature.Build.Label.ToolGameSaveDone",
			failed = "Feature.Build.Label.ToolGameSaveFailed",
			running = "Feature.Build.Label.ToolGameSaveRunning"
		},
		search_assets = {
			completed = "Feature.Build.Label.ToolAssetSearchDone",
			failed = "Feature.Build.Label.ToolAssetSearchFailed",
			running = "Feature.Build.Label.ToolAssetSearchRunning"
		},
		set_game_thumbnail = {
			completed = "Feature.Build.Label.ToolThumbnailDone",
			failed = "Feature.Build.Label.ToolThumbnailFailed",
			running = "Feature.Build.Label.ToolThumbnailRunning"
		},
		update_game_info = {
			completed = "Feature.Build.Label.ToolGameInfoDone",
			failed = "Feature.Build.Label.ToolGameInfoFailed",
			running = "Feature.Build.Label.ToolGameInfoRunning"
		}
	}
	
	if fFlagBuildExperienceClientDataModelTools then
		t_2.inspect_client_instance = {
			completed = "Feature.Build.Label.ToolInspectDone",
			failed = "Feature.Build.Label.ToolInspectFailed",
			running = "Feature.Build.Label.ToolInspectRunning"
		}
		t_2.search_client_datamodel = {
			completed = "Feature.Build.Label.ToolClientDMDone",
			failed = "Feature.Build.Label.ToolClientDMFailed",
			running = "Feature.Build.Label.ToolClientDMRunning"
		}
	end
	t_1 = {
		AD_UPSELL_CARD_CREATE = "Feature.Build.Action.Create",
		AD_UPSELL_CARD_DESC = "Feature.Build.Description.BoostGameAudience",
		AD_UPSELL_CARD_TITLE = "Feature.Build.Title.PromoteGameFree",
		AGENT_PLAN_BUILD = "Feature.Build.Action.Build",
		AGENT_PLAN_OVERVIEW = "Feature.Build.Header.Overview",
		AGENT_PLAN_VIEW = "Feature.Build.Action.View",
		ANSWER_STACK_CUSTOM_ANSWER = "Feature.Build.Header.CustomAnswer",
		ANSWER_STACK_NEXT = "Feature.Build.Action.Next",
		ANSWER_STACK_SELECT_AN_OPTION = "Feature.Build.Label.SelectOption",
		ANSWER_STACK_SUBMIT = "Feature.Build.Action.Submit",
		ARCHIVE_GAME_ARCHIVE = "Feature.Build.Action.Archive",
		ARCHIVE_GAME_CANCEL = "Feature.Build.Action.Cancel",
		ARCHIVE_GAME_DESCRIPTION = "Feature.Build.Description.ArchiveRemoval",
		ARCHIVE_GAME_TITLE = "Feature.Build.Title.ArchiveThisGame",
		BUILD_ASSISTANT_FALLBACK_NAME = "Feature.Build.Action.Build",
		BUILD_ELIGIBILITY_DIALOG_ACTION = "Feature.Build.Action.OK",
		BUILD_ELIGIBILITY_ERROR_DESCRIPTION = "Feature.Build.Message.TryAgain",
		BUILD_ELIGIBILITY_ERROR_TITLE = "Feature.Build.Title.GenericError",
		BUILD_ELIGIBILITY_INELIGIBLE_DESCRIPTION = "Feature.Build.Message.AccountRequirements",
		BUILD_ELIGIBILITY_INELIGIBLE_TITLE = "Feature.Build.Title.BuildUnavailable",
		BUILD_HEADER_TITLE = "Feature.Build.Action.Build",
		BUILD_SEARCH_PLACEHOLDER = "Feature.Build.Label.SearchGames",
		BUILD_SUBLINE = "Feature.Build.Message.WhatToCreate",
		BUILD_MENU_AUDIENCE = "Feature.Build.Title.Audience",
		BUILD_MENU_BACK_TO_BUILD = "Feature.Build.Label.BackToBuild",
		BUILD_MENU_INVITE_TO_PLAYTEST = "Feature.Build.Action.AddToPlaytest",
		BUILD_MENU_LOADING = "Feature.Build.Label.Loading",
		BUILD_MENU_PLAYTEST = "Feature.Build.Action.Playtest",
		BUILD_MENU_PUBLISH = "Feature.Build.Action.Publish",
		BUILD_MENU_PUBLISH_LATEST = "Feature.Build.Action.PublishLatest",
		CREATOR_CREDIT_BUY = "Feature.Build.Action.Buy",
		CREATOR_CREDIT_MENU_ITEM = "Feature.Build.Label.Usage",
		CREATOR_CREDIT_PAGE_TITLE = "Feature.Build.Title.BuildUsage",
		CREATOR_CREDIT_FREE_USAGE_LABEL = "Feature.Build.Label.FreeBuildUsage",
		CREATOR_CREDIT_FREE_USAGE_CAPTION = "Feature.Build.Label.ResetsDaily",
		CREATOR_CREDIT_ADDITIONAL_USAGE_LABEL = "Feature.Build.Label.GetMoreBuildUsage",
		CREATOR_CREDIT_ADDITIONAL_DAILY_USAGE_LABEL = "Feature.Build.Label.AdditionalUsage",
		CREATOR_CREDIT_AVAILABLE_SUFFIX = "Feature.Build.Label.Available",
		CREATOR_CREDIT_ADDITIONAL_USAGE_DESCRIPTION = "Feature.Build.Description.AutoBuyUsage",
		CREATOR_CREDIT_SET_DAILY_LIMIT = "Feature.Build.Action.SetDailyLimit",
		CREATOR_CREDIT_MANAGE_LIMIT = "Feature.Build.Action.ManageLimit",
		CREATOR_CREDIT_SETTINGS_SAVE_ERROR = "Feature.Build.Message.SaveChangesFailed",
		CREATOR_CREDIT_LIMIT_SHEET_TITLE = "Feature.Build.Action.SetDailyLimit",
		CREATOR_CREDIT_LIMIT_SHEET_CONFIRM = "Feature.Build.Action.SetLimit",
		CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT = "Feature.Build.Label.NoLimit",
		CREATOR_CREDIT_BUY_ROBUX_BUTTON = "Feature.Build.Action.BuyRobux",
		CREATOR_CREDIT_BUY_MORE_ROBUX_TITLE = "Feature.Build.Title.NoRobuxForUsage",
		CREATOR_CREDIT_BUY_MORE_ROBUX_DESCRIPTION = "Feature.Build.Description.BuyRobuxToCreate",
		CREATOR_CREDIT_FREE_TRIAL_EXHAUSTED_TITLE = "Feature.Build.Title.FreeUsageReached",
		CREATOR_CREDIT_FREE_TRIAL_EXHAUSTED_DESCRIPTION = "Feature.Build.Description.BuyUsageOrWait",
		CREATOR_CREDIT_DAILY_LIMIT_REACHED_TITLE = "Feature.Build.Title.DailyRobuxReached",
		CREATOR_CREDIT_DAILY_LIMIT_REACHED_DESCRIPTION = "Feature.Build.Description.RaiseLimitOrWait",
		CREATOR_CREDIT_ADJUST_LIMIT_BUTTON = "Feature.Build.Action.ManageLimit",
		CREATOR_CREDIT_VIEW_USAGE_BUTTON = "Feature.Build.Action.ViewUsage",
		CREATOR_CREDIT_NOT_NOW_BUTTON = "Feature.Build.Action.NotNow",
		CREATOR_CREDIT_BUY_ROBUX_SHEET_TITLE = "Feature.Build.Action.BuyRobux",
		CREATOR_CREDIT_BUY_ROBUX_SHEET_CONFIRM = "Feature.Build.Action.Buy",
		BUILD_MENU_SETTINGS = "Feature.Build.Action.Settings",
		BUILD_MENU_SHARE = "Feature.Build.Action.Share",
		BUILD_MENU_VERSION_HISTORY = "Feature.Build.Title.VersionHistory",
		CHAT_ASSIGNING_TASKS = "Feature.Build.Message.WorkingOnTasks",
		CHAT_ASSISTANT_DISABLED = "Feature.Build.Title.ChatBuildUnavailable",
		CHAT_ASSISTANT_LOADING = "Feature.Build.Label.Thinking",
		CHAT_ASSISTANT_RESPONSE_FAILED = "Feature.Build.Message.BuildResponseFailed",
		CHAT_ASSISTANT_STILL_WORKING = "Feature.Build.Message.BuildStillWorking",
		CHAT_ASSISTANT_STOPPED = "Feature.Build.Message.BuildStopped",
		CHAT_BUILD_CHAT_PAGE_TITLE = "New Game",
		CHAT_COMPLETED_GAME_CREATION_DESCRIPTION = if fFlagEnableTeamTestLua then "Feature.Build.Description.GameSavedPlaytest" else "Feature.Build.Description.GameCreationDone",
		CHAT_COMPLETED_GAME_CREATION_TITLE = "Feature.Build.Title.GameCreationDone",
		CHAT_COMPOSER_PLACEHOLDER = "Feature.Build.Label.DescribeIdea",
		CHAT_COPY_TEXT = "Feature.Build.Action.CopyText",
		CHAT_CREATE_UNIVERSE_ERROR = "Feature.Build.Message.GameNotCreated",
		CHAT_DEFAULT_FAILURE = "Feature.Build.Message.BuildConnectFailed",
		CHAT_ERROR_CONFLICT = "Feature.Build.Message.BuildBusy",
		CHAT_ERROR_FORBIDDEN = "Feature.Build.Message.BuildAccountBlocked",
		CHAT_ERROR_GONE = "Feature.Build.Message.ConversationGone",
		CHAT_ERROR_INTERNAL = "Feature.Build.Message.BuildInternalError",
		CHAT_ERROR_INVALID_PARAMS = "Feature.Build.Message.InvalidMessage",
		CHAT_ERROR_NOT_FOUND = "Feature.Build.Message.ConversationNotFound",
		CHAT_ERROR_OUT_OF_CREDITS = "Feature.Build.Message.OutOfBuildUsage",
		CHAT_ERROR_UNAUTHORIZED = "Feature.Build.Message.SignedOut",
		CHAT_ERROR_UPSTREAM_UNAVAILABLE = "Feature.Build.Message.BuildTemporarilyDown",
		CHAT_MISSING_PROJECT = "Feature.Build.Message.CreateGameToUseBuild",
		CHAT_NOTIFICATION_DISABLED_DESCRIPTION = "Feature.Build.Description.EnableBuildNotifs",
		CHAT_NOTIFICATION_PROMPT_DESCRIPTION = "Feature.Build.Description.BuildReplyNotif",
		CHAT_NOTIFICATION_PROMPT_TITLE = "Feature.Build.Title.PushNotifications",
		CHAT_NOT_NOW = "Feature.Build.Action.NotNow",
		CHAT_NOTIFY_ME = "Feature.Build.Action.NotifyMe",
		CHAT_OPEN_SETTINGS = "Feature.Build.Action.OpenSettings",
		CHAT_PLAYTEST = "Feature.Build.Action.Playtest",
		CHAT_POLICY_REJECTION = "Feature.Build.Message.SafetyPolicy",
		CHAT_PORTRAIT_REQUIRED = "Feature.Build.Message.TurnToPortrait",
		CHAT_QUESTION_COMPOSER_ANSWER = "Feature.Build.Message.AnswerBuildQuestion",
		CHAT_QUESTION_MULTIPLE = "Feature.Build.Title.BuildQuestions",
		CHAT_QUESTION_SINGLE = "Feature.Build.Title.BuildQuestion",
		CHAT_REVERT_CONFIRMATION_ACTION = "Feature.Build.Action.Revert",
		CHAT_REVERT_CONFIRMATION_DESCRIPTION = "Feature.Build.Description.RestoreLatest",
		CHAT_REVERT_CONFIRMATION_TITLE = "Feature.Build.Title.RevertLastChange",
		CHAT_REVERT_FAILURE = if fFlagEnableTeamTestLua then "Feature.Build.Message.RevertVersionFail" else "Feature.Build.Message.PublishNotReverted",
		CHAT_REVERT_SUCCESS = if fFlagEnableTeamTestLua then "Feature.Build.Message.CreatedRevertedVer" else "Feature.Build.Message.PublishReverted",
		CHAT_TOOL = "Feature.Build.Label.Tool",
		CHAT_TOOL_FAILED = "Feature.Build.Message.FailedTitle",
		CHAT_TOOL_FINISHED = "Feature.Build.Message.FinishedTitle",
		CHAT_TOOL_RUNNING = "Feature.Build.Message.RunningTitle",
		CHAT_TURN_ACTIVITY = "Feature.Build.Title.TurnActivity",
		CHAT_UPDATE_WITH_CHANGES = "Feature.Build.Action.UpdateWithChanges",
		GAME_CONFIGURATION_ACCESS = "Feature.Build.Label.Access",
		GAME_CONFIGURATION_ACCESS_AND_SHARING = "Feature.Build.Header.AccessSharing",
		GAME_CONFIGURATION_ACCESS_BODY = "Feature.Build.Description.PlayAfterPublish",
		GAME_CONFIGURATION_ARCHIVE_GAME = "Feature.Build.Action.ArchiveGame",
		GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER = "Feature.Build.Message.QuestionnaireNeeded",
		GAME_CONFIGURATION_AUDIENCE = "Feature.Build.Title.Audience",
		GAME_CONFIGURATION_AUDIENCE_BANNER = "Feature.Build.Message.ExpandAudience",
		GAME_CONFIGURATION_AUDIENCE_BODY = "Feature.Build.Description.PlayAfterPublish",
		GAME_CONFIGURATION_AUDIENCE_FRIENDS = "Feature.Build.Label.Friends",
		GAME_CONFIGURATION_AUDIENCE_FRIENDS_ONLY = "Feature.Build.Label.FriendsOnly",
		GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE = "Feature.Build.Message.AudienceIneligible",
		GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION = "Feature.Build.Message.ExpandAudience",
		GAME_CONFIGURATION_AUDIENCE_PAGE_TITLE = "Feature.Build.Title.ExperienceAudience",
		GAME_CONFIGURATION_AUDIENCE_PRIVATE = "Feature.Build.Label.Private",
		GAME_CONFIGURATION_AUDIENCE_PUBLIC = "Feature.Build.Label.Public",
		GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED = "Feature.Build.Message.PublishExpandAudience",
		GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION = "Feature.Build.Description.MakeAudienceAvail",
		GAME_CONFIGURATION_AUDIENCE_UNKNOWN = "Feature.Build.Label.Unknown",
		GAME_CONFIGURATION_CONTENT_RATING = "Feature.Build.Label.ContentRating",
		GAME_CONFIGURATION_CREATOR_HUB = "Feature.Build.Label.CreatorHub",
		GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION = "Feature.Build.Description.HubSettings",
		GAME_CONFIGURATION_GAME_DETAILS = "Feature.Build.Header.GameDetails",
		GAME_CONFIGURATION_GAME_DETAILS_BODY = "Feature.Build.Description.ManageAppearance",
		GAME_CONFIGURATION_ICON_AND_THUMBNAILS = "Feature.Build.Label.IconThumbnails",
		GAME_CONFIGURATION_LINK_COPIED = if not fFlagEnableShareSheet then "Feature.Build.Message.LinkCopied" else nil,
		GAME_CONFIGURATION_LOADING = "Feature.Build.Label.Loading",
		GAME_CONFIGURATION_PREVIEW = "Feature.Build.Action.Preview",
		GAME_CONFIGURATION_PUBLISH = "Feature.Build.Action.Publish",
		GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR = "Feature.Build.Message.AccountTooNew",
		GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR = "Feature.Build.Message.PublicPublishFailed",
		GAME_CONFIGURATION_PUBLISH_ERROR = "Feature.Build.Message.GamePublishFailed",
		GAME_CONFIGURATION_PUBLISH_SUCCESS = "Feature.Build.Message.ReadyToPlay",
		GAME_CONFIGURATION_SHARE = "Feature.Build.Action.Share",
		GAME_CONFIGURATION_UPDATE_RATING = "Feature.Build.Action.UpdateRating",
		GAME_CONFIGURATION_TITLE_AND_DESCRIPTION = "Feature.Build.Label.TitleDescription",
		MEDIA_SELECTION_CAPTURE_LIBRARY = "Feature.Build.Label.CaptureLibrary",
		MEDIA_SELECTION_DELETE = "Feature.Build.Action.Delete",
		MEDIA_SELECTION_TITLE = "Feature.Build.Label.IconThumbnails",
		MEDIA_SELECTION_VIDEO = "Feature.Build.Label.Video",
		MY_CREATIONS_BUILD_WITH_AI = "Feature.Build.Description.BuildIdeaGame",
		MY_CREATIONS_BUILDING = "Feature.Build.Label.Building",
		MY_CREATIONS_INPUT_NEEDED = "Feature.Build.Label.InputNeeded",
		MY_CREATIONS_LOAD_ERROR = "Feature.Build.Message.ExperiencesLoadFailed",
		MY_CREATIONS_NEW_GAME = "Feature.Build.Content.NewGame",
		MY_CREATIONS_PRIVATE = "Feature.Build.Label.Private",
		MY_CREATIONS_PUBLIC = "Feature.Build.Label.Public",
		MY_CREATIONS_PUBLICLY_UNAVAILABLE = "Feature.Build.Label.PubliclyUnavailable",
		MY_CREATIONS_READY = "Feature.Build.Label.Ready",
		MY_CREATIONS_RESTRICTED = "Feature.Build.Label.Limited",
		PLAYTEST_DISABLED_TOOLTIP = "Feature.Build.Description.PlaytestLocked",
		PLAYTEST_TITLE = "Feature.Build.Action.Playtest",
		PRIVATE_INVITES_ADD_PLAYTESTER = "Feature.Build.Action.AddPlaytester",
		PRIVATE_INVITES_ADD_PLAYTESTERS = "Feature.Build.Action.AddPlaytesters",
		PRIVATE_INVITES_ALL_FRIENDS_ADDED = "Feature.Build.Message.AllFriendsAdded",
		PRIVATE_INVITES_FRIENDS_LOAD_ERROR = "Feature.Build.Message.FriendsLoadFailed",
		PRIVATE_INVITES_INVITE_BUTTON = "Feature.Build.Action.AddFriends",
		PRIVATE_INVITES_NO_FRIENDS = "Feature.Build.Message.NoFriendsToAdd",
		PRIVATE_INVITES_PAGE_TITLE = "Feature.Build.Title.Playtesters",
		PRIVATE_INVITES_ROW_DESCRIPTION = "Feature.Build.Description.ChoosePlaytesters",
		PRIVATE_INVITES_ROW_LOAD_ERROR = "Feature.Build.Message.InvitesLoadFailed",
		PRIVATE_INVITES_ROW_TITLE = "Feature.Build.Title.Playtesters",
		PRIVATE_INVITES_ROW_TITLE_EMPTY = "Feature.Build.Action.AddToPlaytest",
		PRIVATE_INVITES_SEARCH_PLACEHOLDER = "Feature.Build.Label.Search",
		PRIVATE_INVITES_SHARE_LINK = "Feature.Build.Action.ShareLink",
		PRIVATE_INVITES_SHARE_LINK_ERROR = "Feature.Build.Message.ShareLinkFailed",
		PRIVATE_INVITES_SHARE_WITH_FRIENDS = "Feature.Build.Label.ShareAddedFriends",
		PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON = "Feature.Build.Action.Share",
		PRIVATE_INVITES_TITLE = "Feature.Build.Title.AddFriendsToPlaytest",
		PRIVATE_INVITES_UNKNOWN_USER = "Feature.Build.Label.Unknown",
		PUBLISH_CONTENT_BODY = "Feature.Build.Description.RatingAgreement",
		PUBLISH_CONTENT_MATURITY = "Feature.Build.Header.ContentMaturity",
		PUBLISH_CONTENT_TITLE = "Feature.Build.Title.Content",
		PUBLISH_VERSION_INFORMATION_BODY = "Feature.Build.Description.VersionChanges",
		PUBLISH_VERSION_INFORMATION_TITLE = "Feature.Build.Title.VersionInformation",
		PUBLISH_VERSION_TITLE_DESCRIPTION = "Feature.Build.Label.VersionTitleDesc",
		SHARE_AUDIENCE_CANCEL = "Feature.Build.Action.Cancel",
		SHARE_AUDIENCE_FRIENDS_ONLY_DESCRIPTION = "Feature.Build.Description.FriendsLinkOnly",
		SHARE_AUDIENCE_FRIENDS_ONLY_TITLE = "Feature.Build.Title.FriendsOnlyPlay",
		SHARE_AUDIENCE_PLAYTESTERS_ONLY_DESCRIPTION = "Feature.Build.Description.PlaytesterAccess",
		SHARE_AUDIENCE_PLAYTESTERS_ONLY_TITLE = "Feature.Build.Title.PlaytestersOnlyPlay",
		SHARE_AUDIENCE_PRIVATE_DESCRIPTION = "Feature.Build.Description.PrivateShare",
		SHARE_AUDIENCE_PRIVATE_TITLE = "Feature.Build.Title.GamePrivate",
		SHARE_AUDIENCE_SHARE = "Feature.Build.Action.Share",
		SUBAGENT_STATUS_AGENTS = "Feature.Build.Title.Tasks",
		SUBAGENT_STATUS_ALL = "Feature.Build.Label.All",
		SUBAGENT_STATUS_BUILDING = "Feature.Build.Label.Building",
		SUBAGENT_STATUS_DELETED = "Feature.Build.Label.Deleted",
		SUBAGENT_STATUS_DONE = "Feature.Build.Label.Done",
		SUBAGENT_STATUS_ERROR = "Feature.Build.Label.Error",
		SUBAGENT_STATUS_IN_PROGRESS = "Feature.Build.Label.InProgress",
		SUBAGENT_STATUS_NOT_STARTED = "Feature.Build.Label.NotStarted",
		SUBAGENT_STATUS_PENDING = "Feature.Build.Label.Pending",
		SUBAGENT_STATUS_SEARCH_TASKS = "Feature.Build.Label.SearchTasks",
		SUBAGENT_STATUS_VERSION = "Feature.Build.Label.Version",
		TITLE_DESCRIPTION_DESCRIPTION_LABEL = "Feature.Build.Label.Description",
		TITLE_DESCRIPTION_TITLE_LABEL = "Feature.Build.Label.Title",
		TITLE_DESCRIPTION_TITLE = "Feature.Build.Label.TitleDescription",
		UNPUBLISHED_PLAYTEST_MODE_TOOLTIP_DESCRIPTION = "Feature.Build.Description.PlaytestLatest",
		UNPUBLISHED_PLAYTEST_MODE_TOOLTIP_TITLE = "Feature.Build.Title.ChangesNotLive",
		USER_PICKER_NO_RESULTS = "Feature.Build.Message.NoResults",
		VERSION_HISTORY_AUTOSAVED = "Feature.Build.Label.Autosaved",
		VERSION_HISTORY_CANCEL = "Feature.Build.Action.Cancel",
		VERSION_HISTORY_EMPTY = "Feature.Build.Message.NoVersionHistory",
		VERSION_HISTORY_FALLBACK_DESCRIPTION = "Feature.Build.Message.NoDescriptionProvided",
		VERSION_HISTORY_HIDE_AUTOSAVED = "Feature.Build.Action.HideAutosaved",
		VERSION_HISTORY_LOAD_FAILED = "Feature.Build.Message.VersionHistoryLoad",
		VERSION_HISTORY_LOADING = "Feature.Build.Message.LoadingVersions",
		VERSION_HISTORY_PREVIOUSLY_PUBLISHED = "Feature.Build.Label.PreviouslyPublished",
		VERSION_HISTORY_PUBLISHED = "Feature.Build.Label.Published",
		VERSION_HISTORY_RESTORE = "Feature.Build.Action.Restore",
		VERSION_HISTORY_RESTORE_FAILED = "Feature.Build.Message.RestoreVersionFailed",
		VERSION_HISTORY_TITLE = "Feature.Build.Title.VersionHistory",
		formatBuildGreeting = formatBuildGreeting,
		formatChatRevertConfirmationDescription = formatChatRevertConfirmationDescription,
		formatGameSharedWithTarget = formatGameSharedWithTarget,
		formatShareExperience = formatShareExperience,
		formatChatFailedTool = formatChatFailedTool,
		formatChatFinishedTool = formatChatFinishedTool,
		formatChatRunningTool = formatChatRunningTool,
		formatChatTaskCount = formatChatTaskCount,
		formatChatThinkingDuration = formatChatThinkingDuration,
		formatChatTurnFailureMessage = formatChatTurnFailureMessage,
		formatChatWorkedDuration = formatChatWorkedDuration,
		getChatToolActivityLabel = getChatToolActivityLabel,
		getChatToolActivityLocalizationKey = function(p38, p39) --[[ line: 670 ]]
			-- upvalues: t_2 (ref)
			if p38 == nil then
				return nil
			end
			local var37 = t_2[p38]
			
			return if var37 == nil then nil elseif p39 == "completed" then var37.completed elseif p39 == "failed" then var37.failed else var37.running
		end,
		formatMyCreationsUniverseName = formatMyCreationsUniverseName,
		formatPrivateInvitesCount = formatPrivateInvitesCount,
		formatPrivateInvitesSent = formatPrivateInvitesSent,
		formatPrivateInvitesSubtitle = formatPrivateInvitesSubtitle,
		formatSubagentStatusCompletedTasks = formatSubagentStatusCompletedTasks,
		formatUserPickerUsername = formatUserPickerUsername,
		formatVersionHistoryCreatedDate = formatVersionHistoryCreatedDate,
		formatVersionHistoryRestoredBadge = formatVersionHistoryRestoredBadge,
		formatVersionHistoryVersionLabel = formatVersionHistoryVersionLabel,
		formatVersionHistoryVersionNumber = formatVersionHistoryVersionNumber,
		formatVersionHistoryVersionTitle = formatVersionHistoryVersionTitle,
		formatCreatorCreditAdditionalUsed = formatCreatorCreditAdditionalUsed,
		formatCreatorCreditAdditionalUsedNoLimit = formatCreatorCreditAdditionalUsedNoLimit,
		formatCreatorCreditLimitBelowSpend = formatCreatorCreditLimitBelowSpend,
		formatCreatorCreditPercentUsed = formatCreatorCreditPercentUsed,
		formatCreatorCreditRobuxUsage = formatCreatorCreditRobuxUsage,
		formatCreatorCreditRobuxUsageUnlimited = formatCreatorCreditRobuxUsageUnlimited,
		formatCreatorCreditResetHours = formatCreatorCreditResetHours
	}
end
return t_1