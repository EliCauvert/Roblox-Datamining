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
local signalsMigrationConfigModule = require(appChat.Flags.SignalsMigrationConfig)
local fFlagAppChatUseUltimateListConversationListModule = require(appChat.Flags.FFlagAppChatUseUltimateListConversationList)
local conversationListWithTopBar = roactModule.PureComponent:extend("ConversationListWithTopBar")
local shouldUseFoundationConversationRow = signalsMigrationConfigModule.shouldUseFoundationConversationRow
local fFlagAppChatUseUltimateListConversationListModule_1 = shouldUseFoundationConversationRow and fFlagAppChatUseUltimateListConversationListModule
local conversationListModule = require(script.Parent.ConversationList)
local var1 = false
local var2 = nil

local function _()
	-- upvalues: var1 (write), var2 (write)
	if var1 then
		return var2
	end
	var1 = true
	local ok, status = pcall(function()
		return require(script.Parent.ConversationListUltimate)
	end)
	
	if ok then
		var2 = status
	end
	return var2
end

conversationListWithTopBar.defaultProps = {
	filterText = nil,
	isDebugEnabled = false,
	topBarHeight = 0,
	entryHeight = 64,
	canAccessParty = false,
	isPartyQuickStartEnabled = false,
	itemList = {},
	navigateToSquadLobby = function() end,
	canvasTopPadding = if fFlagAppIaScrollAway then 0 else nil
}

function conversationListWithTopBar.getDerivedStateFromProps(p1)
	-- upvalues: cryoModule (ref), searchFilterPredicate (ref)
	local filterText = p1.filterText
	
	return {
		filteredItemList = cryoModule.List.filterMap(p1.itemList, function(p2)
			-- upvalues: searchFilterPredicate (copy), filterText (ref)
			return if searchFilterPredicate(filterText, p2.title) then p2 else nil
		end)
	}
end

function conversationListWithTopBar.init(p1)
	-- upvalues: memoize (ref), roactPaginator (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), cryoModule (ref), httpService (ref), chatLandingTelemetryEventsModule (ref)
	function p2.showErrorToast(p2)
		-- upvalues: p1 (ref)
		p1.props.navigateToToast({ toastProps = { toastContent = { toastTitle = p2 } } })
	end
	
	function p2.reportAnalytics(p2)
		-- upvalues: p1 (ref)
		if not p1.props.conversationsIsFetching and not p1.props.oldestConversationIsFetched then
			p2:userFetchedOlderConversations(p1.props.localUserId)
		end
	end
	
	p1.loadNext = memoize(function(p2)
		-- upvalues: p1 (ref), roactPaginator (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy)
		return function(p3)
			-- upvalues: p1 (copy), roactPaginator (copy), p2 (ref), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy)
			if p1.props[roactPaginator.loadNext] then
				p1.reportAnalytics(p2)
				
				if fFlagAppChatPerfTrackingModule then
					appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.PaginationConversationList)
				end
				p1.props[roactPaginator.loadNext](p3)
			end
		end
	end)
	p1.isFiltered = p1.props.filterText and p1.props.filterText:match("%S")
	p1.indexOfList = memoize(function(p2, p3)
		-- upvalues: cryoModule (copy)
		local index = table.find(cryoModule.List.map(p2, function(p4)
			return p4.id
		end), p3)
		
		return index or 0
	end)
	
	function p2.formatParticipantIds(p2)
		-- upvalues: cryoModule (copy), httpService (copy)
		local var3 = cryoModule.List.filterMap(p2 or {}, function(p3)
			return if p3.id then tonumber(p3.id) else nil
		end)
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), var3 (ref)
			return httpService:JSONEncode(var3)
		end)
		
		return if ok then status else "[]"
	end
	
	function p2.fireClickEvent(p2, p3, p4)
		-- upvalues: chatLandingTelemetryEventsModule (copy), p1 (ref)
		local id = p2.id
		p3.emit(chatLandingTelemetryEventsModule.ConversationClicked, {
			isFiltered = p1.isFiltered ~= nil,
			conversationListCount = #p1.state.filteredItemList,
			selectedConversationId = id,
			selectedIndex = p1.indexOfList(p1.state.filteredItemList, id),
			hasUnreadMessages = p2.hasUnreadMessages,
			selectedConversationModerationType = if p2 then p2.moderationType else nil,
			selectedConversationUserPendingStatus = if p2 then p2.userPendingStatus else nil,
			participantUserIds = p1.formatParticipantIds(p2.participants),
			osaAcknowledgementStatus = p2.osaAcknowledgementStatus,
			osaImpressionId = p4
		})
		p3.emit(chatLandingTelemetryEventsModule.ConversationClickedIndexStat, {
			statValue = p1.indexOfList(p1.state.filteredItemList, id) or 0
		})
	end
	
	p1.fireConversationImpressionEvent = memoize(function(p2)
		-- upvalues: chatLandingTelemetryEventsModule (copy), p1 (ref)
		return function(p3)
			-- upvalues: p2 (ref), chatLandingTelemetryEventsModule (copy), p1 (copy)
			local id = p3.id
			p2.emit(chatLandingTelemetryEventsModule.ConversationCellRendered, {
				isFiltered = p1.isFiltered ~= nil,
				conversationListCount = #p1.state.filteredItemList,
				selectedConversationId = id,
				selectedIndex = p1.indexOfList(p1.state.filteredItemList, id),
				hasUnreadMessages = p3.hasUnreadMessages,
				selectedConversationModerationType = p3.moderationType,
				selectedConversationUserPendingStatus = p3.userPendingStatus,
				participantUserIds = p1.formatParticipantIds(p3.participants),
				osaAcknowledgementStatus = p3.osaAcknowledgementStatus
			})
			p2.emit(chatLandingTelemetryEventsModule.ConversationCellRenderedIndexStat, {
				statValue = p1.indexOfList(p1.state.filteredItemList, id) or 0
			})
		end
	end)
	
	function p2.onActivated(p2)
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), p1 (ref)
		if fFlagAppChatPerfTrackingModule then
			appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = tostring(p2.id) })
		end
		p1.props.navigateToConversation(p2.id)
	end
