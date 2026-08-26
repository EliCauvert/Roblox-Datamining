local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useProfileCardWidth = require(parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local userTileModule = require(parent.UserTile)
local editComponentRowModule = require(editProfile.BaseComponents.EditComponentRow)
local editProfileHeaderBarModule = require(editProfile.BaseComponents.EditProfileHeaderBar)
local textKeysModule = require(editProfile.Common.TextKeys)
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab

return function(p1)
	-- upvalues: useProfileCardWidth (ref), fFlagAXEnableProfileTab (ref), textKeysModule (ref), useLocalization (ref), reactModule (ref), view (ref), editProfileHeaderBarModule (ref), userTileModule (ref), iconButton (ref), iconName (ref), iconSize (ref), buttonVariant (ref), editComponentRowModule (ref)
	local var1 = useProfileCardWidth()
	local var2 = fFlagAXEnableProfileTab and p1.fullBleed == true
	local var3 = useLocalization({
		TopBarTitle = textKeysModule.Title,
		UsernameLabel = textKeysModule.Username,
		DisplayNameLabel = if p1.isPolicyEnabled then textKeysModule.AgedUpDisplayName else textKeysModule.DisplayName,
		BioLabel = textKeysModule.About,
		BioPlaceholder = textKeysModule.AboutPlaceholder
	})
	
	return reactModule.createElement(view, {
		tag = if fFlagAXEnableProfileTab then {
			["col items-start bg-surface-0"] = true,
			["position-top-right anchor-top-right"] = not var2,
			["size-full-full"] = var2
		} else "col items-start position-top-right anchor-top-right bg-surface-0",
		Size = if var2 then nil else UDim2.new(0, var1, 1, 0)
	}, {
		TopBar = reactModule.createElement(editProfileHeaderBarModule, { onClose = p1.onClose, headerText = var3.TopBarTitle }),
		EditableComponents = reactModule.createElement(view, {
			tag = "col padding-xlarge gap-xxlarge size-full-0 auto-y"
		}, {
			AvatarEditRow = reactModule.createElement(view, { tag = "size-full-2400", LayoutOrder = 1 }, {
				AvatarContainer = reactModule.createElement(view, {
					tag = "size-2400-2400 position-center-center anchor-center-center"
				}, {
					AvatarHeadshot = reactModule.createElement(view, { tag = "size-full-full" }, {
						UserTile = reactModule.createElement(userTileModule.UserTile, {
							userId = p1.userId,
							layoutMode = userTileModule.LayoutMode.compact,
							onActivated = p1.settingButtonOnActivated.avatar
						})
					}),
					EditAvatarIconButton = reactModule.createElement(view, {
						tag = "position-bottom-right anchor-bottom-right auto-xy bg-over-media-0 radius-circle"
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
			TextComponentsList = reactModule.createElement(view, {
				tag = "col size-full-0 auto-y bg-surface-100 radius-medium",
				LayoutOrder = 2
			}, {
				EditDisplayNameRow = reactModule.createElement(editComponentRowModule, {
					layoutOrder = 1,
					label = var3.DisplayNameLabel,
					currentValue = p1.displayName,
					onActivated = if p1.areNamesLoading then function() end else p1.settingButtonOnActivated.displayName,
					shouldShimmer = p1.areNamesLoading,
					forwardRef = p1.firstItemRef
				}),
				UsernameEditRow = reactModule.createElement(editComponentRowModule, {
					layoutOrder = 2,
					label = var3.UsernameLabel,
					currentValue = p1.username,
					onActivated = p1.settingButtonOnActivated.username,
					shouldShimmer = p1.areNamesLoading
				}),
				BioEditRow = reactModule.createElement(editComponentRowModule, {
					layoutOrder = 3,
					label = var3.BioLabel,
					currentValue = if p1.bioText == "" or p1.bioText == nil then var3.BioPlaceholder else p1.bioText,
					onActivated = p1.settingButtonOnActivated.bio,
					shouldShimmer = p1.isBioLoading
				})
			})
		})
	})
end