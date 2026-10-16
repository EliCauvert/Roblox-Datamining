local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local Radius = FoundationModule.Enums.Radius
local IconButton = FoundationModule.IconButton
local List = FoundationModule.List
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseProfileCardWidthFunction = require(Parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local UserTileModule = require(Parent.UserTile)
local EditProfileHeaderBarModule = require(EditProfile.BaseComponents.EditProfileHeaderBar)
local TextKeysModule = require(EditProfile.Common.TextKeys)
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local FFlagFixNonTruncatedTextModule = require(EditProfile.Flags.FFlagFixNonTruncatedText)
local EditProfileProfileFramesSectionModule = if require(Parent.SharedFlags).FFlagEditProfileFramesEnabled then require(EditProfile.Components.EditProfileLanding.EditProfileProfileFramesSection) else nil
local Number: number = tonumber(game:DefineFastString("EditProfileLandingTrailingWidthRatio", "0.4")) or 0.4
local config = {
	isContained = true,
	hasDivider = { hasDivider = true, isInset = false }
}

local function renderRowTrailing(AreNamesLoading, Text1, YOffset, p1) --[[ Line: 64 ]]
	-- upvalues: ReactModule (copy), Skeleton (copy), Radius (copy), FFlagFixNonTruncatedTextModule (copy), Text (copy), Number (copy)
	return if AreNamesLoading then ReactModule.createElement(Skeleton, {
		Size = UDim2.new(0.3, 0, 0, YOffset),
		radius = Radius.Medium
	}) elseif FFlagFixNonTruncatedTextModule and p1 ~= nil then ReactModule.createElement(Text, {
		tag = "auto-y text-body-small text-align-x-right text-truncate-end",
		Text = Text1,
		Size = UDim2.new(0, p1 * Number, 0, 0)
	}) else ReactModule.createElement(Text, {
		tag = "auto-xy text-body-small text-truncate-end",
		Text = Text1
	})
end

return function(p1) --[[ Line: 91 | Named "EditProfileLandingV2" ]]
	-- upvalues: UseProfileCardWidthFunction (copy), UseTokensFunction (copy), FFlagAXEnableProfileTab (copy), TextKeysModule (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), EditProfileHeaderBarModule (copy), UserTileModule (copy), IconButton (copy), IconName (copy), IconSize (copy), ButtonVariant (copy), List (copy), config (copy), renderRowTrailing (copy), FFlagFixNonTruncatedTextModule (copy), EditProfileProfileFramesSectionModule (copy)
	local UseProfileCardWidthResult = UseProfileCardWidthFunction()
	local UseTokensResult = UseTokensFunction()
	local IsFullBleed: boolean = FFlagAXEnableProfileTab and p1.fullBleed == true
	local UseLocalizationResult = UseLocalizationFunction({
		TopBarTitle = TextKeysModule.Title,
		UsernameLabel = TextKeysModule.Username,
		DisplayNameLabel = if p1.isPolicyEnabled then TextKeysModule.AgedUpDisplayName else TextKeysModule.DisplayName,
		BioLabel = TextKeysModule.About,
		BioPlaceholder = TextKeysModule.AboutPlaceholder
	})
	local Size400 = UseTokensResult.Size.Size_400
	
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
			tag = "col gap-xxlarge size-full-0 auto-y padding-xlarge"
		}, {
			AvatarEditRow = ReactModule.createElement(View, { tag = "size-full-2400", LayoutOrder = 1 }, {
				AvatarContainer = ReactModule.createElement(View, {
					tag = "position-center-center anchor-center-center size-2400-2400"
				}, {
					AvatarHeadshot = ReactModule.createElement(View, { tag = "size-full-full" }, {
						UserTile = ReactModule.createElement(UserTileModule.UserTile, {
							userId = p1.userId,
							layoutMode = UserTileModule.LayoutMode.compact,
							onActivated = p1.settingButtonOnActivated.avatar
						})
					}),
					EditAvatarIconButton = ReactModule.createElement(View, {
						tag = "position-bottom-right anchor-bottom-right auto-xy radius-circle bg-over-media-0"
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
			TextComponentsList = ReactModule.createElement(List.Root, {
				testId = "TextComponentsList",
				LayoutOrder = 2,
				isContained = config.isContained,
				hasDivider = config.hasDivider
			}, {
				EditDisplayNameRow = ReactModule.createElement(List.Item, {
					testId = "EditDisplayNameRow",
					LayoutOrder = 1,
					title = UseLocalizationResult.DisplayNameLabel,
					trailing = renderRowTrailing(p1.areNamesLoading, p1.displayName, Size400, if FFlagFixNonTruncatedTextModule then UseProfileCardWidthResult else nil),
					onActivated = if p1.areNamesLoading then nil else { onActivated = p1.settingButtonOnActivated.displayName },
					ref = p1.firstItemRef
				}),
				UsernameEditRow = ReactModule.createElement(List.Item, {
					testId = "UsernameEditRow",
					LayoutOrder = 2,
					title = UseLocalizationResult.UsernameLabel,
					trailing = renderRowTrailing(p1.areNamesLoading, p1.username, Size400, if FFlagFixNonTruncatedTextModule then UseProfileCardWidthResult else nil),
					onActivated = if p1.areNamesLoading then nil else { onActivated = p1.settingButtonOnActivated.username }
				}),
				BioEditRow = ReactModule.createElement(List.Item, {
					testId = "BioEditRow",
					LayoutOrder = 3,
					title = UseLocalizationResult.BioLabel,
					trailing = renderRowTrailing(p1.isBioLoading, if p1.bioText == "" or p1.bioText == nil then UseLocalizationResult.BioPlaceholder else string.gsub(p1.bioText, "\n", " "), Size400, if FFlagFixNonTruncatedTextModule then UseProfileCardWidthResult else nil),
					onActivated = if p1.isBioLoading then nil else { onActivated = p1.settingButtonOnActivated.bio }
				})
			}),
			ProfileFramesList = if EditProfileProfileFramesSectionModule == nil then nil else ReactModule.createElement(EditProfileProfileFramesSectionModule, {
				layoutOrder = 3,
				userId = p1.userId,
				onActivated = p1.onProfileFramesActivated
			})
		})
	})
end