local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local badgeShape = foundationModule.Enums.BadgeShape
local badgeVariant = foundationModule.Enums.BadgeVariant
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local radius = foundationModule.Enums.Radius
local badge = foundationModule.Badge
local iconButton = foundationModule.IconButton
local list = foundationModule.List
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useProfileCardWidth = require(parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local userTileModule = require(parent.UserTile)
local editProfileHeaderBarModule = require(editProfile.BaseComponents.EditProfileHeaderBar)
local profileFramePreviewThumbnail = require(parent.AvatarExperienceProfilePictureEditor).ProfileFramePreviewThumbnail
local textKeysModule = require(editProfile.Common.TextKeys)
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local fFlagEditProfileFramesEnabled2 = require(parent.SharedFlags).FFlagEditProfileFramesEnabled2
local t = {
	isContained = true,
	hasDivider = { hasDivider = true, isInset = false }
}

local function renderRowTrailing(p0, p1, p2) --[[ line: 64 ]]
	-- upvalues: reactModule (ref), skeleton (ref), radius (ref), text (ref)
	return if p0 then reactModule.createElement(skeleton, { Size = UDim2.new(0.3, 0, 0, p2), radius = radius.Medium }) else reactModule.createElement(text, {
		tag = "auto-xy text-body-small text-truncate-end",
		Text = p1
	})
end

return function(p3) --[[ line: 78 | named "EditProfileLandingV2" ]]
	-- upvalues: useProfileCardWidth (ref), useTokens (ref), fFlagAXEnableProfileTab (ref), textKeysModule (ref), useLocalization (ref), reactModule (ref), view (ref), editProfileHeaderBarModule (ref), userTileModule (ref), iconButton (ref), iconName (ref), iconSize (ref), buttonVariant (ref), list (ref), t (ref), renderRowTrailing (ref), fFlagEditProfileFramesEnabled2 (ref), badge (ref), badgeVariant (ref), badgeShape (ref), profileFramePreviewThumbnail (ref)
	local var8 = useProfileCardWidth()
	local var9 = useTokens()
	local var10 = fFlagAXEnableProfileTab and p3.fullBleed == true
	local var11 = useLocalization({
		TopBarTitle = textKeysModule.Title,
		UsernameLabel = textKeysModule.Username,
		DisplayNameLabel = if p3.isPolicyEnabled then textKeysModule.AgedUpDisplayName else textKeysModule.DisplayName,
		BioLabel = textKeysModule.About,
		BioPlaceholder = textKeysModule.AboutPlaceholder,
		ProfileFrameLabel = textKeysModule.ProfileFrame,
		NewLabel = textKeysModule.New
	})
	local size400 = var9.Size.Size_400
	
	return reactModule.createElement(view, {
		tag = if fFlagAXEnableProfileTab then {
			["col items-start bg-surface-0"] = true,
			["position-top-right anchor-top-right"] = not var10,
			["size-full-full"] = var10
		} else "col items-start position-top-right anchor-top-right bg-surface-0",
		Size = if var10 then nil else UDim2.new(0, var8, 1, 0)
	}, {
		TopBar = reactModule.createElement(editProfileHeaderBarModule, { onClose = p3.onClose, headerText = var11.TopBarTitle }),
		EditableComponents = reactModule.createElement(view, {
			tag = "col gap-xxlarge size-full-0 auto-y padding-xlarge"
		}, {
			AvatarEditRow = reactModule.createElement(view, { tag = "size-full-2400", LayoutOrder = 1 }, {
				AvatarContainer = reactModule.createElement(view, {
					tag = "position-center-center anchor-center-center size-2400-2400"
				}, {
					AvatarHeadshot = reactModule.createElement(view, { tag = "size-full-full" }, {
						UserTile = reactModule.createElement(userTileModule.UserTile, {
							userId = p3.userId,
							layoutMode = userTileModule.LayoutMode.compact,
							onActivated = p3.settingButtonOnActivated.avatar
						})
					}),
					EditAvatarIconButton = reactModule.createElement(view, {
						tag = "position-bottom-right anchor-bottom-right auto-xy radius-circle bg-over-media-0"
					}, {
						IconButton = reactModule.createElement(iconButton, {
							isCircular = true,
							icon = iconName.PhotoCamera,
							size = iconSize.Small,
							onActivated = p3.settingButtonOnActivated.avatar,
							variant = buttonVariant.Standard
						})
					})
				})
			}),
			TextComponentsList = reactModule.createElement(list.Root, {
				testId = "TextComponentsList",
				LayoutOrder = 2,
				isContained = t.isContained,
				hasDivider = t.hasDivider
			}, {
				EditDisplayNameRow = reactModule.createElement(list.Item, {
					testId = "EditDisplayNameRow",
					LayoutOrder = 1,
					title = var11.DisplayNameLabel,
					trailing = renderRowTrailing(p3.areNamesLoading, p3.displayName, size400),
					onActivated = if p3.areNamesLoading then nil else { onActivated = p3.settingButtonOnActivated.displayName },
					ref = p3.firstItemRef
				}),
				UsernameEditRow = reactModule.createElement(list.Item, {
					testId = "UsernameEditRow",
					LayoutOrder = 2,
					title = var11.UsernameLabel,
					trailing = renderRowTrailing(p3.areNamesLoading, p3.username, size400),
					onActivated = if p3.areNamesLoading then nil else { onActivated = p3.settingButtonOnActivated.username }
				}),
				BioEditRow = reactModule.createElement(list.Item, {
					testId = "BioEditRow",
					LayoutOrder = 3,
					title = var11.BioLabel,
					trailing = renderRowTrailing(p3.isBioLoading, if p3.bioText == "" or p3.bioText == nil then var11.BioPlaceholder else string.gsub(p3.bioText, "\n", " "), size400),
					onActivated = if p3.isBioLoading then nil else { onActivated = p3.settingButtonOnActivated.bio }
				})
			}),
			ProfileFramesList = if fFlagEditProfileFramesEnabled2 then reactModule.createElement(list.Root, {
				testId = "ProfileFramesList",
				LayoutOrder = 3,
				isContained = t.isContained,
				hasDivider = t.hasDivider
			}, {
				ProfileFramesRow = reactModule.createElement(list.Item, {
					testId = "ProfileFramesRow",
					LayoutOrder = 1,
					title = var11.ProfileFrameLabel,
					trailing = reactModule.createElement(view, { tag = "row align-y-center gap-small auto-xy" }, {
						NewLabel = if p3.showProfileFramesNewLabel then reactModule.createElement(badge, {
							text = var11.NewLabel,
							variant = badgeVariant.Neutral,
							shape = badgeShape.Box
						}) else nil,
						ProfileFramePreview = reactModule.createElement(profileFramePreviewThumbnail, {
							frameAssetId = p3.profileFrameAssetId,
							isLoading = p3.isProfileFrameLoading == true
						})
					}),
					onActivated = if p3.isProfileFrameLoading then nil else { onActivated = p3.settingButtonOnActivated.profileFrames }
				})
			}) else nil
		})
	})
end