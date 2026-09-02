local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local verifiedBadgesModule = require(parent.VerifiedBadges)
local UIBloxModule = require(parent.UIBlox)
local horizontalPageMargin = UIBloxModule.App.Container.HorizontalPageMargin
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local images = UIBloxModule.App.ImageSet.Images
local tooltip = UIBloxModule.App.Dialog.Tooltip
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local openTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local useTokens = foundationModule.Hooks.useTokens
local enums = foundationModule.Enums
local stateLayerAffordance = enums.StateLayerAffordance
local iconSize_1 = enums.IconSize
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local contexts = require(parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local textKeysModule = require(profilePlatform.Common.TextKeys)
local fFlagFriendRequestNicknames = require(parent.SharedFlags).FFlagFriendRequestNicknames
local fFlagProfilePlatformEnableClickToCopyUsernameModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableClickToCopyUsername)
local fFlagEnableFontStylisticAlternativesOnSocialScreens = require(parent.SharedFlags).FFlagEnableFontStylisticAlternativesOnSocialScreens
local getFFlagLuaAppEnableOpenTypeSupport = require(parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local fFlagProfilePlatformEnableRobloxAdminBadgeModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableRobloxAdminBadge)
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local fFlagHidePremiumIconography = require(parent.SharedFlags).FFlagHidePremiumIconography
local fFlagAddPlatformNameToProfileHeader = require(parent.SharedFlags).FFlagAddPlatformNameToProfileHeader
local fFlagDisableCopyUsernameOnConsole = require(parent.SharedFlags).FFlagDisableCopyUsernameOnConsole
local responsiveModule = require(parent.Responsive)
local getBuilderIconForCurrentPlatform = foundationModule.Utility.getBuilderIconForCurrentPlatform
local fFlagProfilePlatformTruncateLongCustomFriendNamesModule = require(profilePlatform.Flags.FFlagProfilePlatformTruncateLongCustomFriendNames)
local var1 = if fFlagProfilePlatformEnableClickToCopyUsernameModule then images["icons/actions/edit/copy"] else nil

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), fFlagAddPlatformNameToProfileHeader (ref), getBuilderIconForCurrentPlatform (ref), images (ref), fFlagProfilePlatformEnableClickToCopyUsernameModule (ref), useDispatch (ref), useProfileAnalyticsContextModule (ref), fFlagDisableCopyUsernameOnConsole (ref), responsiveModule (ref), fFlagHidePremiumIconography (ref), fFlagEnableBlackbirdCheck (ref), verifiedBadgesModule (ref), useLocalization (ref), textKeysModule (ref), default (ref), contexts (ref), eventNamesModule (ref), setCurrentToastMessage (ref), var1 (ref), horizontalPageMargin (ref), fFlagProfilePlatformTruncateLongCustomFriendNamesModule (ref), view (ref), iconButton (ref), iconSize (ref), tooltip (ref), tooltipOrientation (ref), text (ref), fFlagFriendRequestNicknames (ref), fFlagProfilePlatformEnableRobloxAdminBadgeModule (ref), foundationModule (ref), fFlagEnableFontStylisticAlternativesOnSocialScreens (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), openTypeSupport (ref), stateLayerAffordance (ref), icon (ref), iconSize_1 (ref)
	local var2
	local var3 = useTokens()
	local var4 = reactModule.useMemo(function()
		-- upvalues: fFlagAddPlatformNameToProfileHeader (copy), getBuilderIconForCurrentPlatform (copy)
		return if fFlagAddPlatformNameToProfileHeader then getBuilderIconForCurrentPlatform() else nil
	end, {})
	local var5 = if p1.isEdited then images["icons/actions/edit/editOn_small"] else images["icons/actions/edit/edit_small"]
	local var6 = if fFlagProfilePlatformEnableClickToCopyUsernameModule then useDispatch() else nil
	local var7 = if fFlagProfilePlatformEnableClickToCopyUsernameModule then useProfileAnalyticsContextModule() else nil
	
	if fFlagDisableCopyUsernameOnConsole then
		var2 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
		var2 = nil
	else
		var2 = false
	end
	local createElement_1
	local primaryName = p1.primaryName
	primaryName = (primaryName .. (if fFlagHidePremiumIconography then "" elseif p1.isPremium and (not fFlagEnableBlackbirdCheck or p1.isRobloxSubscriber ~= true) then verifiedBadgesModule.emoji.premium else "")) .. (if p1.isVerified then verifiedBadgesModule.emoji.verified else "")
	local username = `@{p1.username}`
	local var8 = useLocalization({
		tooltipTitle = if p1.isLocalUser then nil else textKeysModule.AliasTooltipHeader,
		tooltipBody = if p1.isLocalUser then textKeysModule.DisplayNameTooltipBody else textKeysModule.AliasTooltipBody,
		usernameCopied = if fFlagProfilePlatformEnableClickToCopyUsernameModule then textKeysModule.UsernameCopied else nil,
		trustedLabel = textKeysModule.TrustedLabel
	})
	local var9 = if fFlagProfilePlatformEnableClickToCopyUsernameModule then reactModule.useCallback(function()
		-- upvalues: default (copy), contexts (copy), p1 (ref), var7 (ref), eventNamesModule (copy), var6 (ref), setCurrentToastMessage (copy), var8 (ref), var1 (copy)
		default:setClipboardText({ context = contexts.ProfileCard, text = p1.username })
		var7.fireAnalyticsEvent(eventNamesModule.UsernameCopied)
		var6(setCurrentToastMessage({
			isLocalized = true,
			toastMessage = var8.usernameCopied,
			toastIcon = var1
		}))
	end, { p1.username, var7, var8.usernameCopied }) else nil
	local var10 = if p1.isTrustedConnection then ` \226\128\162 {var8.trustedLabel}` else ""
	local var11 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.openEditName then
			p1.openEditName()
		end
		p1.dismissTooltip()
	end)
	local createElement = reactModule.createElement
	local t = {
		useAutomaticSizing = true,
		backgroundTransparency = 1,
		size = p1.size,
		layoutOrder = p1.layoutOrder
	}
	local t_1 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	if fFlagProfilePlatformTruncateLongCustomFriendNamesModule then
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(view, {
			tag = "row align-y-center auto-y size-full-0",
			LayoutOrder = 1
		}, {
			PrimaryNameFrameTouchable = reactModule.createElement(view, {
				tag = "row align-x-left align-y-center auto-xy gap-xxsmall",
				LayoutOrder = 1,
				onActivated = var11
			}, {
				EditNameButton = if p1.openEditName then reactModule.createElement(iconButton, {
					layoutOrder = 1,
					icon = var5,
					iconSize = iconSize.Small,
					size = UDim2.fromOffset(26, 26),
					onActivated = var11
				}, {
					tooltip = if p1.isTooltipActive then reactModule.createElement(tooltip, {
						forceClickTriggerPoint = true,
						isDirectChild = true,
						triggerPosition = Vector2.new(16, 0),
						triggerSize = Vector2.new(0, 0),
						headerText = var8.tooltipTitle,
						bodyText = var8.tooltipBody,
						orientation = tooltipOrientation.Top
					}) else nil
				}) else nil,
				PrimaryName = reactModule.createElement(text, {
					tag = "auto-xy text-align-x-left text-align-y-bottom content-emphasis text-truncate-end shrink",
					LayoutOrder = 2,
					Text = primaryName,
					fontStyle = var3.Typography.HeadingSmall,
					Size = if fFlagFriendRequestNicknames then UDim2.new(1, 0, 1, 0) else nil,
					TextWrapped = if fFlagFriendRequestNicknames then true else nil,
					FluidSizing = if fFlagFriendRequestNicknames then false else nil,
					LineHeight = if fFlagFriendRequestNicknames then 1 else nil
				}),
				AdminTiltIcon = if fFlagProfilePlatformEnableRobloxAdminBadgeModule and p1.isRobloxAdmin then reactModule.createElement(foundationModule.Icon, {
					LayoutOrder = 3,
					name = foundationModule.Enums.IconName.Tilt,
					size = foundationModule.Enums.IconSize.Large
				}) else nil,
				SubscriptionBadge = if fFlagEnableBlackbirdCheck and p1.isRobloxSubscriber == true then reactModule.createElement(view, { tag = "auto-xy padding-top-xxsmall", LayoutOrder = 4 }, {
					Icon = reactModule.createElement(foundationModule.Icon, {
						name = foundationModule.Enums.IconName.RobloxPlus,
						size = foundationModule.Enums.IconSize.Small
					})
				}) else nil
			})
		})
	else
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			PrimaryNameFrameTouchable = reactModule.createElement("TextButton", {
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = "",
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				[reactModule.Event.Activated] = var11,
				Selectable = false
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = if fFlagProfilePlatformEnableRobloxAdminBadgeModule and p1.isRobloxAdmin then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Bottom,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				EditNameButton = if p1.openEditName then reactModule.createElement(iconButton, {
					layoutOrder = 1,
					icon = var5,
					iconSize = iconSize.Small,
					size = UDim2.fromOffset(26, 26),
					onActivated = var11
				}, {
					tooltip = if p1.isTooltipActive then reactModule.createElement(tooltip, {
						forceClickTriggerPoint = true,
						isDirectChild = true,
						triggerPosition = Vector2.new(16, 0),
						triggerSize = Vector2.new(0, 0),
						headerText = var8.tooltipTitle,
						bodyText = var8.tooltipBody,
						orientation = tooltipOrientation.Top
					}) else nil
				}) else nil,
				PrimaryName = reactModule.createElement(text, {
					tag = "auto-xy text-align-x-left text-align-y-bottom content-emphasis",
					LayoutOrder = 2,
					Text = primaryName,
					fontStyle = var3.Typography.HeadingSmall,
					Size = if fFlagFriendRequestNicknames then UDim2.new(1, 0, 1, 0) else nil,
					TextWrapped = if fFlagFriendRequestNicknames then true else nil,
					FluidSizing = if fFlagFriendRequestNicknames then false else nil,
					LineHeight = if fFlagFriendRequestNicknames then 1 else nil
				}),
				AdminTiltIcon = if fFlagProfilePlatformEnableRobloxAdminBadgeModule and p1.isRobloxAdmin then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIPadding = reactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, var3.Gap.XXSmall),
						PaddingBottom = UDim.new(0, var3.Gap.XXSmall)
					}),
					Icon = reactModule.createElement(foundationModule.Icon, {
						name = foundationModule.Enums.IconName.Tilt,
						size = foundationModule.Enums.IconSize.Large
					})
				}) else nil,
				SubscriptionBadge = if fFlagEnableBlackbirdCheck and p1.isRobloxSubscriber == true then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIPadding = reactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, var3.Gap.XXSmall),
						PaddingBottom = UDim.new(0, var3.Gap.XXSmall)
					}),
					Icon = reactModule.createElement(foundationModule.Icon, {
						name = foundationModule.Enums.IconName.RobloxPlus,
						size = foundationModule.Enums.IconSize.Small
					})
				}) else nil
			})
		})
	end
	t_1.PrimaryNameFrame = createElement_1
	t_1.Username = reactModule.createElement(text, {
		tag = "auto-xy text-align-x-left text-align-y-top",
		LayoutOrder = 2,
		RichText = if fFlagEnableFontStylisticAlternativesOnSocialScreens then true else nil,
		Text = if fFlagEnableFontStylisticAlternativesOnSocialScreens then `<font features="zero, ss03">{username}</font>` .. var22 else username .. var22,
		fontStyle = var3.Typography.CaptionMedium,
		Size = if fFlagFriendRequestNicknames then UDim2.new(1, 0, 1, 0) else nil,
		OpenTypeFeatures = if fFlagEnableFontStylisticAlternativesOnSocialScreens then nil elseif getFFlagLuaAppEnableOpenTypeSupport() then openTypeSupport:getUserNameStylisticAlternative() else nil,
		onActivated = if var2 then nil else var9,
		stateLayer = if var2 then nil elseif fFlagProfilePlatformEnableClickToCopyUsernameModule then { affordance = stateLayerAffordance.None } else nil
	})
	t_1.PlatformName = if fFlagAddPlatformNameToProfileHeader and p1.platformName then reactModule.createElement(view, {
		tag = "row align-y-center gap-xsmall auto-xy",
		LayoutOrder = 3
	}, {
		PlatformIcon = if var4 then reactModule.createElement(icon, { LayoutOrder = 1, name = var4, size = iconSize_1.XSmall }) else nil,
		PlatformNameLabel = reactModule.createElement(text, {
			tag = "shrink auto-xy text-align-x-left text-align-y-top",
			LayoutOrder = 2,
			Text = p1.platformName,
			fontStyle = var3.Typography.CaptionMedium
		})
	}) else nil
	
	return createElement(horizontalPageMargin, t, t_1)
end