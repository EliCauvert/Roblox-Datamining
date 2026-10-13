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
local fFlagSocialCarouselShowPlusBadgeModule = require(socialCarousel.Flags.FFlagSocialCarouselShowPlusBadge)
local fFlagSocialCarouselInGameTitleMarquee = require(parent.SharedFlags).FFlagSocialCarouselInGameTitleMarquee
local var1 = if fFlagSocialCarouselInGameTitleMarquee then require(socialCarousel.Components.MarqueeText.MarqueeText) else nil

local function UserTileHoverListener(p1)
	-- upvalues: reactModule (ref)
	local tileRef = p1.tileRef
	local onMarqueeHover = p1.onMarqueeHover
	local onMarqueeHoverEnd = p1.onMarqueeHoverEnd
	local friendId = p1.friendId
	reactModule.useEffect(function()
		-- upvalues: tileRef (ref), onMarqueeHover (ref), friendId (ref), onMarqueeHoverEnd (ref)
		local var2 = if tileRef ~= nil then nil else tileRef.current
		
		if var2 == nil or not var2:IsA("GuiObject") then return end
		local var3 = var2
		
		if not var2:IsA("GuiButton") then
			for i, v in var2:GetDescendants() do
				if v:IsA("GuiButton") then
					var3 = v
					break
				end
			end
		end
		local mouseEnterConnection = var3.MouseEnter:Connect(function()
			-- upvalues: onMarqueeHover (copy), friendId (copy)
			onMarqueeHover(friendId)
		end)
		local mouseLeaveConnection = var3.MouseLeave:Connect(function()
			-- upvalues: onMarqueeHoverEnd (copy), friendId (copy)
			if onMarqueeHoverEnd then
				onMarqueeHoverEnd(friendId)
			end
		end)
		
		return function()
			-- upvalues: mouseEnterConnection (ref), mouseLeaveConnection (ref), onMarqueeHoverEnd (copy), friendId (copy)
			mouseEnterConnection:Disconnect()
			mouseLeaveConnection:Disconnect()
			
			if onMarqueeHoverEnd then
				onMarqueeHoverEnd(friendId)
			end
		end
	end, { tileRef, onMarqueeHover, onMarqueeHoverEnd, friendId })
	
	return nil
end

return function(p2)
	-- upvalues: useTokens (ref), foundationModule (ref), convertToFoundationPresenceEnum (ref), fFlagSocialCarouselInGameTitleMarquee (ref), presenceTypes (ref), var1 (write), reactModule (ref), marqueePlayStatus (ref), view (ref), UserTileHoverListener (ref), userTile (ref), layoutMode (ref), fFlagFriendsCarouselProfileFrameEnabledModule (ref), fFlagSocialCarouselShowPlusBadgeModule (ref)
	local presence
	local var2 = useTokens()
	local var3 = if p2.item.presence ~= nil then foundationModule.Enums.UserPresence.None else foundationModule.Enums.UserPresence[convertToFoundationPresenceEnum(p2.item.presence.userPresenceType)]
	local contextualText = p2.contextualText
	
	if fFlagSocialCarouselInGameTitleMarquee then
		presence = p2.item.presence
		local var4 = if presence and presence.userPresenceType == presenceTypes.InGame then presence.lastLocation else nil
		
		if var4 ~= nil and var4 ~= "" and (p2.contextualText == var4 and var1) then
			local onMarqueeFinished = p2.onMarqueeFinished
			contextualText = reactModule.createElement(var1, {
				LayoutOrder = 2,
				text = var4,
				playStatus = p2.playStatus or marqueePlayStatus.Idle,
				fontStyle = var2.Typography.LabelSmall,
				maxLoops = if onMarqueeFinished ~= nil then nil else 1,
				runId = p2.marqueeRunId,
				requiresOverflow = p2.onMarqueeHover ~= nil,
				onFinished = if onMarqueeFinished ~= nil then nil else function()
					-- upvalues: onMarqueeFinished (ref), p2 (ref)
					onMarqueeFinished(p2.item.id)
				end
			})
		end
	end
	presence = reactModule.createElement
	
	return presence(view, {
		tag = "auto-none",
		Size = p2.itemSize,
		LayoutOrder = p2.index,
		ref = p2.tileRef,
		selection = if p2.selectionOrder then { Selectable = true, SelectionOrder = p2.selectionOrder } else nil
	}, {
		HoverListener = if fFlagSocialCarouselInGameTitleMarquee and p2.onMarqueeHover ~= nil then reactModule.createElement(UserTileHoverListener, {
			tileRef = p2.tileRef,
			friendId = p2.item.id,
			onMarqueeHover = p2.onMarqueeHover,
			onMarqueeHoverEnd = p2.onMarqueeHoverEnd
		}) else nil,
		Content = reactModule.createElement(userTile, {
			layoutMode = layoutMode.compact,
			userId = p2.item.id,
			title = p2.name,
			subtitle = contextualText,
			titleStyle = var2.Typography.TitleSmall,
			subtitleStyle = var2.Typography.LabelSmall,
			userPresenceType = var3,
			onActivated = p2.onActivated,
			titleIcon = p2.titleIcon,
			includeProfileFrame = fFlagFriendsCarouselProfileFrameEnabledModule,
			isRobloxSubscriber = if fFlagSocialCarouselShowPlusBadgeModule then p2.isRobloxSubscriber else nil
		})
	})
end