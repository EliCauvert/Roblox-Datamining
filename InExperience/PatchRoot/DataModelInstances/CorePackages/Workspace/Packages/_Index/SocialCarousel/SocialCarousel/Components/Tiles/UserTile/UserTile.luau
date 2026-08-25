local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local reactModule = require(parent.React)
local socialCommonModule = require(parent.SocialCommon)
local userTile = require(parent.UserTile).UserTile
local layoutMode = require(parent.UserTile).LayoutMode
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local convertToFoundationPresenceEnum = socialCommonModule.Utils.convertToFoundationPresenceEnum
local fFlagFriendsCarouselProfileFrameEnabledModule = require(socialCarousel.Flags.FFlagFriendsCarouselProfileFrameEnabled)

return function(p0)
	-- upvalues: useTokens (ref), foundationModule (ref), convertToFoundationPresenceEnum (ref), reactModule (ref), view (ref), userTile (ref), layoutMode (ref), fFlagFriendsCarouselProfileFrameEnabledModule (ref)
	local var5 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "auto-none",
		Size = p0.itemSize,
		LayoutOrder = p0.index,
		ref = p0.tileRef,
		selection = if p0.selectionOrder then { Selectable = true, SelectionOrder = p0.selectionOrder } else nil
	}, {
		Content = reactModule.createElement(userTile, {
			layoutMode = layoutMode.compact,
			userId = p0.item.id,
			title = p0.name,
			subtitle = p0.contextualText,
			titleStyle = var5.Typography.TitleSmall,
			subtitleStyle = var5.Typography.LabelSmall,
			userPresenceType = if p0.item.presence ~= nil then foundationModule.Enums.UserPresence.None else foundationModule.Enums.UserPresence[convertToFoundationPresenceEnum(p0.item.presence.userPresenceType)],
			onActivated = p0.onActivated,
			titleIcon = p0.titleIcon,
			includeProfileFrame = fFlagFriendsCarouselProfileFrameEnabledModule
		})
	})
end