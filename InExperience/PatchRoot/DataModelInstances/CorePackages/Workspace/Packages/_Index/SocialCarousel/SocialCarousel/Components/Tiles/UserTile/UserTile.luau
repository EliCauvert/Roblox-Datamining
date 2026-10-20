local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local SocialCommonModule = require(Parent.SocialCommon)
local UserTile = require(Parent.UserTile).UserTile
local LayoutMode = require(Parent.UserTile).LayoutMode
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local ConvertToFoundationPresenceEnumFunction = SocialCommonModule.Utils.convertToFoundationPresenceEnum
local PresenceTypes = SocialCommonModule.Enums.PresenceTypes
local MarqueePlayStatus = require(SocialCarousel.Common.Enums).MarqueePlayStatus
local FFlagFriendsCarouselProfileFrameEnabledModule = require(SocialCarousel.Flags.FFlagFriendsCarouselProfileFrameEnabled)
local FFlagSocialCarouselShowPlusBadgeModule = require(SocialCarousel.Flags.FFlagSocialCarouselShowPlusBadge)
local FFlagSocialCarouselInGameTitleMarquee = require(Parent.SharedFlags).FFlagSocialCarouselInGameTitleMarquee
local MarqueeTextModule = if FFlagSocialCarouselInGameTitleMarquee then require(SocialCarousel.Components.MarqueeText.MarqueeText) else nil

local function UserTileHoverListener(p1)
	-- upvalues: ReactModule (copy)
	local TileRef = p1.tileRef
	local OnMarqueeHoverFunction = p1.onMarqueeHover
	local OnMarqueeHoverEndFunction = p1.onMarqueeHoverEnd
	local FriendId = p1.friendId
	ReactModule.useEffect(function()
		-- upvalues: TileRef (copy), OnMarqueeHoverFunction (copy), FriendId (copy), OnMarqueeHoverEndFunction (copy)
		local Current = if TileRef == nil then nil else TileRef.current
		
		if Current == nil or not Current:IsA("GuiObject") then return end
		local Frame = Current
		
		if not Current:IsA("GuiButton") then
			for _, Button in Current:GetDescendants() do
				if Button:IsA("GuiButton") then
					Frame = Button
					break
				end
			end
		end
		local MouseEnterConnection = Frame.MouseEnter:Connect(function()
			-- upvalues: OnMarqueeHoverFunction (upval), FriendId (upval)
			OnMarqueeHoverFunction(FriendId)
		end)
		local MouseLeaveConnection = Frame.MouseLeave:Connect(function()
			-- upvalues: OnMarqueeHoverEndFunction (upval), FriendId (upval)
			if OnMarqueeHoverEndFunction then
				OnMarqueeHoverEndFunction(FriendId)
			end
		end)
		
		return function()
			-- upvalues: MouseEnterConnection (copy), MouseLeaveConnection (copy), OnMarqueeHoverEndFunction (upval), FriendId (upval)
			MouseEnterConnection:Disconnect()
			MouseLeaveConnection:Disconnect()
			
			if OnMarqueeHoverEndFunction then
				OnMarqueeHoverEndFunction(FriendId)
			end
		end
	end, {
		TileRef,
		OnMarqueeHoverFunction,
		OnMarqueeHoverEndFunction,
		FriendId
	})
	
	return nil
end

return function(p2)
	-- upvalues: UseTokensFunction (copy), FoundationModule (copy), ConvertToFoundationPresenceEnumFunction (copy), FFlagSocialCarouselInGameTitleMarquee (copy), PresenceTypes (copy), MarqueeTextModule (ref), ReactModule (copy), MarqueePlayStatus (copy), View (copy), UserTileHoverListener (copy), UserTile (copy), LayoutMode (copy), FFlagFriendsCarouselProfileFrameEnabledModule (copy), FFlagSocialCarouselShowPlusBadgeModule (copy)
	local UseTokensResult = UseTokensFunction()
	local None = if p2.item.presence == nil then FoundationModule.Enums.UserPresence.None else FoundationModule.Enums.UserPresence[ConvertToFoundationPresenceEnumFunction(p2.item.presence.userPresenceType)]
	local ContextualText = p2.contextualText
	
	if FFlagSocialCarouselInGameTitleMarquee then
		local Presence = p2.item.presence
		local LastLocation = if Presence and Presence.userPresenceType == PresenceTypes.InGame then Presence.lastLocation else nil
		
		if LastLocation ~= nil and LastLocation ~= "" and p2.contextualText == LastLocation and MarqueeTextModule then
			local OnMarqueeFinishedFunction = p2.onMarqueeFinished
			ContextualText = ReactModule.createElement(MarqueeTextModule, {
				LayoutOrder = 2,
				text = LastLocation,
				playStatus = p2.playStatus or MarqueePlayStatus.Idle,
				fontStyle = UseTokensResult.Typography.LabelSmall,
				maxLoops = if OnMarqueeFinishedFunction == nil then nil else 1,
				runId = p2.marqueeRunId,
				requiresOverflow = p2.onMarqueeHover ~= nil,
				onFinished = if OnMarqueeFinishedFunction == nil then nil else function()
					-- upvalues: OnMarqueeFinishedFunction (copy), p2 (copy)
					OnMarqueeFinishedFunction(p2.item.id)
				end
			})
		end
	end
	return ReactModule.createElement(View, {
		tag = "auto-none",
		Size = p2.itemSize,
		LayoutOrder = p2.index,
		ref = p2.tileRef,
		selection = if p2.selectionOrder then { Selectable = true, SelectionOrder = p2.selectionOrder } else nil
	}, {
		HoverListener = if FFlagSocialCarouselInGameTitleMarquee and p2.onMarqueeHover ~= nil then ReactModule.createElement(UserTileHoverListener, {
			tileRef = p2.tileRef,
			friendId = p2.item.id,
			onMarqueeHover = p2.onMarqueeHover,
			onMarqueeHoverEnd = p2.onMarqueeHoverEnd
		}) else nil,
		Content = ReactModule.createElement(UserTile, {
			layoutMode = LayoutMode.compact,
			userId = p2.item.id,
			title = p2.name,
			subtitle = ContextualText,
			titleStyle = UseTokensResult.Typography.TitleSmall,
			subtitleStyle = UseTokensResult.Typography.LabelSmall,
			userPresenceType = None,
			onActivated = p2.onActivated,
			titleIcon = p2.titleIcon,
			includeProfileFrame = FFlagFriendsCarouselProfileFrameEnabledModule,
			isRobloxSubscriber = if FFlagSocialCarouselShowPlusBadgeModule then p2.isRobloxSubscriber else nil
		})
	})
end