end

function conversationListWithTopBar.render(p1)
	-- upvalues: withAnalyticsModule (ref), withTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), partyPageCarouselExperimentation (ref), shouldUseFoundationConversationRow (ref), fFlagAppIaScrollAway (ref), fFlagAppChatUseUltimateListConversationListModule_1 (ref), conversationListModule (ref), var1 (write), var2 (write), roactModule (ref)
	return withAnalyticsModule(function(p2)
		-- upvalues: withTelemetryModule (copy), chatLandingTelemetryLayerModule (copy), p1 (ref), partyPageCarouselExperimentation (copy), shouldUseFoundationConversationRow (copy), fFlagAppIaScrollAway (copy), fFlagAppChatUseUltimateListConversationListModule_1 (copy), conversationListModule (copy), var1 (copy), var2 (copy), roactModule (copy)
		return withTelemetryModule(chatLandingTelemetryLayerModule.Context)(function(p3)
			-- upvalues: p1 (copy), p2 (ref), partyPageCarouselExperimentation (copy), shouldUseFoundationConversationRow (copy), fFlagAppIaScrollAway (copy), fFlagAppChatUseUltimateListConversationListModule_1 (copy), conversationListModule (copy), var1 (copy), var2 (copy), roactModule (copy)
			local t = {
				Size = UDim2.fromScale(1, 1),
				itemList = if p1.props.filterText and p1.props.filterText:match("%S") then p1.state.filteredItemList else p1.props.itemList,
				loadNext = p1.loadNext(p2),
				isDebugEnabled = p1.props.isDebugEnabled,
				isWideMode = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() or shouldUseFoundationConversationRow then p1.props.isWideMode else nil,
				filterText = p1.props.filterText,
				onActivated = p1.onActivated,
				entryHeight = p1.props.entryHeight,
				navigateToSquadLobby = p1.props.navigateToSquadLobby,
				isInExperience = p1.props.isInExperience,
				localUserId = p1.props.localUserId,
				navigateToConversationFromUserId = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then p1.props.navigateToConversationFromUserId else nil,
				navigateToQuickStartSquadInviteFriends = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then p1.props.navigateToQuickStartSquadInviteFriends else nil,
				shouldShowPhoneVerificationUpsell = p1.props.shouldShowPhoneVerificationUpsell,
				shouldShowUnfilteredAccessFtux = p1.props.shouldShowUnfilteredAccessFtux,
				shouldShowPartyUpsellFtux = p1.props.shouldShowPartyUpsellFtux,
				dismissUnfilteredThreadsFtux = p1.props.dismissUnfilteredThreadsFtux,
				showGroupsLink = p1.props.showGroupsLink,
				canvasTopPadding = if fFlagAppIaScrollAway then p1.props.canvasTopPadding else nil,
				fireConversationImpressionEvent = p1.fireConversationImpressionEvent(p3),
				isPartyQuickStartEnabled = p1.props.isPartyQuickStartEnabled,
				fireConversationClickedEvent = p1.fireClickEvent
			}
			
			if shouldUseFoundationConversationRow then
				t.canAccessParty = p1.props.canAccessParty
			end
			if fFlagAppChatUseUltimateListConversationListModule_1 then
				t.isLoadingNext = p1.props.conversationsIsFetching
				t.isLoadingPrevious = p1.props.conversationsIsFetching
				t.oldestConversationIsFetched = p1.props.oldestConversationIsFetched
			end
			local var3 = conversationListModule
			
			if fFlagAppChatUseUltimateListConversationListModule_1 then
				local var4
				if var1 then
					var4 = var2
				else
					var1 = true
					local ok, status = pcall(function()
						return require(script.Parent.ConversationListUltimate)
					end)
					
					if ok then
						var2 = status
					end
					var4 = var2
				end
				if not var4 then
					var4 = conversationListModule
				end
				var3 = var4
			end
			return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, { conversationList = roactModule.createElement(var3, t) })
		end)
	end)
end

function conversationListWithTopBar.didMount(p1)
	p1.isMounted = true
end

function conversationListWithTopBar.didUpdate(p1, p2)
	-- upvalues: fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref)
	if fFlagAppChatPerfTrackingModule and #p2.itemList < #p1.props.itemList then
		appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.PaginationConversationList)
	end
end

function conversationListWithTopBar.willUnmount(p1)
	p1.isMounted = false
end

return conversationListWithTopBar