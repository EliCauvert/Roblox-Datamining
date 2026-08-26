local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local roactUtilsModule = require(parent.RoactUtils)
local editProfileImageModule = require(script.Parent.EditProfileImage)
local enumsModule = require(avatarExperienceProfilePictureEditor.Common.Enums)
local closeProfilePictureEditorModule = require(avatarExperienceProfilePictureEditor.Utils.closeProfilePictureEditor)
local showEditProfileImageToastModule = require(avatarExperienceProfilePictureEditor.Utils.showEditProfileImageToast)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch

return roactNavigationModule.withNavigationFocus(function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), closeProfilePictureEditorModule (ref), showEditProfileImageToastModule (ref), enumsModule (ref), editProfileImageModule (ref)
	local var1 = useDispatch()
	
	return reactModule.createElement(editProfileImageModule, {
		mode = if p1.navigation.getParam then p1.navigation.getParam("mode", enumsModule.EditProfileImageMode.Default) else enumsModule.EditProfileImageMode.Default,
		fullBleed = if p1.navigation.getParam then p1.navigation.getParam("fullBleed") else nil,
		showCloseButton = p1.isFocused ~= false,
		onClose = reactModule.useCallback(function()
			-- upvalues: closeProfilePictureEditorModule (copy), p1 (ref)
			closeProfilePictureEditorModule(p1.navigation)
		end, { p1.navigation }),
		onSaveSuccess = reactModule.useCallback(function()
			-- upvalues: showEditProfileImageToastModule (copy), var1 (ref), closeProfilePictureEditorModule (copy), p1 (ref)
			showEditProfileImageToastModule.showSaveSuccessToast(var1)
			closeProfilePictureEditorModule(p1.navigation)
		end, { var1, p1.navigation }),
		onOpenEmoteDetails = p1.onOpenEmoteDetails,
		onPrepareRecommendedEmotePurchase = p1.onPrepareRecommendedEmotePurchase,
		onShopForMoreEmotes = p1.onShopForMoreEmotes,
		renderRecommendedEmotePurchaseFooter = p1.renderRecommendedEmotePurchaseFooter
	})
end)