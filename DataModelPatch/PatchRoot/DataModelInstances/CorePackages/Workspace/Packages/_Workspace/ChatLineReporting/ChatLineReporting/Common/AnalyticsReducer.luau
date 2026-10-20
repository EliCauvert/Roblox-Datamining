local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local _ = require(ChatLineReporting.Common.Types)
local AnalyticsActions = require(ChatLineReporting.Common.Constants).AnalyticsActions

return function(Tbl, p1)
	-- upvalues: AnalyticsActions (copy)
	local Copy = table.clone(Tbl)
	local Type = p1.type
	
	if Type == AnalyticsActions.SetPlaceId then
		Copy.place_id = p1.place_id
		
		return Copy
	end
	if Type == AnalyticsActions.AccumulateForTimeSpent then
		Copy.accumulated_time_ms = p1.accumulated_time_ms
		
		return Copy
	end
	if Type == AnalyticsActions.SetReasonSelection then
		Copy.reason_selection = p1.reason_selection
		
		return Copy
	end
	if Type == AnalyticsActions.SetCommentAdded then
		Copy.comment_added = p1.comment_added
		
		return Copy
	end
	if Type == AnalyticsActions.SetChatLineSelected then
		Copy.chat_line_selected = true
		Copy.selected_chat_line_index = p1.selected_chat_line_index
		
		return Copy
	end
	if Type == AnalyticsActions.SetChatHistoryInformation then
		Copy.selectable_chat_history_size = p1.selectable_chat_history_size
		Copy.total_chat_history_size = p1.total_chat_history_size
		Copy.num_non_general_channel_chats = p1.num_non_general_channel_chats
		
		return Copy
	end
	if Type == AnalyticsActions.SetViewportInformation then
		Copy.viewport_size_x = p1.viewport_size_x
		Copy.viewport_size_y = p1.viewport_size_y
		Copy.is_portrait_mode = p1.is_portrait_mode
	end
	return Copy
end