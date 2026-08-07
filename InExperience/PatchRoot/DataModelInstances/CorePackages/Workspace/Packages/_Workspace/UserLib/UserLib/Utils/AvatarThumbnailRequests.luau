local userLib = script:FindFirstAncestor("UserLib")
local constantsModule = require(userLib.Utils.Constants)
local thumbnailRequestModule = require(userLib.Utils.ThumbnailRequest)

return {
	USER_CAROUSEL = {
		thumbnailRequestModule.fromData(constantsModule.RbxAvatarThumbnailTypesFromEnum.AvatarThumbnail, constantsModule.RbxThumbnailSizes.Size100x100)
	},
	USER_CAROUSEL_HEAD_SHOT = {
		thumbnailRequestModule.fromData(constantsModule.RbxAvatarThumbnailTypesFromEnum.HeadShot, constantsModule.RbxThumbnailSizes.Size150x150)
	},
	USER_CAROUSEL_AVATAR_THUMBNAIL = {
		thumbnailRequestModule.fromData(constantsModule.RbxAvatarThumbnailTypesFromEnum.AvatarThumbnail, constantsModule.RbxThumbnailSizes.Size150x150)
	},
	HOME_HEADER_USER = {
		thumbnailRequestModule.fromData(constantsModule.RbxAvatarThumbnailTypesFromEnum.HeadShot, constantsModule.RbxThumbnailSizes.Size150x150)
	},
	FRIEND_CAROUSEL = {
		thumbnailRequestModule.fromData(constantsModule.RbxAvatarThumbnailTypesFromEnum.HeadShot, constantsModule.RbxThumbnailSizes.Size48x48)
	},
	CUSTOMIZE_BUTTON = {
		thumbnailRequestModule.fromData(constantsModule.RbxAvatarThumbnailTypesFromEnum.AvatarThumbnail, constantsModule.RbxThumbnailSizes.Size720x720)
	}
}