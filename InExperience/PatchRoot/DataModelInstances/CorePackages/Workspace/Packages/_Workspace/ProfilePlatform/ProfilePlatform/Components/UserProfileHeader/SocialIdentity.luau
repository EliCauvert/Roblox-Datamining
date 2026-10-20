local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local VerifiedBadgesModule = require(Parent.VerifiedBadges)
local UIBloxModule = require(Parent.UIBlox)
local HorizontalPageMargin = UIBloxModule.App.Container.HorizontalPageMargin
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local Tooltip = UIBloxModule.App.Dialog.Tooltip
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local OpenTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Enums = FoundationModule.Enums
local StateLayerAffordance = Enums.StateLayerAffordance
local IconSize1 = Enums.IconSize
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local Contexts = require(Parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local FFlagProfilePlatformEnableClickToCopyUsernameModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableClickToCopyUsername)
local FFlagEnableFontStylisticAlternativesOnSocialScreens = require(Parent.SharedFlags).FFlagEnableFontStylisticAlternativesOnSocialScreens
local GetFFlagLuaAppEnableOpenTypeSupportFunction = require(Parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local FFlagProfilePlatformEnableRobloxAdminBadgeModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableRobloxAdminBadge)
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local FFlagHidePremiumIconography = require(Parent.SharedFlags).FFlagHidePremiumIconography
local FFlagAddPlatformNameToProfileHeader = require(Parent.SharedFlags).FFlagAddPlatformNameToProfileHeader
local FFlagDisableCopyUsernameOnConsole = require(Parent.SharedFlags).FFlagDisableCopyUsernameOnConsole
local ResponsiveModule = require(Parent.Responsive)
local GetBuilderIconForCurrentPlatformFunction = FoundationModule.Utility.getBuilderIconForCurrentPlatform
local FFlagProfilePlatformTruncateLongCustomFriendNamesModule = require(ProfilePlatform.Flags.FFlagProfilePlatformTruncateLongCustomFriendNames)
local IconsActionsEditCopy = if FFlagProfilePlatformEnableClickToCopyUsernameModule then Images["icons/actions/edit/copy"] else nil

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FFlagAddPlatformNameToProfileHeader (copy), GetBuilderIconForCurrentPlatformFunction (copy), Images (copy), FFlagProfilePlatformEnableClickToCopyUsernameModule (copy), UseDispatchFunction (copy), UseProfileAnalyticsContextModule (copy), FFlagDisableCopyUsernameOnConsole (copy), ResponsiveModule (copy), FFlagHidePremiumIconography (copy), FFlagEnableBlackbirdCheck (copy), VerifiedBadgesModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), Default (copy), Contexts (copy), EventNamesModule (copy), SetCurrentToastMessageFunction (copy), IconsActionsEditCopy (copy), HorizontalPageMargin (copy), FFlagProfilePlatformTruncateLongCustomFriendNamesModule (copy), View (copy), IconButton (copy), IconSize (copy), Tooltip (copy), TooltipOrientation (copy), Text (copy), FFlagProfilePlatformEnableRobloxAdminBadgeModule (copy), FoundationModule (copy), FFlagEnableFontStylisticAlternativesOnSocialScreens (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), OpenTypeSupport (copy), StateLayerAffordance (copy), Icon (copy), IconSize1 (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagAddPlatformNameToProfileHeader (upval), GetBuilderIconForCurrentPlatformFunction (upval)
		return if FFlagAddPlatformNameToProfileHeader then GetBuilderIconForCurrentPlatformFunction() else nil
	end, {})
	local IconsActionsEditEditOnSmall = if p1.isEdited then Images["icons/actions/edit/editOn_small"] else Images["icons/actions/edit/edit_small"]
	local UseDispatchResult = if FFlagProfilePlatformEnableClickToCopyUsernameModule then UseDispatchFunction() else nil
	local UseProfileAnalyticsContextModuleResult = if FFlagProfilePlatformEnableClickToCopyUsernameModule then UseProfileAnalyticsContextModule() else nil
	local IsUsePreferredInputResultMatch: boolean = if FFlagDisableCopyUsernameOnConsole then ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional else false
	local Text1 = (p1.primaryName .. (if FFlagHidePremiumIconography then "" elseif p1.isPremium and (not FFlagEnableBlackbirdCheck or p1.isRobloxSubscriber ~= true) then VerifiedBadgesModule.emoji.premium else "")) .. (if p1.isVerified then VerifiedBadgesModule.emoji.verified else "")
	local Text2: string = `@{p1.username}`
	local UseLocalizationResult = UseLocalizationFunction({
		tooltipTitle = if p1.isLocalUser then nil else TextKeysModule.AliasTooltipHeader,
		tooltipBody = if p1.isLocalUser then TextKeysModule.DisplayNameTooltipBody else TextKeysModule.AliasTooltipBody,
		usernameCopied = if FFlagProfilePlatformEnableClickToCopyUsernameModule then TextKeysModule.UsernameCopied else nil,
		trustedLabel = TextKeysModule.TrustedLabel
	})
	local UseResult = if FFlagProfilePlatformEnableClickToCopyUsernameModule then ReactModule.useCallback(function()
		-- upvalues: Default (upval), Contexts (upval), p1 (copy), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), SetCurrentToastMessageFunction (upval), UseLocalizationResult (copy), IconsActionsEditCopy (upval)
		Default:setClipboardText({ context = Contexts.ProfileCard, text = p1.username })
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.UsernameCopied)
		UseDispatchResult(SetCurrentToastMessageFunction({
			isLocalized = true,
			toastMessage = UseLocalizationResult.usernameCopied,
			toastIcon = IconsActionsEditCopy
		}))
	end, {
		p1.username,
		UseProfileAnalyticsContextModuleResult,
		UseLocalizationResult.usernameCopied
	}) else nil
	local Text3: string = if p1.isTrustedConnection then ` • {UseLocalizationResult.trustedLabel}` else ""
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.openEditName then
			p1.openEditName()
		end
		p1.dismissTooltip()
	end)
	
	return ReactModule.createElement(HorizontalPageMargin, {
		useAutomaticSizing = true,
		backgroundTransparency = 1,
		size = p1.size,
		layoutOrder = p1.layoutOrder
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		PrimaryNameFrame = if FFlagProfilePlatformTruncateLongCustomFriendNamesModule then ReactModule.createElement(View, {
			tag = "row align-y-center auto-y size-full-0",
			LayoutOrder = 1
		}, {
			PrimaryNameFrameTouchable = ReactModule.createElement(View, {
				tag = "row align-x-left align-y-center auto-xy gap-xxsmall",
				LayoutOrder = 1,
				onActivated = UseResult1
			}, {
				EditNameButton = if p1.openEditName then ReactModule.createElement(IconButton, {
					layoutOrder = 1,
					icon = IconsActionsEditEditOnSmall,
					iconSize = IconSize.Small,
					size = UDim2.fromOffset(26, 26),
					onActivated = UseResult1
				}, {
					tooltip = if p1.isTooltipActive then ReactModule.createElement(Tooltip, {
						forceClickTriggerPoint = true,
						isDirectChild = true,
						triggerPosition = Vector2.new(16, 0),
						triggerSize = Vector2.new(0, 0),
						headerText = UseLocalizationResult.tooltipTitle,
						bodyText = UseLocalizationResult.tooltipBody,
						orientation = TooltipOrientation.Top
					}) else nil
				}) else nil,
				PrimaryName = ReactModule.createElement(Text, {
					tag = "auto-xy text-align-x-left text-align-y-bottom content-emphasis text-truncate-end shrink",
					LayoutOrder = 2,
					Text = Text1,
					fontStyle = UseTokensResult.Typography.HeadingSmall
				}),
				AdminTiltIcon = if FFlagProfilePlatformEnableRobloxAdminBadgeModule and p1.isRobloxAdmin then ReactModule.createElement(FoundationModule.Icon, {
					LayoutOrder = 3,
					name = FoundationModule.Enums.IconName.Tilt,
					size = FoundationModule.Enums.IconSize.Large
				}) else nil,
				SubscriptionBadge = if FFlagEnableBlackbirdCheck and p1.isRobloxSubscriber == true then ReactModule.createElement(View, { tag = "auto-xy padding-top-xxsmall", LayoutOrder = 4 }, {
					Icon = ReactModule.createElement(FoundationModule.Icon, {
						name = FoundationModule.Enums.IconName.RobloxPlus,
						size = FoundationModule.Enums.IconSize.Small
					})
				}) else nil
			})
		}) else ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			PrimaryNameFrameTouchable = ReactModule.createElement("TextButton", {
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = "",
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				[ReactModule.Event.Activated] = UseResult1,
				Selectable = false
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = if FFlagProfilePlatformEnableRobloxAdminBadgeModule and p1.isRobloxAdmin then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Bottom,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				EditNameButton = if p1.openEditName then ReactModule.createElement(IconButton, {
					layoutOrder = 1,
					icon = IconsActionsEditEditOnSmall,
					iconSize = IconSize.Small,
					size = UDim2.fromOffset(26, 26),
					onActivated = UseResult1
				}, {
					tooltip = if p1.isTooltipActive then ReactModule.createElement(Tooltip, {
						forceClickTriggerPoint = true,
						isDirectChild = true,
						triggerPosition = Vector2.new(16, 0),
						triggerSize = Vector2.new(0, 0),
						headerText = UseLocalizationResult.tooltipTitle,
						bodyText = UseLocalizationResult.tooltipBody,
						orientation = TooltipOrientation.Top
					}) else nil
				}) else nil,
				PrimaryName = ReactModule.createElement(Text, {
					tag = "auto-xy text-align-x-left text-align-y-bottom content-emphasis",
					LayoutOrder = 2,
					Text = Text1,
					fontStyle = UseTokensResult.Typography.HeadingSmall
				}),
				AdminTiltIcon = if FFlagProfilePlatformEnableRobloxAdminBadgeModule and p1.isRobloxAdmin then ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, UseTokensResult.Gap.XXSmall),
						PaddingBottom = UDim.new(0, UseTokensResult.Gap.XXSmall)
					}),
					Icon = ReactModule.createElement(FoundationModule.Icon, {
						name = FoundationModule.Enums.IconName.Tilt,
						size = FoundationModule.Enums.IconSize.Large
					})
				}) else nil,
				SubscriptionBadge = if FFlagEnableBlackbirdCheck and p1.isRobloxSubscriber == true then ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, UseTokensResult.Gap.XXSmall),
						PaddingBottom = UDim.new(0, UseTokensResult.Gap.XXSmall)
					}),
					Icon = ReactModule.createElement(FoundationModule.Icon, {
						name = FoundationModule.Enums.IconName.RobloxPlus,
						size = FoundationModule.Enums.IconSize.Small
					})
				}) else nil
			})
		}),
		Username = ReactModule.createElement(Text, {
			tag = "auto-xy text-align-x-left text-align-y-top",
			LayoutOrder = 2,
			RichText = if FFlagEnableFontStylisticAlternativesOnSocialScreens then true else nil,
			Text = if FFlagEnableFontStylisticAlternativesOnSocialScreens then `<font features="zero, ss03">{Text2}</font>` .. Text3 else Text2 .. Text3,
			fontStyle = UseTokensResult.Typography.CaptionMedium,
			OpenTypeFeatures = if FFlagEnableFontStylisticAlternativesOnSocialScreens then nil elseif GetFFlagLuaAppEnableOpenTypeSupportFunction() then OpenTypeSupport:getUserNameStylisticAlternative() else nil,
			onActivated = if IsUsePreferredInputResultMatch then nil else UseResult,
			stateLayer = if IsUsePreferredInputResultMatch then nil elseif FFlagProfilePlatformEnableClickToCopyUsernameModule then { affordance = StateLayerAffordance.None } else nil
		}),
		PlatformName = if FFlagAddPlatformNameToProfileHeader and p1.platformName then ReactModule.createElement(View, {
			tag = "row align-y-center gap-xsmall auto-xy",
			LayoutOrder = 3
		}, {
			PlatformIcon = if UseMemoResult then ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = UseMemoResult,
				size = IconSize1.XSmall
			}) else nil,
			PlatformNameLabel = ReactModule.createElement(Text, {
				tag = "shrink auto-xy text-align-x-left text-align-y-top",
				LayoutOrder = 2,
				Text = p1.platformName,
				fontStyle = UseTokensResult.Typography.CaptionMedium
			})
		}) else nil
	})
end