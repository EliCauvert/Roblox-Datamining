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
local fFlagFriendsPageViewBtnWidth = require(parent.SharedFlags).FFlagFriendsPageViewBtnWidth
local view = foundationModule.View
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local iconButton = foundationModule.IconButton
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local fillBehavior = foundationModule.Enums.FillBehavior

return reactModule.memo(function(p0) --[[ line: 69 | named "BaseRow" ]]
	-- upvalues: useTokens (ref), userListUseActionAddTranslation (ref), useLocalization (ref), textKeysModule (ref), enumsModule (ref), fFlagFriendsPageViewBtnEnabled (ref), reactModule (ref), view (ref), constantsModule (ref), userTile (ref), foundationModule (ref), fFlagEnableBlackbirdCheck (ref), fFlagFriendsPageViewBtnWidth (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), iconButton (ref), iconSize (ref)
	local var7 = useTokens()
	local var8 = if userListUseActionAddTranslation then useLocalization({
		Accept = textKeysModule.Accept,
		Add = textKeysModule.Add,
		Chat = textKeysModule.Chat,
		Join = textKeysModule.Join,
		Pending = textKeysModule.Pending,
		[enumsModule.ButtonTypes.View] = if fFlagFriendsPageViewBtnEnabled then textKeysModule.View else nil
	}) else nil
	
	return reactModule.createElement(view, {
		LayoutOrder = p0.layoutOrder,
		tag = {
			["size-full-0 auto-y align-y-center"] = true,
			["row gap-medium padding-top-medium padding-bottom-medium padding-right-xsmall flex-x-between"] = p0.layoutMode == enumsModule.RowLayoutMode.Wide,
			["col gap-small padding-medium bg-surface-100 radius-medium"] = p0.layoutMode == enumsModule.RowLayoutMode.Compact
		}
	}, {
		UserTileContainer = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				fill = p0.layoutMode == enumsModule.RowLayoutMode.Wide,
				["size-full-0 auto-y"] = p0.layoutMode == enumsModule.RowLayoutMode.Compact
			},
			Size = if p0.layoutMode == enumsModule.RowLayoutMode.Wide then UDim2.new(0, 0, 0, constantsModule.USER_ROW_HEIGHT) else nil
		}, {
			UserTile = reactModule.createElement(userTile, {
				userId = p0.userId or "",
				avatarThumbnailUrl = p0.avatarThumbnailUrl,
				userPresenceType = p0.userPresenceType or foundationModule.Enums.UserPresence.None,
				title = p0.title,
				subtitle = p0.subtitle,
				layoutMode = p0.layoutMode,
				onActivated = p0.onActivated,
				selectable = p0.selectable ~= nil or p0.selectable,
				isTitleLoading = p0.isTitleLoading,
				isSubtitleLoading = p0.isSubtitleLoading,
				contextualInfo = p0.contextualInfo and p0.contextualInfo.text,
				isContextualInfoLoading = p0.isContextualInfoLoading,
				avatarSize = if p0.layoutMode == enumsModule.RowLayoutMode.Compact then UDim2.new(0, var7.Size.Size_1400, 0, var7.Size.Size_1400) else nil,
				trustedConnectionIndicatorEnabled = p0.trustedConnectionIndicatorEnabled,
				isRobloxSubscriber = if fFlagEnableBlackbirdCheck then p0.isRobloxSubscriber else nil
			})
		}),
		TrailingSection = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = {
				["gap-xsmall"] = true,
				["row align-y-center auto-xy"] = p0.layoutMode == enumsModule.RowLayoutMode.Wide,
				["col size-full-0 auto-y align-x-center"] = p0.layoutMode == enumsModule.RowLayoutMode.Compact
			}
		}, {
			PrimaryActionCta = if not p0.primaryCta or not p0.primaryCta.onActivated then if fFlagFriendsPageViewBtnWidth and p0.layoutMode == enumsModule.RowLayoutMode.Wide then reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "auto-xy",
				sizeConstraint = {
					MinSize = if p0.primaryCta.minWidth then Vector2.new(p0.primaryCta.minWidth, 0) else nil,
					MaxSize = if p0.primaryCta.maxWidth then Vector2.new(p0.primaryCta.maxWidth, 1e999) else nil
				}
			}, {
				Button = reactModule.createElement(button, {
					text = if userListUseActionAddTranslation then var8[p0.primaryCta.type] else p0.primaryCta.type,
					size = inputSize.Small,
					variant = if fFlagFriendsPageViewBtnEnabled then p0.primaryCta.variant or buttonVariant.SoftEmphasis else buttonVariant.SoftEmphasis,
					onActivated = p0.primaryCta.onActivated,
					isDisabled = p0.primaryCta.isDisabled,
					isLoading = p0.primaryCta.isLoading,
					fillBehavior = fillBehavior.Fill
				})
			}) else reactModule.createElement(button, {
				LayoutOrder = 1,
				text = if userListUseActionAddTranslation then var8[p0.primaryCta.type] else p0.primaryCta.type,
				size = inputSize.Small,
				variant = if fFlagFriendsPageViewBtnEnabled then p0.primaryCta.variant or buttonVariant.SoftEmphasis else buttonVariant.SoftEmphasis,
				onActivated = p0.primaryCta.onActivated,
				isDisabled = p0.primaryCta.isDisabled,
				isLoading = p0.primaryCta.isLoading,
				width = if p0.layoutMode == enumsModule.RowLayoutMode.Compact then UDim.new(1, 0) else nil
			}) else nil,
			SecondaryActionCta = if p0.layoutMode == enumsModule.RowLayoutMode.Wide and p0.secondaryCta and (p0.secondaryCta.icon and p0.secondaryCta.onActivated) then reactModule.createElement(iconButton, {
				LayoutOrder = 2,
				icon = p0.secondaryCta.icon,
				size = iconSize.Small,
				variant = buttonVariant.Utility,
				onActivated = p0.secondaryCta.onActivated,
				isDisabled = p0.secondaryCta.isDisabled,
				isLoading = p0.secondaryCta.isLoading
			}) else nil,
			TrailingContentWrapper = if p0.layoutMode == enumsModule.RowLayoutMode.Wide and p0.trailingContent then reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 3 }, { Content = p0.trailingContent }) else nil
		})
	})
end)