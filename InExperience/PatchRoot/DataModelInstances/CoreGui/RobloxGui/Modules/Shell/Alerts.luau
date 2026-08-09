local localizedStringsModule = require(game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell"):FindFirstChild("LocalizedStrings"))
local fFlagAppShellMigrateLocales = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagAppShellMigrateLocales

return {
	Default = {
		Id = 0,
		Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.AlertOccurredTitle") else localizedStringsModule:LocalizedString("AlertOccurredTitle"),
		Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.DefaultAlertPhrase") else localizedStringsModule:LocalizedString("DefaultAlertPhrase")
	},
	UnlockedUGC = {
		Id = 101,
		Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.UnlockedUGCTitle") else localizedStringsModule:LocalizedString("UnlockedUGCTitle"),
		Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.UnlockedUGCPhrase") else localizedStringsModule:LocalizedString("UnlockedUGCPhrase")
	},
	LostConnection = {
		Controller = {
			Id = 201,
			Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ControllerLostConnectionTitle") else localizedStringsModule:LocalizedString("ControllerLostConnectionTitle"),
			Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ControllerLostConnectionPhrase") else localizedStringsModule:LocalizedString("ControllerLostConnectionPhrase")
		},
		ActiveUser = {
			Id = 202,
			Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ActiveUserLostConnectionTitle") else localizedStringsModule:LocalizedString("ActiveUserLostConnectionTitle"),
			Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ActiveUserLostConnectionPhrase") else localizedStringsModule:LocalizedString("ActiveUserLostConnectionPhrase")
		}
	},
	PlayMyPlaceMoreGames = {
		Id = 301,
		Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.PlayMyPlaceMoreGamesTitle") else localizedStringsModule:LocalizedString("PlayMyPlaceMoreGamesTitle"),
		Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.PlayMyPlaceMoreGamesPhrase") else localizedStringsModule:LocalizedString("PlayMyPlaceMoreGamesPhrase")
	},
	CrossPlatformPlayWelcome = {
		Id = 401,
		Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.CPPWelcomeTitle") else localizedStringsModule:LocalizedString("CPPWelcomeTitle"),
		Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.CPPWelcomePhrase") else localizedStringsModule:LocalizedString("CPPWelcomePhrase")
	},
	Reauthentication = {
		[0] = {
			Id = 1001,
			Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.AlertOccurredTitle") else localizedStringsModule:LocalizedString("AlertOccurredTitle"),
			Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthUnknownPhrase") else localizedStringsModule:LocalizedString("ReauthUnknownPhrase")
		},
		[1] = {
			Id = 1002,
			Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutTitle") else localizedStringsModule:LocalizedString("ReauthSignedOutTitle"),
			Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutPhrase") else localizedStringsModule:LocalizedString("ReauthSignedOutPhrase")
		},
		[2] = {
			Id = 1003,
			Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle") else localizedStringsModule:LocalizedString("ReauthRemovedTitle"),
			Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase") else localizedStringsModule:LocalizedString("ReauthRemovedPhrase")
		},
		[3] = {
			Id = 1004,
			Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutTitle") else localizedStringsModule:LocalizedString("ReauthSignedOutTitle"),
			Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthInvalidSessionPhrase") else localizedStringsModule:LocalizedString("ReauthInvalidSessionPhrase")
		},
		[4] = {
			Id = 1005,
			Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthUnlinkTitle") else localizedStringsModule:LocalizedString("ReauthUnlinkTitle"),
			Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthUnlinkPhrase") else localizedStringsModule:LocalizedString("ReauthUnlinkPhrase")
		},
		[5] = {
			Id = 1006,
			Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle") else localizedStringsModule:LocalizedString("ReauthRemovedTitle"),
			Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase") else localizedStringsModule:LocalizedString("ReauthRemovedPhrase")
		},
		[6] = {
			Id = 1007,
			Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle") else localizedStringsModule:LocalizedString("ReauthRemovedTitle"),
			Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase") else localizedStringsModule:LocalizedString("ReauthRemovedPhrase")
		},
		[7] = {
			Id = 1008,
			Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle") else localizedStringsModule:LocalizedString("ReauthRemovedTitle"),
			Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase") else localizedStringsModule:LocalizedString("ReauthRemovedPhrase")
		}
	},
	SignOut = {
		[0] = {
			Id = 1001,
			Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.AlertOccurredTitle") else localizedStringsModule:LocalizedString("AlertOccurredTitle"),
			Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthUnknownPhrase") else localizedStringsModule:LocalizedString("ReauthUnknownPhrase")
		},
		[1] = {
			Id = 1002,
			Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutTitle") else localizedStringsModule:LocalizedString("ReauthSignedOutTitle"),
			Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutPhrase") else localizedStringsModule:LocalizedString("ReauthSignedOutPhrase")
		},
		[2] = {
			Id = 1003,
			Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthSignedOutTitle") else localizedStringsModule:LocalizedString("ReauthSignedOutTitle"),
			Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthInvalidSessionPhrase") else localizedStringsModule:LocalizedString("ReauthInvalidSessionPhrase")
		},
		[3] = {
			Id = 1004,
			Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthUnlinkTitle") else localizedStringsModule:LocalizedString("ReauthUnlinkTitle"),
			Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthUnlinkPhrase") else localizedStringsModule:LocalizedString("ReauthUnlinkPhrase")
		},
		[4] = {
			Id = 1005,
			Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle") else localizedStringsModule:LocalizedString("ReauthRemovedTitle"),
			Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase") else localizedStringsModule:LocalizedString("ReauthRemovedPhrase")
		},
		[5] = {
			Id = 1006,
			Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedTitle") else localizedStringsModule:LocalizedString("ReauthRemovedTitle"),
			Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthRemovedPhrase") else localizedStringsModule:LocalizedString("ReauthRemovedPhrase")
		},
		[6] = nil,
		[7] = {
			Id = 1007,
			Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthMaintenanceTitle") else localizedStringsModule:LocalizedString("ReauthMaintenanceTitle"),
			Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ReauthMaintenancePhrase") else localizedStringsModule:LocalizedString("ReauthMaintenancePhrase")
		}
	},
	PlatformLink = {
		Id = 1201,
		Title = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.PlatformLinkInfoTitle") else localizedStringsModule:LocalizedString("PlatformLinkInfoTitle"),
		Msg = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.PlatformLinkInfoMessage") else localizedStringsModule:LocalizedString("PlatformLinkInfoMessage")
	}
}