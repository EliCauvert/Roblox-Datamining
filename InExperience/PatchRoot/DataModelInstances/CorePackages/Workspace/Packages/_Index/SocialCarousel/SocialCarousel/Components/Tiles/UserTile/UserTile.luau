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
local presenceTypes = socialCommonModule.Enums.PresenceTypes
local marqueePlayStatus = require(socialCarousel.Common.Enums).MarqueePlayStatus
local fFlagFriendsCarouselProfileFrameEnabledModule = require(socialCarousel.Flags.FFlagFriendsCarouselProfileFrameEnabled)
local fFlagSocialCarouselInGameTitleMarquee = require(parent.SharedFlags).FFlagSocialCarouselInGameTitleMarquee
local var1 = if fFlagSocialCarouselInGameTitleMarquee then require(socialCarousel.Components.MarqueeText.MarqueeText) else nil

return function(p1)
	-- upvalues: useTokens (ref), foundationModule (ref), convertToFoundationPresenceEnum (ref), fFlagSocialCarouselInGameTitleMarquee (ref), presenceTypes (ref), var1 (write), reactModule (ref), marqueePlayStatus (ref), view (ref), userTile (ref), layoutMode (ref), fFlagFriendsCarouselProfileFrameEnabledModule (ref)
	local var2 = useTokens()
	local var3 = if p1.item.presence ~= nil then foundationModule.Enums.UserPresence.None else foundationModule.Enums.UserPresence[convertToFoundationPresenceEnum(p1.item.presence.userPresenceType)]
	local contextualText = p1.contextualText
	
	if fFlagSocialCarouselInGameTitleMarquee then
		local presence = p1.item.presence
		local var4 = if presence and presence.userPresenceType == presenceTypes.InGame then presence.lastLocation else nil
		
		if var4 ~= nil and var4 ~= "" and (p1.contextualText == var4 and var1) then
			local onMarqueeFinished = p1.onMarqueeFinished
			contextualText = reactModule.createElement(var1, {
				LayoutOrder = 2,
				text = var4,
				playStatus = p1.playStatus or marqueePlayStatus.Idle,
				fontStyle = var2.Typography.LabelSmall,
				maxLoops = if onMarqueeFinished ~= nil then nil else 1,
				runId = p1.marqueeRunId,
				onFinished = if onMarqueeFinished ~= nil then nil else function()
					-- upvalues: onMarqueeFinished (ref), p1 (ref)
					onMarqueeFinished(p1.item.id)
				end
			})
		end
	end
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
			subtitle = contextualText,
			titleStyle = var2.Typography.TitleSmall,
			subtitleStyle = var2.Typography.LabelSmall,
			userPresenceType = var3,
			onActivated = p1.onActivated,
			titleIcon = p1.titleIcon,
			includeProfileFrame = fFlagFriendsCarouselProfileFrameEnabledModule
		})
	})
end