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
local fFlagRenameDeprecatedUIBloxTokens = sharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local fFlagEnableBlackbirdCheck = sharedFlagsModule.FFlagEnableBlackbirdCheck
local fFlagHidePremiumIconography = sharedFlagsModule.FFlagHidePremiumIconography
local fFlagEnableFlyoutUncheckedBadge = sharedFlagsModule.FFlagEnableFlyoutUncheckedBadge

return function(p0) --[[ line: 42 | named "FlyoutProfileCard" ]]
	-- upvalues: useTokens (ref), fFlagEnableFlyoutUncheckedBadge (ref), useLocalization (ref), useAppPolicy (ref), useRoactService (ref), appEventIngestService (ref), reactModule (ref), flyoutAnalyticsModule (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), fFlagEnableBlackbirdCheck (ref), fFlagHidePremiumIconography (ref), foundationModule (ref), loadableImage (ref), fFlagRenameDeprecatedUIBloxTokens (ref), text (ref), icon (ref), builderIconsModule (ref), iconSize (ref), iconName (ref), badge (ref), badgeVariant (ref), chevronSmallDownButtonModule (ref)
	local var17
	local var7 = useTokens()
	local var8 = if fFlagEnableFlyoutUncheckedBadge then useLocalization({ Unchecked = "CommonUI.Features.Label.Unchecked" }) else nil
	local var9 = if fFlagEnableFlyoutUncheckedBadge then useAppPolicy(function(p1) --[[ line: 52 ]]
		return p1.getShowUncheckedBadge()
	end) else nil
	local var10 = useRoactService(appEventIngestService)
	local localUserModel = p0.localUserModel
	local var11 = reactModule.useCallback(function() --[[ line: 59 ]]
		-- upvalues: p0 (ref), localUserModel (ref), flyoutAnalyticsModule (copy), var10 (ref)
		p0.closeDrawer()
		
		if p0.onProfileActivated then
			p0.onProfileActivated()
			flyoutAnalyticsModule.sendMoreLegacyAndFlyoutItemClickEvent(var10, "Profile", if localUserModel then localUserModel.id else "")
		end
	end, {
		localUserModel,
		p0.onProfileActivated,
		p0.closeDrawer,
		var10
	})
	local var12 = reactModule.useCallback(function() --[[ line: 67 ]]
		-- upvalues: p0 (ref)
		p0.closeDrawer()
		
		if p0.onSwitchAccountActivated then
			p0.onSwitchAccountActivated()
		end
	end, { p0.onSwitchAccountActivated, p0.closeDrawer })
	local var13 = reactModule.useMemo(function() --[[ line: 74 ]]
		-- upvalues: localUserModel (ref), getStandardSizeAvatarHeadShotRbxthumb (copy)
		return if localUserModel and localUserModel.id then getStandardSizeAvatarHeadShotRbxthumb(localUserModel.id) else nil
	end, { localUserModel })
	local var14 = reactModule.useMemo(function() --[[ line: 81 ]]
		-- upvalues: localUserModel (ref)
		return localUserModel and localUserModel.membership == Enum.MembershipType.Premium
	end, { localUserModel })
	local var15 = if localUserModel then localUserModel.name else ""
	local var16 = if localUserModel then localUserModel.displayName else ""
	
	if fFlagEnableBlackbirdCheck then
		var17 = p0.isRobloxSubscriber == true
		var17 = nil
	else
		var17 = false
	end
	return reactModule.createElement(foundationModule.View, {
		tag = {
			["auto-y size-full-0"] = true,
			["row align-y-center gap-small"] = fFlagEnableFlyoutUncheckedBadge
		},
		LayoutOrder = p0.layoutOrder
	}, {
		ProfileCardButton = reactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			AutomaticSize = if fFlagEnableFlyoutUncheckedBadge then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
			LayoutOrder = if fFlagEnableFlyoutUncheckedBadge then 1 else nil,
			[reactModule.Event.Activated] = var11
		}, {
			UIFlexItem = if fFlagEnableFlyoutUncheckedBadge then reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }) else nil,
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, var7.Gap.Medium)
			}),
			UserAvatar = reactModule.createElement(loadableImage, {
				useShimmerAnimationWhileLoading = true,
				shouldHandleReloads = true,
				LayoutOrder = 1,
				Size = UDim2.new(0, var7.Size.Size_1600, 0, var7.Size.Size_1600),
				BackgroundColor3 = (if fFlagRenameDeprecatedUIBloxTokens then var7.Color.Common.Shimmer else var7.Semantic.Color.Common.Placeholder).Color3,
				BackgroundTransparency = (if fFlagRenameDeprecatedUIBloxTokens then var7.Color.Common.Shimmer else var7.Semantic.Color.Common.Placeholder).Transparency,
				Image = var13,
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
						Text = var16
					}),
					PremiumIcon = if if fFlagHidePremiumIconography then false else var14 and not var17 then reactModule.createElement(icon, {
						LayoutOrder = 2,
						style = var7.Color.Content.Emphasis,
						name = builderIconsModule.Icon.Premium,
						size = iconSize.Small
					}) else nil,
					SubscriberBadge = if var17 then reactModule.createElement(icon, {
						LayoutOrder = 3,
						style = var7.Color.Content.Emphasis,
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
		UncheckedBadge = if fFlagEnableFlyoutUncheckedBadge and var9 then reactModule.createElement(badge, {
			LayoutOrder = 2,
			text = var8.Unchecked,
			variant = badgeVariant.Neutral
		}) else nil,
		SwitchAccountButton = if p0.onSwitchAccountActivated then reactModule.createElement(chevronSmallDownButtonModule, {
			onActivated = var12,
			layoutOrder = if fFlagEnableFlyoutUncheckedBadge then 3 else nil
		}) else nil
	})
end