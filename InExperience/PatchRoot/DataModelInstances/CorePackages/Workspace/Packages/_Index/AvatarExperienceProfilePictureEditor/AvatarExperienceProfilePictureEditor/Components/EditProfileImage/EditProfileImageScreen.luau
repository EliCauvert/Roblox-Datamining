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

return roactNavigationModule.withNavigationFocus(function(p0) --[[ line: 23 | named "EditProfileImageScreen" ]]
	-- upvalues: useDispatch (ref), reactModule (ref), closeProfilePictureEditorModule (ref), showEditProfileImageToastModule (ref), enumsModule (ref), editProfileImageModule (ref)
	local var8 = useDispatch()
	
	return reactModule.createElement(editProfileImageModule, {
		mode = if p0.navigation.getParam then p0.navigation.getParam("mode", enumsModule.EditProfileImageMode.Default) else enumsModule.EditProfileImageMode.Default,
		fullBleed = if p0.navigation.getParam then p0.navigation.getParam("fullBleed") else nil,
		showCloseButton = p0.isFocused ~= false,
		onClose = reactModule.useCallback(function() --[[ line: 26 ]]
			-- upvalues: closeProfilePictureEditorModule (copy), p0 (ref)
			closeProfilePictureEditorModule(p0.navigation)
		end, { p0.navigation }),
		onSaveSuccess = reactModule.useCallback(function() --[[ line: 30 ]]
			-- upvalues: showEditProfileImageToastModule (copy), var8 (ref), closeProfilePictureEditorModule (copy), p0 (ref)
			showEditProfileImageToastModule.showSaveSuccessToast(var8)
			closeProfilePictureEditorModule(p0.navigation)
		end, { var8, p0.navigation }),
		onOpenEmoteDetails = p0.onOpenEmoteDetails,
		onPrepareRecommendedEmotePurchase = p0.onPrepareRecommendedEmotePurchase,
		onShopForMoreEmotes = p0.onShopForMoreEmotes,
		renderRecommendedEmotePurchaseFooter = p0.renderRecommendedEmotePurchaseFooter
	})
end)