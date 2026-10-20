local GeneratedStringsModule = require(script.Parent.GeneratedStrings)
local config = {
	Keys = {
		BY = "BY",
		RECOMMENDED_GAMES = "RECOMMENDED_GAMES",
		PLAYING = "PLAYING",
		VISITS = "VISITS",
		CREATED = "CREATED",
		UPDATED = "UPDATED",
		MAX_PLAYERS = "MAX_PLAYERS",
		GENRE = "GENRE",
		ALLOWED_GEAR = "ALLOWED_GEAR",
		REPORT_ABUSE = "REPORT_ABUSE",
		COPYLOCKED = "COPYLOCKED",
		DETAILS = "DETAILS",
		VIP_SERVERS = "VIP_SERVERS",
		GAME_BADGES = "GAME_BADGES",
		PASSES_FOR_THIS_GAME = "PASSES_FOR_THIS_GAME",
		GEAR_FOR_THIS_GAME = "GEAR_FOR_THIS_GAME",
		PLAYERS = "PLAYERS",
		CLANS = "CLANS",
		SERVERS_MY_FRIENDS_ARE_IN = "SERVERS_MY_FRIENDS_ARE_IN",
		OTHER_SERVERS = "OTHER_SERVERS",
		ABOUT = "ABOUT",
		STORE = "STORE",
		LEADERBOARDS = "LEADERBOARDS",
		SERVERS = "SERVERS",
		SEARCH = "SEARCH",
		TURN_ON_CHAT = "TURN_ON_CHAT",
		PRIVACY_SETTINGS = "PRIVACY_SETTINGS",
		CANCEL = "CANCEL",
		CONFIRM = "CONFIRM",
		SEARCH_GAMES = "SEARCH_GAMES",
		SEARCH_FOR_FRIENDS = "SEARCH_FOR_FRIENDS",
		SEARCH_FOR_FRIENDS_AND_CHAT = "SEARCH_FOR_FRIENDS_AND_CHAT",
		NO_RESULTS_FOUND = "NO_RESULTS_FOUND",
		SEE_MORE_FRIENDS = "SEE_MORE_FRIENDS",
		SEE_LESS_FRIENDS = "SEE_LESS_FRIENDS",
		NO_NETWORK_CONNECTION = "NO_NETWORK_CONNECTION",
		SHARE_GAME_TO_CHAT = "SHARE_GAME_TO_CHAT",
		MAKE_FRIENDS_TO_CHAT = "MAKE_FRIENDS_TO_CHAT",
		THIS_MESSAGE_WAS_MODERATED = "THIS_MESSAGE_WAS_MODERATED",
		FILTERED_FOR_RECEIVERS = "FILTERED_FOR_RECEIVERS",
		CHAT_GROUP_NAME = "CHAT_GROUP_NAME",
		NOTIFICATIONS = "NOTIFICATIONS",
		ADD_FRIENDS = "ADD_FRIENDS",
		LEAVE_GROUP = "LEAVE_GROUP",
		LEAVE_GROUP_MESSAGE = "LEAVE_GROUP_MESSAGE",
		STAY = "STAY",
		LEAVE = "LEAVE",
		REMOVE_USER = "REMOVE_USER",
		REMOVE_USER_CONFIRMATION_MESSAGE = "REMOVE_USER_CONFIRMATION_MESSAGE",
		REMOVE = "REMOVE",
		NOT_SET = "NOT_SET",
		CHAT = "CHAT",
		CHAT_DETAILS = "CHAT_DETAILS",
		NEW_CHAT_GROUP = "NEW_CHAT_GROUP",
		CHAT_INPUT_PLACEHOLDER = "CHAT_INPUT_PLACEHOLDER",
		OPTION = "OPTION",
		VIEW_PROFILE = "VIEW_PROFILE",
		REPORT_USER = "REPORT_USER",
		REMOVE_FROM_GROUP = "REMOVE_FROM_GROUP",
		GENERAL = "GENERAL",
		MEMBERS = "MEMBERS",
		FAILED_TO_RENAME_TITLE = "FAILED_TO_RENAME_TITLE",
		FAILED_TO_RENAME_MESSAGE = "FAILED_TO_RENAME_MESSAGE",
		GROUP_NAME_MODERATED = "GROUP_NAME_MODERATED",
		FAILED_TO_LEAVE_GROUP = "FAILED_TO_LEAVE_GROUP",
		FAILED_TO_LEAVE_GROUP_MESSAGE = "FAILED_TO_LEAVE_GROUP_MESSAGE",
		FAILED_TO_REMOVE_USER = "FAILED_TO_REMOVE_USER",
		FAILED_TO_REMOVE_USER_MESSAGE = "FAILED_TO_REMOVE_USER_MESSAGE",
		TOO_MANY_PEOPLE = "TOO_MANY_PEOPLE",
		REMOVED_FROM_CONVERSATION = "REMOVED_FROM_CONVERSATION",
		NAME_THIS_CHAT_GROUP = "NAME_THIS_CHAT_GROUP",
		SAVE = "SAVE",
		SAVE_NEW_GROUP = "SAVE_NEW_GROUP",
		SAVE_ADDED_FRIENDS = "SAVE_ADDED_FRIENDS",
		SEND = "SEND",
		SENT = "SENT",
		OFFLINE = "OFFLINE",
		ONLINE = "ONLINE",
		BY_BUILDER = "BY_BUILDER",
		VIEW_ASSET_DETAILS = "VIEW_ASSET_DETAILS",
		PLAY_GAME = "PLAY_GAME",
		MY_FEED = "MY_FEED",
		FRIENDS_COUNT = "FRIENDS_COUNT",
		SEE_ALL = "SEE_ALL",
		GAMES = "GAMES",
		HOME = "HOME",
		CATALOG = "CATALOG",
		AVATAR = "AVATAR",
		FRIENDS = "FRIENDS",
		MORE = "MORE",
		CURRENT_PLAYERS = "CURRENT_PLAYERS"
	},
	Languages = {
		EN_US = "en-us",
		AR = "ar",
		ZH_CN = "zh-CN",
		ZH_TW = "zh-TW",
		CS = "cs",
		DA = "da",
		NL = "nl",
		EN_GB = "en-GB",
		FI = "fi",
		FR_CA = "fr-CA",
		ES = "es",
		ES_XL = "es-XL",
		SV = "sv",
		TH = "th",
		TR = "tr",
		VI = "vi"
	}
}
config.DefaultLanguage = config.Languages.EN_US
config.Content = {
	{
		comment = "The preposition after the game title to introduce the game creator.",
		key = config.Keys.BY,
		values = { [config.Languages.EN_US] = "By" }
	},
	{
		comment = "Recommended Games section header for the About Tab on the game details page.",
		key = config.Keys.RECOMMENDED_GAMES,
		values = { [config.Languages.EN_US] = "Recommended Games" }
	},
	{
		comment = "Notification that a game is locked.",
		key = config.Keys.COPYLOCKED,
		values = { [config.Languages.EN_US] = "This place is copylocked" }
	},
	{
		comment = "Clickable text to report a game details page for bad content.",
		key = config.Keys.REPORT_ABUSE,
		values = { [config.Languages.EN_US] = "Report Abuse" }
	},
	{
		comment = "Label for the number of players playing a game.",
		key = config.Keys.PLAYING,
		values = { [config.Languages.EN_US] = "Playing" }
	},
	{
		comment = "Label for the number of players that are currently playing a game.",
		key = config.Keys.CURRENT_PLAYERS,
		values = {
			[config.Languages.EN_US] = "{NUMBER_OF_CURRENT_PLAYERS} Playing"
		}
	},
	{
		comment = "Label for the number of visits a game has.",
		key = config.Keys.VISITS,
		values = { [config.Languages.EN_US] = "Visits" }
	},
	{
		comment = "Label for the creation date of a game.",
		key = config.Keys.CREATED,
		values = { [config.Languages.EN_US] = "Created" }
	},
	{
		comment = "Label for the date of the last update to a game.",
		key = config.Keys.UPDATED,
		values = { [config.Languages.EN_US] = "Updated" }
	},
	{
		comment = "Label for the maximum number of players in a game.",
		key = config.Keys.MAX_PLAYERS,
		values = { [config.Languages.EN_US] = "Max Players" }
	},
	{
		comment = "Label for the game genre.",
		key = config.Keys.GENRE,
		values = { [config.Languages.EN_US] = "Genre" }
	},
	{
		comment = "Label for the allowed gear for a game.",
		key = config.Keys.ALLOWED_GEAR,
		values = { [config.Languages.EN_US] = "Allowed Gear" }
	},
	{
		comment = "The other servers section header in the servers tab on the game details page.",
		key = config.Keys.OTHER_SERVERS,
		values = { [config.Languages.EN_US] = "Other Servers" }
	},
	{
		comment = "The servers my friends are in section in the servers tab on the game details page.",
		key = config.Keys.SERVERS_MY_FRIENDS_ARE_IN,
		values = { [config.Languages.EN_US] = "Servers my friends are in" }
	},
	{
		comment = "The group leaderboard header in the leaderboards tab on the game details page.",
		key = config.Keys.CLANS,
		values = { [config.Languages.EN_US] = "Clans" }
	},
	{
		comment = "The players section header in the leaderboards tab on the game details page.",
		key = config.Keys.PLAYERS,
		values = { [config.Languages.EN_US] = "Players" }
	},
	{
		comment = "The gear section header in the store tab on the game details page.",
		key = config.Keys.GEAR_FOR_THIS_GAME,
		values = { [config.Languages.EN_US] = "Gear for this game" }
	},
	{
		comment = "The passes section header in the store tab on the game details page.",
		key = config.Keys.PASSES_FOR_THIS_GAME,
		values = { [config.Languages.EN_US] = "Passes for this game" }
	},
	{
		comment = "The game badges section header on the game details page.",
		key = config.Keys.GAME_BADGES,
		values = { [config.Languages.EN_US] = "Game Badges" }
	},
	{
		comment = "The VIP servers section header in the about and servers tabs on the game details page.",
		key = config.Keys.VIP_SERVERS,
		values = { [config.Languages.EN_US] = "VIP Servers" }
	},
	{
		comment = "The game details section header on the game details page.",
		key = config.Keys.DETAILS,
		values = { [config.Languages.EN_US] = "Details" }
	},
	{
		comment = "The About tab's text on the game details page.",
		key = config.Keys.ABOUT,
		values = { [config.Languages.EN_US] = "About" }
	},
	{
		comment = "The Store tab's text on the game details page.",
		key = config.Keys.STORE,
		values = { [config.Languages.EN_US] = "Store" }
	},
	{
		comment = "The Leaderboards tab's text on the game details page.",
		key = config.Keys.LEADERBOARDS,
		values = { [config.Languages.EN_US] = "Leaderboards" }
	},
	{
		comment = "The Servers tab's text on the game details page.",
		key = config.Keys.SERVERS,
		values = { [config.Languages.EN_US] = "Servers" }
	},
	{
		comment = "Placeholder text for most search input text boxes. Explains the functionality of the text box.",
		key = config.Keys.SEARCH,
		values = { [config.Languages.EN_US] = "Search" }
	},
	{
		comment = "Explains how to enable chat.",
		key = config.Keys.TURN_ON_CHAT,
		values = {
			[config.Languages.EN_US] = "To chat with friends, turn on chat in your Privacy Settings."
		}
	},
	{
		comment = "Label for button that opens the user's privacy settings.",
		key = config.Keys.PRIVACY_SETTINGS,
		values = { [config.Languages.EN_US] = "Privacy Settings" }
	},
	{
		comment = "Used for buttons that cancel an action.",
		key = config.Keys.CANCEL,
		values = { [config.Languages.EN_US] = "Cancel" }
	},
	{
		comment = "Used for buttons that confirm an action or dismiss an informational pop-up.",
		key = config.Keys.CONFIRM,
		values = { [config.Languages.EN_US] = "Okay" }
	},
	{
		comment = "Placeholder text when searching for games.",
		key = config.Keys.SEARCH_GAMES,
		values = { [config.Languages.EN_US] = "Search games" }
	},
	{
		comment = "Placeholder text when searching for friends.",
		key = config.Keys.SEARCH_FOR_FRIENDS,
		values = { [config.Languages.EN_US] = "Search for Friends" }
	},
	{
		comment = "Placeholder text when searching for friends and chat groups.",
		key = config.Keys.SEARCH_FOR_FRIENDS_AND_CHAT,
		values = {
			[config.Languages.EN_US] = "Search for friends and chat groups"
		}
	},
	{
		comment = "When searching and not finding any results.",
		key = config.Keys.NO_RESULTS_FOUND,
		values = { [config.Languages.EN_US] = "No results found" }
	},
	{
		comment = "Labels a button that expands a list of friends. NUMBER_OF_FRIENDS is the number of additional friends that will be shown.",
		key = config.Keys.SEE_MORE_FRIENDS,
		values = {
			[config.Languages.EN_US] = "See More ({NUMBER_OF_FRIENDS})"
		}
	},
	{
		comment = "Labels a button that expands a list of friends. NUMBER_OF_FRIENDS is the number of additional friends that will be shown.",
		key = config.Keys.SEE_LESS_FRIENDS,
		values = { [config.Languages.EN_US] = "See Less" }
	},
	{
		comment = "Informs the user that there is no network connection and data (conversations, etc.) can not be sent or received.",
		key = config.Keys.NO_NETWORK_CONNECTION,
		values = { [config.Languages.EN_US] = "Connecting..." }
	},
	{
		comment = "Title for share game to chat feature.",
		key = config.Keys.SHARE_GAME_TO_CHAT,
		values = { [config.Languages.EN_US] = "Share game to chat" }
	},
	{
		comment = "Unless a user has friends, they won't be able to chat with anyone. This message informs players they need friends to chat and suggests playing games as a way to find friends.",
		key = config.Keys.MAKE_FRIENDS_TO_CHAT,
		values = {
			[config.Languages.EN_US] = "Make friends in games to start chatting and playing together."
		}
	},
	{
		comment = "Shown to the user if a message is fully moderated and not sent to the other users in a conversation.",
		key = config.Keys.THIS_MESSAGE_WAS_MODERATED,
		values = {
			[config.Languages.EN_US] = "This message was moderated and not sent."
		}
	},
	{
		comment = "Shown to the user if a message is not shown to the minor people in a group chat.",
		key = config.Keys.FILTERED_FOR_RECEIVERS,
		values = {
			[config.Languages.EN_US] = "Not everyone in this chat can see your message."
		}
	},
	{
		comment = "Label for the name of a conversation",
		key = config.Keys.CHAT_GROUP_NAME,
		values = { [config.Languages.EN_US] = "Chat Group Name" }
	},
	{
		comment = "Label for button that allows you to change settings for which notifications you get.",
		key = config.Keys.NOTIFICATIONS,
		values = { [config.Languages.EN_US] = "Notifications" }
	},
	{
		comment = "Labels a button that allows you to add friends to a conversation.",
		key = config.Keys.ADD_FRIENDS,
		values = { [config.Languages.EN_US] = "Add Friends" }
	},
	{
		comment = "Labels action that allows a user to remove themself from a conversation.",
		key = config.Keys.LEAVE_GROUP,
		values = { [config.Languages.EN_US] = "Leave Group" }
	},
	{
		comment = "Labels an action which removes another user (not the local user) from a conversation.",
		key = config.Keys.REMOVE_USER,
		values = { [config.Languages.EN_US] = "Remove User" }
	},
	{
		comment = "Labels the confirmation button for removing a user from a conversation.",
		key = config.Keys.REMOVE,
		values = { [config.Languages.EN_US] = "Remove" }
	},
	{
		comment = "Message explaining that if they leave a chat group they will no longer be able to participate in chat.",
		key = config.Keys.LEAVE_GROUP_MESSAGE,
		values = {
			[config.Languages.EN_US] = "You won't be able to keep chatting with this group."
		}
	},
	{
		comment = "Cancels the leave group action.",
		key = config.Keys.STAY,
		values = { [config.Languages.EN_US] = "Stay" }
	},
	{
		comment = "Confirms the leave group action.",
		key = config.Keys.LEAVE,
		values = { [config.Languages.EN_US] = "Leave" }
	},
	{
		comment = "Informs the user the title of a group conversation has not been set.",
		key = config.Keys.NOT_SET,
		values = { [config.Languages.EN_US] = "Not Set" }
	},
	{
		comment = "Title of screen that shows list of conversations, which is the first screen that appears when chat is open.",
		key = config.Keys.CHAT,
		values = { [config.Languages.EN_US] = "Chat" }
	},
	{
		comment = "Title of screen that informs the user of a conversation's participants and title and allows them to edit these.",
		key = config.Keys.CHAT_DETAILS,
		values = { [config.Languages.EN_US] = "Chat Details" }
	},
	{
		comment = "Title of screen where user can create a new chat group.",
		key = config.Keys.NEW_CHAT_GROUP,
		values = { [config.Languages.EN_US] = "New Chat Group" }
	},
	{
		comment = "Text shown in chat input bar before user types anything.",
		key = config.Keys.CHAT_INPUT_PLACEHOLDER,
		values = { [config.Languages.EN_US] = "Say something" }
	},
	{
		comment = "Title of pop-up that shows list of user actions.",
		key = config.Keys.OPTION,
		values = { [config.Languages.EN_US] = "Option" }
	},
	{
		comment = "Label for button that allows user to view another user's profile.",
		key = config.Keys.VIEW_PROFILE,
		values = { [config.Languages.EN_US] = "View Profile" }
	},
	{
		comment = "Label for button that allows user to report another user for inappropriate behavior.",
		key = config.Keys.REPORT_USER,
		values = { [config.Languages.EN_US] = "Report User" }
	},
	{
		comment = "Label for button that allows a user to remove another user from a group conversation.",
		key = config.Keys.REMOVE_FROM_GROUP,
		values = { [config.Languages.EN_US] = "Remove from Group" }
	},
	{
		comment = "Labels section of group details screen with general information like group name.",
		key = config.Keys.GENERAL,
		values = { [config.Languages.EN_US] = "General" }
	},
	{
		comment = "Labels section of group details screen that lists participants.",
		key = config.Keys.MEMBERS,
		values = { [config.Languages.EN_US] = "Members" }
	},
	{
		comment = "Informs the user that a conversation could not be renamed.",
		key = config.Keys.FAILED_TO_RENAME_TITLE,
		values = {
			[config.Languages.EN_US] = "Failed to Rename Conversation"
		}
	},
	{
		comment = "Informs the user that a conversation could not be renamed.",
		key = config.Keys.FAILED_TO_RENAME_MESSAGE,
		values = {
			[config.Languages.EN_US] = "The conversation {EXISTING_NAME} could not be renamed to {NEW_NAME}."
		}
	},
	{
		comment = "Informs the user that the name they tried to give a group was deemed inappropriate and moderated.",
		key = config.Keys.GROUP_NAME_MODERATED,
		values = {
			[config.Languages.EN_US] = "The chat group name you entered was moderated"
		}
	},
	{
		comment = "Title of message when a user tries to leave a group and the http request fails.",
		key = config.Keys.FAILED_TO_LEAVE_GROUP,
		values = { [config.Languages.EN_US] = "Failed to Leave Group" }
	},
	{
		comment = "Message when a user tries to leave a group and the http request fails.",
		key = config.Keys.FAILED_TO_LEAVE_GROUP_MESSAGE,
		values = {
			[config.Languages.EN_US] = "You could not be removed from the conversation {CONVERSATION_TITLE}."
		}
	},
	{
		comment = "Title of message when a user tries to remove another user from a group and the http request fails.",
		key = config.Keys.FAILED_TO_REMOVE_USER,
		values = { [config.Languages.EN_US] = "Failed to Remove User" }
	},
	{
		comment = "Title of message when a user tries to remove another user from a group and the http request fails.",
		key = config.Keys.FAILED_TO_REMOVE_USER_MESSAGE,
		values = {
			[config.Languages.EN_US] = "The user {USERNAME} could not be removed from the conversation {CONVERSATION_TITLE}."
		}
	},
	{
		comment = "Informs the user that they can't add any more friends to a conversation.",
		key = config.Keys.TOO_MANY_PEOPLE,
		values = {
			[config.Languages.EN_US] = "You can only have up to {MAX_GROUP_SIZE} players in a chat group."
		}
	},
	{
		comment = "Informs the user that they have been removed from a conversation.",
		key = config.Keys.REMOVED_FROM_CONVERSATION,
		values = {
			[config.Languages.EN_US] = "You have been removed from the group."
		}
	},
	{
		comment = "Placeholder text for input field that allows user to name a new chat group",
		key = config.Keys.NAME_THIS_CHAT_GROUP,
		values = { [config.Languages.EN_US] = "Name this chat group" }
	},
	{
		comment = "Labels button that saves a new chat group.",
		key = config.Keys.SAVE_NEW_GROUP,
		values = { [config.Languages.EN_US] = "Create" }
	},
	{
		comment = "Labels button that saves changes to chat group when adding new friends.",
		key = config.Keys.SAVE_ADDED_FRIENDS,
		values = { [config.Languages.EN_US] = "Add" }
	},
	{
		comment = "A Send label that is used to send messages",
		key = config.Keys.SEND,
		values = { [config.Languages.EN_US] = "Send" }
	},
	{
		comment = "A Sent label that is used after a message is sent.",
		key = config.Keys.SENT,
		values = { [config.Languages.EN_US] = "Sent" }
	},
	{
		comment = "Labels button that confirms and saves a change",
		key = config.Keys.SAVE,
		values = { [config.Languages.EN_US] = "Save" }
	},
	{
		comment = "Message asking user for confirmation before removing another user from a group conversation",
		key = config.Keys.REMOVE_USER_CONFIRMATION_MESSAGE,
		values = {
			[config.Languages.EN_US] = "Are you sure you want to remove {USERNAME} from this chat group?"
		}
	},
	{
		comment = "Informs the local user that another user is not signed onto the platform",
		key = config.Keys.OFFLINE,
		values = { [config.Languages.EN_US] = "Offline" }
	},
	{
		comment = "Informs the local user that another user is signed onto the platform",
		key = config.Keys.ONLINE,
		values = { [config.Languages.EN_US] = "Online" }
	},
	{
		comment = "Informs that a game is made by a certain builder.",
		key = config.Keys.BY_BUILDER,
		values = { [config.Languages.EN_US] = "By {USERNAME}" }
	},
	{
		comment = "Labels a button that will show the user more information on an asset.",
		key = config.Keys.VIEW_ASSET_DETAILS,
		values = { [config.Languages.EN_US] = "View Details" }
	},
	{
		comment = "Labels a button that will send the player into a game.",
		key = config.Keys.PLAY_GAME,
		values = { [config.Languages.EN_US] = "Play" }
	},
	{
		comment = "Header on the section of the home page that shows the user's feed",
		key = config.Keys.MY_FEED,
		values = { [config.Languages.EN_US] = "View My Feed" }
	},
	{
		comment = "Header on the section of the home page that shows the user's friends",
		key = config.Keys.FRIENDS_COUNT,
		values = { [config.Languages.EN_US] = "Friends ({COUNT})" }
	},
	{
		comment = "Button that goes on carousels of throughout the UI, which allows the user to go to a separate page which displays the entire list of things that would go in the carousel",
		key = config.Keys.SEE_ALL,
		values = { [config.Languages.EN_US] = "See All" }
	},
	{
		comment = "Title text for application's home page",
		key = config.Keys.HOME,
		values = { [config.Languages.EN_US] = "Home" }
	},
	{
		comment = "Title text for page that contains a list of games",
		key = config.Keys.GAMES,
		values = { [config.Languages.EN_US] = "Games" }
	},
	{
		comment = "Title text for page that contains catalog",
		key = config.Keys.CATALOG,
		values = { [config.Languages.EN_US] = "Catalog" }
	},
	{
		comment = "Title text for page that contains avatar editor",
		key = config.Keys.AVATAR,
		values = { [config.Languages.EN_US] = "Avatar" }
	},
	{
		comment = "Title text for page that contains friends info",
		key = config.Keys.FRIENDS,
		values = { [config.Languages.EN_US] = "Friends" }
	},
	{
		comment = "Title text for page that contains a list of other pages",
		key = config.Keys.MORE,
		values = { [config.Languages.EN_US] = "More" }
	}
}

for _, value1 in pairs(config.Content) do
	local GeneratedStringsModuleEntry = GeneratedStringsModule[value1.key]
	
	if GeneratedStringsModuleEntry then
		for i, value in pairs(GeneratedStringsModuleEntry) do
			value1.values[i] = value
		end
	end
end
return config