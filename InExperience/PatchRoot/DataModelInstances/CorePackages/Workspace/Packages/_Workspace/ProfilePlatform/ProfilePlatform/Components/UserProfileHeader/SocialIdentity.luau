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
local var12 = if fFlagProfilePlatformEnableClickToCopyUsernameModule then images["icons/actions/edit/copy"] else nil

return function(p0) --[[ line: 81 | named "SocialIdentity" ]]
	-- upvalues: useTokens (ref), reactModule (ref), fFlagAddPlatformNameToProfileHeader (ref), getBuilderIconForCurrentPlatform (ref), images (ref), fFlagProfilePlatformEnableClickToCopyUsernameModule (ref), useDispatch (ref), useProfileAnalyticsContextModule (ref), fFlagDisableCopyUsernameOnConsole (ref), responsiveModule (ref), fFlagHidePremiumIconography (ref), fFlagEnableBlackbirdCheck (ref), verifiedBadgesModule (ref), useLocalization (ref), textKeysModule (ref), default (ref), contexts (ref), eventNamesModule (ref), setCurrentToastMessage (ref), var12 (ref), horizontalPageMargin (ref), fFlagProfilePlatformTruncateLongCustomFriendNamesModule (ref), view (ref), iconButton (ref), iconSize (ref), tooltip (ref), tooltipOrientation (ref), text (ref), fFlagFriendRequestNicknames (ref), fFlagProfilePlatformEnableRobloxAdminBadgeModule (ref), foundationModule (ref), fFlagEnableFontStylisticAlternativesOnSocialScreens (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), openTypeSupport (ref), stateLayerAffordance (ref), icon (ref), iconSize_1 (ref)
	local var18
	local var13 = useTokens()
	local var14 = reactModule.useMemo(function() --[[ line: 83 ]]
		-- upvalues: fFlagAddPlatformNameToProfileHeader (copy), getBuilderIconForCurrentPlatform (copy)
		return if fFlagAddPlatformNameToProfileHeader then getBuilderIconForCurrentPlatform() else nil
	end, {})
	local var15 = if p0.isEdited then images["icons/actions/edit/editOn_small"] else images["icons/actions/edit/edit_small"]
	local var16 = if fFlagProfilePlatformEnableClickToCopyUsernameModule then useDispatch() else nil
	local var17 = if fFlagProfilePlatformEnableClickToCopyUsernameModule then useProfileAnalyticsContextModule() else nil
	
	if fFlagDisableCopyUsernameOnConsole then
		var18 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
		var18 = nil
	else
		var18 = false
	end
	local createElement_1
	local primaryName = p0.primaryName
	primaryName = (primaryName .. (if fFlagHidePremiumIconography then "" elseif p0.isPremium and (not fFlagEnableBlackbirdCheck or p0.isRobloxSubscriber ~= true) then verifiedBadgesModule.emoji.premium else "")) .. (if p0.isVerified then verifiedBadgesModule.emoji.verified else "")
	local username = `@{p0.username}`
	local var20 = useLocalization({
		tooltipTitle = if p0.isLocalUser then nil else textKeysModule.AliasTooltipHeader,
		tooltipBody = if p0.isLocalUser then textKeysModule.DisplayNameTooltipBody else textKeysModule.AliasTooltipBody,
		usernameCopied = if fFlagProfilePlatformEnableClickToCopyUsernameModule then textKeysModule.UsernameCopied else nil,
		trustedLabel = textKeysModule.TrustedLabel
	})
	local var21 = if fFlagProfilePlatformEnableClickToCopyUsernameModule then reactModule.useCallback(function() --[[ line: 119 ]]
		-- upvalues: default (copy), contexts (copy), p0 (ref), var17 (ref), eventNamesModule (copy), var16 (ref), setCurrentToastMessage (copy), var20 (ref), var12 (copy)
		default:setClipboardText({ context = contexts.ProfileCard, text = p0.username })
		var17.fireAnalyticsEvent(eventNamesModule.UsernameCopied)
		var16(setCurrentToastMessage({
			isLocalized = true,
			toastMessage = var20.usernameCopied,
			toastIcon = var12
		}))
	end, { p0.username, var17, var20.usernameCopied }) else nil
	local var22 = if p0.isTrustedConnection then ` \226\128\162 {var20.trustedLabel}` else ""
	local var23 = reactModule.useCallback(function() --[[ line: 135 ]]
		-- upvalues: p0 (ref)
		if p0.openEditName then
			p0.openEditName()
		end
		p0.dismissTooltip()
	end)
	local createElement = reactModule.createElement
	local t = {
		useAutomaticSizing = true,
		backgroundTransparency = 1,
		size = p0.size,
		layoutOrder = p0.layoutOrder
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
				onActivated = var23
			}, {
				EditNameButton = if p0.openEditName then reactModule.createElement(iconButton, {
					layoutOrder = 1,
					icon = var15,
					iconSize = iconSize.Small,
					size = UDim2.fromOffset(26, 26),
					onActivated = var23
				}, {
					tooltip = if p0.isTooltipActive then reactModule.createElement(tooltip, {
						forceClickTriggerPoint = true,
						isDirectChild = true,
						triggerPosition = Vector2.new(16, 0),
						triggerSize = Vector2.new(0, 0),
						headerText = var20.tooltipTitle,
						bodyText = var20.tooltipBody,
						orientation = tooltipOrientation.Top
					}) else nil
				}) else nil,
				PrimaryName = reactModule.createElement(text, {
					tag = "auto-xy text-align-x-left text-align-y-bottom content-emphasis text-truncate-end shrink",
					LayoutOrder = 2,
					Text = primaryName,
					fontStyle = var13.Typography.HeadingSmall,
					Size = if fFlagFriendRequestNicknames then UDim2.new(1, 0, 1, 0) else nil,
					TextWrapped = if fFlagFriendRequestNicknames then true else nil,
					FluidSizing = if fFlagFriendRequestNicknames then false else nil,
					LineHeight = if fFlagFriendRequestNicknames then 1 else nil
				}),
				AdminTiltIcon = if fFlagProfilePlatformEnableRobloxAdminBadgeModule and p0.isRobloxAdmin then reactModule.createElement(foundationModule.Icon, {
					LayoutOrder = 3,
					name = foundationModule.Enums.IconName.Tilt,
					size = foundationModule.Enums.IconSize.Large
				}) else nil,
				SubscriptionBadge = if fFlagEnableBlackbirdCheck and p0.isRobloxSubscriber == true then reactModule.createElement(view, { tag = "auto-xy padding-top-xxsmall", LayoutOrder = 4 }, {
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
				[reactModule.Event.Activated] = var23,
				Selectable = false
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = if fFlagProfilePlatformEnableRobloxAdminBadgeModule and p0.isRobloxAdmin then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Bottom,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				EditNameButton = if p0.openEditName then reactModule.createElement(iconButton, {
					layoutOrder = 1,
					icon = var15,
					iconSize = iconSize.Small,
					size = UDim2.fromOffset(26, 26),
					onActivated = var23
				}, {
					tooltip = if p0.isTooltipActive then reactModule.createElement(tooltip, {
						forceClickTriggerPoint = true,
						isDirectChild = true,
						triggerPosition = Vector2.new(16, 0),
						triggerSize = Vector2.new(0, 0),
						headerText = var20.tooltipTitle,
						bodyText = var20.tooltipBody,
						orientation = tooltipOrientation.Top
					}) else nil
				}) else nil,
				PrimaryName = reactModule.createElement(text, {
					tag = "auto-xy text-align-x-left text-align-y-bottom content-emphasis",
					LayoutOrder = 2,
					Text = primaryName,
					fontStyle = var13.Typography.HeadingSmall,
					Size = if fFlagFriendRequestNicknames then UDim2.new(1, 0, 1, 0) else nil,
					TextWrapped = if fFlagFriendRequestNicknames then true else nil,
					FluidSizing = if fFlagFriendRequestNicknames then false else nil,
					LineHeight = if fFlagFriendRequestNicknames then 1 else nil
				}),
				AdminTiltIcon = if fFlagProfilePlatformEnableRobloxAdminBadgeModule and p0.isRobloxAdmin then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIPadding = reactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, var13.Gap.XXSmall),
						PaddingBottom = UDim.new(0, var13.Gap.XXSmall)
					}),
					Icon = reactModule.createElement(foundationModule.Icon, {
						name = foundationModule.Enums.IconName.Tilt,
						size = foundationModule.Enums.IconSize.Large
					})
				}) else nil,
				SubscriptionBadge = if fFlagEnableBlackbirdCheck and p0.isRobloxSubscriber == true then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIPadding = reactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, var13.Gap.XXSmall),
						PaddingBottom = UDim.new(0, var13.Gap.XXSmall)
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
		fontStyle = var13.Typography.CaptionMedium,
		Size = if fFlagFriendRequestNicknames then UDim2.new(1, 0, 1, 0) else nil,
		OpenTypeFeatures = if fFlagEnableFontStylisticAlternativesOnSocialScreens then nil elseif getFFlagLuaAppEnableOpenTypeSupport() then openTypeSupport:getUserNameStylisticAlternative() else nil,
		onActivated = if var18 then nil else var21,
		stateLayer = if var18 then nil elseif fFlagProfilePlatformEnableClickToCopyUsernameModule then { affordance = stateLayerAffordance.None } else nil
	})
	t_1.PlatformName = if fFlagAddPlatformNameToProfileHeader and p0.platformName then reactModule.createElement(view, {
		tag = "row align-y-center gap-xsmall auto-xy",
		LayoutOrder = 3
	}, {
		PlatformIcon = if var14 then reactModule.createElement(icon, { LayoutOrder = 1, name = var14, size = iconSize_1.XSmall }) else nil,
		PlatformNameLabel = reactModule.createElement(text, {
			tag = "shrink auto-xy text-align-x-left text-align-y-top",
			LayoutOrder = 2,
			Text = p0.platformName,
			fontStyle = var13.Typography.CaptionMedium
		})
	}) else nil
	
	return createElement(horizontalPageMargin, t, t_1)
end