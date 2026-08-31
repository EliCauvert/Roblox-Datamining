local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local badgeShape = foundationModule.Enums.BadgeShape
local badgeVariant = foundationModule.Enums.BadgeVariant
local badge = foundationModule.Badge
local list = foundationModule.List
local view = foundationModule.View
local useLocalization = require(parent.Localization).Hooks.useLocalization
local avatarExperienceProfilePictureEditorModule = require(parent.AvatarExperienceProfilePictureEditor)
local profileFramePreviewThumbnail = avatarExperienceProfilePictureEditorModule.ProfileFramePreviewThumbnail
local useUserAvatarConfigurations = avatarExperienceProfilePictureEditorModule.useUserAvatarConfigurations
local useProfileFramesNewLabelModule = require(editProfile.Hooks.useProfileFramesNewLabel)
local textKeysModule = require(editProfile.Common.TextKeys)
local fFlagProfileFramesNewLabelEnabledModule = require(editProfile.Flags.FFlagProfileFramesNewLabelEnabled)
local t = {
	isContained = true,
	hasDivider = { hasDivider = true, isInset = false }
}

return function(p1)
	-- upvalues: useLocalization (ref), textKeysModule (ref), useUserAvatarConfigurations (ref), useProfileFramesNewLabelModule (ref), fFlagProfileFramesNewLabelEnabledModule (ref), reactModule (ref), list (ref), t (ref), view (ref), badge (ref), badgeVariant (ref), badgeShape (ref), profileFramePreviewThumbnail (ref)
	local var1 = useLocalization({
		ProfileFrameLabel = textKeysModule.ProfileFrame,
		NewLabel = textKeysModule.New
	})
	local _, var2, var3 = useUserAvatarConfigurations(p1.userId)
	local var4, var5 = useProfileFramesNewLabelModule()
	
	return reactModule.createElement(list.Root, {
		testId = "ProfileFramesList",
		LayoutOrder = p1.layoutOrder,
		isContained = t.isContained,
		hasDivider = t.hasDivider
	}, {
		ProfileFramesRow = reactModule.createElement(list.Item, {
			testId = "ProfileFramesRow",
			LayoutOrder = 1,
			title = var1.ProfileFrameLabel,
			trailing = reactModule.createElement(view, { tag = "row align-y-center gap-small auto-xy" }, {
				NewLabel = if fFlagProfileFramesNewLabelEnabledModule and var4 then reactModule.createElement(badge, {
					text = var1.NewLabel,
					variant = badgeVariant.Contrast,
					shape = badgeShape.Box
				}) else nil,
				ProfileFramePreview = if fFlagProfileFramesNewLabelEnabledModule and var4 then nil else reactModule.createElement(profileFramePreviewThumbnail, { frameAssetId = var2, isLoading = var3 == true })
			}),
			onActivated = if var3 then nil else {
				onActivated = function()
					-- upvalues: fFlagProfileFramesNewLabelEnabledModule (copy), var5 (ref), p1 (ref)
					if fFlagProfileFramesNewLabelEnabledModule then
						var5()
					end
					p1.onActivated()
				end
			}
		})
	})
end