local HttpService = game:GetService("HttpService")
local TypesModule = require(script.Parent.types)
local SubagentTaskStatus = TypesModule.SubagentTaskStatus
local SubagentTaskCategory = TypesModule.SubagentTaskCategory
local config = {
	pending = SubagentTaskStatus.Pending,
	in_progress = SubagentTaskStatus.InProgress,
	done = SubagentTaskStatus.Done,
	error = SubagentTaskStatus.Error,
	deleted = SubagentTaskStatus.Deleted
}
local config1 = {
	gameplay = SubagentTaskCategory.Gameplay,
	art = SubagentTaskCategory.Art,
	audio = SubagentTaskCategory.Audio,
	marketing = SubagentTaskCategory.Marketing
}
local config2 = {
	[SubagentTaskStatus.InProgress] = 1,
	[SubagentTaskStatus.Done] = 2,
	[SubagentTaskStatus.Pending] = 3,
	[SubagentTaskStatus.Error] = 4,
	[SubagentTaskStatus.Deleted] = 5
}

local function _(Text: string) --[[ Line: 46 | Named "toTaskStatus" ]]
	-- upvalues: SubagentTaskStatus (copy), config (copy)
	return if typeof(Text) == "string" then config[string.lower(Text)] or Text else SubagentTaskStatus.Pending
end

local _ = function(Text: string) --[[ Line: 53 | Named "toTaskCategory" ]]
	-- upvalues: config1 (copy)
	return if typeof(Text) == "string" then config1[string.lower(Text)] or Text else nil
end

local _ = function(Text: string): boolean --[[ Line: 60 | Named "valueLooksLikeToolName" ]]
	return typeof(Text) == "string" and string.lower(Text) == "manage_tasks"
end

local _ = function(p1): boolean --[[ Line: 64 | Named "toolCallLooksLikeManageTasks" ]]
	local Kind: string = p1.kind
	
	if typeof(Kind) ~= "string" or string.lower(Kind) ~= "manage_tasks" then
		local Title: string = p1.title
		
		if typeof(Title) ~= "string" or string.lower(Title) ~= "manage_tasks" then
			local RawInput = p1.rawInput
			
			if typeof(RawInput) ~= "table" then
				return false
			end
			local Name: string = RawInput.name
			local IsManageTasks: boolean = typeof(Name) == "string" and string.lower(Name) == "manage_tasks"
			
			if not IsManageTasks then
				local ToolName: string = RawInput.toolName
				IsManageTasks = typeof(ToolName) == "string" and string.lower(ToolName) == "manage_tasks"
			end
			return IsManageTasks
		end
	end
	return true
end

local function toTaskMetadata(Metadata) --[[ Line: 77 ]]
	-- upvalues: HttpService (copy)
	if Metadata == nil then
		return nil
	end
	if typeof(Metadata) == "table" then
		return Metadata
	end
	if typeof(Metadata) == "string" then
		local Success, Result = pcall(function() --[[ Line: 84 ]]
			-- upvalues: HttpService (upval), Metadata (copy)
			return HttpService:JSONDecode(Metadata)
		end)
		
		if Success and typeof(Result) == "table" then
			return Result
		end
	end
	return nil
end

local function toTaskItem(TaskItem) --[[ Line: 94 ]]
	-- upvalues: config1 (copy), SubagentTaskStatus (copy), config (copy), toTaskMetadata (copy)
	if typeof(TaskItem) ~= "table" or typeof(TaskItem.text) ~= "string" or TaskItem.text == "" then
		return nil
	end
	local Category: string = TaskItem.category
	local Entry = if typeof(Category) == "string" then config1[string.lower(Category)] or Category else nil
	
	if Entry == nil then
		return nil
	else
		local Status: string = TaskItem.status
		
		return {
			text = TaskItem.text,
			description = TaskItem.description,
			status = if typeof(Status) == "string" then config[string.lower(Status)] or Status else SubagentTaskStatus.Pending,
			category = Entry,
			metadata = toTaskMetadata(TaskItem.metadata),
			created_timestamp = if typeof(TaskItem.created_timestamp) == "string" then TaskItem.created_timestamp else nil
		}
	end
end

local _ = function(p1) --[[ Line: 122 | Named "getTaskStatusPriority" ]]
	-- upvalues: config2 (copy)
	return if p1 == nil then 6 else config2[p1] or 6
end

local _ = function(Tbl) --[[ Line: 129 | Named "sortTasksByStatus" ]]
	-- upvalues: config2 (copy)
	local Copy = table.clone(Tbl)
	table.sort(Copy, function(A, B): boolean --[[ Line: 131 ]]
		-- upvalues: config2 (upval)
		local Status = A.status
		local Status1 = B.status
		
		return (if Status == nil then 6 else config2[Status] or 6) < (if Status1 == nil then 6 else config2[Status1] or 6)
	end)
	
	return Copy
end

