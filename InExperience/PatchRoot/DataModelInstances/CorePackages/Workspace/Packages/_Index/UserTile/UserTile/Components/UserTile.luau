local userTile = script:FindFirstAncestor("UserTile")
local parent = userTile.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local titleStackModule = require(userTile.Components.TitleStack)
local avatarModule = require(userTile.Components.Avatar)
local avatarPileModule = require(userTile.Components.AvatarPile)
local view = foundationModule.View
local controlState = foundationModule.Enums.ControlState
local enums = foundationModule.Enums
local layoutModeModule = require(script.Parent.Parent.Enums.LayoutMode)
local fFlagProfilePlatformNewProfileHeader = require(parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local fFlagUserTileShowShimmerWhenLoadingModule = require(userTile.Flags.FFlagUserTileShowShimmerWhenLoading)
local fFlagUserTileTextTCIndicator = require(parent.SharedFlags).FFlagUserTileTextTCIndicator
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local fFlagUserTileShowBadges = require(parent.SharedFlags).FFlagUserTileShowBadges
local fFlagEnableMobileGameJoinCard = require(parent.SharedFlags).FFlagEnableMobileGameJoinCard
local fFlagUserTileAddContextualInfoIcon = require(parent.SharedFlags).FFlagUserTileAddContextualInfoIcon
local fFlagUserTileTitleStackAddExtraInfo = require(parent.SharedFlags).FFlagUserTileTitleStackAddExtraInfo
local fFlagUserTileUnfilteredChatIndicator = require(parent.SharedFlags).FFlagUserTileUnfilteredChatIndicator

return function(p1)
	-- upvalues: reactModule (ref), controlState (ref), view (ref), layoutModeModule (ref), enums (ref), avatarPileModule (ref), avatarModule (ref), fFlagUserTileShowShimmerWhenLoadingModule (ref), titleStackModule (ref), fFlagUserTileShowBadges (ref), fFlagUserTileAddContextualInfoIcon (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagEnableMobileGameJoinCard (ref), fFlagUserTileTextTCIndicator (ref), fFlagUserTileUnfilteredChatIndicator (ref), fFlagEnableBlackbirdCheck (ref), fFlagUserTileTitleStackAddExtraInfo (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = p1.onActivated ~= nil
	
	return reactModule.createElement(view, {
		tag = {
			["size-full"] = true,
			["col align-x-center gap-small"] = p1.layoutMode == layoutModeModule.compact,
			["row align-y-center gap-medium"] = p1.layoutMode == layoutModeModule.wide
		},
		selection = { Selectable = p1.selectable },
		onStateChanged = reactModule.useCallback(function(p2)
			-- upvalues: var2 (ref), var3 (ref), controlState (copy), p1 (ref)
			var2(var3 and (if p2 ~= controlState.Hover then p2 == controlState.Pressed else true))
			
			if p1.onStateChanged then
				p1.onStateChanged(p2)
			end
		end, { p1.onActivated, p1.onStateChanged }),
		onActivated = p1.onActivated,
		stateLayer = { affordance = enums.StateLayerAffordance.None }
	}, {
		AvatarThumbnail = reactModule.createElement(view, {
			tag = "size-full aspect-1-1",
			LayoutOrder = 1,
			Size = p1.avatarSize
		}, {
			AvatarComponent = if p1.facePileSecondUserId then reactModule.createElement(avatarPileModule, {
				layoutOrder = 1,
				ZIndex = 2,
				primaryUserId = p1.userId,
				secondUserId = p1.facePileSecondUserId,
				userPresenceType = p1.userPresenceType,
				hover = var1
			}) else reactModule.createElement(avatarModule, {
				layoutOrder = 1,
				ZIndex = 2,
				avatarThumbnailUrl = if fFlagUserTileShowShimmerWhenLoadingModule then p1.avatarThumbnailUrl else nil,
				userId = p1.userId,
				userPresenceType = p1.userPresenceType,
				hover = var1,
				backplateStyle = p1.backplateStyle,
				includeProfileFrame = p1.includeProfileFrame
			})
		}),
		TitleStack = reactModule.createElement(titleStackModule, {
			layoutOrder = 2,
			ZIndex = 1,
			title = p1.title,
			isVerified = if fFlagUserTileShowBadges then p1.isVerified else nil,
			isPremium = if fFlagUserTileShowBadges then p1.isPremium else nil,
			isRobloxAdmin = if fFlagUserTileShowBadges then p1.isRobloxAdmin else nil,
			subtitle = p1.subtitle,
			contextualInfo = p1.contextualInfo,
			contextualInfoIcon = if fFlagUserTileAddContextualInfoIcon then p1.contextualInfoIcon else nil,
			layoutMode = p1.layoutMode,
			titleStyle = p1.titleStyle,
			subtitleStyle = p1.subtitleStyle,
			contextualInfoStyle = p1.contextualInfoStyle,
			titleIcon = p1.titleIcon,
			onSubtitleClicked = if fFlagProfilePlatformNewProfileHeader or fFlagEnableMobileGameJoinCard then p1.onSubtitleClicked else nil,
			isTitleLoading = if fFlagUserTileShowShimmerWhenLoadingModule then p1.isTitleLoading else nil,
			isSubtitleLoading = if fFlagUserTileShowShimmerWhenLoadingModule then p1.isSubtitleLoading else nil,
			isContextualInfoLoading = if fFlagUserTileShowShimmerWhenLoadingModule then p1.isContextualInfoLoading else nil,
			customTextTruncation = p1.customTextTruncation,
			isTrustedConnection = if fFlagUserTileTextTCIndicator then p1.isTrustedConnection else nil,
			trustedConnectionIndicatorEnabled = if fFlagUserTileTextTCIndicator then p1.trustedConnectionIndicatorEnabled else nil,
			shouldShowUnfilteredChatIndicator = if fFlagUserTileUnfilteredChatIndicator then p1.shouldShowUnfilteredChatIndicator else nil,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then p1.isRobloxSubscriber else nil,
			extraInfo = p1.extraInfo,
			isExtraInfoLoading = if fFlagUserTileTitleStackAddExtraInfo then p1.isExtraInfoLoading else nil,
			extraInfoStyle = p1.extraInfoStyle,
			onExtraInfoClicked = p1.onExtraInfoClicked
		})
	})
end