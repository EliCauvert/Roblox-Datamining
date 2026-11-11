local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local AXPartialPageModal = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Components.AXPartialPageModal
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ThemeName = UIBloxModule.App.Style.Constants.ThemeName
local UseStyleMetadataFunction = UIBloxModule.Core.Style.useStyleMetadata
local GetIconSizeFunction = UIBloxModule.App.ImageSet.getIconSize
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local FoundationModule = require(CorePackages.Packages.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)(function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseStyleMetadataFunction (copy), GetIconSizeFunction (copy), IconSize (copy), ThemeName (copy), ReactModule (copy), NavigationUtilsModule (copy), View (copy), FoundationModule (copy), Text (copy), AXPartialPageModal (copy), ButtonType (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		confirmButtonText = "Feature.Avatar.Action.GotIt",
		customizeIntroTitle = "Feature.Avatar.Title.NewCustomizeLook",
		customizeIntroMessage = "Feature.Avatar.Message.NewCustomize"
	})
	local UseStyleMetadataResult = UseStyleMetadataFunction()
	local IconSize1 = GetIconSizeFunction(IconSize.XXLarge)
	local IsThemeNameMatch = UseStyleMetadataResult.ThemeName == ThemeName.Dark
	local ClothesCategoryArtDark: string = if IsThemeNameMatch then "icons/graphic/clothes_category_art_dark" else "icons/graphic/clothes_category_art_light"
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeFocusedScreen(p1.navigation)
	end, { p1.navigation })
	
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
		-- upvalues: ReactModule (upval), View (upval), IconSize1 (copy), FoundationModule (upval), ClothesCategoryArtDark (copy), Text (upval), UseLocalizationResult (copy)
		return {
			ViewFrame = ReactModule.createElement(View, {
				tag = "auto-y padding-bottom-medium col align-x-left align-y-top",
				Size = UDim2.fromScale(1, 0)
			}, {
				GraphicContainer = ReactModule.createElement(View, {
					tag = "position-center-center grow padding-bottom-small",
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, IconSize1)
				}, {
					ClothingCategoryArt = ReactModule.createElement(FoundationModule.Image, {
						tag = "size-full",
						Image = ClothesCategoryArtDark,
						ScaleType = Enum.ScaleType.Fit
					})
				}),
				PromptBodyTitle = ReactModule.createElement(Text, {
					tag = " auto-xy padding-y-small text-align-x-left text-truncate-end text-heading-small text-wrap",
					LayoutOrder = 2,
					Text = UseLocalizationResult.customizeIntroTitle
				}),
				PromptBodyText = ReactModule.createElement(Text, {
					tag = "auto-xy padding-y-small text-align-x-left text-truncate-end text-body-large text-wrap",
					LayoutOrder = 3,
					Text = UseLocalizationResult.customizeIntroMessage
				})
			})
		}
	end)()))
end))