local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local AXPartialPageModal = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.AXPartialPageModal
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local GetIconSizeFunction = UIBloxModule.App.ImageSet.getIconSize
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local FoundationModule = require(CorePackages.Packages.Foundation)
local FoundationCloudAssetsModule = require(CorePackages.Packages.FoundationCloudAssets)
local View = FoundationModule.View
local Text = FoundationModule.Text
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local FFlagAXFixAvatarScreenVR = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixAvatarScreenVR
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local Assets = FoundationCloudAssetsModule.Assets
FoundationCloudAssetsModule.preloadAsset("pictograms/makeup_look")
local PictogramsMakeupLook = Assets["pictograms/makeup_look"]
local WithMappedNavigationParamsModuleResult = WithMappedNavigationParamsModule(function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy), GetIconSizeFunction (copy), IconSize (copy), RoactNavigationModule (copy), View (copy), PictogramsMakeupLook (copy), Text (copy), AXPartialPageModal (copy), ButtonVariant (copy), InputSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		viewButtonText = "CommonUI.Messages.Action.View",
		dismissButtonText = "CommonUI.Messages.Action.Dismiss",
		titleText = "Feature.Avatar.Title.MakeupIntroFtux",
		bodyText = "Feature.Avatar.Description.MakeupIntroFtux"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local IconSize1 = GetIconSizeFunction(IconSize.XXLarge)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), RoactNavigationModule (upval)
		p1.navigation.dispatch(RoactNavigationModule.Actions.back(nil))
	end, { p1.navigation })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), p1 (copy)
		UseResult()
		p1.onView()
	end, { p1.onView, UseResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), p1 (copy)
		UseResult()
		p1.onDismiss()
	end, { p1.onDismiss, UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	
	return ReactModule.createElement(AXPartialPageModal, {
		visible = UseStateResult,
		onBackgroundPress = UseResult2,
		buttonStackProps = {
			rowLayout = true,
			buttons = {
				{
					props = {
						onActivated = UseResult1,
						text = UseLocalizationResult.viewButtonText,
						variant = ButtonVariant.Emphasis,
						size = InputSize.Medium
					}
				},
				{
					props = {
						onActivated = UseResult2,
						text = UseLocalizationResult.dismissButtonText,
						variant = ButtonVariant.Standard,
						size = InputSize.Medium
					}
				}
			}
		}
	}, ReactModule.useCallback(function()
		-- upvalues: ReactModule (upval), View (upval), IconSize1 (copy), FoundationModule (upval), PictogramsMakeupLook (upval), UseTokensResult (copy), Text (upval), UseLocalizationResult (copy)
		return {
			ViewFrame = ReactModule.createElement(View, {
				tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
			}, {
				GraphicContainer = ReactModule.createElement(View, {
					tag = "position-center-center grow padding-bottom-small",
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, IconSize1)
				}, {
					MakeupCategoryArt = ReactModule.createElement(FoundationModule.Image, {
						tag = "size-full",
						Image = PictogramsMakeupLook and PictogramsMakeupLook.assetId,
						ScaleType = Enum.ScaleType.Fit,
						imageStyle = UseTokensResult.Color.Content.Emphasis
					})
				}),
				PromptBodyTitle = ReactModule.createElement(Text, {
					tag = "auto-xy padding-bottom-small padding-top-medium text-align-x-left text-heading-small text-wrap",
					LayoutOrder = 3,
					Text = UseLocalizationResult.titleText
				}),
				PromptBodyText = ReactModule.createElement(Text, {
					tag = "auto-xy text-align-x-left text-truncate-end text-body-large text-wrap",
					LayoutOrder = 4,
					Text = UseLocalizationResult.bodyText
				})
			})
		}
	end, {
		IconSize1,
		UseTokensResult,
		UseLocalizationResult,
		PictogramsMakeupLook
	})())
end)

if FFlagAXFixAvatarScreenVR then
	WithMappedNavigationParamsModuleResult = WithOverlayFocusHandlingModule(WithMappedNavigationParamsModuleResult)
end
return WithMappedNavigationParamsModuleResult