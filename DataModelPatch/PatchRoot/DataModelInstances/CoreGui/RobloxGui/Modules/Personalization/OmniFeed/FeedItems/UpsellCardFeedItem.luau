local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local SocialUpsellModule = require(CorePackages.Workspace.Packages.SocialUpsell)
local UseResponsiveLayoutFunction = UIBloxModule.Core.Layout.Responsive.useResponsiveLayout
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local IsSubjectToDesktopPoliciesFunction = require(CorePackages.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local OmniFeedProps = Modules.Personalization.OmniFeed.OmniFeedProps
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local SocialExperimentsModule = require(CorePackages.Workspace.Packages.SocialExperiments)
local FFlagTestDeviceForFAEUpsell = SocialExperimentsModule.FFlagTestDeviceForFAEUpsell
local DeviceMeetsRequirementsForFAEFunction = SocialExperimentsModule.deviceMeetsRequirementsForFAE
local UsePageSideMarginFunction = require(CorePackages.Workspace.Packages.CollectionViews).usePageSideMargin
local HomePageUpsellCardWithIconModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.Home.HomePageUpsellCardWithIcon)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local UpsellBanner = SocialUpsellModule.UpsellBanner
local CreateBannerConfigFromUpsellCardVariationFunction = SocialUpsellModule.Utils.createBannerConfigFromUpsellCardVariation
local PostHomePageContactMethodModuleVariationDismissFunction = Modules.LuaApp.Thunks.PostHomePageContactMethodModuleVariationDismiss
local UpsellEntrySurfaceType = SocialUpsellModule.Analytics.Enum.UpsellEntrySurfaceType
local SocialUpsellType = SocialUpsellModule.Enums.SocialUpsellType
local UpsellComponent = SocialUpsellModule.Analytics.Enum.UpsellComponent
local StartFacialAgeEstimationFunction = SocialUpsellModule.Thunks.startFacialAgeEstimation
local UseSocialUpsellOverlayControllerFunction = SocialUpsellModule.Hooks.useSocialUpsellOverlayController
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagLuaAppCompositionAlways = SharedFlagsModule.FFlagLuaAppCompositionAlways
local FFlagAgeBasedUXHomepageVerificationBannerLockIcon = SharedFlagsModule.FFlagAgeBasedUXHomepageVerificationBannerLockIcon
local FFlagAgeBasedUXHomepageVerificationBannerGreyButton = SharedFlagsModule.FFlagAgeBasedUXHomepageVerificationBannerGreyButton
local GAMECAROUSELSIDECOMPACTPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING
local GAMECAROUSELSIDEWIDEPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING

return function(p1)
	-- upvalues: FFlagLuaAppCompositionAlways (copy), OmniFeedProps (copy), UseSelectorFunction (copy), UseAppPolicyFunction (copy), ReactModule (copy), FFlagAgeBasedUXHomepageVerificationBannerLockIcon (copy), FFlagAgeBasedUXHomepageVerificationBannerGreyButton (copy), FoundationModule (copy), UseDispatchFunction (copy), UseSocialUpsellOverlayControllerFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), StartFacialAgeEstimationFunction (copy), SocialUpsellType (copy), UpsellEntrySurfaceType (copy), SocialUpsellModule (copy), UpsellComponent (copy), PostHomePageContactMethodModuleVariationDismissFunction (copy), UseStyleFunction (copy), UseResponsiveLayoutFunction (copy), FormFactor (copy), GAMECAROUSELSIDECOMPACTPADDING (copy), GAMECAROUSELSIDEWIDEPADDING (copy), UsePageSideMarginFunction (copy), FFlagTestDeviceForFAEUpsell (copy), DeviceMeetsRequirementsForFAEFunction (copy), RoactModule (copy), HomePageUpsellCardWithIconModule (copy), IsSubjectToDesktopPoliciesFunction (copy), IsVRAppBuildFunction (copy), UpsellBanner (copy), CreateBannerConfigFromUpsellCardVariationFunction (copy)
	local AppCompositionEnabled = if FFlagLuaAppCompositionAlways then true else p1[OmniFeedProps.key].appCompositionEnabled
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.HomePageUpsellCardVariation
	end)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.useGridPageLayout()
	end)
	local UseRefResult = ReactModule.useRef(nil)
	local UpsellCardV2Config = UseSelectorResult and (UseSelectorResult.upsellCardType and UseSelectorResult.upsellCardV2Config)
	local IsFae: boolean = (FFlagAgeBasedUXHomepageVerificationBannerLockIcon or FFlagAgeBasedUXHomepageVerificationBannerGreyButton) and (UpsellCardV2Config and UseSelectorResult.upsellCardType == "Fae")
	local Config = if IsFae then {
		iconOverride = if FFlagAgeBasedUXHomepageVerificationBannerLockIcon then FoundationModule.Enums.IconName.LockClosed else nil,
		primaryButtonVariantOverride = if FFlagAgeBasedUXHomepageVerificationBannerGreyButton then FoundationModule.Enums.ButtonVariant.Standard else nil
	} else nil
	local UseDispatchResult = UseDispatchFunction()
	local UseSocialUpsellOverlayControllerResult = UseSocialUpsellOverlayControllerFunction(false)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseResult = ReactModule.useCallback(function(_)
		-- upvalues: UseSelectorResult (copy), UseDispatchResult (copy), StartFacialAgeEstimationFunction (upval), SocialUpsellType (upval), UpsellEntrySurfaceType (upval)
		if UseSelectorResult and UseSelectorResult.upsellCardType == "Fae" then
			UseDispatchResult(StartFacialAgeEstimationFunction(SocialUpsellType.FacialAgeEstimation .. UpsellEntrySurfaceType.Homepage, nil, nil, UpsellEntrySurfaceType.Homepage))
		end
	end, { UseDispatchResult, UseSelectorResult })
	local UseResult1 = ReactModule.useCallback(function(ImpressionId)
		-- upvalues: UseSelectorResult (copy), UseSocialUpsellOverlayControllerResult (copy), SocialUpsellModule (upval), UpsellEntrySurfaceType (upval), UpsellComponent (upval)
		if UseSelectorResult and UseSelectorResult.upsellCardType == "Fae" then
			UseSocialUpsellOverlayControllerResult.openSocialOverlay(SocialUpsellModule.Enums.SocialUpsellType.FacialAgeEstimation, {
				upsellEntrySurface = UpsellEntrySurfaceType.Homepage,
				upsellEntryComponent = UpsellComponent.Banner,
				impressionId = ImpressionId
			})
		end
	end, {
		UseSelectorResult,
		UseSocialUpsellOverlayControllerResult.openSocialOverlay
	})
	local UseResult2 = ReactModule.useCallback(function(_)
		-- upvalues: UseDispatchResult (copy), UseSelectorResult (copy), PostHomePageContactMethodModuleVariationDismissFunction (upval), UseRoactServiceResult (copy)
		if UseDispatchResult and UseSelectorResult then
			UseDispatchResult(PostHomePageContactMethodModuleVariationDismissFunction(UseRoactServiceResult, UseSelectorResult.upsellCardType))
		end
	end, { UseSelectorResult, UseRoactServiceResult })
	local Theme = UseStyleFunction().Theme
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.FormFactor
	end)
	local Margin = if FFlagLuaAppCompositionAlways then nil else UseResponsiveLayoutFunction("margin")
	local Margin1 = if AppCompositionEnabled then nil elseif UseAppPolicyResult then Margin elseif UseSelectorResult1 == FormFactor.COMPACT then GAMECAROUSELSIDECOMPACTPADDING else GAMECAROUSELSIDEWIDEPADDING
	
	if not FFlagLuaAppCompositionAlways then
		local UsePageSideMarginResult = UsePageSideMarginFunction(UseRefResult.current)
		
		if UpsellCardV2Config then
			Margin1 = UsePageSideMarginResult
		end
	end
	return if FFlagTestDeviceForFAEUpsell and UpsellCardV2Config and not DeviceMeetsRequirementsForFAEFunction() then nil else RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = Theme.BackgroundUIDefault.Color,
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = UseRefResult
	}, {
		UIPadding = RoactModule.createElement("UIPadding", {
			PaddingLeft = if AppCompositionEnabled then nil else UDim.new(0, Margin1),
			PaddingRight = if AppCompositionEnabled then nil else UDim.new(0, Margin1),
			PaddingTop = UDim.new(0, 1)
		}),
		HomePageUpsellCard = if UpsellCardV2Config then nil else RoactModule.createElement(HomePageUpsellCardWithIconModule, {
			upsellCardVariation = UseSelectorResult,
			isCentered = IsSubjectToDesktopPoliciesFunction() or IsVRAppBuildFunction()
		}),
		HomePageUpsellBannerV2 = if UpsellCardV2Config and UseSelectorResult.upsellCardType ~= "" then RoactModule.createElement(UpsellBanner, {
			config = CreateBannerConfigFromUpsellCardVariationFunction(UseSelectorResult, Config),
			onPrimaryAction = UseResult,
			onSecondaryAction = UseResult1,
			onDismiss = UseResult2,
			upsellEntrySurface = UpsellEntrySurfaceType.Homepage,
			upsellEntryComponent = UpsellComponent.Banner
		}) else nil
	})
end