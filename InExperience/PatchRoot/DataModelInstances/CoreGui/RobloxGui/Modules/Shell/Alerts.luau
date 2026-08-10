local _ = game:GetService("CorePackages")
local localizedStringsModule = require(game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell"):FindFirstChild("LocalizedStrings"))

return {
	Default = {
		Id = 0,
		Title = localizedStringsModule:LocStringUA("Xbox.Old.AlertOccurredTitle"),
		Msg = localizedStringsModule:LocStringUA("Xbox.Old.DefaultAlertPhrase")
	},
	UnlockedUGC = {
		Id = 101,
		Title = localizedStringsModule:LocStringUA("Xbox.Old.UnlockedUGCTitle"),
		Msg = localizedStringsModule:LocStringUA("Xbox.Old.UnlockedUGCPhrase")
	},
	LostConnection = {
		Controller = {
			Id = 201,
			Title = localizedStringsModule:LocStringUA("Xbox.Old.ControllerLostConnectionTitle"),
			Msg = localizedStringsModule:LocStringUA("Xbox.Old.ControllerLostConnectionPhrase")
		},
		ActiveUser = {
			Id = 202,
			Title = localizedStringsModule:LocStringUA("Xbox.Old.ActiveUserLostConnectionTitle"),
			Msg = localizedStringsModule:LocStringUA("Xbox.Old.ActiveUserLostConnectionPhrase")
		}
	},
	PlayMyPlaceMoreGames = {
		Id = 301,
		Title = localizedStringsModule:LocStringUA("Xbox.Old.PlayMyPlaceMoreGamesTitle"),
		Msg = localizedStringsModule:LocStringUA("Xbox.Old.PlayMyPlaceMoreGamesPhrase")
	},
	CrossPlatformPlayWelcome = {
		Id = 401,
		Title = localizedStringsModule:LocStringUA("Xbox.Old.CPPWelcomeTitle"),
		Msg = localizedStringsModule:LocStringUA("Xbox.Old.CPPWelcomePhrase")
	},
	Reauthentication = {
		[0] = {
			Id = 1001,
			Title = localizedStringsModule:LocStringUA("Xbox.Old.AlertOccurredTitle"),
			Msg = localizedStringsModule:LocStringUA("Xbox.Old.ReauthUnknownPhrase")
		},
		[1] = {
			Id = 1002,
			Title = localizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutTitle"),
			Msg = localizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutPhrase")
		},
		[2] = {
			Id = 1003,
			Title = localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
			Msg = localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
		},
		[3] = {
			Id = 1004,
			Title = localizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutTitle"),
			Msg = localizedStringsModule:LocStringUA("Xbox.Old.ReauthInvalidSessionPhrase")
		},
		[4] = {
			Id = 1005,
			Title = localizedStringsModule:LocStringUA("Xbox.Old.ReauthUnlinkTitle"),
			Msg = localizedStringsModule:LocStringUA("Xbox.Old.ReauthUnlinkPhrase")
		},
		[5] = {
			Id = 1006,
			Title = localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
			Msg = localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
		},
		[6] = {
			Id = 1007,
			Title = localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
			Msg = localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
		},
		[7] = {
			Id = 1008,
			Title = localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
			Msg = localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
		}
	},
	SignOut = {
		[0] = {
			Id = 1001,
			Title = localizedStringsModule:LocStringUA("Xbox.Old.AlertOccurredTitle"),
			Msg = localizedStringsModule:LocStringUA("Xbox.Old.ReauthUnknownPhrase")
		},
		[1] = {
			Id = 1002,
			Title = localizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutTitle"),
			Msg = localizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutPhrase")
		},
		[2] = {
			Id = 1003,
			Title = localizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutTitle"),
			Msg = localizedStringsModule:LocStringUA("Xbox.Old.ReauthInvalidSessionPhrase")
		},
		[3] = {
			Id = 1004,
			Title = localizedStringsModule:LocStringUA("Xbox.Old.ReauthUnlinkTitle"),
			Msg = localizedStringsModule:LocStringUA("Xbox.Old.ReauthUnlinkPhrase")
		},
		[4] = {
			Id = 1005,
			Title = localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
			Msg = localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
		},
		[5] = {
			Id = 1006,
			Title = localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
			Msg = localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
		},
		[6] = nil,
		[7] = {
			Id = 1007,
			Title = localizedStringsModule:LocStringUA("Xbox.Old.ReauthMaintenanceTitle"),
			Msg = localizedStringsModule:LocStringUA("Xbox.Old.ReauthMaintenancePhrase")
		}
	},
	PlatformLink = {
		Id = 1201,
		Title = localizedStringsModule:LocStringUA("Xbox.Old.PlatformLinkInfoTitle"),
		Msg = localizedStringsModule:LocStringUA("Xbox.Old.PlatformLinkInfoMessage")
	}
}