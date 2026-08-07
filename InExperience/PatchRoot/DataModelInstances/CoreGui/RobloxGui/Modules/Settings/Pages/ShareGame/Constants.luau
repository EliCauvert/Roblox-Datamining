local corePackagesService = game:GetService("CorePackages")
local userModel = require(corePackagesService.Workspace.Packages.UserLib).Models.UserModel
local thumbnailRequest = require(corePackagesService.Workspace.Packages.UserLib).Utils.ThumbnailRequest
local constants = require(corePackagesService.Workspace.Packages.UserLib).Utils.Constants
local t = {
	PHONE_PORTRAIT = "PHONE_PORTRAIT",
	PHONE_LANDSCAPE = "PHONE_LANDSCAPE",
	TABLET_PORTRAIT = "TABLET_PORTRAIT",
	TABLET_LANDSCAPE = "TABLET_LANDSCAPE",
	DESKTOP = "DESKTOP"
}
local t_1 = {
	WHITE = Color3.fromRGB(255, 255, 255),
	GRAY1 = Color3.fromRGB(25, 25, 25),
	GRAY2 = Color3.fromRGB(117, 117, 117),
	GRAY3 = Color3.fromRGB(184, 184, 184),
	GRAY4 = Color3.fromRGB(227, 227, 227),
	GRAY5 = Color3.fromRGB(242, 242, 242),
	GRAY6 = Color3.fromRGB(245, 245, 245),
	RED = Color3.fromRGB(254, 68, 72)
}
local t_2 = {
	SHARE_GAME_Z_INDEX = 2,
	Color = t_1,
	PresenceColors = {
		[userModel.PresenceType.ONLINE] = Color3.fromRGB(0, 162, 255),
		[userModel.PresenceType.IN_GAME] = Color3.fromRGB(2, 183, 87),
		[userModel.PresenceType.IN_STUDIO] = Color3.fromRGB(246, 136, 2),
		[userModel.PresenceType.OFFLINE] = t_1.GRAY3
	},
	PresenceTextKey = {
		[userModel.PresenceType.ONLINE] = "InGame.Presence.Label.Online",
		[userModel.PresenceType.IN_GAME] = "InGame.Presence.Label.InGame",
		[userModel.PresenceType.IN_STUDIO] = "InGame.Presence.Label.InStudio",
		[userModel.PresenceType.OFFLINE] = "InGame.Presence.Label.Offline"
	},
	InviteStatus = {
		Success = "Success",
		Moderated = "Moderated",
		Failed = "Failed",
		Pending = "Pending"
	},
	DeviceOrientation = {
		PORTRAIT = "PORTRAIT",
		LANDSCAPE = "LANDSCAPE",
		INVALID = "INVALID"
	},
	PageRoute = {
		NONE = "NONE",
		SETTINGS_HUB = "SETTINGS_HUB",
		SHARE_GAME = "SHARE_GAME"
	},
	DeviceLayout = t,
	LayoutSpecific = {
		[t.PHONE_LANDSCAPE] = {
			HEADER_HEIGHT = 40,
			PAGE_TITLE_TEXT_SIZE = 23,
			SEARCH_BOX_MARGIN = 12,
			PAGE_SIDE_MARGINS = 7,
			BACK_BUTTON_HEIGHT = 44,
			BACK_BUTTON_WIDTH = 44,
			BACK_BUTTON_MODAL_WIDTH = 44,
			EXTEND_BOTTOM_SIZE = 0,
			TOAST_HEIGHT = 40
		},
		[t.PHONE_PORTRAIT] = {
			HEADER_HEIGHT = 40,
			PAGE_TITLE_TEXT_SIZE = 23,
			SEARCH_BOX_MARGIN = 15,
			PAGE_SIDE_MARGINS = 5,
			BACK_BUTTON_HEIGHT = 44,
			BACK_BUTTON_WIDTH = 44,
			BACK_BUTTON_MODAL_WIDTH = 44,
			EXTEND_BOTTOM_SIZE = 0,
			TOAST_HEIGHT = 40
		},
		[t.TABLET_PORTRAIT] = {
			HEADER_HEIGHT = 40,
			PAGE_TITLE_TEXT_SIZE = 23,
			SEARCH_BOX_MARGIN = 15,
			PAGE_SIDE_MARGINS = 15,
			BACK_BUTTON_HEIGHT = 44,
			BACK_BUTTON_WIDTH = 44,
			BACK_BUTTON_MODAL_WIDTH = 44,
			EXTEND_BOTTOM_SIZE = 0,
			TOAST_HEIGHT = 80
		},
		[t.TABLET_LANDSCAPE] = {
			HEADER_HEIGHT = 60,
			PAGE_TITLE_TEXT_SIZE = 23,
			SEARCH_BOX_MARGIN = 15,
			PAGE_SIDE_MARGINS = 5,
			BACK_BUTTON_HEIGHT = 44,
			BACK_BUTTON_WIDTH = 44,
			BACK_BUTTON_MODAL_WIDTH = 44,
			EXTEND_BOTTOM_SIZE = 68,
			TOAST_HEIGHT = 80
		},
		[t.DESKTOP] = {
			HEADER_HEIGHT = 60,
			PAGE_TITLE_TEXT_SIZE = 29,
			SEARCH_BOX_MARGIN = 0,
			PAGE_SIDE_MARGINS = 0,
			BACK_BUTTON_HEIGHT = 44,
			BACK_BUTTON_WIDTH = 154,
			BACK_BUTTON_MODAL_WIDTH = 44,
			EXTEND_BOTTOM_SIZE = 68,
			TOAST_HEIGHT = 80
		}
	},
	Triggers = {
		DeveloperMultiple = "DeveloperMultiple",
		DeveloperSingle = "DeveloperSingle",
		GameMenu = "GameMenu"
	},
	InviteAvatarThumbnailType = constants.RbxAvatarThumbnailTypesFromEnum.HeadShot,
	InviteAvatarThumbnailSize = constants.RbxThumbnailSizes.Size150x150,
	InviteAvatarRbxthumbType = constants.RbxthumbTypes.AvatarHeadShot
}
t_2.ThumbnailRequest = {
	InviteToGame = {
		thumbnailRequest.fromData(t_2.InviteAvatarThumbnailType, t_2.InviteAvatarThumbnailSize)
	}
}

return t_2