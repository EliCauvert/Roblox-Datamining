local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local EditProfileImageModule = require(script.Parent.EditProfileImage)
local EnumsModule = require(AvatarExperienceProfilePictureEditor.Common.Enums)
local CloseProfilePictureEditorModule = require(AvatarExperienceProfilePictureEditor.Utils.closeProfilePictureEditor)
local ShowEditProfileImageToastModule = require(AvatarExperienceProfilePictureEditor.Utils.showEditProfileImageToast)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch

return require(Parent.RoactNavigation).withNavigationFocus(function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), CloseProfilePictureEditorModule (copy), ShowEditProfileImageToastModule (copy), EnumsModule (copy), EditProfileImageModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.createElement(EditProfileImageModule, {
		mode = if p1.navigation.getParam then p1.navigation.getParam("mode", EnumsModule.EditProfileImageMode.Default) else EnumsModule.EditProfileImageMode.Default,
		initialFrameAssetId = p1.initialFrameAssetId,
		initialFrameSelectionRequestId = p1.initialFrameSelectionRequestId,
		showCloseButton = p1.isFocused ~= false,
		onClose = ReactModule.useCallback(function()
			-- upvalues: CloseProfilePictureEditorModule (upval), p1 (copy)
			CloseProfilePictureEditorModule(p1.navigation)
		end, { p1.navigation }),
		onSaveSuccess = ReactModule.useCallback(function()
			-- upvalues: ShowEditProfileImageToastModule (upval), UseDispatchResult (copy), CloseProfilePictureEditorModule (upval), p1 (copy)
			ShowEditProfileImageToastModule.showSaveSuccessToast(UseDispatchResult)
			CloseProfilePictureEditorModule(p1.navigation)
		end, { UseDispatchResult, p1.navigation }),
		onOpenEmoteDetails = p1.onOpenEmoteDetails,
		onPrepareRecommendedEmotePurchase = p1.onPrepareRecommendedEmotePurchase,
		onShopForMoreEmotes = p1.onShopForMoreEmotes,
		onPromptR15Upgrade = p1.onPromptR15Upgrade,
		accountRigType = p1.accountRigType,
		renderRecommendedEmotePurchaseFooter = p1.renderRecommendedEmotePurchaseFooter
	})
end)