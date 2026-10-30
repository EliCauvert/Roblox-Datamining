local UserTile = script:FindFirstAncestor("UserTile")
local Parent = UserTile.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local TitleStackModule = require(UserTile.Components.TitleStack)
local AvatarModule = require(UserTile.Components.Avatar)
local AvatarPileModule = require(UserTile.Components.AvatarPile)
local View = FoundationModule.View
local ControlState = FoundationModule.Enums.ControlState
local Enums = FoundationModule.Enums
local LayoutModeModule = require(script.Parent.Parent.Enums.LayoutMode)
local FFlagProfilePlatformNewProfileHeader = require(Parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local FFlagUserTileShowShimmerWhenLoadingModule = require(UserTile.Flags.FFlagUserTileShowShimmerWhenLoading)
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local FFlagUserTileShowBadges = require(Parent.SharedFlags).FFlagUserTileShowBadges
local FFlagEnableMobileGameJoinCard = require(Parent.SharedFlags).FFlagEnableMobileGameJoinCard
local FFlagUserTileAddContextualInfoIcon = require(Parent.SharedFlags).FFlagUserTileAddContextualInfoIcon
local FFlagUserTileTitleStackAddExtraInfo = require(Parent.SharedFlags).FFlagUserTileTitleStackAddExtraInfo
local FFlagUserTileUnfilteredChatIndicator = require(Parent.SharedFlags).FFlagUserTileUnfilteredChatIndicator

return function(p1)
	-- upvalues: ReactModule (copy), ControlState (copy), View (copy), LayoutModeModule (copy), Enums (copy), AvatarPileModule (copy), AvatarModule (copy), FFlagUserTileShowShimmerWhenLoadingModule (copy), TitleStackModule (copy), FFlagUserTileShowBadges (copy), FFlagUserTileAddContextualInfoIcon (copy), FFlagProfilePlatformNewProfileHeader (copy), FFlagEnableMobileGameJoinCard (copy), FFlagUserTileUnfilteredChatIndicator (copy), FFlagEnableBlackbirdCheck (copy), FFlagUserTileTitleStackAddExtraInfo (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local HasOnActivated = p1.onActivated ~= nil
	
	return ReactModule.createElement(View, {
		tag = {
			["size-full"] = true,
			["col align-x-center gap-small"] = p1.layoutMode == LayoutModeModule.compact,
			["row align-y-center gap-medium"] = p1.layoutMode == LayoutModeModule.wide
		},
		selection = { Selectable = p1.selectable },
		onStateChanged = ReactModule.useCallback(function(Hover)
			-- upvalues: UseStateResult2 (copy), HasOnActivated (copy), ControlState (upval), p1 (copy)
			UseStateResult2(HasOnActivated and (Hover == ControlState.Hover or Hover == ControlState.Pressed))
			
			if p1.onStateChanged then
				p1.onStateChanged(Hover)
			end
		end, { p1.onActivated, p1.onStateChanged }),
		onActivated = p1.onActivated,
		stateLayer = { affordance = Enums.StateLayerAffordance.None }
	}, {
		AvatarThumbnail = ReactModule.createElement(View, {
			tag = "size-full aspect-1-1",
			LayoutOrder = 1,
			Size = p1.avatarSize
		}, {
			AvatarComponent = if p1.facePileSecondUserId then ReactModule.createElement(AvatarPileModule, {
				layoutOrder = 1,
				ZIndex = 2,
				primaryUserId = p1.userId,
				secondUserId = p1.facePileSecondUserId,
				userPresenceType = p1.userPresenceType,
				hover = UseStateResult
			}) else ReactModule.createElement(AvatarModule, {
				layoutOrder = 1,
				ZIndex = 2,
				avatarThumbnailUrl = if FFlagUserTileShowShimmerWhenLoadingModule then p1.avatarThumbnailUrl else nil,
				userId = p1.userId,
				userPresenceType = p1.userPresenceType,
				hover = UseStateResult,
				backplateStyle = p1.backplateStyle,
				includeProfileFrame = p1.includeProfileFrame,
				overlayIcon = p1.overlayIcon
			})
		}),
		TitleStack = ReactModule.createElement(TitleStackModule, {
			layoutOrder = 2,
			ZIndex = 1,
			title = p1.title,
			isVerified = if FFlagUserTileShowBadges then p1.isVerified else nil,
			isPremium = if FFlagUserTileShowBadges then p1.isPremium else nil,
			isRobloxAdmin = if FFlagUserTileShowBadges then p1.isRobloxAdmin else nil,
			subtitle = p1.subtitle,
			contextualInfo = p1.contextualInfo,
			contextualInfoIcon = if FFlagUserTileAddContextualInfoIcon then p1.contextualInfoIcon else nil,
			layoutMode = p1.layoutMode,
			titleStyle = p1.titleStyle,
			subtitleStyle = p1.subtitleStyle,
			contextualInfoStyle = p1.contextualInfoStyle,
			titleIcon = p1.titleIcon,
			onSubtitleClicked = if FFlagProfilePlatformNewProfileHeader or FFlagEnableMobileGameJoinCard then p1.onSubtitleClicked else nil,
			isTitleLoading = if FFlagUserTileShowShimmerWhenLoadingModule then p1.isTitleLoading else nil,
			isSubtitleLoading = if FFlagUserTileShowShimmerWhenLoadingModule then p1.isSubtitleLoading else nil,
			isContextualInfoLoading = if FFlagUserTileShowShimmerWhenLoadingModule then p1.isContextualInfoLoading else nil,
			customTextTruncation = p1.customTextTruncation,
			isTrustedConnection = p1.isTrustedConnection,
			trustedConnectionIndicatorEnabled = p1.trustedConnectionIndicatorEnabled,
			shouldShowUnfilteredChatIndicator = if FFlagUserTileUnfilteredChatIndicator then p1.shouldShowUnfilteredChatIndicator else nil,
			isRobloxSubscriber = if FFlagEnableBlackbirdCheck then p1.isRobloxSubscriber else nil,
			extraInfo = p1.extraInfo,
			isExtraInfoLoading = if FFlagUserTileTitleStackAddExtraInfo then p1.isExtraInfoLoading else nil,
			extraInfoStyle = p1.extraInfoStyle,
			onExtraInfoClicked = p1.onExtraInfoClicked
		})
	})
end