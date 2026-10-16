local AppChat = script:FindFirstAncestor("AppChat")
local AppChatNetworkingModule = require(AppChat.Parent.AppChatNetworking)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagAppChatMessageTTIMilestonesModule = require(AppChat.Flags.FFlagAppChatMessageTTIMilestones)
local FFlagAppChatIncrementalPaginationProjectionModule = require(AppChat.Flags.FFlagAppChatIncrementalPaginationProjection)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local GetConversationMessageViewModelStoreModule = require(AppChat.Stores.GetConversationMessageViewModelStore)

return function(ConversationId, _, p1) --[[ Line: 11 ]]
	-- upvalues: FFlagAppChatPerfTrackingModule (copy), FFlagAppChatMessageTTIMilestonesModule (copy), AppChatPerfTrackerModule (copy), FFlagAppChatIncrementalPaginationProjectionModule (copy), GetConversationMessageViewModelStoreModule (copy), AppChatNetworkingModule (copy)
	return function(p2) --[[ Line: 12 ]]
		-- upvalues: FFlagAppChatPerfTrackingModule (upval), FFlagAppChatMessageTTIMilestonesModule (upval), p1 (copy), ConversationId (copy), AppChatPerfTrackerModule (upval), FFlagAppChatIncrementalPaginationProjectionModule (upval), GetConversationMessageViewModelStoreModule (upval), AppChatNetworkingModule (upval)
		local v1: boolean = FFlagAppChatPerfTrackingModule and (FFlagAppChatMessageTTIMilestonesModule and p1 == nil)
		
		if v1 then
			local config = { conversationId = ConversationId }
			AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, config)
			AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Subphase.NetworkFetch, config)
			AppChatPerfTrackerModule.trackRequest(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataStarted.Name, "GetOlderMessages", config)
		end
		if FFlagAppChatIncrementalPaginationProjectionModule then
			GetConversationMessageViewModelStoreModule(false).conversationMessageListStore.setLoading(ConversationId, true)
		end
		local DispatchResult = p2:dispatch(AppChatNetworkingModule.rodux.GetOlderMessages.API(ConversationId, p1))
		
		if v1 then
			DispatchResult = DispatchResult:tap(function() --[[ Line: 44 ]]
				-- upvalues: ConversationId (upval), AppChatPerfTrackerModule (upval)
				local config = { conversationId = ConversationId }
				AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, config)
				AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Subphase.ResponseReceived, config)
			end)
		end
		if FFlagAppChatIncrementalPaginationProjectionModule then
			DispatchResult = DispatchResult:finally(function() --[[ Line: 61 ]]
				-- upvalues: GetConversationMessageViewModelStoreModule (upval), ConversationId (upval)
				GetConversationMessageViewModelStoreModule(false).conversationMessageListStore.setLoading(ConversationId, false)
			end)
		end
		return DispatchResult:catch(function(Err) --[[ Line: 66 ]]
			warn("AppChatNetworking failure in getOlderMessages, Status: " .. tostring(Err))
		end)
	end
end