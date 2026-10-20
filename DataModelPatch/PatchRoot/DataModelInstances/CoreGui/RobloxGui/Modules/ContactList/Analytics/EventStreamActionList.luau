local CorePackages = game:GetService("CorePackages")
local DashModule = require(CorePackages.Packages.Dash)
local Enums = require(CorePackages.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local EventNamesEnumModule = require(script.Parent.EventNamesEnum)
local LocalPlayer = game:GetService("Players").LocalPlayer
local Platform = game:GetService("UserInputService"):GetPlatform()
local PlaySessionId = game:GetService("RbxAnalyticsService"):GetPlaySessionId()
local Desktop: string = if Platform == Enum.Platform.Windows or Platform == Enum.Platform.OSX then "desktop" elseif Platform == Enum.Platform.IOS then "ios" elseif Platform == Enum.Platform.Android then "android" elseif Platform == Enum.Platform.XBox360 or Platform == Enum.Platform.PS3 or Platform == Enum.Platform.PS4 or Platform == Enum.Platform.XBoxOne or Platform == Enum.Platform.WiiU then "console" else "other"

return {
	[EventNamesEnumModule.CallBarHangUpClicked] = {
		context = Contexts.ContactList,
		eventType = EventTypes.CallBarHangUpClicked,
		additionalInfo = {
			uid = LocalPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = Desktop,
			playSessionId = PlaySessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = DashModule.identity,
			calleeUserId = DashModule.identity,
			callerUserId = DashModule.identity,
			callId = DashModule.identity,
			callStatus = DashModule.identity,
			isRetry = DashModule.identity
		}
	},
	[EventNamesEnumModule.PhoneBookNavigate] = {
		context = Contexts.ContactList,
		eventType = EventTypes.PhoneBookNavigate,
		additionalInfo = {
			uid = LocalPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = Desktop,
			playSessionId = PlaySessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = DashModule.identity,
			startingPage = DashModule.identity,
			destinationPage = DashModule.identity
		}
	},
	[EventNamesEnumModule.PhoneBookSearchClicked] = {
		context = Contexts.ContactList,
		eventType = EventTypes.PhoneBookSearchClicked,
		additionalInfo = {
			uid = LocalPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = Desktop
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = DashModule.identity,
			playSessionId = PlaySessionId
		}
	},
	[EventNamesEnumModule.PhoneBookSearchAttempted] = {
		context = Contexts.ContactList,
		eventType = EventTypes.PhoneBookSearchAttempted,
		additionalInfo = {
			uid = LocalPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = Desktop,
			playSessionId = PlaySessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = DashModule.identity,
			searchQueryString = DashModule.identity
		}
	},
	[EventNamesEnumModule.PhoneBookSearchFinished] = {
		context = Contexts.ContactList,
		eventType = EventTypes.PhoneBookSearchFinished,
		additionalInfo = {
			uid = LocalPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = Desktop,
			playSessionId = PlaySessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = DashModule.identity,
			searchQueryString = DashModule.identity,
			searchResultCount = DashModule.identity
		}
	},
	[EventNamesEnumModule.PhoneBookPlayerMenuOpened] = {
		context = Contexts.ContactList,
		eventType = EventTypes.PhoneBookPlayerMenuOpened,
		additionalInfo = {
			uid = LocalPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = Desktop,
			playSessionId = PlaySessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = DashModule.identity,
			friendUserId = DashModule.identity,
			searchQueryString = DashModule.identity,
			itemListIndex = DashModule.identity,
			isSuggestedUser = DashModule.identity,
			page = DashModule.identity
		}
	},
	[EventNamesEnumModule.PhoneBookPlayerMenuUnfriendClicked] = {
		context = Contexts.ContactList,
		eventType = EventTypes.PhoneBookPlayerMenuUnfriendClicked,
		additionalInfo = {
			uid = LocalPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = Desktop,
			playSessionId = PlaySessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = DashModule.identity,
			friendUserId = DashModule.identity
		}
	},
	[EventNamesEnumModule.PhoneBookPlayerMenuUnfriendFinished] = {
		context = Contexts.ContactList,
		eventType = EventTypes.PhoneBookPlayerMenuUnfriendFinished,
		additionalInfo = {
			uid = LocalPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = Desktop,
			playSessionId = PlaySessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = DashModule.identity,
			friendUserId = DashModule.identity,
			success = DashModule.identity
		}
	},
	[EventNamesEnumModule.PhoneBookPlayerMenuBlockClicked] = {
		context = Contexts.ContactList,
		eventType = EventTypes.PhoneBookPlayerMenuBlockClicked,
		additionalInfo = {
			uid = LocalPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = Desktop,
			playSessionId = PlaySessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = DashModule.identity,
			friendUserId = DashModule.identity
		}
	},
	[EventNamesEnumModule.PhoneBookCallFriendClicked] = {
		context = Contexts.ContactList,
		eventType = EventTypes.PhoneBookCallFriendClicked,
		additionalInfo = {
			uid = LocalPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = Desktop,
			playSessionId = PlaySessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = DashModule.identity,
			friendUserId = DashModule.identity,
			searchQueryString = DashModule.identity,
			itemListIndex = DashModule.identity,
			isSuggestedUser = DashModule.identity,
			page = DashModule.identity
		}
	},
	[EventNamesEnumModule.PhoneBookCallFriendFailed] = {
		context = Contexts.ContactList,
		eventType = EventTypes.PhoneBookCallFriendFailed,
		additionalInfo = {
			uid = LocalPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = Desktop,
			playSessionId = PlaySessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = DashModule.identity,
			calleeUserId = DashModule.identity,
			callerUserId = DashModule.identity,
			errorMsg = DashModule.identity
		}
	}
}