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

return function(p1)
	-- upvalues: useTokens (ref), foundationModule (ref), convertToFoundationPresenceEnum (ref), reactModule (ref), view (ref), userTile (ref), layoutMode (ref), fFlagFriendsCarouselProfileFrameEnabledModule (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "auto-none",
		Size = p1.itemSize,
		LayoutOrder = p1.index,
		ref = p1.tileRef,
		selection = if p1.selectionOrder then { Selectable = true, SelectionOrder = p1.selectionOrder } else nil
	}, {
		Content = reactModule.createElement(userTile, {
			layoutMode = layoutMode.compact,
			userId = p1.item.id,
			title = p1.name,
			subtitle = p1.contextualText,
			titleStyle = var1.Typography.TitleSmall,
			subtitleStyle = var1.Typography.LabelSmall,
			userPresenceType = if p1.item.presence ~= nil then foundationModule.Enums.UserPresence.None else foundationModule.Enums.UserPresence[convertToFoundationPresenceEnum(p1.item.presence.userPresenceType)],
			onActivated = p1.onActivated,
			titleIcon = p1.titleIcon,
			includeProfileFrame = fFlagFriendsCarouselProfileFrameEnabledModule
		})
	})
end