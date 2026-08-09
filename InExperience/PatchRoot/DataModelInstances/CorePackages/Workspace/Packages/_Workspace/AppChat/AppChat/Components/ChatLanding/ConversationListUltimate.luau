local IXPService = game:GetService("IXPService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatPerfExperimentation = require(parent.SocialExperiments).AppChatPerfExperimentation
local appPage = require(parent.RobloxAppEnums).AppPage
local coreGui = require(parent.ReactFocusNavigation).EngineInterface.CoreGui
local cryoModule = require(parent.Cryo)
local focusNavigationService = require(parent.ReactFocusNavigation).FocusNavigationService
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signal = require(parent.AppCommonLib).Signal
local socialCarouselModule = require(parent.SocialCarousel)
local socialExperimentsModule = require(parent.SocialExperiments)
local foundationModule = require(parent.Foundation)
local ultimateListModule = require(parent.UltimateList)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local createScrollIntervalTrackerModule = require(appChat.Telemetry.createScrollIntervalTracker)
local constants = socialCarouselModule.Constants
local enums = socialCarouselModule.Enums
local squadQuickStartExperimentation = socialExperimentsModule.SquadQuickStartExperimentation
local chatLandingModalContainerModule = require(script.Parent.ChatLandingModal.ChatLandingModalContainer)
local conversationRowModule = require(script.Parent.ConversationRow)
local conversationGroupsEntryContainerModule = require(script.Parent.ConversationGroupsEntryContainer)
local partyQuickStartContainerModule = require(script.Parent.PartyQuickStartContainer)
local appChatChatLandingInitialFetchLimit = game:DefineFastInt("AppChatChatLandingInitialFetchLimit", 5)
local fFlagAppIaScrollAway = sharedFlagsModule.FFlagAppIaScrollAway
local appChatChatLandingInitialFetchMinimumConversations = game:DefineFastInt("AppChatChatLandingInitialFetchMinimumConversations", 30)
local fFlagAppChatRemoveConversationListDividerIxpEnabledModule = require(appChat.Flags.FFlagAppChatRemoveConversationListDividerIxpEnabled)
local fStringAppChatRemoveConversationListDividerIxpLayerModule = require(appChat.Flags.FStringAppChatRemoveConversationListDividerIxpLayer)
local appChatPerfChatLandingPaginationOnStartReachedUnits = game:DefineFastInt("AppChatPerfChatLandingPaginationOnStartReachedUnits", 1)
local appChatPerfChatLandingPaginationOnEndReachedUnits = game:DefineFastInt("AppChatPerfChatLandingPaginationOnEndReachedUnits", 1)
local partyPageCarouselExperimentation = require(parent.SocialExperiments).PartyPageCarouselExperimentation
local name = require(script.Parent.Logger):new(script.Name)

local function noop() --[[ line: 55 ]] end

local function _(p0) --[[ line: 57 | named "isPartyQuickStartEnabled" ]]
	return p0.isPartyQuickStartEnabled
end

local _ = function(p1) --[[ line: 61 | named "getIsSquadEnabledForRows" ]]
	return p1.canAccessParty == true
end

local function getConversationRowListItems(p2) --[[ line: 65 ]]
	local t = {}
	
	for i, v in p2 do
		t[i] = { id = tostring(v.id) }
	end
	return t
end

local _ = function(p3) --[[ line: 75 | named "getFirstId" ]]
	return if p3 and p3[1] then p3[1].id else nil
end

local _ = function(p4) --[[ line: 79 | named "getLastId" ]]
	return if p4 and p4[#p4] then p4[#p4].id else nil
end

local _ = function(p5) --[[ line: 83 | named "getAutoLoadNextRequestKey" ]]
	return `{#p5}:{tostring(if p5 and p5[1] then p5[1].id else nil)}:{tostring(if p5 and p5[#p5] then p5[#p5].id else nil)}`
end

local function getKey(p6) --[[ line: 87 ]]
	return tostring(p6.id)
end

local function MeasuredChatLandingModal(p7) --[[ line: 91 ]]
	-- upvalues: reactModule (ref), chatLandingModalContainerModule (ref)
	local var28 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 94 ]]
		-- upvalues: var28 (ref), p7 (ref)
		local current = var28.current
		
		if current ~= nil then
			p7.onHeightChanged(p7.itemId, current.AbsoluteSize.Y)
		end
	end, { p7.itemId, p7.onHeightChanged })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = var28,
		[reactModule.Change.AbsoluteSize] = function(p8) --[[ line: 106 ]]
			-- upvalues: p7 (ref)
			p7.onHeightChanged(p7.itemId, p8.AbsoluteSize.Y)
		end
	}, {
		ChatLandingModal = reactModule.createElement(chatLandingModalContainerModule, {})
	})
