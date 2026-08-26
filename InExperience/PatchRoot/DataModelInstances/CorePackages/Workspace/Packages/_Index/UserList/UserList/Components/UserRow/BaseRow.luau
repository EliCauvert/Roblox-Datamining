local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local userTile = require(parent.UserTile).UserTile
local foundationModule = require(parent.Foundation)
local _ = require(userList.Common.Types)
local enumsModule = require(userList.Common.Enums)
local constantsModule = require(userList.Common.Constants)
local textKeysModule = require(userList.Common.TextKeys)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local userListUseActionAddTranslation = game:DefineFastFlag("UserListUseActionAddTranslation", false)
local fFlagFriendsPageViewBtnEnabled = require(parent.SharedFlags).FFlagFriendsPageViewBtnEnabled
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local fFlagUserListCtaIntegrationEnabled = require(parent.SharedFlags).FFlagUserListCtaIntegrationEnabled
local fFlagAddStatusIndicatorToBaseRow = require(parent.SharedFlags).FFlagAddStatusIndicatorToBaseRow
local view = foundationModule.View
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local iconButton = foundationModule.IconButton
local iconSize = foundationModule.Enums.IconSize
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local statusIndicator = foundationModule.StatusIndicator
local statusIndicatorVariant = foundationModule.Enums.StatusIndicatorVariant
local useTokens = foundationModule.Hooks.useTokens
local fillBehavior = foundationModule.Enums.FillBehavior

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), userListUseActionAddTranslation (ref), useLocalization (ref), textKeysModule (ref), enumsModule (ref), fFlagFriendsPageViewBtnEnabled (ref), fFlagUserListCtaIntegrationEnabled (ref), reactModule (ref), view (ref), constantsModule (ref), userTile (ref), foundationModule (ref), fFlagEnableBlackbirdCheck (ref), fFlagAddStatusIndicatorToBaseRow (ref), statusIndicator (ref), statusIndicatorVariant (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), skeleton (ref), radius (ref), iconButton (ref), iconSize (ref)
	local var1
	local var2 = useTokens()
	local var3 = if userListUseActionAddTranslation then useLocalization({
		Accept = textKeysModule.Accept,
		Add = textKeysModule.Add,
		Chat = textKeysModule.Chat,
		Join = textKeysModule.Join,
		Pending = textKeysModule.Pending,
		[enumsModule.ButtonTypes.View] = if fFlagFriendsPageViewBtnEnabled or fFlagUserListCtaIntegrationEnabled then textKeysModule.View else nil
	}) else nil
	local createElement = reactModule.createElement
	local t = {
		LayoutOrder = p1.layoutOrder,
		tag = {
			["size-full-0 auto-y align-y-center"] = true,
			["row gap-medium padding-top-medium padding-bottom-medium padding-right-xsmall flex-x-between"] = p1.layoutMode == enumsModule.RowLayoutMode.Wide,
			["col gap-small padding-medium bg-surface-100 radius-medium"] = p1.layoutMode == enumsModule.RowLayoutMode.Compact
		}
	}
	local t_1 = {
		UserTileContainer = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				fill = p1.layoutMode == enumsModule.RowLayoutMode.Wide,
				["size-full-0 auto-y"] = p1.layoutMode == enumsModule.RowLayoutMode.Compact
			},
			Size = if p1.layoutMode == enumsModule.RowLayoutMode.Wide then UDim2.new(0, 0, 0, constantsModule.USER_ROW_HEIGHT) else nil
		}, {
			UserTile = reactModule.createElement(userTile, {
				userId = p1.userId or "",
				avatarThumbnailUrl = p1.avatarThumbnailUrl,
				userPresenceType = p1.userPresenceType or foundationModule.Enums.UserPresence.None,
				title = p1.title,
				subtitle = p1.subtitle,
				layoutMode = p1.layoutMode,
				onActivated = p1.onActivated,
				selectable = p1.selectable ~= nil or p1.selectable,
				isTitleLoading = p1.isTitleLoading,
				isSubtitleLoading = p1.isSubtitleLoading,
				contextualInfo = p1.contextualInfo and p1.contextualInfo.text,
				isContextualInfoLoading = p1.isContextualInfoLoading,
				avatarSize = if p1.layoutMode == enumsModule.RowLayoutMode.Compact then UDim2.new(0, var2.Size.Size_1400, 0, var2.Size.Size_1400) else nil,
				trustedConnectionIndicatorEnabled = p1.trustedConnectionIndicatorEnabled,
				isRobloxSubscriber = if fFlagEnableBlackbirdCheck then p1.isRobloxSubscriber else nil
			})
		})
	}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		LayoutOrder = 2,
		tag = {
			["gap-xsmall"] = true,
			["row align-y-center auto-xy"] = p1.layoutMode == enumsModule.RowLayoutMode.Wide,
			["col size-full-0 auto-y align-x-center"] = p1.layoutMode == enumsModule.RowLayoutMode.Compact
		}
	}
	local t_3 = {
		StatusIndicatorContainer = if fFlagAddStatusIndicatorToBaseRow and p1.shouldShowNewIndicator then reactModule.createElement(view, { LayoutOrder = 1, tag = "auto-xy padding-right-small" }, {
			StatusIndicator = reactModule.createElement(statusIndicator, { variant = statusIndicatorVariant.Emphasis })
		}) else nil
	}
	
	if p1.primaryCta and p1.primaryCta.onActivated then
		if p1.layoutMode == enumsModule.RowLayoutMode.Wide then
			var1 = reactModule.createElement
			var1 = var1(view, {
				tag = "auto-xy",
				LayoutOrder = if fFlagAddStatusIndicatorToBaseRow then 2 else 1,
				sizeConstraint = {
					MinSize = if p1.primaryCta.minWidth then Vector2.new(p1.primaryCta.minWidth, 0) else nil,
					MaxSize = if p1.primaryCta.maxWidth then Vector2.new(p1.primaryCta.maxWidth, 1e999) else nil
				}
			}, {
				Button = reactModule.createElement(button, {
					text = if userListUseActionAddTranslation then var3[p1.primaryCta.type] else p1.primaryCta.type,
					size = inputSize.Small,
					variant = if fFlagFriendsPageViewBtnEnabled or fFlagUserListCtaIntegrationEnabled then p1.primaryCta.variant or buttonVariant.SoftEmphasis else buttonVariant.SoftEmphasis,
					onActivated = p1.primaryCta.onActivated,
					isDisabled = p1.primaryCta.isDisabled,
					isLoading = p1.primaryCta.isLoading,
					fillBehavior = fillBehavior.Fill
				})
			})
		else
			var1 = reactModule.createElement
			var1 = var1(button, {
				text = if userListUseActionAddTranslation then var3[p1.primaryCta.type] else p1.primaryCta.type,
				size = inputSize.Small,
				variant = if fFlagFriendsPageViewBtnEnabled or fFlagUserListCtaIntegrationEnabled then p1.primaryCta.variant or buttonVariant.SoftEmphasis else buttonVariant.SoftEmphasis,
				onActivated = p1.primaryCta.onActivated,
				isDisabled = p1.primaryCta.isDisabled,
				isLoading = p1.primaryCta.isLoading,
				LayoutOrder = if fFlagAddStatusIndicatorToBaseRow then 2 else 1,
				width = if p1.layoutMode == enumsModule.RowLayoutMode.Compact then UDim.new(1, 0) else nil
			})
		end
	var1 = if fFlagUserListCtaIntegrationEnabled and p1.ctaLoading and p1.layoutMode == enumsModule.RowLayoutMode.Wide then reactModule.createElement(skeleton, {
		LayoutOrder = if fFlagAddStatusIndicatorToBaseRow then 2 else 1,
		Size = UDim2.fromOffset(p1.ctaLoading.minWidth or 0, var2.Size.Size_800),
		radius = radius.Medium
	}) else nil
	t_3.PrimaryActionCta = var1
	t_3.SecondaryActionCta = if p1.layoutMode == enumsModule.RowLayoutMode.Wide and p1.secondaryCta and (p1.secondaryCta.icon and p1.secondaryCta.onActivated) then reactModule.createElement(iconButton, {
		icon = p1.secondaryCta.icon,
		size = iconSize.Small,
		variant = buttonVariant.Utility,
		onActivated = p1.secondaryCta.onActivated,
		isDisabled = p1.secondaryCta.isDisabled,
		isLoading = p1.secondaryCta.isLoading,
		LayoutOrder = if fFlagAddStatusIndicatorToBaseRow then 3 else 2
	}) else nil
	t_3.TrailingContentWrapper = if p1.layoutMode == enumsModule.RowLayoutMode.Wide and p1.trailingContent then reactModule.createElement(view, {
		tag = "auto-xy",
		LayoutOrder = if fFlagAddStatusIndicatorToBaseRow then 4 else 3
	}, { Content = p1.trailingContent }) else nil
	t_1.TrailingSection = createElement_1(view, t_2, t_3)
	
	return createElement(view, t, t_1)
end)