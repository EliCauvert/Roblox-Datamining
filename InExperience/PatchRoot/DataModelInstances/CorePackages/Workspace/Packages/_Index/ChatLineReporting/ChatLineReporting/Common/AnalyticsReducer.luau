local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local _ = require(chatLineReporting.Common.Types)
local analyticsActions = require(chatLineReporting.Common.Constants).AnalyticsActions

return function(p0, p1)
	-- upvalues: analyticsActions (ref)
	local cloned = table.clone(p0)
	local type = p1.type
	
	if type == analyticsActions.SetPlaceId then
		cloned.place_id = p1.place_id
		
		return cloned
	elseif type == analyticsActions.AccumulateForTimeSpent then
		cloned.accumulated_time_ms = p1.accumulated_time_ms
		
		return cloned
	elseif type == analyticsActions.SetReasonSelection then
		cloned.reason_selection = p1.reason_selection
		
		return cloned
	elseif type == analyticsActions.SetCommentAdded then
		cloned.comment_added = p1.comment_added
		
		return cloned
	elseif type == analyticsActions.SetChatLineSelected then
		cloned.chat_line_selected = true
		cloned.selected_chat_line_index = p1.selected_chat_line_index
		
		return cloned
	elseif type == analyticsActions.SetChatHistoryInformation then
		cloned.selectable_chat_history_size = p1.selectable_chat_history_size
		cloned.total_chat_history_size = p1.total_chat_history_size
		cloned.num_non_general_channel_chats = p1.num_non_general_channel_chats
		
		return cloned
	elseif type == analyticsActions.SetViewportInformation then
		cloned.viewport_size_x = p1.viewport_size_x
		cloned.viewport_size_y = p1.viewport_size_y
		cloned.is_portrait_mode = p1.is_portrait_mode
	end
	return cloned
end