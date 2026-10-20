local Parent = script:FindFirstAncestor("ProfileCard").Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local Badge = FoundationModule.Badge
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local LoadableImage = require(Parent.UIBlox).App.Loading.LoadableImage
local Text = FoundationModule.Text
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagEnableFlyoutUncheckedBadge = SharedFlagsModule.FFlagEnableFlyoutUncheckedBadge
local FFlagEnableDrawerFocusNav = SharedFlagsModule.FFlagEnableDrawerFocusNav
local FFlagHidePremiumIconography = SharedFlagsModule.FFlagHidePremiumIconography
local FFlagEnableBlackbirdCheck = SharedFlagsModule.FFlagEnableBlackbirdCheck

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), FFlagEnableFlyoutUncheckedBadge (copy), UseLocalizationFunction (copy), UseAppPolicyFunction (copy), ReactModule (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), FFlagEnableBlackbirdCheck (copy), FFlagHidePremiumIconography (copy), FoundationModule (copy), FFlagEnableDrawerFocusNav (copy), LoadableImage (copy), Text (copy), Icon (copy), BuilderIconsModule (copy), IconSize (copy), IconName (copy), Badge (copy), BadgeVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = if FFlagEnableFlyoutUncheckedBadge then UseLocalizationFunction({ Unchecked = "CommonUI.Features.Label.Unchecked" }) else nil
	local UseAppPolicyResult = if FFlagEnableFlyoutUncheckedBadge then UseAppPolicyFunction(function(p2)
		return p2.getShowUncheckedBadge()
	end) else nil
	local LocalUserModel = p1.localUserModel
	local UseMemoResult = ReactModule.useMemo(function(): boolean
		-- upvalues: LocalUserModel (copy)
		return LocalUserModel and LocalUserModel.membership == Enum.MembershipType.Premium
	end, { LocalUserModel })
	local Size1000 = if p1.isCompact then UseTokensResult.Size.Size_1000 else UseTokensResult.Size.Size_1600
	local IsIsRobloxSubscriber: boolean = if FFlagEnableBlackbirdCheck then p1.isRobloxSubscriber == true else false
	local NoIsIsRobloxSubscriber: boolean = not FFlagHidePremiumIconography and (UseMemoResult and not IsIsRobloxSubscriber)
	local OnProfileActivatedFunction = p1.onProfileActivated
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = {
			["size-full-0 auto-y"] = true,
			["row align-y-center gap-small"] = FFlagEnableFlyoutUncheckedBadge,
			["padding-y-medium"] = p1.isCompact == true
		},
		LayoutOrder = p1.layoutOrder
	}, {
		ProfileCardButton = ReactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			Active = OnProfileActivatedFunction ~= nil,
			Selectable = OnProfileActivatedFunction ~= nil,
			AutomaticSize = if FFlagEnableFlyoutUncheckedBadge then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
			LayoutOrder = if FFlagEnableFlyoutUncheckedBadge then 1 else nil,
			[ReactModule.Event.Activated] = ReactModule.useCallback(function()
				-- upvalues: OnProfileActivatedFunction (copy)
				if OnProfileActivatedFunction then
					OnProfileActivatedFunction()
				end
			end, { OnProfileActivatedFunction }),
			[ReactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil
		}, {
			UIPadding = if FFlagEnableDrawerFocusNav then ReactModule.createElement("UIPadding", {
				PaddingRight = UDim.new(0, UseTokensResult.Padding.Small)
			}) else nil,
			UIFlexItem = if FFlagEnableFlyoutUncheckedBadge then ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }) else nil,
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, UseTokensResult.Gap.Medium)
			}),
			UserAvatar = ReactModule.createElement(LoadableImage, {
				useShimmerAnimationWhileLoading = true,
				shouldHandleReloads = true,
				LayoutOrder = 1,
				Size = UDim2.fromOffset(Size1000, Size1000),
				BackgroundColor3 = UseTokensResult.Color.Common.Shimmer.Color3,
				BackgroundTransparency = UseTokensResult.Color.Common.Shimmer.Transparency,
				Image = ReactModule.useMemo(function()
					-- upvalues: LocalUserModel (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (upval), p1 (copy)
					return if LocalUserModel and LocalUserModel.id then GetStandardSizeAvatarHeadShotRbxthumbFunction(LocalUserModel.id, p1.useProfileFrameThumbnail == true) else nil
				end, { LocalUserModel, p1.useProfileFrameThumbnail }),
				cornerRadius = UDim.new(0.5, 0)
			}),
			UserInfoContainer = ReactModule.createElement(FoundationModule.View, {
				LayoutOrder = 2,
				tag = {
					col = true,
					["gap-xsmall"] = p1.isCompact == true,
					["fill auto-y"] = FFlagEnableFlyoutUncheckedBadge,
					["position-center-left anchor-center-left auto-xy"] = not FFlagEnableFlyoutUncheckedBadge
				}
			}, {
				UsernameContainer = ReactModule.createElement(FoundationModule.View, {
					LayoutOrder = 1,
					tag = {
						["row gap-xsmall"] = true,
						["size-full-0 auto-y"] = FFlagEnableFlyoutUncheckedBadge,
						["position-center-left anchor-center-left auto-xy"] = not FFlagEnableFlyoutUncheckedBadge
					}
				}, {
					DisplayNameText = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = {
							["auto-xy text-title-medium text-align-x-left content-emphasis"] = true,
							["shrink text-truncate-split"] = FFlagEnableFlyoutUncheckedBadge
						},
						Text = LocalUserModel and LocalUserModel.displayName or ""
					}),
					PremiumIcon = if NoIsIsRobloxSubscriber then ReactModule.createElement(Icon, {
						LayoutOrder = 2,
						testId = "profile-card-premium-icon",
						style = UseTokensResult.Color.Content.Emphasis,
						name = BuilderIconsModule.Icon.Premium,
						size = IconSize.Small
					}) else nil,
					SubscriberBadge = if IsIsRobloxSubscriber then ReactModule.createElement(Icon, {
						LayoutOrder = 3,
						testId = "profile-card-subscriber-icon",
						style = UseTokensResult.Color.Content.Emphasis,
						name = IconName.RobloxPlus,
						size = IconSize.Small
					}) else nil
				}),
				UserName = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = {
						["text-body-medium text-align-x-left content-default"] = true,
						["size-full-0 auto-y text-truncate-split"] = FFlagEnableFlyoutUncheckedBadge,
						["auto-xy"] = not FFlagEnableFlyoutUncheckedBadge
					},
					Text = "@" .. (LocalUserModel and LocalUserModel.name or "")
				})
			})
		}),
		UncheckedBadge = if FFlagEnableFlyoutUncheckedBadge and UseAppPolicyResult then ReactModule.createElement(Badge, {
			LayoutOrder = 2,
			text = UseLocalizationResult.Unchecked,
			variant = BadgeVariant.Neutral
		}) else nil
	})
end)