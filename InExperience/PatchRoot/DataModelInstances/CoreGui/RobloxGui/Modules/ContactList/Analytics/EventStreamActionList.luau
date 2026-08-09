local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local dashModule = require(corePackagesService.Packages.Dash)
local enums = require(corePackagesService.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums
local contexts = enums.Contexts
local eventTypes = enums.EventTypes
local eventNamesEnumModule = require(script.Parent.EventNamesEnum)
local localPlayer = playersService.LocalPlayer
local platform = userInputService:GetPlatform()
local playSessionId = rbxAnalyticsService:GetPlaySessionId()
local _ = nil
local var8 = if platform == Enum.Platform.Windows or platform == Enum.Platform.OSX then "desktop" elseif platform == Enum.Platform.IOS then "ios" elseif platform == Enum.Platform.Android then "android" elseif platform == Enum.Platform.XBox360 or platform == Enum.Platform.PS3 or (platform == Enum.Platform.PS4 or platform == Enum.Platform.XBoxOne) or platform == Enum.Platform.WiiU then "console" else "other"

return {
	[eventNamesEnumModule.CallBarHangUpClicked] = {
		context = contexts.ContactList,
		eventType = eventTypes.CallBarHangUpClicked,
		additionalInfo = {
			uid = localPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = var8,
			playSessionId = playSessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = dashModule.identity,
			calleeUserId = dashModule.identity,
			callerUserId = dashModule.identity,
			callId = dashModule.identity,
			callStatus = dashModule.identity,
			isRetry = dashModule.identity
		}
	},
	[eventNamesEnumModule.PhoneBookNavigate] = {
		context = contexts.ContactList,
		eventType = eventTypes.PhoneBookNavigate,
		additionalInfo = {
			uid = localPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = var8,
			playSessionId = playSessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = dashModule.identity,
			startingPage = dashModule.identity,
			destinationPage = dashModule.identity
		}
	},
	[eventNamesEnumModule.PhoneBookSearchClicked] = {
		context = contexts.ContactList,
		eventType = eventTypes.PhoneBookSearchClicked,
		additionalInfo = {
			uid = localPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = var8
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = dashModule.identity,
			playSessionId = playSessionId
		}
	},
	[eventNamesEnumModule.PhoneBookSearchAttempted] = {
		context = contexts.ContactList,
		eventType = eventTypes.PhoneBookSearchAttempted,
		additionalInfo = {
			uid = localPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = var8,
			playSessionId = playSessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = dashModule.identity,
			searchQueryString = dashModule.identity
		}
	},
	[eventNamesEnumModule.PhoneBookSearchFinished] = {
		context = contexts.ContactList,
		eventType = eventTypes.PhoneBookSearchFinished,
		additionalInfo = {
			uid = localPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = var8,
			playSessionId = playSessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = dashModule.identity,
			searchQueryString = dashModule.identity,
			searchResultCount = dashModule.identity
		}
	},
	[eventNamesEnumModule.PhoneBookPlayerMenuOpened] = {
		context = contexts.ContactList,
		eventType = eventTypes.PhoneBookPlayerMenuOpened,
		additionalInfo = {
			uid = localPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = var8,
			playSessionId = playSessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = dashModule.identity,
			friendUserId = dashModule.identity,
			searchQueryString = dashModule.identity,
			itemListIndex = dashModule.identity,
			isSuggestedUser = dashModule.identity,
			page = dashModule.identity
		}
	},
	[eventNamesEnumModule.PhoneBookPlayerMenuUnfriendClicked] = {
		context = contexts.ContactList,
		eventType = eventTypes.PhoneBookPlayerMenuUnfriendClicked,
		additionalInfo = {
			uid = localPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = var8,
			playSessionId = playSessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = dashModule.identity,
			friendUserId = dashModule.identity
		}
	},
	[eventNamesEnumModule.PhoneBookPlayerMenuUnfriendFinished] = {
		context = contexts.ContactList,
		eventType = eventTypes.PhoneBookPlayerMenuUnfriendFinished,
		additionalInfo = {
			uid = localPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = var8,
			playSessionId = playSessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = dashModule.identity,
			friendUserId = dashModule.identity,
			success = dashModule.identity
		}
	},
	[eventNamesEnumModule.PhoneBookPlayerMenuBlockClicked] = {
		context = contexts.ContactList,
		eventType = eventTypes.PhoneBookPlayerMenuBlockClicked,
		additionalInfo = {
			uid = localPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = var8,
			playSessionId = playSessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = dashModule.identity,
			friendUserId = dashModule.identity
		}
	},
	[eventNamesEnumModule.PhoneBookCallFriendClicked] = {
		context = contexts.ContactList,
		eventType = eventTypes.PhoneBookCallFriendClicked,
		additionalInfo = {
			uid = localPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = var8,
			playSessionId = playSessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = dashModule.identity,
			friendUserId = dashModule.identity,
			searchQueryString = dashModule.identity,
			itemListIndex = dashModule.identity,
			isSuggestedUser = dashModule.identity,
			page = dashModule.identity
		}
	},
	[eventNamesEnumModule.PhoneBookCallFriendFailed] = {
		context = contexts.ContactList,
		eventType = eventTypes.PhoneBookCallFriendFailed,
		additionalInfo = {
			uid = localPlayer.UserId,
			universeId = game.GameId,
			placeId = game.PlaceId,
			deviceType = var8,
			playSessionId = playSessionId
		},
		formatRulesForAdditionalInfo = {
			eventTimestampMs = dashModule.identity,
			calleeUserId = dashModule.identity,
			callerUserId = dashModule.identity,
			errorMsg = dashModule.identity
		}
	}
}