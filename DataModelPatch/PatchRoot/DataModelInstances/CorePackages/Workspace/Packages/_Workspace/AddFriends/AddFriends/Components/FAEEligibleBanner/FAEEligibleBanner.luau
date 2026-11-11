local AddFriends = script:FindFirstAncestor("AddFriends")
local Parent = AddFriends.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local Icon = FoundationModule.Icon
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local SocialUpsellModule = require(Parent.SocialUpsell)
local UseSocialUpsellOverlayControllerFunction = SocialUpsellModule.Hooks.useSocialUpsellOverlayController
local SocialUpsellType = SocialUpsellModule.Enums.SocialUpsellType
local UpsellEntrySurfaceType = SocialUpsellModule.Analytics.Enum.UpsellEntrySurfaceType
local UpsellComponent = SocialUpsellModule.Analytics.Enum.UpsellComponent
local EventNamesModule = require(AddFriends.Analytics.EventNames)
local UseFireAnalyticsEventModule = require(AddFriends.Analytics.useFireAnalyticsEvent)
local UseShowFAEEligibleBannerModule = require(script.Parent.useShowFAEEligibleBanner)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagCreateConnectionsHub = SharedFlagsModule.FFlagCreateConnectionsHub
local FFlagAddFriendsPageUpdateAmpRules = SharedFlagsModule.FFlagAddFriendsPageUpdateAmpRules
local FFlagMakeVPCFAECheckMoreGeneric = SharedFlagsModule.FFlagMakeVPCFAECheckMoreGeneric
local AFPFAEBannerNoRadius = game:DefineFastFlag("AFPFAEBannerNoRadius", false)

return function(p1)
	-- upvalues: UseSocialUpsellOverlayControllerFunction (copy), UseShowFAEEligibleBannerModule (copy), UseFireAnalyticsEventModule (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), EventNamesModule (copy), SocialUpsellType (copy), UpsellEntrySurfaceType (copy), UpsellComponent (copy), FFlagMakeVPCFAECheckMoreGeneric (copy), FFlagAddFriendsPageUpdateAmpRules (copy), View (copy), FFlagCreateConnectionsHub (copy), AFPFAEBannerNoRadius (copy), Icon (copy), IconName (copy), IconSize (copy), IconVariant (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy), IconButton (copy)
	local UseSocialUpsellOverlayControllerResult = UseSocialUpsellOverlayControllerFunction(false)
	local UseShowFAEEligibleBannerModuleResult, UseShowFAEEligibleBannerModuleResult2 = UseShowFAEEligibleBannerModule()
	local UseFireAnalyticsEventModuleResult = UseFireAnalyticsEventModule()
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		body = "Feature.Friends.Label.FAEEligibleBanner.Body",
		unlock = "Feature.FAE.Action.Unlock"
	})
	ReactModule.useEffect(function()
		-- upvalues: UseShowFAEEligibleBannerModuleResult (copy), UseFireAnalyticsEventModuleResult (copy), EventNamesModule (upval)
		if UseShowFAEEligibleBannerModuleResult then
			UseFireAnalyticsEventModuleResult(EventNamesModule.FAEEligibleBannerImpression)
		end
	end, {
		UseShowFAEEligibleBannerModuleResult,
		UseFireAnalyticsEventModuleResult
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseFireAnalyticsEventModuleResult (copy), EventNamesModule (upval), UseShowFAEEligibleBannerModuleResult2 (copy), UseSocialUpsellOverlayControllerResult (copy), SocialUpsellType (upval), UpsellEntrySurfaceType (upval), UpsellComponent (upval), FFlagMakeVPCFAECheckMoreGeneric (upval), FFlagAddFriendsPageUpdateAmpRules (upval)
		UseFireAnalyticsEventModuleResult(EventNamesModule.FAEEligibleBannerClick)
		UseShowFAEEligibleBannerModuleResult2()
		UseSocialUpsellOverlayControllerResult.openSocialOverlay(SocialUpsellType.FacialAgeEstimation, {
			upsellEntrySurface = UpsellEntrySurfaceType.AddFriendsPage,
			upsellEntryComponent = UpsellComponent.Banner,
			entryPointEventCtx = SocialUpsellType.FacialAgeEstimation .. UpsellEntrySurfaceType.AddFriendsPage,
			shouldIncludeVPC = if FFlagMakeVPCFAECheckMoreGeneric and FFlagAddFriendsPageUpdateAmpRules then true else nil
		})
	end, {
		UseShowFAEEligibleBannerModuleResult2,
		UseSocialUpsellOverlayControllerResult.openSocialOverlay,
		UseFireAnalyticsEventModuleResult
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseFireAnalyticsEventModuleResult (copy), EventNamesModule (upval), UseShowFAEEligibleBannerModuleResult2 (copy)
		UseFireAnalyticsEventModuleResult(EventNamesModule.FAEEligibleBannerClose)
		UseShowFAEEligibleBannerModuleResult2()
	end, {
		UseShowFAEEligibleBannerModuleResult2,
		UseFireAnalyticsEventModuleResult
	})
	
	return if UseShowFAEEligibleBannerModuleResult then ReactModule.createElement(View, {
		LayoutOrder = p1.layoutOrder,
		tag = {
			["col size-full-0 auto-y"] = true,
			["padding-y-xsmall"] = not FFlagCreateConnectionsHub
		}
	}, {
		Banner = ReactModule.createElement(View, {
			tag = {
				["row align-y-center gap-medium size-full-0 auto-y padding-x-medium padding-y-large bg-shift-200"] = true,
				["radius-medium"] = not AFPFAEBannerNoRadius
			}
		}, {
			LeftGroup = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row align-y-center fill gap-medium auto-y"
			}, {
				InfoIcon = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "row align-x-center align-y-center radius-circle bg-system-emphasis",
					Size = UDim2.fromOffset(UseTokensResult.Size.Size_600, UseTokensResult.Size.Size_600)
				}, {
					Glyph = ReactModule.createElement(Icon, {
						name = IconName.StackableI,
						size = IconSize.Medium,
						variant = IconVariant.Filled,
						style = UseTokensResult.Color.Extended.White.White_100
					})
				}),
				BodyText = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "fill auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
					Text = UseLocalizationResult.body
				})
			}),
			RightGroup = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "row align-y-center gap-small auto-xy"
			}, {
				UnlockButton = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					text = UseLocalizationResult.unlock,
					variant = ButtonVariant.Standard,
					size = InputSize.Small,
					onActivated = UseResult
				}),
				CloseButton = ReactModule.createElement(IconButton, {
					LayoutOrder = 2,
					icon = IconName.X,
					size = InputSize.Small,
					variant = ButtonVariant.Utility,
					onActivated = UseResult1
				})
			})
		})
	}) else nil
end