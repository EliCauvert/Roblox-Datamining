local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local RoactUtilsModule = require(Parent.RoactUtils)
local EditProfileImageModule = require(script.Parent.EditProfileImage)
local EnumsModule = require(AvatarExperienceProfilePictureEditor.Common.Enums)
local FFlagNavigationCallbackParam = require(Parent.SharedFlags).FFlagNavigationCallbackParam
local CloseProfilePictureEditorModule = require(AvatarExperienceProfilePictureEditor.Utils.closeProfilePictureEditor)
local LeaveEditProfileImageModule = require(AvatarExperienceProfilePictureEditor.Utils.leaveEditProfileImage)
local ShowEditProfileImageToastModule = require(AvatarExperienceProfilePictureEditor.Utils.showEditProfileImageToast)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch

return RoactNavigationModule.withNavigationFocus(function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), FFlagNavigationCallbackParam (copy), LeaveEditProfileImageModule (copy), CloseProfilePictureEditorModule (copy), ShowEditProfileImageToastModule (copy), EnumsModule (copy), EditProfileImageModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.createElement(EditProfileImageModule, {
		mode = if p1.navigation.getParam then p1.navigation.getParam("mode", EnumsModule.EditProfileImageMode.Default) else EnumsModule.EditProfileImageMode.Default,
		initialFrameAssetId = p1.initialFrameAssetId,
		initialFrameSelectionRequestId = p1.initialFrameSelectionRequestId,
		showCloseButton = p1.isFocused ~= false,
		onClose = ReactModule.useCallback(function()
			-- upvalues: FFlagNavigationCallbackParam (upval), LeaveEditProfileImageModule (upval), p1 (copy), CloseProfilePictureEditorModule (upval)
			if FFlagNavigationCallbackParam then
				LeaveEditProfileImageModule(p1.navigation, p1.onReturn)
				
				return
			else
				CloseProfilePictureEditorModule(p1.navigation)
			end
		end, { p1.navigation, p1.onReturn }),
		onSaveSuccess = ReactModule.useCallback(function()
			-- upvalues: ShowEditProfileImageToastModule (upval), UseDispatchResult (copy), FFlagNavigationCallbackParam (upval), LeaveEditProfileImageModule (upval), p1 (copy), CloseProfilePictureEditorModule (upval)
			ShowEditProfileImageToastModule.showSaveSuccessToast(UseDispatchResult)
			
			if FFlagNavigationCallbackParam then
				LeaveEditProfileImageModule(p1.navigation, p1.onReturn)
				
				return
			else
				CloseProfilePictureEditorModule(p1.navigation)
			end
		end, { UseDispatchResult, p1.navigation, p1.onReturn }),
		onOpenEmoteDetails = p1.onOpenEmoteDetails,
		onPrepareRecommendedEmotePurchase = p1.onPrepareRecommendedEmotePurchase,
		onShopForMoreEmotes = p1.onShopForMoreEmotes,
		onPromptR15Upgrade = p1.onPromptR15Upgrade,
		accountRigType = p1.accountRigType,
		renderRecommendedEmotePurchaseFooter = p1.renderRecommendedEmotePurchaseFooter
	})
end)