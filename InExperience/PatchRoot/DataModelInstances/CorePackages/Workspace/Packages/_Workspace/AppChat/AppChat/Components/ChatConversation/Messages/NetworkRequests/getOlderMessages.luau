local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local FFlagAppChatEnableReactions = require(Parent.SharedFlags).FFlagAppChatEnableReactions
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagAppChatMessageTTIMilestonesModule = require(AppChat.Flags.FFlagAppChatMessageTTIMilestones)
local FFlagAppChatIncrementalPaginationProjectionModule = require(AppChat.Flags.FFlagAppChatIncrementalPaginationProjection)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local GetConversationMessageViewModelStoreModule = require(AppChat.Stores.GetConversationMessageViewModelStore)
local GetMessageReactionsStoreModule = require(AppChat.Stores.GetMessageReactionsStore)

return function(ConversationId, _, p1)
	-- upvalues: FFlagAppChatPerfTrackingModule (copy), FFlagAppChatMessageTTIMilestonesModule (copy), AppChatPerfTrackerModule (copy), FFlagAppChatIncrementalPaginationProjectionModule (copy), GetConversationMessageViewModelStoreModule (copy), AppChatNetworkingModule (copy), FFlagAppChatEnableReactions (copy), GetMessageReactionsStoreModule (copy)
	return function(p2)
		-- upvalues: FFlagAppChatPerfTrackingModule (upval), FFlagAppChatMessageTTIMilestonesModule (upval), p1 (copy), ConversationId (copy), AppChatPerfTrackerModule (upval), FFlagAppChatIncrementalPaginationProjectionModule (upval), GetConversationMessageViewModelStoreModule (upval), AppChatNetworkingModule (upval), FFlagAppChatEnableReactions (upval), GetMessageReactionsStoreModule (upval)
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
			DispatchResult = DispatchResult:tap(function()
				-- upvalues: ConversationId (upval), AppChatPerfTrackerModule (upval)
				local config = { conversationId = ConversationId }
				AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, config)
				AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Subphase.ResponseReceived, config)
			end)
		end
		if FFlagAppChatEnableReactions then
			DispatchResult = DispatchResult:andThen(function(Result)
				-- upvalues: GetMessageReactionsStoreModule (upval)
				if Result.responseBody then
					GetMessageReactionsStoreModule(false).ingestMessageReactions(Result.responseBody.messages)
				end
				return Result
			end)
		end
		if FFlagAppChatIncrementalPaginationProjectionModule then
			DispatchResult = DispatchResult:finally(function()
				-- upvalues: GetConversationMessageViewModelStoreModule (upval), ConversationId (upval)
				GetConversationMessageViewModelStoreModule(false).conversationMessageListStore.setLoading(ConversationId, false)
			end)
		end
		return DispatchResult:catch(function(Err)
			warn("AppChatNetworking failure in getOlderMessages, Status: " .. tostring(Err))
		end)
	end
end