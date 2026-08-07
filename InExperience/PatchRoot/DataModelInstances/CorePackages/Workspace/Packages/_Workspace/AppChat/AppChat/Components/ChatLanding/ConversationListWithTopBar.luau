local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local httpService = game:GetService("HttpService")
local cryoModule = require(parent.Cryo)
local roactModule = require(parent.Roact)
local roactPaginator = require(appChat.SocialLibraries).RoactPaginator
local searchFilterPredicate = require(appChat.SocialLibraries).Utils.searchFilterPredicate
local memoize = require(parent.AppCommonLib).memoize
local withAnalyticsModule = require(appChat.LegacyAnalytics.withAnalytics)
local withTelemetryModule = require(appChat.Telemetry.withTelemetry)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local chatLandingTelemetryEventsModule = require(script:FindFirstAncestor("ChatLanding").ChatLandingTelemetryEvents)
local chatLandingTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local fFlagAppIaScrollAway = require(parent.SharedFlags).FFlagAppIaScrollAway
local partyPageCarouselExperimentation = require(parent.SocialExperiments).PartyPageCarouselExperimentation
local fFlagAppChatUseNewConversationRowModule = require(appChat.Flags.FFlagAppChatUseNewConversationRow)
local fFlagAppChatConversationStoreModule = require(appChat.Flags.FFlagAppChatConversationStore)
local fFlagAppChatSignalsMessageStoreModule = require(appChat.Flags.FFlagAppChatSignalsMessageStore)
local fFlagAppChatUseUltimateListConversationListModule = require(appChat.Flags.FFlagAppChatUseUltimateListConversationList)
local conversationListWithTopBar = roactModule.PureComponent:extend("ConversationListWithTopBar")
local fFlagAppChatSignalsMessageStoreModule_1 = fFlagAppChatUseNewConversationRowModule and (fFlagAppChatConversationStoreModule and fFlagAppChatSignalsMessageStoreModule)
local fFlagAppChatUseUltimateListConversationListModule_1 = fFlagAppChatSignalsMessageStoreModule_1 and fFlagAppChatUseUltimateListConversationListModule
local conversationListModule = require(script.Parent.ConversationList)
local var18 = false
local var19 = nil

local function _() --[[ line: 41 | named "getConversationListUltimate" ]]
	-- upvalues: var18 (write), var19 (write)
	if var18 then
		return var19
	end
	var18 = true
	local ok, status = pcall(function() --[[ line: 47 ]]
		return require(script.Parent.ConversationListUltimate)
	end)
	
	if ok then
		var19 = status
	end
	return var19
end

conversationListWithTopBar.defaultProps = {
	filterText = nil,
	isDebugEnabled = false,
	topBarHeight = 0,
	entryHeight = 64,
	canAccessParty = false,
	isPartyQuickStartEnabled = false,
	itemList = {},
	navigateToSquadLobby = function() --[[ line: 61 ]] end,
	canvasTopPadding = if fFlagAppIaScrollAway then 0 else nil
}

function conversationListWithTopBar.getDerivedStateFromProps(p0) --[[ line: 69 ]]
	-- upvalues: cryoModule (ref), searchFilterPredicate (ref)
	local filterText = p0.filterText
	
	return {
		filteredItemList = cryoModule.List.filterMap(p0.itemList, function(p1) --[[ line: 74 ]]
			-- upvalues: searchFilterPredicate (copy), filterText (ref)
			return if searchFilterPredicate(filterText, p1.title) then p1 else nil
		end)
	}
end

