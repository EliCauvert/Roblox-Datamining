local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseProfileCardWidthFunction = require(Parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local UserTileModule = require(Parent.UserTile)
local EditComponentRowModule = require(EditProfile.BaseComponents.EditComponentRow)
local EditProfileHeaderBarModule = require(EditProfile.BaseComponents.EditProfileHeaderBar)
local TextKeysModule = require(EditProfile.Common.TextKeys)
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab

return function(p1) --[[ Line: 42 | Named "EditProfileLanding" ]]
	-- upvalues: UseProfileCardWidthFunction (copy), FFlagAXEnableProfileTab (copy), TextKeysModule (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), EditProfileHeaderBarModule (copy), UserTileModule (copy), IconButton (copy), IconName (copy), IconSize (copy), ButtonVariant (copy), EditComponentRowModule (copy)
	local UseProfileCardWidthResult = UseProfileCardWidthFunction()
	local IsFullBleed: boolean = FFlagAXEnableProfileTab and p1.fullBleed == true
	local UseLocalizationResult = UseLocalizationFunction({
		TopBarTitle = TextKeysModule.Title,
		UsernameLabel = TextKeysModule.Username,
		DisplayNameLabel = if p1.isPolicyEnabled then TextKeysModule.AgedUpDisplayName else TextKeysModule.DisplayName,
		BioLabel = TextKeysModule.About,
		BioPlaceholder = TextKeysModule.AboutPlaceholder
	})
	
	return ReactModule.createElement(View, {
		tag = if FFlagAXEnableProfileTab then {
			["col items-start bg-surface-0"] = true,
			["position-top-right anchor-top-right"] = not IsFullBleed,
			["size-full-full"] = IsFullBleed
		} else "col items-start position-top-right anchor-top-right bg-surface-0",
		Size = if IsFullBleed then nil else UDim2.new(0, UseProfileCardWidthResult, 1, 0)
	}, {
		TopBar = ReactModule.createElement(EditProfileHeaderBarModule, {
			onClose = p1.onClose,
			headerText = UseLocalizationResult.TopBarTitle
		}),
		EditableComponents = ReactModule.createElement(View, {
			tag = "col padding-xlarge gap-xxlarge size-full-0 auto-y"
		}, {
			AvatarEditRow = ReactModule.createElement(View, { tag = "size-full-2400", LayoutOrder = 1 }, {
				AvatarContainer = ReactModule.createElement(View, {
					tag = "size-2400-2400 position-center-center anchor-center-center"
				}, {
					AvatarHeadshot = ReactModule.createElement(View, { tag = "size-full-full" }, {
						UserTile = ReactModule.createElement(UserTileModule.UserTile, {
							userId = p1.userId,
							layoutMode = UserTileModule.LayoutMode.compact,
							onActivated = p1.settingButtonOnActivated.avatar
						})
					}),
					EditAvatarIconButton = ReactModule.createElement(View, {
						tag = "position-bottom-right anchor-bottom-right auto-xy bg-over-media-0 radius-circle"
					}, {
						IconButton = ReactModule.createElement(IconButton, {
							isCircular = true,
							icon = IconName.PhotoCamera,
							size = IconSize.Small,
							onActivated = p1.settingButtonOnActivated.avatar,
							variant = ButtonVariant.Standard
						})
					})
				})
			}),
			TextComponentsList = ReactModule.createElement(View, {
				tag = "col size-full-0 auto-y bg-surface-100 radius-medium",
				LayoutOrder = 2
			}, {
				EditDisplayNameRow = ReactModule.createElement(EditComponentRowModule, {
					layoutOrder = 1,
					label = UseLocalizationResult.DisplayNameLabel,
					currentValue = p1.displayName,
					onActivated = if p1.areNamesLoading then function() --[[ Line: 115 ]] end else p1.settingButtonOnActivated.displayName,
					shouldShimmer = p1.areNamesLoading,
					forwardRef = p1.firstItemRef
				}),
				UsernameEditRow = ReactModule.createElement(EditComponentRowModule, {
					layoutOrder = 2,
					label = UseLocalizationResult.UsernameLabel,
					currentValue = p1.username,
					onActivated = p1.settingButtonOnActivated.username,
					shouldShimmer = p1.areNamesLoading
				}),
				BioEditRow = ReactModule.createElement(EditComponentRowModule, {
					layoutOrder = 3,
					label = UseLocalizationResult.BioLabel,
					currentValue = if p1.bioText == "" or p1.bioText == nil then UseLocalizationResult.BioPlaceholder else p1.bioText,
					onActivated = p1.settingButtonOnActivated.bio,
					shouldShimmer = p1.isBioLoading
				})
			})
		})
	})
end