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
local EnumsModule = require(SocialCarousel.Common.Enums)
local MarqueePlayStatus = EnumsModule.MarqueePlayStatus
local FFlagFriendsCarouselProfileFrameEnabledModule = require(SocialCarousel.Flags.FFlagFriendsCarouselProfileFrameEnabled)
local FFlagSocialCarouselShowPlusBadgeModule = require(SocialCarousel.Flags.FFlagSocialCarouselShowPlusBadge)
local FFlagSocialCarouselInGameTitleMarquee = require(Parent.SharedFlags).FFlagSocialCarouselInGameTitleMarquee
local FFlagShowRequestsInCarouselForAllUsers = require(Parent.SharedFlags).FFlagShowRequestsInCarouselForAllUsers
local FFlagSocialCarouselBuildPresence = require(Parent.SharedFlags).FFlagSocialCarouselBuildPresence
local FFlagSocialCarouselXSmallTileTextModule = require(SocialCarousel.Flags.FFlagSocialCarouselXSmallTileText)
local UseXSmallTileTypographyModule = require(SocialCarousel.Hooks.useXSmallTileTypography)
local MarqueeScrollContext = require(SocialCarousel.Stores.MarqueeSession.MarqueeScrollContext).MarqueeScrollContext
local MarqueeTextModule = if FFlagSocialCarouselInGameTitleMarquee then require(SocialCarousel.Components.MarqueeText.MarqueeText) else nil

local function UserTileMarqueeListener(p1)
	-- upvalues: ReactModule (copy), EnumsModule (copy)
	local TileRef = p1.tileRef
	local OnManualMarqueeStartFunction = p1.onManualMarqueeStart
	local OnManualMarqueeEndFunction = p1.onManualMarqueeEnd
	local FriendId = p1.friendId
	local MarqueeOnFocusEnabled = p1.marqueeOnFocusEnabled
	ReactModule.useEffect(function()
		-- upvalues: TileRef (copy), EnumsModule (upval), FriendId (copy), OnManualMarqueeStartFunction (copy), OnManualMarqueeEndFunction (copy), MarqueeOnFocusEnabled (copy)
		local Current = if TileRef == nil then nil else TileRef.current
		
		if Current == nil or not Current:IsA("GuiObject") then return end
		local Frame = Current
		Current:SetAttribute(EnumsModule.MarqueeFriendIdAttribute, FriendId)
		
		if not Current:IsA("GuiButton") then
			for _, Button in Current:GetDescendants() do
				if Button:IsA("GuiButton") then
					Frame = Button
					break
				end
			end
		end
		local MouseEnterConnection = Frame.MouseEnter:Connect(function()
			-- upvalues: OnManualMarqueeStartFunction (upval), FriendId (upval)
			OnManualMarqueeStartFunction(FriendId)
		end)
		local MouseLeaveConnection = Frame.MouseLeave:Connect(function()
			-- upvalues: OnManualMarqueeEndFunction (upval), FriendId (upval)
			if OnManualMarqueeEndFunction then
				OnManualMarqueeEndFunction(FriendId)
			end
		end)
		local Connection = nil
		local Connection1 = nil
		
		if MarqueeOnFocusEnabled then
			if game:GetService("GuiService").SelectedCoreObject == Frame then
				OnManualMarqueeStartFunction(FriendId)
			end
			Connection = Frame.SelectionGained:Connect(function()
				-- upvalues: OnManualMarqueeStartFunction (upval), FriendId (upval)
				OnManualMarqueeStartFunction(FriendId)
			end)
			Connection1 = Frame.SelectionLost:Connect(function()
				-- upvalues: OnManualMarqueeEndFunction (upval), FriendId (upval)
				if OnManualMarqueeEndFunction then
					OnManualMarqueeEndFunction(FriendId)
				end
			end)
		end
		return function()
			-- upvalues: Current (copy), EnumsModule (upval), MouseEnterConnection (copy), MouseLeaveConnection (copy), Connection (ref), Connection1 (ref), OnManualMarqueeEndFunction (upval), FriendId (upval)
			Current:SetAttribute(EnumsModule.MarqueeFriendIdAttribute, nil)
			MouseEnterConnection:Disconnect()
			MouseLeaveConnection:Disconnect()
			
			if Connection then
				Connection:Disconnect()
			end
			if Connection1 then
				Connection1:Disconnect()
			end
			if OnManualMarqueeEndFunction then
				OnManualMarqueeEndFunction(FriendId)
			end
		end
	end, {
		TileRef,
		OnManualMarqueeStartFunction,
		OnManualMarqueeEndFunction,
		FriendId,
		MarqueeOnFocusEnabled
	})
	
	return nil
end