function conversationListWithTopBar.init(p2) --[[ line: 86 ]]
	-- upvalues: memoize (ref), roactPaginator (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), cryoModule (ref), httpService (ref), chatLandingTelemetryEventsModule (ref)
	function p2.showErrorToast(p3) --[[ line: 87 ]]
		-- upvalues: p2 (ref)
		p2.props.navigateToToast({ toastProps = { toastContent = { toastTitle = p3 } } })
	end
	
	function p2.reportAnalytics(p4) --[[ line: 97 ]]
		-- upvalues: p2 (ref)
		if not p2.props.conversationsIsFetching and not p2.props.oldestConversationIsFetched then
			p4:userFetchedOlderConversations(p2.props.localUserId)
		end
	end
	
	p2.loadNext = memoize(function(p5) --[[ line: 104 ]]
		-- upvalues: p2 (ref), roactPaginator (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy)
		return function(p6) --[[ line: 105 ]]
			-- upvalues: p2 (copy), roactPaginator (copy), p5 (ref), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy)
			if p2.props[roactPaginator.loadNext] then
				p2.reportAnalytics(p5)
				
				if fFlagAppChatPerfTrackingModule then
					appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.PaginationConversationList)
				end
				p2.props[roactPaginator.loadNext](p6)
			end
		end
	end)
	p2.isFiltered = p2.props.filterText and p2.props.filterText:match("%S")
	p2.indexOfList = memoize(function(p7, p8) --[[ line: 118 ]]
		-- upvalues: cryoModule (copy)
		local index = table.find(cryoModule.List.map(p7, function(p9) --[[ line: 120 ]]
			return p9.id
		end), p8)
		
		return index or 0
	end)
	
	function p2.formatParticipantIds(p10) --[[ line: 131 ]]
		-- upvalues: cryoModule (copy), httpService (copy)
		local var21 = cryoModule.List.filterMap(p10 or {}, function(p11) --[[ line: 132 ]]
			return if p11.id then tonumber(p11.id) else nil
		end)
		local ok, status = pcall(function() --[[ line: 139 ]]
			-- upvalues: httpService (copy), var21 (ref)
			return httpService:JSONEncode(var21)
		end)
		
		return if ok then status else "[]"
	end
	
	function p2.fireClickEvent(p12, p13, p14) --[[ line: 145 ]]
		-- upvalues: chatLandingTelemetryEventsModule (copy), p2 (ref)
		local id = p12.id
		p13.emit(chatLandingTelemetryEventsModule.ConversationClicked, {
			isFiltered = p2.isFiltered ~= nil,
			conversationListCount = #p2.state.filteredItemList,
			selectedConversationId = id,
			selectedIndex = p2.indexOfList(p2.state.filteredItemList, id),
			hasUnreadMessages = p12.hasUnreadMessages,
			selectedConversationModerationType = if p12 then p12.moderationType else nil,
			selectedConversationUserPendingStatus = if p12 then p12.userPendingStatus else nil,
			participantUserIds = p2.formatParticipantIds(p12.participants),
			osaAcknowledgementStatus = p12.osaAcknowledgementStatus,
			osaImpressionId = p14
		})
		p13.emit(chatLandingTelemetryEventsModule.ConversationClickedIndexStat, {
			statValue = p2.indexOfList(p2.state.filteredItemList, id) or 0
		})
	end
	
	p2.fireConversationImpressionEvent = memoize(function(p15) --[[ line: 164 ]]
		-- upvalues: chatLandingTelemetryEventsModule (copy), p2 (ref)
		return function(p16) --[[ line: 165 ]]
			-- upvalues: p15 (ref), chatLandingTelemetryEventsModule (copy), p2 (copy)
			local id = p16.id
			p15.emit(chatLandingTelemetryEventsModule.ConversationCellRendered, {
				isFiltered = p2.isFiltered ~= nil,
				conversationListCount = #p2.state.filteredItemList,
				selectedConversationId = id,
				selectedIndex = p2.indexOfList(p2.state.filteredItemList, id),
				hasUnreadMessages = p16.hasUnreadMessages,
				selectedConversationModerationType = p16.moderationType,
				selectedConversationUserPendingStatus = p16.userPendingStatus,
				participantUserIds = p2.formatParticipantIds(p16.participants),
				osaAcknowledgementStatus = p16.osaAcknowledgementStatus
			})
			p15.emit(chatLandingTelemetryEventsModule.ConversationCellRenderedIndexStat, {
				statValue = p2.indexOfList(p2.state.filteredItemList, id) or 0
			})
		end
	end)
	
	function p2.onActivated(p17) --[[ line: 185 ]]
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), p2 (ref)
		if fFlagAppChatPerfTrackingModule then
			appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = tostring(p17.id) })
		end
		p2.props.navigateToConversation(p17.id)
	end
end

