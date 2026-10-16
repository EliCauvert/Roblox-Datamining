local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local BuilderIconsModule = require(Parent.BuilderIcons)
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local Badge = FoundationModule.Badge
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local IconName = FoundationModule.Enums.IconName
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local LoadableImage = require(Parent.UIBlox).App.Loading.LoadableImage
local FlyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ChevronSmallDownButtonModule = require(script.Parent.ChevronSmallDownButton)
local GetTestIdFunction = require(Parent.RoactUtils).getTestId
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppAddTestIdsForArrow = SharedFlagsModule.FFlagLuaAppAddTestIdsForArrow
local FFlagEnableBlackbirdCheck = SharedFlagsModule.FFlagEnableBlackbirdCheck
local FFlagHidePremiumIconography = SharedFlagsModule.FFlagHidePremiumIconography
local FFlagEnableFlyoutUncheckedBadge = SharedFlagsModule.FFlagEnableFlyoutUncheckedBadge
local FFlagEnableDrawerFocusNav = SharedFlagsModule.FFlagEnableDrawerFocusNav
local FFlagFlyoutSidePanelUseProfileFrameThumbnail = SharedFlagsModule.FFlagFlyoutSidePanelUseProfileFrameThumbnail

return function(p1) --[[ Line: 45 | Named "FlyoutProfileCard" ]]
	-- upvalues: UseTokensFunction (copy), FFlagEnableFlyoutUncheckedBadge (copy), UseLocalizationFunction (copy), UseAppPolicyFunction (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), ReactModule (copy), FlyoutAnalyticsModule (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), FFlagFlyoutSidePanelUseProfileFrameThumbnail (copy), FFlagEnableBlackbirdCheck (copy), FFlagHidePremiumIconography (copy), FoundationModule (copy), FFlagLuaAppAddTestIdsForArrow (copy), GetTestIdFunction (copy), FFlagEnableDrawerFocusNav (copy), LoadableImage (copy), Text (copy), Icon (copy), BuilderIconsModule (copy), IconSize (copy), IconName (copy), Badge (copy), BadgeVariant (copy), ChevronSmallDownButtonModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = if FFlagEnableFlyoutUncheckedBadge then UseLocalizationFunction({ Unchecked = "CommonUI.Features.Label.Unchecked" }) else nil
	local UseAppPolicyResult = if FFlagEnableFlyoutUncheckedBadge then UseAppPolicyFunction(function(p2) --[[ Line: 55 ]]
		return p2.getShowUncheckedBadge()
	end) else nil
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local LocalUserModel = p1.localUserModel
	local UseResult = ReactModule.useCallback(function() --[[ Line: 70 ]]
		-- upvalues: p1 (copy)
		p1.closeDrawer()
		
		if p1.onSwitchAccountActivated then
			p1.onSwitchAccountActivated()
		end
	end, { p1.onSwitchAccountActivated, p1.closeDrawer })
	local UseMemoResult = ReactModule.useMemo(function(): boolean --[[ Line: 87 ]]
		-- upvalues: LocalUserModel (copy)
		return LocalUserModel and LocalUserModel.membership == Enum.MembershipType.Premium
	end, { LocalUserModel })
	local IsIsRobloxSubscriber: boolean = if FFlagEnableBlackbirdCheck then p1.isRobloxSubscriber == true else false
	local NoIsIsRobloxSubscriber: boolean = not FFlagHidePremiumIconography and (UseMemoResult and not IsIsRobloxSubscriber)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = {
			["auto-y size-full-0"] = true,
			["row align-y-center gap-small"] = FFlagEnableFlyoutUncheckedBadge
		},
		LayoutOrder = p1.layoutOrder
	}, {
		ProfileCardButton = ReactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			AutomaticSize = if FFlagEnableFlyoutUncheckedBadge then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
			LayoutOrder = if FFlagEnableFlyoutUncheckedBadge then 1 else nil,
			[ReactModule.Event.Activated] = ReactModule.useCallback(function() --[[ Line: 62 ]]
				-- upvalues: p1 (copy), LocalUserModel (copy), FlyoutAnalyticsModule (upval), UseRoactServiceResult (copy)
				p1.closeDrawer()
				
				if p1.onProfileActivated then
					p1.onProfileActivated()
					FlyoutAnalyticsModule.sendMoreLegacyAndFlyoutItemClickEvent(UseRoactServiceResult, "Profile", LocalUserModel and LocalUserModel.id or "")
				end
			end, {
				LocalUserModel,
				p1.onProfileActivated,
				p1.closeDrawer,
				UseRoactServiceResult
			}),
			[ReactModule.Tag] = if FFlagLuaAppAddTestIdsForArrow then GetTestIdFunction("core-ui-flyout-profile-card") else nil
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
				Size = UDim2.new(0, UseTokensResult.Size.Size_1600, 0, UseTokensResult.Size.Size_1600),
				BackgroundColor3 = UseTokensResult.Color.Common.Shimmer.Color3,
				BackgroundTransparency = UseTokensResult.Color.Common.Shimmer.Transparency,
				Image = ReactModule.useMemo(function() --[[ Line: 77 ]]
					-- upvalues: LocalUserModel (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (upval), FFlagFlyoutSidePanelUseProfileFrameThumbnail (upval)
					return if LocalUserModel and LocalUserModel.id then GetStandardSizeAvatarHeadShotRbxthumbFunction(LocalUserModel.id, FFlagFlyoutSidePanelUseProfileFrameThumbnail) else nil
				end, { LocalUserModel }),
				cornerRadius = UDim.new(0.5, 0)
			}),
			UserInfoContainer = ReactModule.createElement(FoundationModule.View, {
				LayoutOrder = 2,
				tag = {
					col = true,
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
							["auto-xy text-title-medium content-emphasis text-align-x-left"] = true,
							["shrink text-truncate-split"] = FFlagEnableFlyoutUncheckedBadge
						},
						Text = LocalUserModel and LocalUserModel.displayName or ""
					}),
					PremiumIcon = if NoIsIsRobloxSubscriber then ReactModule.createElement(Icon, {
						LayoutOrder = 2,
						style = UseTokensResult.Color.Content.Emphasis,
						name = BuilderIconsModule.Icon.Premium,
						size = IconSize.Small
					}) else nil,
					SubscriberBadge = if IsIsRobloxSubscriber then ReactModule.createElement(Icon, {
						LayoutOrder = 3,
						style = UseTokensResult.Color.Content.Emphasis,
						name = IconName.RobloxPlus,
						size = IconSize.Small
					}) else nil
				}),
				UserName = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = {
						["text-body-medium content-default text-align-x-left"] = true,
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
		}) else nil,
		SwitchAccountButton = if p1.onSwitchAccountActivated then ReactModule.createElement(ChevronSmallDownButtonModule, {
			onActivated = UseResult,
			layoutOrder = if FFlagEnableFlyoutUncheckedBadge then 3 else nil
		}) else nil
	})
end