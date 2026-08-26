local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local radius = foundationModule.Enums.Radius
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
local textKeysModule = require(editProfile.Common.TextKeys)
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local fFlagFixNonTruncatedTextModule = require(editProfile.Flags.FFlagFixNonTruncatedText)
local editProfileLandingTrailingWidthRatio = tonumber(game:DefineFastString("EditProfileLandingTrailingWidthRatio", "0.4")) or 0.4
local t = {
	isContained = true,
	hasDivider = { hasDivider = true, isInset = false }
}

local function renderRowTrailing(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), skeleton (ref), radius (ref), fFlagFixNonTruncatedTextModule (ref), text (ref), editProfileLandingTrailingWidthRatio (ref)
	return if p1 then reactModule.createElement(skeleton, { Size = UDim2.new(0.3, 0, 0, p3), radius = radius.Medium }) elseif fFlagFixNonTruncatedTextModule and p4 ~= nil then reactModule.createElement(text, {
		tag = "auto-y text-body-small text-align-x-right text-truncate-end",
		Text = p2,
		Size = UDim2.new(0, p4 * editProfileLandingTrailingWidthRatio, 0, 0)
	}) else reactModule.createElement(text, {
		tag = "auto-xy text-body-small text-truncate-end",
		Text = p2
	})
end

return function(p1)
	-- upvalues: useProfileCardWidth (ref), useTokens (ref), fFlagAXEnableProfileTab (ref), textKeysModule (ref), useLocalization (ref), reactModule (ref), view (ref), editProfileHeaderBarModule (ref), userTileModule (ref), iconButton (ref), iconName (ref), iconSize (ref), buttonVariant (ref), list (ref), t (ref), renderRowTrailing (ref), fFlagFixNonTruncatedTextModule (ref)
	local var1 = useProfileCardWidth()
	local var2 = useTokens()
	local var3 = fFlagAXEnableProfileTab and p1.fullBleed == true
	local var4 = useLocalization({
		TopBarTitle = textKeysModule.Title,
		UsernameLabel = textKeysModule.Username,
		DisplayNameLabel = if p1.isPolicyEnabled then textKeysModule.AgedUpDisplayName else textKeysModule.DisplayName,
		BioLabel = textKeysModule.About,
		BioPlaceholder = textKeysModule.AboutPlaceholder
	})
	local size400 = var2.Size.Size_400
	
	return reactModule.createElement(view, {
		tag = if fFlagAXEnableProfileTab then {
			["col items-start bg-surface-0"] = true,
			["position-top-right anchor-top-right"] = not var3,
			["size-full-full"] = var3
		} else "col items-start position-top-right anchor-top-right bg-surface-0",
		Size = if var3 then nil else UDim2.new(0, var1, 1, 0)
	}, {
		TopBar = reactModule.createElement(editProfileHeaderBarModule, { onClose = p1.onClose, headerText = var4.TopBarTitle }),
		EditableComponents = reactModule.createElement(view, {
			tag = "col gap-xxlarge size-full-0 auto-y padding-xlarge"
		}, {
			AvatarEditRow = reactModule.createElement(view, { tag = "size-full-2400", LayoutOrder = 1 }, {
				AvatarContainer = reactModule.createElement(view, {
					tag = "position-center-center anchor-center-center size-2400-2400"
				}, {
					AvatarHeadshot = reactModule.createElement(view, { tag = "size-full-full" }, {
						UserTile = reactModule.createElement(userTileModule.UserTile, {
							userId = p1.userId,
							layoutMode = userTileModule.LayoutMode.compact,
							onActivated = p1.settingButtonOnActivated.avatar
						})
					}),
					EditAvatarIconButton = reactModule.createElement(view, {
						tag = "position-bottom-right anchor-bottom-right auto-xy radius-circle bg-over-media-0"
					}, {
						IconButton = reactModule.createElement(iconButton, {
							isCircular = true,
							icon = iconName.PhotoCamera,
							size = iconSize.Small,
							onActivated = p1.settingButtonOnActivated.avatar,
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
					title = var4.DisplayNameLabel,
					trailing = renderRowTrailing(p1.areNamesLoading, p1.displayName, size400, if fFlagFixNonTruncatedTextModule then var1 else nil),
					onActivated = if p1.areNamesLoading then nil else { onActivated = p1.settingButtonOnActivated.displayName },
					ref = p1.firstItemRef
				}),
				UsernameEditRow = reactModule.createElement(list.Item, {
					testId = "UsernameEditRow",
					LayoutOrder = 2,
					title = var4.UsernameLabel,
					trailing = renderRowTrailing(p1.areNamesLoading, p1.username, size400, if fFlagFixNonTruncatedTextModule then var1 else nil),
					onActivated = if p1.areNamesLoading then nil else { onActivated = p1.settingButtonOnActivated.username }
				}),
				BioEditRow = reactModule.createElement(list.Item, {
					testId = "BioEditRow",
					LayoutOrder = 3,
					title = var4.BioLabel,
					trailing = renderRowTrailing(p1.isBioLoading, if p1.bioText == "" or p1.bioText == nil then var4.BioPlaceholder else string.gsub(p1.bioText, "\n", " "), size400, if fFlagFixNonTruncatedTextModule then var1 else nil),
					onActivated = if p1.isBioLoading then nil else { onActivated = p1.settingButtonOnActivated.bio }
				})
			})
		})
	})
end