local function appendTasksFromPayload(Input, List) --[[ Line: 137 ]]
	-- upvalues: toTaskItem (copy)
	local Tasks = if typeof(Input) == "table" then Input.tasks else nil
	
	if typeof(Tasks) ~= "table" then return end
	for _, _task in Tasks do
		local TaskItem = toTaskItem(_task)
		
		if TaskItem ~= nil then
			table.insert(List, TaskItem)
		end
	end
end

local function appendTasksFromMaybeJson(RawInput, p1) --[[ Line: 151 ]]
	-- upvalues: appendTasksFromPayload (copy), HttpService (copy)
	if typeof(RawInput) == "table" then
		appendTasksFromPayload(RawInput, p1)
		
		return
	end
	if typeof(RawInput) == "string" then
		local Success, Result = pcall(function() --[[ Line: 155 ]]
			-- upvalues: HttpService (upval), RawInput (copy)
			return HttpService:JSONDecode(RawInput)
		end)
		
		if not Success then return end
		local Text = if typeof(Result) == "table" then Result.text else nil
		
		if typeof(Text) == "string" then
			local Success1, Result1 = pcall(function() --[[ Line: 164 ]]
				-- upvalues: HttpService (upval), Text (copy)
				return HttpService:JSONDecode(Text)
			end)
			
			if Success1 then
				appendTasksFromPayload(Result1, p1)
			end
		end
		appendTasksFromPayload(Result, p1)
	end
end

local function orderedManageTasksToolCalls(p1) --[[ Line: 185 ]]
	local List = {}
	local t = {}
	
	for _, activityItem in p1.activityItems do
		if activityItem.kind == "tool_call" then
			local ToolCall = p1.toolCalls[activityItem.toolCallId]
			
			if ToolCall ~= nil then
				local Kind: string = ToolCall.kind
				local IsManageTasks: boolean = typeof(Kind) == "string" and string.lower(Kind) == "manage_tasks"
				
				if not IsManageTasks then
					local Title: string = ToolCall.title
					IsManageTasks = typeof(Title) == "string" and string.lower(Title) == "manage_tasks"
				end
				local IsManageTasks1 = nil
				if IsManageTasks then
					IsManageTasks1 = true
				else
					local RawInput = ToolCall.rawInput
					
					if typeof(RawInput) == "table" then
						local Name: string = RawInput.name
						IsManageTasks1 = typeof(Name) == "string" and string.lower(Name) == "manage_tasks"
						
						if not IsManageTasks1 then
							local ToolName: string = RawInput.toolName
							IsManageTasks1 = typeof(ToolName) == "string" and string.lower(ToolName) == "manage_tasks"
						end
					else
						IsManageTasks1 = false
					end
				end
				if IsManageTasks1 then
					table.insert(List, ToolCall)
					t[ToolCall.toolCallId] = true
				end
			end
		end
	end
	local List1 = {}
	
	for i, toolCall in p1.toolCalls do
		if not t[i] then
			local Kind: string = toolCall.kind
			local IsManageTasks2: boolean = typeof(Kind) == "string" and string.lower(Kind) == "manage_tasks"
			
			if not IsManageTasks2 then
				local Title: string = toolCall.title
				IsManageTasks2 = typeof(Title) == "string" and string.lower(Title) == "manage_tasks"
			end
			local IsManageTasks3 = nil
			if IsManageTasks2 then
				IsManageTasks3 = true
			else
				local RawInput = toolCall.rawInput
				
				if typeof(RawInput) == "table" then
					local Name: string = RawInput.name
					IsManageTasks3 = typeof(Name) == "string" and string.lower(Name) == "manage_tasks"
					
					if not IsManageTasks3 then
						local ToolName: string = RawInput.toolName
						IsManageTasks3 = typeof(ToolName) == "string" and string.lower(ToolName) == "manage_tasks"
					end
				else
					IsManageTasks3 = false
				end
			end
			if IsManageTasks3 then
				table.insert(List1, i)
			end
		end
	end
	table.sort(List1)
	
	for _, value in List1 do
		table.insert(List, p1.toolCalls[value])
	end
	return List
end

local _ = function(TaskItem): string --[[ Line: 213 | Named "taskKey" ]]
	return `{TaskItem.category}:{TaskItem.text}`
end

local function applyTasks(List1, List, p2) --[[ Line: 217 ]]
	for _, TaskItem in List1 do
		local Text: string = `{TaskItem.category}:{TaskItem.text}`
		
		if p2[Text] == nil then
			table.insert(List, TaskItem)
		end
		p2[Text] = TaskItem
	end
end

