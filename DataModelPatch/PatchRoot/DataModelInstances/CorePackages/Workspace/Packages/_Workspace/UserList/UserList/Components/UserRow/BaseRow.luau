local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local UserTile = require(Parent.UserTile).UserTile
local FoundationModule = require(Parent.Foundation)
local _ = require(UserList.Common.Types)
local EnumsModule = require(UserList.Common.Enums)
local ConstantsModule = require(UserList.Common.Constants)
local TextKeysModule = require(UserList.Common.TextKeys)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UserListUseActionAddTranslation = game:DefineFastFlag("UserListUseActionAddTranslation", false)
local FFlagFriendsPageViewBtnEnabled = require(Parent.SharedFlags).FFlagFriendsPageViewBtnEnabled
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local FFlagFriendsPageViewBtnWidth = require(Parent.SharedFlags).FFlagFriendsPageViewBtnWidth
local View = FoundationModule.View
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local IconButton = FoundationModule.IconButton
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FillBehavior = FoundationModule.Enums.FillBehavior

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UserListUseActionAddTranslation (copy), UseLocalizationFunction (copy), TextKeysModule (copy), EnumsModule (copy), FFlagFriendsPageViewBtnEnabled (copy), ReactModule (copy), View (copy), ConstantsModule (copy), UserTile (copy), FoundationModule (copy), FFlagEnableBlackbirdCheck (copy), FFlagFriendsPageViewBtnWidth (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy), IconButton (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = if UserListUseActionAddTranslation then UseLocalizationFunction({
		Accept = TextKeysModule.Accept,
		Add = TextKeysModule.Add,
		Chat = TextKeysModule.Chat,
		Join = TextKeysModule.Join,
		Pending = TextKeysModule.Pending,
		[EnumsModule.ButtonTypes.View] = if FFlagFriendsPageViewBtnEnabled then TextKeysModule.View else nil
	}) else nil
	
	return ReactModule.createElement(View, {
		LayoutOrder = p1.layoutOrder,
		tag = {
			["size-full-0 auto-y align-y-center"] = true,
			["row gap-medium padding-top-medium padding-bottom-medium padding-right-xsmall flex-x-between"] = p1.layoutMode == EnumsModule.RowLayoutMode.Wide,
			["col gap-small padding-medium bg-surface-100 radius-medium"] = p1.layoutMode == EnumsModule.RowLayoutMode.Compact
		}
	}, {
		UserTileContainer = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = {
				fill = p1.layoutMode == EnumsModule.RowLayoutMode.Wide,
				["size-full-0 auto-y"] = p1.layoutMode == EnumsModule.RowLayoutMode.Compact
			},
			Size = if p1.layoutMode == EnumsModule.RowLayoutMode.Wide then UDim2.new(0, 0, 0, ConstantsModule.USER_ROW_HEIGHT) else nil
		}, {
			UserTile = ReactModule.createElement(UserTile, {
				userId = p1.userId or "",
				avatarThumbnailUrl = p1.avatarThumbnailUrl,
				userPresenceType = p1.userPresenceType or FoundationModule.Enums.UserPresence.None,
				title = p1.title,
				subtitle = p1.subtitle,
				layoutMode = p1.layoutMode,
				onActivated = p1.onActivated,
				selectable = p1.selectable == nil or p1.selectable,
				isTitleLoading = p1.isTitleLoading,
				isSubtitleLoading = p1.isSubtitleLoading,
				contextualInfo = p1.contextualInfo and p1.contextualInfo.text,
				isContextualInfoLoading = p1.isContextualInfoLoading,
				avatarSize = if p1.layoutMode == EnumsModule.RowLayoutMode.Compact then UDim2.new(0, UseTokensResult.Size.Size_1400, 0, UseTokensResult.Size.Size_1400) else nil,
				trustedConnectionIndicatorEnabled = p1.trustedConnectionIndicatorEnabled,
				isRobloxSubscriber = if FFlagEnableBlackbirdCheck then p1.isRobloxSubscriber else nil
			})
		}),
		TrailingSection = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = {
				["gap-xsmall"] = true,
				["row align-y-center auto-xy"] = p1.layoutMode == EnumsModule.RowLayoutMode.Wide,
				["col size-full-0 auto-y align-x-center"] = p1.layoutMode == EnumsModule.RowLayoutMode.Compact
			}
		}, {
			PrimaryActionCta = if p1.primaryCta and p1.primaryCta.onActivated then if FFlagFriendsPageViewBtnWidth and p1.layoutMode == EnumsModule.RowLayoutMode.Wide then ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "auto-xy",
				sizeConstraint = {
					MinSize = if p1.primaryCta.minWidth then Vector2.new(p1.primaryCta.minWidth, 0) else nil,
					MaxSize = if p1.primaryCta.maxWidth then Vector2.new(p1.primaryCta.maxWidth, 1e999) else nil
				}
			}, {
				Button = ReactModule.createElement(Button, {
					text = if UserListUseActionAddTranslation then UseLocalizationResult[p1.primaryCta.type] else p1.primaryCta.type,
					size = InputSize.Small,
					variant = FFlagFriendsPageViewBtnEnabled and p1.primaryCta.variant or ButtonVariant.SoftEmphasis,
					onActivated = p1.primaryCta.onActivated,
					isDisabled = p1.primaryCta.isDisabled,
					isLoading = p1.primaryCta.isLoading,
					fillBehavior = FillBehavior.Fill
				})
			}) else ReactModule.createElement(Button, {
				LayoutOrder = 1,
				text = if UserListUseActionAddTranslation then UseLocalizationResult[p1.primaryCta.type] else p1.primaryCta.type,
				size = InputSize.Small,
				variant = FFlagFriendsPageViewBtnEnabled and p1.primaryCta.variant or ButtonVariant.SoftEmphasis,
				onActivated = p1.primaryCta.onActivated,
				isDisabled = p1.primaryCta.isDisabled,
				isLoading = p1.primaryCta.isLoading,
				width = if p1.layoutMode == EnumsModule.RowLayoutMode.Compact then UDim.new(1, 0) else nil
			}) else nil,
			SecondaryActionCta = if p1.layoutMode == EnumsModule.RowLayoutMode.Wide and p1.secondaryCta and p1.secondaryCta.icon and p1.secondaryCta.onActivated then ReactModule.createElement(IconButton, {
				LayoutOrder = 2,
				icon = p1.secondaryCta.icon,
				size = IconSize.Small,
				variant = ButtonVariant.Utility,
				onActivated = p1.secondaryCta.onActivated,
				isDisabled = p1.secondaryCta.isDisabled,
				isLoading = p1.secondaryCta.isLoading
			}) else nil,
			TrailingContentWrapper = if p1.layoutMode == EnumsModule.RowLayoutMode.Wide and p1.trailingContent then ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 3 }, { Content = p1.trailingContent }) else nil
		})
	})
end)