function conversationListWithTopBar.render(p18) --[[ line: 195 ]]
	-- upvalues: withAnalyticsModule (ref), withTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), partyPageCarouselExperimentation (ref), fFlagAppChatSignalsMessageStoreModule_1 (ref), fFlagAppIaScrollAway (ref), fFlagAppChatUseUltimateListConversationListModule_1 (ref), conversationListModule (ref), var18 (write), var19 (write), roactModule (ref)
	return withAnalyticsModule(function(p19) --[[ line: 196 ]]
		-- upvalues: withTelemetryModule (copy), chatLandingTelemetryLayerModule (copy), p18 (ref), partyPageCarouselExperimentation (copy), fFlagAppChatSignalsMessageStoreModule_1 (copy), fFlagAppIaScrollAway (copy), fFlagAppChatUseUltimateListConversationListModule_1 (copy), conversationListModule (copy), var18 (copy), var19 (copy), roactModule (copy)
		return withTelemetryModule(chatLandingTelemetryLayerModule.Context)(function(p20) --[[ line: 197 ]]
			-- upvalues: p18 (copy), p19 (ref), partyPageCarouselExperimentation (copy), fFlagAppChatSignalsMessageStoreModule_1 (copy), fFlagAppIaScrollAway (copy), fFlagAppChatUseUltimateListConversationListModule_1 (copy), conversationListModule (copy), var18 (copy), var19 (copy), roactModule (copy)
			local t = {
				Size = UDim2.fromScale(1, 1),
				itemList = if p18.props.filterText and p18.props.filterText:match("%S") then p18.state.filteredItemList else p18.props.itemList,
				loadNext = p18.loadNext(p19),
				isDebugEnabled = p18.props.isDebugEnabled,
				isWideMode = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() or fFlagAppChatSignalsMessageStoreModule_1 then p18.props.isWideMode else nil,
				filterText = p18.props.filterText,
				onActivated = p18.onActivated,
				entryHeight = p18.props.entryHeight,
				navigateToSquadLobby = p18.props.navigateToSquadLobby,
				isInExperience = p18.props.isInExperience,
				localUserId = p18.props.localUserId,
				rowProps = { showBackground = not p18.props.isInExperience },
				navigateToConversationFromUserId = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then p18.props.navigateToConversationFromUserId else nil,
				navigateToQuickStartSquadInviteFriends = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then p18.props.navigateToQuickStartSquadInviteFriends else nil,
				shouldShowPhoneVerificationUpsell = p18.props.shouldShowPhoneVerificationUpsell,
				shouldShowUnfilteredAccessFtux = p18.props.shouldShowUnfilteredAccessFtux,
				shouldShowPartyUpsellFtux = p18.props.shouldShowPartyUpsellFtux,
				dismissUnfilteredThreadsFtux = p18.props.dismissUnfilteredThreadsFtux,
				showGroupsLink = p18.props.showGroupsLink,
				canvasTopPadding = if fFlagAppIaScrollAway then p18.props.canvasTopPadding else nil,
				fireConversationImpressionEvent = p18.fireConversationImpressionEvent(p20),
				isPartyQuickStartEnabled = p18.props.isPartyQuickStartEnabled,
				fireConversationClickedEvent = p18.fireClickEvent
			}
			
			if fFlagAppChatSignalsMessageStoreModule_1 then
				t.canAccessParty = p18.props.canAccessParty
			end
			if fFlagAppChatUseUltimateListConversationListModule_1 then
				t.isLoadingNext = p18.props.conversationsIsFetching
				t.isLoadingPrevious = p18.props.conversationsIsFetching
				t.oldestConversationIsFetched = p18.props.oldestConversationIsFetched
			end
			local var23 = conversationListModule
			
			if fFlagAppChatUseUltimateListConversationListModule_1 then
				local var24
				if var18 then
					var24 = var19
				else
					var18 = true
					local ok, status = pcall(function() --[[ line: 47 ]]
						return require(script.Parent.ConversationListUltimate)
					end)
					
					if ok then
						var19 = status
					end
					var24 = var19
				end
				if not var24 then
					var24 = conversationListModule
				end
				var23 = var24
			end
			return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, { conversationList = roactModule.createElement(var23, t) })
		end)
	end)
end

function conversationListWithTopBar.didMount(p21) --[[ line: 260 ]]
	p21.isMounted = true
end

function conversationListWithTopBar.didUpdate(p22, p23) --[[ line: 264 ]]
	-- upvalues: fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref)
	if fFlagAppChatPerfTrackingModule and #p23.itemList < #p22.props.itemList then
		appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.PaginationConversationList)
	end
end

function conversationListWithTopBar.willUnmount(p24) --[[ line: 270 ]]
	p24.isMounted = false
end

return conversationListWithTopBar