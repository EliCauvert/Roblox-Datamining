local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local _ = require(chatLineReporting.Common.Types)
local analyticsActions = require(chatLineReporting.Common.Constants).AnalyticsActions

return function(p1, p2)
	-- upvalues: analyticsActions (ref)
	local cloned = table.clone(p1)
	local type = p2.type
	
	if type == analyticsActions.SetPlaceId then
		cloned.place_id = p2.place_id
		
		return cloned
	elseif type == analyticsActions.AccumulateForTimeSpent then
		cloned.accumulated_time_ms = p2.accumulated_time_ms
		
		return cloned
	elseif type == analyticsActions.SetReasonSelection then
		cloned.reason_selection = p2.reason_selection
		
		return cloned
	elseif type == analyticsActions.SetCommentAdded then
		cloned.comment_added = p2.comment_added
		
		return cloned
	elseif type == analyticsActions.SetChatLineSelected then
		cloned.chat_line_selected = true
		cloned.selected_chat_line_index = p2.selected_chat_line_index
		
		return cloned
	elseif type == analyticsActions.SetChatHistoryInformation then
		cloned.selectable_chat_history_size = p2.selectable_chat_history_size
		cloned.total_chat_history_size = p2.total_chat_history_size
		cloned.num_non_general_channel_chats = p2.num_non_general_channel_chats
		
		return cloned
	elseif type == analyticsActions.SetViewportInformation then
		cloned.viewport_size_x = p2.viewport_size_x
		cloned.viewport_size_y = p2.viewport_size_y
		cloned.is_portrait_mode = p2.is_portrait_mode
	end
	return cloned
end