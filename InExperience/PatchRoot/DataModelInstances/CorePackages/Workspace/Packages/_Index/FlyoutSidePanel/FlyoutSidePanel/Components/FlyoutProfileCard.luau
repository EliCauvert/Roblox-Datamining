local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local builderIconsModule = require(parent.BuilderIcons)
local getStandardSizeAvatarHeadShotRbxthumb = require(parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local badge = foundationModule.Badge
local badgeVariant = foundationModule.Enums.BadgeVariant
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local iconName = foundationModule.Enums.IconName
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local loadableImage = UIBloxModule.App.Loading.LoadableImage
local flyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useLocalization = require(parent.Localization).Hooks.useLocalization
local chevronSmallDownButtonModule = require(script.Parent.ChevronSmallDownButton)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableBlackbirdCheck = sharedFlagsModule.FFlagEnableBlackbirdCheck
local fFlagHidePremiumIconography = sharedFlagsModule.FFlagHidePremiumIconography
local fFlagEnableFlyoutUncheckedBadge = sharedFlagsModule.FFlagEnableFlyoutUncheckedBadge
local fFlagEnableDrawerFocusNav = sharedFlagsModule.FFlagEnableDrawerFocusNav
local fFlagFlyoutSidePanelUseProfileFrameThumbnail = sharedFlagsModule.FFlagFlyoutSidePanelUseProfileFrameThumbnail

return function(p1)
	-- upvalues: useTokens (ref), fFlagEnableFlyoutUncheckedBadge (ref), useLocalization (ref), useAppPolicy (ref), useRoactService (ref), appEventIngestService (ref), reactModule (ref), flyoutAnalyticsModule (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), fFlagFlyoutSidePanelUseProfileFrameThumbnail (ref), fFlagEnableBlackbirdCheck (ref), fFlagHidePremiumIconography (ref), foundationModule (ref), fFlagEnableDrawerFocusNav (ref), loadableImage (ref), text (ref), icon (ref), builderIconsModule (ref), iconSize (ref), iconName (ref), badge (ref), badgeVariant (ref), chevronSmallDownButtonModule (ref)
	local var1
	local var2 = useTokens()
	local var3 = if fFlagEnableFlyoutUncheckedBadge then useLocalization({ Unchecked = "CommonUI.Features.Label.Unchecked" }) else nil
	local var4 = if fFlagEnableFlyoutUncheckedBadge then useAppPolicy(function(p2)
		return p2.getShowUncheckedBadge()
	end) else nil
	local var5 = useRoactService(appEventIngestService)
	local localUserModel = p1.localUserModel
	local var6 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), localUserModel (ref), flyoutAnalyticsModule (copy), var5 (ref)
		p1.closeDrawer()
		
		if p1.onProfileActivated then
			p1.onProfileActivated()
			flyoutAnalyticsModule.sendMoreLegacyAndFlyoutItemClickEvent(var5, "Profile", if localUserModel then localUserModel.id else "")
		end
	end, {
		localUserModel,
		p1.onProfileActivated,
		p1.closeDrawer,
		var5
	})
	local var7 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.closeDrawer()
		
		if p1.onSwitchAccountActivated then
			p1.onSwitchAccountActivated()
		end
	end, { p1.onSwitchAccountActivated, p1.closeDrawer })
	local var8 = reactModule.useMemo(function()
		-- upvalues: localUserModel (ref), getStandardSizeAvatarHeadShotRbxthumb (copy), fFlagFlyoutSidePanelUseProfileFrameThumbnail (copy)
		return if localUserModel and localUserModel.id then getStandardSizeAvatarHeadShotRbxthumb(localUserModel.id, fFlagFlyoutSidePanelUseProfileFrameThumbnail) else nil
	end, { localUserModel })
	local var9 = reactModule.useMemo(function()
		-- upvalues: localUserModel (ref)
		return localUserModel and localUserModel.membership == Enum.MembershipType.Premium
	end, { localUserModel })
	local var10 = if localUserModel then localUserModel.name else ""
	local var11 = if localUserModel then localUserModel.displayName else ""
	
	if fFlagEnableBlackbirdCheck then
		var1 = p1.isRobloxSubscriber == true
		var1 = nil
	else
		var1 = false
	end
	return reactModule.createElement(foundationModule.View, {
		tag = {
			["auto-y size-full-0"] = true,
			["row align-y-center gap-small"] = fFlagEnableFlyoutUncheckedBadge
		},
		LayoutOrder = p1.layoutOrder
	}, {
		ProfileCardButton = reactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			AutomaticSize = if fFlagEnableFlyoutUncheckedBadge then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
			LayoutOrder = if fFlagEnableFlyoutUncheckedBadge then 1 else nil,
			[reactModule.Event.Activated] = var6
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
				Size = UDim2.new(0, var2.Size.Size_1600, 0, var2.Size.Size_1600),
				BackgroundColor3 = var2.Color.Common.Shimmer.Color3,
				BackgroundTransparency = var2.Color.Common.Shimmer.Transparency,
				Image = var8,
				cornerRadius = UDim.new(0.5, 0)
			}),
			UserInfoContainer = reactModule.createElement(foundationModule.View, {
				LayoutOrder = 2,
				tag = {
					col = true,
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
							["auto-xy text-title-medium content-emphasis text-align-x-left"] = true,
							["shrink text-truncate-split"] = fFlagEnableFlyoutUncheckedBadge
						},
						Text = var11
					}),
					PremiumIcon = if if fFlagHidePremiumIconography then false else var9 and not var1 then reactModule.createElement(icon, {
						LayoutOrder = 2,
						style = var2.Color.Content.Emphasis,
						name = builderIconsModule.Icon.Premium,
						size = iconSize.Small
					}) else nil,
					SubscriberBadge = if var1 then reactModule.createElement(icon, {
						LayoutOrder = 3,
						style = var2.Color.Content.Emphasis,
						name = iconName.RobloxPlus,
						size = iconSize.Small
					}) else nil
				}),
				UserName = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = {
						["text-body-medium content-default text-align-x-left"] = true,
						["size-full-0 auto-y text-truncate-split"] = fFlagEnableFlyoutUncheckedBadge,
						["auto-xy"] = not fFlagEnableFlyoutUncheckedBadge
					},
					Text = "@" .. var15
				})
			})
		}),
		UncheckedBadge = if fFlagEnableFlyoutUncheckedBadge and var4 then reactModule.createElement(badge, {
			LayoutOrder = 2,
			text = var3.Unchecked,
			variant = badgeVariant.Neutral
		}) else nil,
		SwitchAccountButton = if p1.onSwitchAccountActivated then reactModule.createElement(chevronSmallDownButtonModule, {
			onActivated = var7,
			layoutOrder = if fFlagEnableFlyoutUncheckedBadge then 3 else nil
		}) else nil
	})
end