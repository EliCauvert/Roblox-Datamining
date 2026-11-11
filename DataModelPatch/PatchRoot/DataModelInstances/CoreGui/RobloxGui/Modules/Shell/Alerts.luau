local _ = game:GetService("CorePackages")
local LocalizedStringsModule = require(game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell"):FindFirstChild("LocalizedStrings"))

return {
	Default = {
		Id = 0,
		Title = LocalizedStringsModule:LocStringUA("Xbox.Old.AlertOccurredTitle"),
		Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.DefaultAlertPhrase")
	},
	UnlockedUGC = {
		Id = 101,
		Title = LocalizedStringsModule:LocStringUA("Xbox.Old.UnlockedUGCTitle"),
		Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.UnlockedUGCPhrase")
	},
	LostConnection = {
		Controller = {
			Id = 201,
			Title = LocalizedStringsModule:LocStringUA("Xbox.Old.ControllerLostConnectionTitle"),
			Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.ControllerLostConnectionPhrase")
		},
		ActiveUser = {
			Id = 202,
			Title = LocalizedStringsModule:LocStringUA("Xbox.Old.ActiveUserLostConnectionTitle"),
			Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.ActiveUserLostConnectionPhrase")
		}
	},
	PlayMyPlaceMoreGames = {
		Id = 301,
		Title = LocalizedStringsModule:LocStringUA("Xbox.Old.PlayMyPlaceMoreGamesTitle"),
		Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.PlayMyPlaceMoreGamesPhrase")
	},
	CrossPlatformPlayWelcome = {
		Id = 401,
		Title = LocalizedStringsModule:LocStringUA("Xbox.Old.CPPWelcomeTitle"),
		Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.CPPWelcomePhrase")
	},
	Reauthentication = {
		[0] = {
			Id = 1001,
			Title = LocalizedStringsModule:LocStringUA("Xbox.Old.AlertOccurredTitle"),
			Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthUnknownPhrase")
		},
		[1] = {
			Id = 1002,
			Title = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutTitle"),
			Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutPhrase")
		},
		[2] = {
			Id = 1003,
			Title = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
			Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
		},
		[3] = {
			Id = 1004,
			Title = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutTitle"),
			Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthInvalidSessionPhrase")
		},
		[4] = {
			Id = 1005,
			Title = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthUnlinkTitle"),
			Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthUnlinkPhrase")
		},
		[5] = {
			Id = 1006,
			Title = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
			Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
		},
		[6] = {
			Id = 1007,
			Title = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
			Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
		},
		[7] = {
			Id = 1008,
			Title = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
			Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
		}
	},
	SignOut = {
		[0] = {
			Id = 1001,
			Title = LocalizedStringsModule:LocStringUA("Xbox.Old.AlertOccurredTitle"),
			Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthUnknownPhrase")
		},
		[1] = {
			Id = 1002,
			Title = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutTitle"),
			Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutPhrase")
		},
		[2] = {
			Id = 1003,
			Title = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutTitle"),
			Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthInvalidSessionPhrase")
		},
		[3] = {
			Id = 1004,
			Title = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthUnlinkTitle"),
			Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthUnlinkPhrase")
		},
		[4] = {
			Id = 1005,
			Title = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
			Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
		},
		[5] = {
			Id = 1006,
			Title = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
			Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
		},
		[6] = nil,
		[7] = {
			Id = 1007,
			Title = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthMaintenanceTitle"),
			Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.ReauthMaintenancePhrase")
		}
	},
	PlatformLink = {
		Id = 1201,
		Title = LocalizedStringsModule:LocStringUA("Xbox.Old.PlatformLinkInfoTitle"),
		Msg = LocalizedStringsModule:LocStringUA("Xbox.Old.PlatformLinkInfoMessage")
	}
}