return function(p2)
	-- upvalues: UseTokensFunction (copy), FFlagSocialCarouselXSmallTileTextModule (copy), UseXSmallTileTypographyModule (copy), FoundationModule (copy), ConvertToFoundationPresenceEnumFunction (copy), FFlagSocialCarouselInGameTitleMarquee (copy), ReactModule (copy), MarqueeScrollContext (copy), MarqueePlayStatus (copy), PresenceTypes (copy), MarqueeTextModule (ref), View (copy), UserTileMarqueeListener (copy), UserTile (copy), LayoutMode (copy), FFlagSocialCarouselBuildPresence (copy), FFlagShowRequestsInCarouselForAllUsers (copy), FFlagFriendsCarouselProfileFrameEnabledModule (copy), FFlagSocialCarouselShowPlusBadgeModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseXSmallTileTypographyModuleResult = if FFlagSocialCarouselXSmallTileTextModule then UseXSmallTileTypographyModule() else nil
	local None = if p2.item.presence == nil then FoundationModule.Enums.UserPresence.None else FoundationModule.Enums.UserPresence[ConvertToFoundationPresenceEnumFunction(p2.item.presence.userPresenceType)]
	local ContextualText = p2.contextualText
	
	if FFlagSocialCarouselInGameTitleMarquee then
		local UseContextResult = ReactModule.useContext(MarqueeScrollContext)
		ReactModule.useEffect(function()
			-- upvalues: UseContextResult (copy), p2 (copy), MarqueePlayStatus (upval)
			if UseContextResult ~= nil and p2.playStatus == MarqueePlayStatus.Idle then
				UseContextResult.clearCurrentScroll(p2.item.id)
			end
		end, { UseContextResult, p2.playStatus, p2.item.id })
		local Presence = p2.item.presence
		local LastLocation = if Presence and Presence.userPresenceType == PresenceTypes.InGame then Presence.lastLocation else nil
		
		if LastLocation ~= nil and LastLocation ~= "" and p2.contextualText == LastLocation and p2.playStatus ~= nil and MarqueeTextModule then
			local OnMarqueeFinishedFunction = p2.onMarqueeFinished
			local Idle = if p2.playStatus == nil then MarqueePlayStatus.Idle else p2.playStatus
			local Id = p2.item.id
			local IsNotIdleMatch = Idle ~= MarqueePlayStatus.Idle
			ContextualText = ReactModule.createElement(MarqueeTextModule, {
				LayoutOrder = 2,
				text = LastLocation,
				playStatus = Idle,
				fontStyle = if UseXSmallTileTypographyModuleResult then UseXSmallTileTypographyModuleResult.label else UseTokensResult.Typography.LabelSmall,
				maxLoops = if OnMarqueeFinishedFunction == nil then nil else 1,
				runId = p2.marqueeRunId,
				holdForNextLoop = OnMarqueeFinishedFunction ~= nil,
				marqueeShortTitlesEnabled = p2.marqueeShortTitlesEnabled == true,
				initialOffset = if UseContextResult == nil or not IsNotIdleMatch then nil else UseContextResult.initialOffsetFor(Id),
				saveOffset = if UseContextResult == nil or not IsNotIdleMatch then nil else function(p3)
					-- upvalues: UseContextResult (copy), Id (copy)
					UseContextResult.saveOffset(Id, p3)
				end,
				onFinished = if UseContextResult == nil and OnMarqueeFinishedFunction == nil then nil else function()
					-- upvalues: UseContextResult (copy), Id (copy), OnMarqueeFinishedFunction (copy)
					if UseContextResult ~= nil then
						UseContextResult.clearCurrentScroll(Id)
					end
					if OnMarqueeFinishedFunction ~= nil then
						OnMarqueeFinishedFunction(Id)
					end
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
		MarqueeListener = if FFlagSocialCarouselInGameTitleMarquee and p2.onManualMarqueeStart ~= nil then ReactModule.createElement(UserTileMarqueeListener, {
			tileRef = p2.tileRef,
			friendId = p2.item.id,
			onManualMarqueeStart = p2.onManualMarqueeStart,
			onManualMarqueeEnd = p2.onManualMarqueeEnd,
			marqueeOnFocusEnabled = p2.marqueeOnFocusEnabled
		}) else nil,
		Content = ReactModule.createElement(UserTile, {
			layoutMode = LayoutMode.compact,
			userId = p2.item.id,
			title = p2.name,
			subtitle = ContextualText,
			titleStyle = if UseXSmallTileTypographyModuleResult then UseXSmallTileTypographyModuleResult.title else UseTokensResult.Typography.TitleSmall,
			subtitleStyle = if UseXSmallTileTypographyModuleResult then UseXSmallTileTypographyModuleResult.label else UseTokensResult.Typography.LabelSmall,
			contextualInfo = if FFlagSocialCarouselBuildPresence then p2.contextualInfo else nil,
			contextualInfoIcon = if FFlagSocialCarouselBuildPresence then p2.contextualInfoIcon else nil,
			contextualInfoStyle = if FFlagSocialCarouselBuildPresence then if UseXSmallTileTypographyModuleResult then UseXSmallTileTypographyModuleResult.label else UseTokensResult.Typography.LabelSmall else nil,
			userPresenceType = None,
			onActivated = p2.onActivated,
			titleIcon = p2.titleIcon,
			overlayIcon = if FFlagShowRequestsInCarouselForAllUsers then p2.overlayIcon else nil,
			includeProfileFrame = FFlagFriendsCarouselProfileFrameEnabledModule,
			isRobloxSubscriber = if FFlagSocialCarouselShowPlusBadgeModule then p2.isRobloxSubscriber else nil
		})
	})
end