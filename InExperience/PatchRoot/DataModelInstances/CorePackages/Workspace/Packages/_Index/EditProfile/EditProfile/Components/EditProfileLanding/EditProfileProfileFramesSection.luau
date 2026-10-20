local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local BadgeShape = FoundationModule.Enums.BadgeShape
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local Badge = FoundationModule.Badge
local List = FoundationModule.List
local View = FoundationModule.View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AvatarExperienceProfilePictureEditorModule = require(Parent.AvatarExperienceProfilePictureEditor)
local ProfileFramePreviewThumbnail = AvatarExperienceProfilePictureEditorModule.ProfileFramePreviewThumbnail
local UseUserAvatarConfigurationsFunction = AvatarExperienceProfilePictureEditorModule.useUserAvatarConfigurations
local UseProfileFramesNewLabelModule = require(EditProfile.Hooks.useProfileFramesNewLabel)
local TextKeysModule = require(EditProfile.Common.TextKeys)
local FFlagProfileFramesNewLabelEnabledModule = require(EditProfile.Flags.FFlagProfileFramesNewLabelEnabled)
local config = {
	isContained = true,
	hasDivider = { hasDivider = true, isInset = false }
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), UseUserAvatarConfigurationsFunction (copy), UseProfileFramesNewLabelModule (copy), FFlagProfileFramesNewLabelEnabledModule (copy), ReactModule (copy), List (copy), config (copy), View (copy), Badge (copy), BadgeVariant (copy), BadgeShape (copy), ProfileFramePreviewThumbnail (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		ProfileFrameLabel = TextKeysModule.ProfileFrame,
		NewLabel = TextKeysModule.New
	})
	local _, UseUserAvatarConfigurationsResult2, UseUserAvatarConfigurationsResult3 = UseUserAvatarConfigurationsFunction(p1.userId)
	local UseProfileFramesNewLabelModuleResult, UseProfileFramesNewLabelModuleResult2 = UseProfileFramesNewLabelModule()
	
	local function OnActivated()
		-- upvalues: FFlagProfileFramesNewLabelEnabledModule (upval), UseProfileFramesNewLabelModuleResult2 (copy), p1 (copy)
		if FFlagProfileFramesNewLabelEnabledModule then
			UseProfileFramesNewLabelModuleResult2()
		end
		p1.onActivated()
	end
	
	return ReactModule.createElement(List.Root, {
		testId = "ProfileFramesList",
		LayoutOrder = p1.layoutOrder,
		isContained = config.isContained,
		hasDivider = config.hasDivider
	}, {
		ProfileFramesRow = ReactModule.createElement(List.Item, {
			testId = "ProfileFramesRow",
			LayoutOrder = 1,
			title = UseLocalizationResult.ProfileFrameLabel,
			trailing = ReactModule.createElement(View, { tag = "row align-y-center gap-small auto-xy" }, {
				NewLabel = if FFlagProfileFramesNewLabelEnabledModule and UseProfileFramesNewLabelModuleResult then ReactModule.createElement(Badge, {
					text = UseLocalizationResult.NewLabel,
					variant = BadgeVariant.Contrast,
					shape = BadgeShape.Box
				}) else nil,
				ProfileFramePreview = if FFlagProfileFramesNewLabelEnabledModule and UseProfileFramesNewLabelModuleResult then nil else ReactModule.createElement(ProfileFramePreviewThumbnail, {
					frameAssetId = UseUserAvatarConfigurationsResult2,
					isLoading = UseUserAvatarConfigurationsResult3 == true
				})
			}),
			onActivated = if UseUserAvatarConfigurationsResult3 then nil else { onActivated = OnActivated }
		})
	})
end