local parent = script:FindFirstAncestor("ProfileCard").Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local UIBloxModule = require(parent.UIBlox)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local getStandardSizeAvatarHeadShotRbxthumb = require(parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local badge = foundationModule.Badge
local badgeVariant = foundationModule.Enums.BadgeVariant
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local loadableImage = UIBloxModule.App.Loading.LoadableImage
local text = foundationModule.Text
local useAppPolicy = universalAppPolicyModule.useAppPolicy
local useLocalization = localizationModule.Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local fFlagEnableFlyoutUncheckedBadge = sharedFlagsModule.FFlagEnableFlyoutUncheckedBadge
local fFlagEnableDrawerFocusNav = sharedFlagsModule.FFlagEnableDrawerFocusNav
local fFlagHidePremiumIconography = sharedFlagsModule.FFlagHidePremiumIconography
local fFlagEnableBlackbirdCheck = sharedFlagsModule.FFlagEnableBlackbirdCheck

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), fFlagEnableFlyoutUncheckedBadge (ref), useLocalization (ref), useAppPolicy (ref), reactModule (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), fFlagEnableBlackbirdCheck (ref), fFlagHidePremiumIconography (ref), foundationModule (ref), fFlagEnableDrawerFocusNav (ref), loadableImage (ref), text (ref), icon (ref), builderIconsModule (ref), iconSize (ref), iconName (ref), badge (ref), badgeVariant (ref)
	local var1
	local var2 = useTokens()
	local var3 = if fFlagEnableFlyoutUncheckedBadge then useLocalization({ Unchecked = "CommonUI.Features.Label.Unchecked" }) else nil
	local var4 = if fFlagEnableFlyoutUncheckedBadge then useAppPolicy(function(p2)
		return p2.getShowUncheckedBadge()
	end) else nil
	local localUserModel = p1.localUserModel
	local var5 = reactModule.useMemo(function()
		-- upvalues: localUserModel (ref), getStandardSizeAvatarHeadShotRbxthumb (copy), p1 (ref)
		return if localUserModel and localUserModel.id then getStandardSizeAvatarHeadShotRbxthumb(localUserModel.id, p1.useProfileFrameThumbnail == true) else nil
	end, { localUserModel, p1.useProfileFrameThumbnail })
	local var6 = reactModule.useMemo(function()
		-- upvalues: localUserModel (ref)
		return localUserModel and localUserModel.membership == Enum.MembershipType.Premium
	end, { localUserModel })
	local var7 = if p1.isCompact then var2.Size.Size_1000 else var2.Size.Size_1600
	local var8 = if localUserModel then localUserModel.name else ""
	local var9 = if localUserModel then localUserModel.displayName else ""
	
	if fFlagEnableBlackbirdCheck then
		var1 = p1.isRobloxSubscriber == true
		var1 = nil
	else
		var1 = false
	end
	local onProfileActivated = p1.onProfileActivated
	
	return reactModule.createElement(foundationModule.View, {
		tag = {
			["size-full-0 auto-y"] = true,
			["row align-y-center gap-small"] = fFlagEnableFlyoutUncheckedBadge,
			["padding-y-medium"] = p1.isCompact == true
		},
		LayoutOrder = p1.layoutOrder
	}, {
		ProfileCardButton = reactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			Active = onProfileActivated ~= nil,
			Selectable = onProfileActivated ~= nil,
			AutomaticSize = if fFlagEnableFlyoutUncheckedBadge then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
			LayoutOrder = if fFlagEnableFlyoutUncheckedBadge then 1 else nil,
			[reactModule.Event.Activated] = reactModule.useCallback(function()
				-- upvalues: onProfileActivated (ref)
				if onProfileActivated then
					onProfileActivated()
				end
			end, { onProfileActivated }),
			[reactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil
		}, {
			UIPadding = if fFlagEnableDrawerFocusNav then reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, var2.Padding.Small) }) else nil,
			UIFlexItem = if fFlagEnableFlyoutUncheckedBadge then reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }) else nil,
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, var2.Gap.Medium)
			}),
			UserAvatar = reactModule.createElement(loadableImage, {
				useShimmerAnimationWhileLoading = true,
				shouldHandleReloads = true,
				LayoutOrder = 1,
				Size = UDim2.fromOffset(var7, var7),
				BackgroundColor3 = var2.Color.Common.Shimmer.Color3,
				BackgroundTransparency = var2.Color.Common.Shimmer.Transparency,
				Image = var5,
				cornerRadius = UDim.new(0.5, 0)
			}),
			UserInfoContainer = reactModule.createElement(foundationModule.View, {
				LayoutOrder = 2,
				tag = {
					col = true,
					["gap-xsmall"] = p1.isCompact == true,
					["fill auto-y"] = fFlagEnableFlyoutUncheckedBadge,
					["position-center-left anchor-center-left auto-xy"] = not fFlagEnableFlyoutUncheckedBadge
				}
			}, {
				UsernameContainer = reactModule.createElement(foundationModule.View, {
					LayoutOrder = 1,
					tag = {
						["row gap-xsmall"] = true,
						["size-full-0 auto-y"] = fFlagEnableFlyoutUncheckedBadge,
						["position-center-left anchor-center-left auto-xy"] = not fFlagEnableFlyoutUncheckedBadge
					}
				}, {
					DisplayNameText = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = {
							["auto-xy text-title-medium text-align-x-left content-emphasis"] = true,
							["shrink text-truncate-split"] = fFlagEnableFlyoutUncheckedBadge
						},
						Text = var9
					}),
					PremiumIcon = if if fFlagHidePremiumIconography then false else var6 and not var1 then reactModule.createElement(icon, {
						LayoutOrder = 2,
						testId = "profile-card-premium-icon",
						style = var2.Color.Content.Emphasis,
						name = builderIconsModule.Icon.Premium,
						size = iconSize.Small
					}) else nil,
					SubscriberBadge = if var1 then reactModule.createElement(icon, {
						LayoutOrder = 3,
						testId = "profile-card-subscriber-icon",
						style = var2.Color.Content.Emphasis,
						name = iconName.RobloxPlus,
						size = iconSize.Small
					}) else nil
				}),
				UserName = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = {
						["text-body-medium text-align-x-left content-default"] = true,
						["size-full-0 auto-y text-truncate-split"] = fFlagEnableFlyoutUncheckedBadge,
						["auto-xy"] = not fFlagEnableFlyoutUncheckedBadge
					},
					Text = "@" .. var13
				})
			})
		}),
		UncheckedBadge = if fFlagEnableFlyoutUncheckedBadge and var4 then reactModule.createElement(badge, {
			LayoutOrder = 2,
			text = var3.Unchecked,
			variant = badgeVariant.Neutral
		}) else nil
	})
end)