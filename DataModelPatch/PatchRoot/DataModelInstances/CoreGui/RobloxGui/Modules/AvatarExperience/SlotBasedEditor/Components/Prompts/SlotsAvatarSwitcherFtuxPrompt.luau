local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local AXPartialPageModal = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Components.AXPartialPageModal
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local IconOnlyMenu = require(CorePackages.Workspace.Packages.AvatarExperienceControlBar).IconOnlyMenu
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseStyleMetadataFunction = UIBloxModule.Core.Style.useStyleMetadata
local ThemeName = UIBloxModule.App.Style.Constants.ThemeName
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local AvatarHeadShot = require(CorePackages.Workspace.Packages.UserLib).Utils.Constants.RbxthumbTypes.AvatarHeadShot

local function selectUserId(p1)
	return p1.LocalUserId
end

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)(function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseTokensFunction (copy), UseSelectorFunction (copy), selectUserId (copy), ReactModule (copy), NavigationUtilsModule (copy), UseStyleMetadataFunction (copy), ThemeName (copy), View (copy), IconOnlyMenu (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), AvatarHeadShot (copy), Text (copy), Icon (copy), IconSize (copy), AXPartialPageModal (copy), ButtonType (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		confirmButtonText = "Feature.Avatar.Action.GotIt",
		avatarSwitcherTitle = "Feature.Avatar.Title.SavedAvatarsLocation",
		avatarSwitcherMessageProfile = "Feature.Avatar.Message.NewControlLocationProfile",
		avatarSwitcherMessageBundles = "Feature.Avatar.Message.NewControlLocationFullBody",
		profilePhoto = "Feature.Avatar.Label.Title.ProfilePhoto"
	})
	local UseTokensResult = UseTokensFunction()
	local UseSelectorResult = UseSelectorFunction(selectUserId)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeFocusedScreen(p1.navigation)
	end, { p1.navigation })
	local Surface200 = UseStyleMetadataFunction().ThemeName == ThemeName.Dark and UseTokensResult.Color.Surface.Surface_200 or UseTokensResult.Color.Extended.Gray.Gray_400
	
	return ReactModule.createElement(AXPartialPageModal, {
		screenSize = p1.screenSize,
		buttonStackProps = {
			buttons = {
				{
					buttonType = ButtonType.PrimaryContextual,
					props = {
						onActivated = function()
							-- upvalues: UseResult (copy), p1 (copy)
							UseResult()
							p1.onConfirm()
						end,
						text = UseLocalizationResult.confirmButtonText
					}
				}
			}
		}
	}, ((function()
		-- upvalues: ReactModule (upval), View (upval), Surface200 (copy), UseTokensResult (copy), IconOnlyMenu (upval), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), UseSelectorResult (copy), AvatarHeadShot (upval), UseLocalizationResult (copy), Text (upval), Icon (upval), IconSize (upval)
		return {
			ViewFrame = ReactModule.createElement(View, {
				tag = "auto-y grow size-full-0 col align-x-left align-y-top"
			}, {
				ControlBarDiagram = ReactModule.createElement(View, {
					tag = "auto-y position-center-center self-center grow radius-medium size-full-0",
					LayoutOrder = 1,
					backgroundStyle = Surface200,
					padding = {
						top = UDim.new(0, UseTokensResult.Margin.Large),
						bottom = UDim.new(0, UseTokensResult.Margin.Large)
					}
				}, {
					IconOnlyMenu = ReactModule.createElement(IconOnlyMenu, {
						direction = "vertical",
						activeItemId = "",
						Position = UDim2.fromScale(0.3, 0),
						items = {
							{
								type = "image",
								id = "1",
								thumbnailUrl = GetRbxthumbWithTypeSizeAndOptionsFunction(UseSelectorResult, AvatarHeadShot, 150, true, true)
							},
							{ type = "icon", id = "2", icon = "icons/menu/customize" },
							{
								type = "icon",
								id = "3",
								icon = "icons/common/hamburgermenu",
								toolTipConfig = {
									open = true,
									bodyText = UseLocalizationResult.profilePhoto
								}
							}
						}
					})
				}),
				PromptBodyTitle = ReactModule.createElement(Text, {
					tag = "auto-xy padding-bottom-small padding-top-xxlarge text-align-x-left text-truncate-end text-heading-small text-wrap",
					LayoutOrder = 2,
					Text = UseLocalizationResult.avatarSwitcherTitle
				}),
				PromptBodyText1 = ReactModule.createElement(View, {
					tag = "auto-y row align-x-left align-y-center size-full-0",
					LayoutOrder = 3
				}, {
					BodyText = ReactModule.createElement(Text, {
						tag = "auto-xy padding-y-small text-align-x-left text-truncate-end text-body-large text-wrap",
						LayoutOrder = 1,
						Text = UseLocalizationResult.avatarSwitcherMessageProfile
					}),
					MenuIcon = ReactModule.createElement(Icon, {
						name = "icons/common/hamburgermenu",
						LayoutOrder = 2,
						size = IconSize.Medium
					})
				}),
				PromptBodyText2 = ReactModule.createElement(Text, {
					tag = "auto-xy padding-bottom-xxlarge text-align-x-left text-truncate-end text-body-large text-wrap",
					LayoutOrder = 4,
					Text = UseLocalizationResult.avatarSwitcherMessageBundles
				})
			})
		}
	end)()))
end))