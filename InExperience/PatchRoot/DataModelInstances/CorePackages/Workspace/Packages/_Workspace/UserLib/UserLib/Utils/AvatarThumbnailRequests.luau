local UserLib = script:FindFirstAncestor("UserLib")
local ConstantsModule = require(UserLib.Utils.Constants)
local ThumbnailRequestModule = require(UserLib.Utils.ThumbnailRequest)

return {
	USER_CAROUSEL = {
		ThumbnailRequestModule.fromData(ConstantsModule.RbxAvatarThumbnailTypesFromEnum.AvatarThumbnail, ConstantsModule.RbxThumbnailSizes.Size100x100)
	},
	USER_CAROUSEL_HEAD_SHOT = {
		ThumbnailRequestModule.fromData(ConstantsModule.RbxAvatarThumbnailTypesFromEnum.HeadShot, ConstantsModule.RbxThumbnailSizes.Size150x150)
	},
	USER_CAROUSEL_AVATAR_THUMBNAIL = {
		ThumbnailRequestModule.fromData(ConstantsModule.RbxAvatarThumbnailTypesFromEnum.AvatarThumbnail, ConstantsModule.RbxThumbnailSizes.Size150x150)
	},
	HOME_HEADER_USER = {
		ThumbnailRequestModule.fromData(ConstantsModule.RbxAvatarThumbnailTypesFromEnum.HeadShot, ConstantsModule.RbxThumbnailSizes.Size150x150)
	},
	FRIEND_CAROUSEL = {
		ThumbnailRequestModule.fromData(ConstantsModule.RbxAvatarThumbnailTypesFromEnum.HeadShot, ConstantsModule.RbxThumbnailSizes.Size48x48)
	},
	CUSTOMIZE_BUTTON = {
		ThumbnailRequestModule.fromData(ConstantsModule.RbxAvatarThumbnailTypesFromEnum.AvatarThumbnail, ConstantsModule.RbxThumbnailSizes.Size720x720)
	}
}