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

return function(p0)
	-- upvalues: reactModule (ref), controlState (ref), view (ref), layoutModeModule (ref), enums (ref), avatarPileModule (ref), avatarModule (ref), fFlagUserTileShowShimmerWhenLoadingModule (ref), titleStackModule (ref), fFlagUserTileShowBadges (ref), fFlagUserTileAddContextualInfoIcon (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagEnableMobileGameJoinCard (ref), fFlagUserTileTextTCIndicator (ref), fFlagUserTileUnfilteredChatIndicator (ref), fFlagEnableBlackbirdCheck (ref), fFlagUserTileTitleStackAddExtraInfo (ref)
	local var8, var9 = reactModule.useState(false)
	local var10 = p0.onActivated ~= nil
	
	return reactModule.createElement(view, {
		tag = {
			["size-full"] = true,
			["col align-x-center gap-small"] = p0.layoutMode == layoutModeModule.compact,
			["row align-y-center gap-medium"] = p0.layoutMode == layoutModeModule.wide
		},
		selection = { Selectable = p0.selectable },
		onStateChanged = reactModule.useCallback(function(p1)
			-- upvalues: var9 (ref), var10 (ref), controlState (copy), p0 (ref)
			var9(var10 and (if p1 ~= controlState.Hover then p1 == controlState.Pressed else true))
			
			if p0.onStateChanged then
				p0.onStateChanged(p1)
			end
		end, { p0.onActivated, p0.onStateChanged }),
		onActivated = p0.onActivated,
		stateLayer = { affordance = enums.StateLayerAffordance.None }
	}, {
		AvatarThumbnail = reactModule.createElement(view, {
			tag = "size-full aspect-1-1",
			LayoutOrder = 1,
			Size = p0.avatarSize
		}, {
			AvatarComponent = if p0.facePileSecondUserId then reactModule.createElement(avatarPileModule, {
				layoutOrder = 1,
				ZIndex = 2,
				primaryUserId = p0.userId,
				secondUserId = p0.facePileSecondUserId,
				userPresenceType = p0.userPresenceType,
				hover = var8
			}) else reactModule.createElement(avatarModule, {
				layoutOrder = 1,
				ZIndex = 2,
				avatarThumbnailUrl = if fFlagUserTileShowShimmerWhenLoadingModule then p0.avatarThumbnailUrl else nil,
				userId = p0.userId,
				userPresenceType = p0.userPresenceType,
				hover = var8,
				backplateStyle = p0.backplateStyle,
				includeProfileFrame = p0.includeProfileFrame
			})
		}),
		TitleStack = reactModule.createElement(titleStackModule, {
			layoutOrder = 2,
			ZIndex = 1,
			title = p0.title,
			isVerified = if fFlagUserTileShowBadges then p0.isVerified else nil,
			isPremium = if fFlagUserTileShowBadges then p0.isPremium else nil,
			isRobloxAdmin = if fFlagUserTileShowBadges then p0.isRobloxAdmin else nil,
			subtitle = p0.subtitle,
			contextualInfo = p0.contextualInfo,
			contextualInfoIcon = if fFlagUserTileAddContextualInfoIcon then p0.contextualInfoIcon else nil,
			layoutMode = p0.layoutMode,
			titleStyle = p0.titleStyle,
			subtitleStyle = p0.subtitleStyle,
			contextualInfoStyle = p0.contextualInfoStyle,
			titleIcon = p0.titleIcon,
			onSubtitleClicked = if fFlagProfilePlatformNewProfileHeader or fFlagEnableMobileGameJoinCard then p0.onSubtitleClicked else nil,
			isTitleLoading = if fFlagUserTileShowShimmerWhenLoadingModule then p0.isTitleLoading else nil,
			isSubtitleLoading = if fFlagUserTileShowShimmerWhenLoadingModule then p0.isSubtitleLoading else nil,
			isContextualInfoLoading = if fFlagUserTileShowShimmerWhenLoadingModule then p0.isContextualInfoLoading else nil,
			customTextTruncation = p0.customTextTruncation,
			isTrustedConnection = if fFlagUserTileTextTCIndicator then p0.isTrustedConnection else nil,
			trustedConnectionIndicatorEnabled = if fFlagUserTileTextTCIndicator then p0.trustedConnectionIndicatorEnabled else nil,
			shouldShowUnfilteredChatIndicator = if fFlagUserTileUnfilteredChatIndicator then p0.shouldShowUnfilteredChatIndicator else nil,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then p0.isRobloxSubscriber else nil,
			extraInfo = p0.extraInfo,
			isExtraInfoLoading = if fFlagUserTileTitleStackAddExtraInfo then p0.isExtraInfoLoading else nil,
			extraInfoStyle = p0.extraInfoStyle,
			onExtraInfoClicked = p0.onExtraInfoClicked
		})
	})
end