end

return reactModule.memo(function(p9) --[[ line: 114 | named "ConversationListUltimate" ]]
	-- upvalues: noop (ref), reactModule (ref), signal (ref), useTokens (ref), cryoModule (ref), appChatPerfExperimentation (ref), partyPageCarouselExperimentation (ref), squadQuickStartExperimentation (ref), fFlagAppChatRemoveConversationListDividerIxpEnabledModule (ref), IXPService (ref), fStringAppChatRemoveConversationListDividerIxpLayerModule (ref), focusNavigationService (ref), coreGui (ref), fFlagAppChatPerfTrackingModule (ref), createScrollIntervalTrackerModule (ref), appChatPerfTrackerModule (ref), appPage (ref), constants (ref), enums (ref), getConversationRowListItems (ref), fFlagAppIaScrollAway (ref), appChatChatLandingInitialFetchLimit (ref), appChatChatLandingInitialFetchMinimumConversations (ref), name (ref), MeasuredChatLandingModal (ref), conversationGroupsEntryContainerModule (ref), partyQuickStartContainerModule (ref), socialCarouselModule (ref), view (ref), conversationRowModule (ref), ultimateListModule (ref), getKey (ref), appChatPerfChatLandingPaginationOnStartReachedUnits (ref), appChatPerfChatLandingPaginationOnEndReachedUnits (ref)
	local entryHeight = p9.entryHeight or 64
	local itemList = p9.itemList or {}
	local size = p9.Size or UDim2.fromScale(1, 1)
	local layoutOrder = p9.LayoutOrder or 1
	local onScrollUpdate = p9.onScrollUpdate or noop
	local navigateToConversationFromUserId = p9.navigateToConversationFromUserId or noop
	local navigateToQuickStartSquadInviteFriends = p9.navigateToQuickStartSquadInviteFriends or noop
	local navigateToSquadLobby = p9.navigateToSquadLobby or noop
	local fireConversationImpressionEvent = p9.fireConversationImpressionEvent or noop
	local fireConversationClickedEvent = p9.fireConversationClickedEvent or noop
	local var39 = p9.showHeaderEntries ~= false
	local rowProps = p9.rowProps or {}
	local var41 = reactModule.useMemo(function() --[[ line: 127 ]]
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local var42 = reactModule.useRef(nil)
	local var43 = reactModule.useRef(nil)
	local var44 = reactModule.useRef(nil)
	local var45 = reactModule.useRef(0)
	local var46 = reactModule.useMemo(function() --[[ line: 134 ]]
		-- upvalues: itemList (ref)
		return `{#itemList}:{tostring(if itemList and itemList[1] then itemList[1].id else nil)}:{tostring(if itemList and itemList[#itemList] then itemList[#itemList].id else nil)}`
	end, { itemList })
	local var47 = reactModule.useRef(nil)
	local var48, var49 = reactModule.useState(Vector2.new(0, 0))
	local var50, var51 = reactModule.useState(nil)
	local var52 = useTokens()
	local var53, var54 = reactModule.useState({})
	local var55 = reactModule.useCallback(function(p10, p11) --[[ line: 142 ]]
		-- upvalues: var54 (ref), cryoModule (copy)
		if p11 < 0 then
			return
		end
		var54(function(p12) --[[ line: 147 ]]
			-- upvalues: p10 (ref), p11 (ref), cryoModule (copy)
			return if p12[p10] == p11 then p12 else cryoModule.Dictionary.join(p12, { [p10] = p11 })
		end)
	end, {})
	local var56 = p9.loadNext ~= nil and (not p9.isLoadingNext and not p9.oldestConversationIsFetched)
	reactModule.useEffect(function() --[[ line: 158 ]]
		-- upvalues: p9 (ref), var47 (ref)
		if p9.isLoadingNext then
			var47.current = nil
		end
	end, { p9.isLoadingNext })
	local var57 = reactModule.useCallback(function() --[[ line: 164 ]]
		-- upvalues: var56 (ref), var47 (ref), var46 (ref), p9 (ref)
		if var56 and var47.current ~= var46 then
			var47.current = var46
			p9.loadNext()
			
			return true
		end
		return false
	end, { var56, var46, p9.loadNext })
	reactModule.useEffect(function() --[[ line: 176 ]]
		-- upvalues: appChatPerfExperimentation (copy), p9 (ref), partyPageCarouselExperimentation (copy), squadQuickStartExperimentation (copy), fFlagAppChatRemoveConversationListDividerIxpEnabledModule (copy), IXPService (copy), fStringAppChatRemoveConversationListDividerIxpLayerModule (copy)
		appChatPerfExperimentation.logExposure()
		
		if p9.shouldLogHeaderEntryExposures ~= false then
			partyPageCarouselExperimentation.logExposure()
			
			if squadQuickStartExperimentation.isLogExposureEnabled then
				squadQuickStartExperimentation.logExposure()
			end
			if fFlagAppChatRemoveConversationListDividerIxpEnabledModule then
				IXPService:LogFlagLinkedUserLayerExposure(fStringAppChatRemoveConversationListDividerIxpLayerModule)
			end
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 190 ]]
		-- upvalues: focusNavigationService (copy), coreGui (copy)
		local var70 = focusNavigationService.new(coreGui)
		
		return function() --[[ line: 192 ]]
			-- upvalues: var70 (ref)
			var70:teardown()
		end
	end, {})
	local var58 = p9.canAccessParty == true
	reactModule.useEffect(function() --[[ line: 199 ]]
		-- upvalues: var50 (ref), fFlagAppChatPerfTrackingModule (copy), var42 (ref), createScrollIntervalTrackerModule (copy), appChatPerfTrackerModule (copy)
		if var50 == nil then
			return nil
		end
		var50.Selectable = false
		
		if fFlagAppChatPerfTrackingModule then
			var42.current = createScrollIntervalTrackerModule(appChatPerfTrackerModule.Events.ScrollConversationList, var50)
			
			return function() --[[ line: 210 ]]
				-- upvalues: var42 (copy)
				if var42.current then
					var42.current.cleanup()
					var42.current = nil
				end
			end
		end
		return nil
	end, { var50 })
	local isPartyQuickStartEnabled = p9.isPartyQuickStartEnabled
	local var59 = reactModule.useMemo(function() --[[ line: 222 ]]
		-- upvalues: appPage (copy), p9 (ref), constants (copy), var41 (ref)
		return {
			sortId = 0,
			sortIndex = 1,
			appPage = appPage.Chat,
			impressionTag = if p9.isInExperience then constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else constants.ANALYTICS.SRC.PARTY_PAGE_UA,
			scrollViewPositionChangedSignal = var41
		}
	end, { p9.isInExperience, var41 })
	local var60 = reactModule.useCallback(function(p13) --[[ line: 234 ]]
		-- upvalues: navigateToConversationFromUserId (ref)
		navigateToConversationFromUserId(p13.id)
	end, { navigateToConversationFromUserId })
	local var61 = reactModule.useMemo(function() --[[ line: 238 ]]
		-- upvalues: enums (copy), navigateToQuickStartSquadInviteFriends (ref), var60 (ref)
		return {
			{
				tileGroup = enums.TileGroup.StartSquad,
				onActivated = navigateToQuickStartSquadInviteFriends
			},
			{
				tileGroup = enums.TileGroup.FriendsList,
				onActivated = var60
			}
		}
	end, { navigateToQuickStartSquadInviteFriends, var60 })
	local var62 = reactModule.useMemo(function() --[[ line: 252 ]]
		-- upvalues: getConversationRowListItems (copy), itemList (ref), p9 (ref), var39 (ref), cryoModule (copy), partyPageCarouselExperimentation (copy), isPartyQuickStartEnabled (ref), fFlagAppIaScrollAway (copy)
		local var71 = getConversationRowListItems(itemList)
		local var72 = var39 and (if p9.filterText ~= "" then p9.filterText == nil else true)
		
		if var72 and p9.showGroupsLink then
			var71 = cryoModule.List.join({
				{
					id = "ConversationGroupsEntryContainer",
					isGroupLink = true
				}
			}, var71)
		end
		if var72 and not partyPageCarouselExperimentation.getPartyPageCarouselEnabled() and isPartyQuickStartEnabled then
			var71 = cryoModule.List.join({
				{ id = "PartyQuickStartContainer", isQuickStartLink = true }
			}, var71)
		end
		if var72 then
			if isPartyQuickStartEnabled and partyPageCarouselExperimentation.getPartyPageCarouselEnabled() and (p9.isWideMode or not p9.isInExperience) then
				var71 = cryoModule.List.join({ { id = "SocialCarousel", isSocialCarousel = true } }, var71)
			end
			var71 = cryoModule.List.join({
				{ id = "UnfilteredThreadsFtux", isChatLandingModal = true }
			}, var71)
		end
		if fFlagAppIaScrollAway and (p9.canvasTopPadding or 0) > 0 then
			var71 = cryoModule.List.join({
				{
					id = "CanvasTopPadding",
					isCanvasTopPadding = true,
					height = p9.canvasTopPadding
				}
			}, var71)
		end
		return var71
	end, {
		itemList, p9.filterText, p9.showGroupsLink, p9.isWideMode, p9.isInExperience,
		p9.canvasTopPadding, var39, isPartyQuickStartEnabled
	})
	local var63 = reactModule.useMemo(function() --[[ line: 325 ]]
		-- upvalues: var62 (ref), var53 (ref), fFlagAppIaScrollAway (copy), entryHeight (ref), cryoModule (copy)
		local t = {}
		local var74 = 0
		
		for i, v in var62 do
			local var75 = if v.isChatLandingModal then var53[v.id] or 200 elseif fFlagAppIaScrollAway and v.isCanvasTopPadding then v.height else entryHeight
			t[i] = cryoModule.Dictionary.join(v, { height = var75, yOffset = var74 })
			var74 += var75
		end
		return { items = t, contentHeight = var74 }
	end, { var62, entryHeight, var53 })
	reactModule.useEffect(function() --[[ line: 348 ]]
		-- upvalues: var56 (ref), var45 (ref), appChatChatLandingInitialFetchLimit (copy), itemList (ref), appChatChatLandingInitialFetchMinimumConversations (copy), var57 (ref), name (copy)
		if var56 and var45.current < appChatChatLandingInitialFetchLimit and #itemList < appChatChatLandingInitialFetchMinimumConversations then
			local var76 = var45.current + 1
			
			if var57() then
				var45.current = var76
				name:info("Loading more conversations because the list (count: {} out of {}) is not enough (attempt {} out of {})", #itemList, appChatChatLandingInitialFetchMinimumConversations, var45.current, appChatChatLandingInitialFetchLimit)
			end
		end
	end, { itemList, var56, var57 })
	reactModule.useEffect(function() --[[ line: 368 ]]
		-- upvalues: var56 (ref), var63 (ref), var48 (ref), var57 (ref), name (copy)
		if var56 and var63.contentHeight > 0 and (var48.Y > 0 and var63.contentHeight <= var48.Y) and var57() then
			name:info("Not enough UltimateList content to fill the view, loading more conversations")
		end
	end, { var63.contentHeight, var48.Y, var56, var57 })
	local var64 = reactModule.useCallback(function() --[[ line: 376 ]]
		-- upvalues: var56 (ref), name (copy), p9 (ref)
		if var56 then
			name:debug("UltimateList onEndReached - Loading more conversations")
			p9.loadNext()
		end
	end, { var56, p9.loadNext })
	local var65 = reactModule.useCallback(function() --[[ line: 383 ]]
		-- upvalues: p9 (ref), name (copy)
		if p9.loadPrevious and not p9.isLoadingPrevious then
			name:debug("UltimateList onStartReached - Loading previous conversations")
			p9.loadPrevious()
		end
	end, { p9.loadPrevious, p9.isLoadingPrevious })
	local var66 = reactModule.useCallback(function(p14) --[[ line: 390 ]]
		-- upvalues: var49 (ref)
		var49(p14)
	end, {})
	local var67 = reactModule.useCallback(function(p15) --[[ line: 394 ]]
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), var42 (ref), var41 (ref), onScrollUpdate (ref)
		if fFlagAppChatPerfTrackingModule and var42.current then
			var42.current.onScrollTick()
		end
		var41:fire()
		onScrollUpdate({ CanvasPosition = Vector2.new(0, p15) })
	end, { var41, onScrollUpdate })
	local var68 = reactModule.useCallback(function(p16) --[[ line: 406 ]]
		-- upvalues: var43 (ref), var51 (ref)
		var43.current = p16
		var51(p16)
	end, {})
	local var69 = if itemList and itemList[1] then itemList[1].id else nil
	reactModule.useEffect(function() --[[ line: 412 ]]
		-- upvalues: var43 (ref), var69 (ref), var44 (ref)
		local current = var43.current
		
		if current ~= nil and var69 ~= nil and (var44.current ~= nil and var44.current ~= var69) and current.CanvasPosition.Y <= 33 then
			current.CanvasPosition = Vector2.new(0, 0)
		end
		var44.current = var69
	end, { var69 })
	
	return if #var62 == 0 then reactModule.createElement(view, {
		BorderSizePixel = 0,
		Size = size,
		backgroundStyle = var52.Color.None,
		LayoutOrder = layoutOrder
	}) else reactModule.createElement(view, {
		BorderSizePixel = 0,
		Size = size,
		backgroundStyle = var52.Color.None,
		LayoutOrder = layoutOrder
	}, {
		scroller = reactModule.createElement(ultimateListModule.Components.ScrollingFrame, {
			direction = "y",
			dataSource = ultimateListModule.DataSources.array(if var48.X > 0 or var48.Y > 0 then var63.items else {}),
			dimensions = ultimateListModule.Dimensions.getter(function(p17) --[[ line: 523 ]]
				return {
					size = UDim2.new(1, 0, 0, p17.height),
					position = UDim2.fromOffset(0, p17.yOffset)
				}
			end),
			renderer = ultimateListModule.Renderers.byState(reactModule.useCallback(function(p18) --[[ line: 428 ]]
				-- upvalues: reactModule (copy), MeasuredChatLandingModal (copy), var55 (ref), conversationGroupsEntryContainerModule (copy), entryHeight (ref), isPartyQuickStartEnabled (ref), partyQuickStartContainerModule (copy), partyPageCarouselExperimentation (copy), socialCarouselModule (copy), var61 (ref), p9 (ref), constants (copy), var59 (ref), fFlagAppIaScrollAway (copy), view (copy), var52 (ref), conversationRowModule (copy), var58 (ref), navigateToSquadLobby (ref), fireConversationImpressionEvent (ref), fireConversationClickedEvent (ref), rowProps (ref)
				return if p18.isChatLandingModal then reactModule.createElement(MeasuredChatLandingModal, { itemId = p18.id, onHeightChanged = var55 }) elseif p18.isGroupLink then reactModule.createElement(conversationGroupsEntryContainerModule, { entryHeight = entryHeight }) elseif isPartyQuickStartEnabled and p18.isQuickStartLink then reactModule.createElement(partyQuickStartContainerModule, { entryHeight = entryHeight }) elseif partyPageCarouselExperimentation.getPartyPageCarouselEnabled() and p18.isSocialCarousel then reactModule.createElement(socialCarouselModule.Entry, {
					roduxKey = "ChatAppReducer",
					hideCarouselHeader = true,
					customTileList = var61,
					source = if p9.isInExperience then constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else constants.ANALYTICS.SRC.PARTY_PAGE_UA,
					unifiedLogging = var59
				}) elseif fFlagAppIaScrollAway and p18.isCanvasTopPadding then reactModule.createElement(view, {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, p18.height),
					backgroundStyle = var52.Color.None
				}) else reactModule.createElement(conversationRowModule, {
					entryHeight = entryHeight,
					conversationId = p18.id,
					isSquadEnabled = var58,
					isWideMode = p9.isWideMode,
					onActivated = p9.onActivated,
					onSquadJoinButtonActivated = navigateToSquadLobby,
					key = "ConversationEntry" .. tostring(p18.id),
					fireImpressionEvent = fireConversationImpressionEvent,
					fireClickEvent = fireConversationClickedEvent,
					showBackground = rowProps.showBackground,
					localUserId = p9.localUserId,
					debugCellValue = if p9.isDebugEnabled then tostring(p18.id) else nil
				})
			end, {
				entryHeight, var58, isPartyQuickStartEnabled, var61, p9.isInExperience, var59,
				p9.onActivated, navigateToSquadLobby, fireConversationImpressionEvent,
				fireConversationClickedEvent, rowProps, p9.isDebugEnabled, p9.localUserId,
				p9.isWideMode, var55, var52
			})),
			getKey = getKey,
			scrollingFrameRef = var68,
			onAbsoluteWindowSizeChanged = var66,
			onScrollAxisChanged = var67,
			onStartReached = var65,
			onEndReached = var64,
			onStartReachedThreshold = entryHeight * appChatPerfChatLandingPaginationOnStartReachedUnits,
			onEndReachedThreshold = entryHeight * appChatPerfChatLandingPaginationOnEndReachedUnits,
			native = {
				Name = "RCTScrollView",
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				BorderSizePixel = 0
			}
		})
	})
end)