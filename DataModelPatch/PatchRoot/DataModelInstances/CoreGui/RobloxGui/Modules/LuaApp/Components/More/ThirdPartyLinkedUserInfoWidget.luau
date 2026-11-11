local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Badge = FoundationModule.Badge
local Image = FoundationModule.Image
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local FFlagEnableNonFlyoutUncheckedBadge = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableNonFlyoutUncheckedBadge

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), FFlagEnableNonFlyoutUncheckedBadge (copy), UseAppPolicyFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Image (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), Text (copy), Icon (copy), IconName (copy), IconSize (copy), Badge (copy), BadgeVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local UseAppPolicyResult = if FFlagEnableNonFlyoutUncheckedBadge then UseAppPolicyFunction(function(p2)
		return p2.getShowUncheckedBadge()
	end) else nil
	local UseLocalizationResult = if FFlagEnableNonFlyoutUncheckedBadge then UseLocalizationFunction({ Unchecked = "CommonUI.Features.Label.Unchecked" }) else nil
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 gap-small auto-y align-x-left align-y-center row",
		LayoutOrder = p1.layoutOrder
	}, {
		UserIcon = ReactModule.createElement(Image, {
			tag = "radius-circle",
			LayoutOrder = 0,
			Image = GetStandardSizeAvatarHeadShotRbxthumbFunction(p1.userId),
			Size = UDim2.fromOffset(UseTokensResult.Size.Size_900, UseTokensResult.Size.Size_900),
			backgroundStyle = UseTokensResult.Color.Common.Shimmer
		}),
		UserInfoView = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = {
				["gap-xsmall align-x-left align-y-center col"] = true,
				["size-full-0 auto-y"] = not FFlagEnableNonFlyoutUncheckedBadge,
				["auto-xy"] = FFlagEnableNonFlyoutUncheckedBadge
			}
		}, {
			UserNameAndBadge = ReactModule.createElement(View, {
				tag = "size-full-0 gap-xsmall auto-y align-x-left align-y-center row"
			}, {
				UserNameText = ReactModule.createElement(Text, {
					tag = "auto-xy text-title-large text-align-y-center text-align-x-left",
					LayoutOrder = 0,
					Text = p1.userName
				}),
				BadgeText = ReactModule.createElement(Text, {
					tag = "auto-xy text-align-y-center text-align-x-left",
					LayoutOrder = 1,
					Text = p1.userBadgeEmoji,
					textStyle = UseTokensResult.Color.Content.Emphasis,
					fontStyle = UseTokensResult.Typography.TitleLarge
				}),
				MembershipIcon = if p1.showRobloxPlusBadge then ReactModule.createElement(Icon, {
					LayoutOrder = 2,
					name = IconName.RobloxPlus,
					size = IconSize.Medium,
					style = UseTokensResult.Color.Content.Emphasis
				}) else nil
			}),
			ThirdPartyUserInfo = if p1.thirdPartyUserName and p1.thirdPartyPlatformIcon then ReactModule.createElement(View, {
				tag = "size-full-0 gap-xsmall auto-y align-x-left align-y-center row"
			}, {
				PlatformIcon = ReactModule.createElement(Image, {
					tag = "align-x-center align-x-left align-y-center",
					LayoutOrder = 0,
					Image = p1.thirdPartyPlatformIcon,
					Size = UDim2.fromOffset(UseTokensResult.Size.Size_400, UseTokensResult.Size.Size_400)
				}),
				ThirdPartyUserName = ReactModule.createElement(Text, {
					tag = "auto-xy text-body-small text-align-y-center text-align-x-left",
					LayoutOrder = 1,
					Text = p1.thirdPartyUserName
				})
			}) else nil
		}),
		UncheckedBadge = if FFlagEnableNonFlyoutUncheckedBadge and UseAppPolicyResult then ReactModule.createElement(Badge, {
			LayoutOrder = 2,
			text = UseLocalizationResult.Unchecked,
			variant = BadgeVariant.Neutral
		}) else nil
	})
end)