local function groupTasks(List) --[[ Line: 227 ]]
	-- upvalues: SubagentTaskStatus (copy), config2 (copy)
	local List1 = {}
	local t = {}
	
	for _, TaskItem in List do
		local Entry = t[TaskItem.category]
		
		if Entry == nil then
			Entry = {
				isComplete = true,
				isLoading = false,
				name = TaskItem.category,
				tasks = {}
			}
			t[TaskItem.category] = Entry
			table.insert(List1, Entry)
		end
		table.insert(Entry.tasks, TaskItem)
		
		if TaskItem.status ~= SubagentTaskStatus.Done then
			Entry.isComplete = false
		end
	end
	for _, value in List1 do
		local Copy = table.clone(value.tasks)
		table.sort(Copy, function(A, B): boolean --[[ Line: 131 ]]
			-- upvalues: config2 (upval)
			local Status = A.status
			local Status1 = B.status
			
			return (if Status == nil then 6 else config2[Status] or 6) < (if Status1 == nil then 6 else config2[Status1] or 6)
		end)
		value.tasks = Copy
		value.isLoading = false
		
		for _, _task in value.tasks do
			if _task.status == SubagentTaskStatus.InProgress then
				value.isLoading = true
				break
			end
		end
	end
	return List1
end

local function toTaskState(List, p3) --[[ Line: 264 ]]
	-- upvalues: groupTasks (copy)
	if #List == 0 then
		return nil
	end
	local List1 = {}
	
	for _, TaskItem in List do
		table.insert(List1, p3[`{TaskItem.category}:{TaskItem.text}`])
	end
	local GroupTasksResult = groupTasks(List1)
	local AllComplete = #GroupTasksResult > 0
	for _, value in GroupTasksResult do
		if not value.isComplete then
			AllComplete = false
			break
		end
	end
	return { groups = GroupTasksResult, allComplete = AllComplete }
end

return {
	TOOL_NAME = "manage_tasks",
	extractTasksFromToolCall = function(p4) --[[ Line: 175 ]]
		-- upvalues: appendTasksFromMaybeJson (copy)
		local Kind: string = p4.kind
		local IsManageTasks = nil
		repeat
			if typeof(Kind) ~= "string" or string.lower(Kind) ~= "manage_tasks" then
				local Title: string = p4.title
				
				if typeof(Title) ~= "string" or string.lower(Title) ~= "manage_tasks" then
					local RawInput = p4.rawInput
					
					if typeof(RawInput) == "table" then
						local Name: string = RawInput.name
						IsManageTasks = typeof(Name) == "string" and string.lower(Name) == "manage_tasks"
						
						if IsManageTasks then break end
						local ToolName: string = RawInput.toolName
						IsManageTasks = typeof(ToolName) == "string" and string.lower(ToolName) == "manage_tasks"
						break
					end
					IsManageTasks = false
				end
			end
			IsManageTasks = true
			break
		until true
		if IsManageTasks then
			local t = {}
			appendTasksFromMaybeJson(p4.rawInput, t)
			
			return if #t > 0 then t else nil
		else
			return nil
		end
	end,
	fromTasks = function(List) --[[ Line: 289 ]]
		-- upvalues: toTaskItem (copy), applyTasks (copy), toTaskState (copy)
		if typeof(List) ~= "table" then
			return nil
		end
		local t = {}
		local t1 = {}
		local List1 = {}
		
		for _, value in List do
			local TaskItem = toTaskItem(value)
			
			if TaskItem ~= nil then
				table.insert(List1, TaskItem)
			end
		end
		applyTasks(List1, t, t1)
		
		return (toTaskState(t, t1))
	end,
	fromTurnState = function(p4) --[[ Line: 307 ]]
		-- upvalues: orderedManageTasksToolCalls (copy), appendTasksFromMaybeJson (copy), applyTasks (copy), toTaskState (copy)
		local t = {}
		local t2 = {}
		
		for _, value in orderedManageTasksToolCalls(p4) do
			local Kind: string = value.kind
			local IsManageTasks: boolean = typeof(Kind) == "string" and string.lower(Kind) == "manage_tasks"
			
			if not IsManageTasks then
				local Title: string = value.title
				IsManageTasks = typeof(Title) == "string" and string.lower(Title) == "manage_tasks"
			end
			local IsManageTasks1 = nil
			if IsManageTasks then
				IsManageTasks1 = true
			else
				local RawInput = value.rawInput
				
				if typeof(RawInput) == "table" then
					local Name: string = RawInput.name
					IsManageTasks1 = typeof(Name) == "string" and string.lower(Name) == "manage_tasks"
					
					if not IsManageTasks1 then
						local ToolName: string = RawInput.toolName
						IsManageTasks1 = typeof(ToolName) == "string" and string.lower(ToolName) == "manage_tasks"
					end
				else
					IsManageTasks1 = false
				end
			end
			local v1 = nil
			if IsManageTasks1 then
				local t3 = {}
				appendTasksFromMaybeJson(value.rawInput, t3)
				v1 = if #t3 > 0 then t3 else nil
			else
				v1 = nil
			end
			if v1 ~= nil then
				applyTasks(v1, t, t2)
			end
		end
		return (toTaskState(t, t2))
	end,
	isTaskComplete = function(p5): boolean --[[ Line: 114 ]]
		-- upvalues: SubagentTaskStatus (copy)
		return p5.status == SubagentTaskStatus.Done
	end,
	isTaskLoading = function(p5): boolean --[[ Line: 118 ]]
		-- upvalues: SubagentTaskStatus (copy)
		return p5.status == SubagentTaskStatus.InProgress
	end
}