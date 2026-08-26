local httpService = game:GetService("HttpService")
local typesModule = require(script.Parent.types)
local subagentTaskStatus = typesModule.SubagentTaskStatus
local subagentTaskCategory = typesModule.SubagentTaskCategory
local t = {
	pending = subagentTaskStatus.Pending,
	in_progress = subagentTaskStatus.InProgress,
	done = subagentTaskStatus.Done,
	error = subagentTaskStatus.Error,
	deleted = subagentTaskStatus.Deleted
}
local t_1 = {
	gameplay = subagentTaskCategory.Gameplay,
	art = subagentTaskCategory.Art,
	audio = subagentTaskCategory.Audio,
	marketing = subagentTaskCategory.Marketing
}
local t_2 = {
	[subagentTaskStatus.InProgress] = 1,
	[subagentTaskStatus.Done] = 2,
	[subagentTaskStatus.Pending] = 3,
	[subagentTaskStatus.Error] = 4,
	[subagentTaskStatus.Deleted] = 5
}

local function _(p1)
	-- upvalues: subagentTaskStatus (ref), t (ref)
	return if typeof(p1) == "string" then t[string.lower(p1)] or p1 else subagentTaskStatus.Pending
end

local _ = function(p1)
	-- upvalues: t_1 (ref)
	return if typeof(p1) == "string" then t_1[string.lower(p1)] or p1 else nil
end

local _ = function(p1)
	return typeof(p1) == "string" and string.lower(p1) == "manage_tasks"
end

local _ = function(p1)
	local kind = p1.kind
	
	if not (typeof(kind) == "string" and string.lower(kind) == "manage_tasks") then
		kind = p1.title
		
		if typeof(kind) == "string" and string.lower(kind) == "manage_tasks" then
			return true
		end
		local rawInput = p1.rawInput
		
		if typeof(rawInput) ~= "table" then
			return false
		end
		local name = rawInput.name
		kind = typeof(name) == "string" and string.lower(name) == "manage_tasks"
		
		if not kind then
			local toolName = rawInput.toolName
			kind = typeof(toolName) == "string" and string.lower(toolName) == "manage_tasks"
		end
		return kind
	end
end

local function toTaskMetadata(p1)
	-- upvalues: httpService (ref)
	if p1 == nil then
		return nil
	elseif typeof(p1) == "table" then
		return p1
	elseif typeof(p1) == "string" then
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p1 (ref)
			return httpService:JSONDecode(p1)
		end)
		
		return if ok and typeof(status) == "table" then status else nil
	end
end

local function toTaskItem(p1)
	-- upvalues: t_1 (ref), subagentTaskStatus (ref), t (ref), toTaskMetadata (ref)
	if typeof(p1) ~= "table" or typeof(p1.text) ~= "string" or p1.text == "" then
		return nil
	end
	local category = p1.category
	local var1 = if typeof(category) ~= "string" then t_1[string.lower(category)] or category else nil
	
	if var1 == nil then
		return nil
	end
	local t_2 = { text = p1.text, description = p1.description }
	local status = p1.status
	t_2.status = if typeof(status) ~= "string" then t[string.lower(status)] or status else subagentTaskStatus.Pending
	t_2.category = var1
	t_2.metadata = toTaskMetadata(p1.metadata)
	t_2.created_timestamp = if typeof(p1.created_timestamp) == "string" then p1.created_timestamp else nil
	
	return t_2
end

local function isTaskComplete(p1)
	-- upvalues: subagentTaskStatus (ref)
	return p1.status == subagentTaskStatus.Done
end

local function isTaskLoading(p1)
	-- upvalues: subagentTaskStatus (ref)
	return p1.status == subagentTaskStatus.InProgress
end

local _ = function(p1)
	-- upvalues: t_2 (ref)
	return if p1 == nil then 6 else t_2[p1] or 6
end

local _ = function(p1)
	-- upvalues: t_2 (ref)
	local cloned = table.clone(p1)
	table.sort(cloned, function(p2, p3)
		-- upvalues: t_2 (copy)
		local status = p2.status
		local status_1 = p3.status
		
		return (if status == nil then 6 else t_2[status] or 6) < (if status_1 == nil then 6 else t_2[status_1] or 6)
	end)
	
	return cloned
end

local function appendTasksFromPayload(p1, p2)
	-- upvalues: toTaskItem (ref)
	local var1 = if typeof(p1) == "table" then p1.tasks else nil
	
	if typeof(var1) ~= "table" then return end
	for i, v in var1 do
		local var2 = toTaskItem(v)
		
		if var2 ~= nil then
			table.insert(p2, var2)
		end
	end
end

local function appendTasksFromMaybeJson(p3, p4)
	-- upvalues: appendTasksFromPayload (ref), httpService (ref)
	if typeof(p3) == "table" then
		appendTasksFromPayload(p3, p4)
		
		return
	elseif typeof(p3) == "string" then
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p3 (ref)
			return httpService:JSONDecode(p3)
		end)
		
		if not ok then return end
		local var3 = if typeof(status) == "table" then status.text else nil
		
		if typeof(var3) == "string" then
			local ok_1, status_1 = pcall(function()
				-- upvalues: httpService (copy), var3 (ref)
				return httpService:JSONDecode(var3)
			end)
			
			if ok_1 then
				appendTasksFromPayload(status_1, p4)
			end
		end
		appendTasksFromPayload(status, p4)
	end
end

local function extractTasksFromToolCall(p3)
	-- upvalues: appendTasksFromMaybeJson (ref)
	local var3
	local kind = p3.kind
	
	if not (typeof(kind) == "string" and string.lower(kind) == "manage_tasks") then
		kind = p3.title
		
		if typeof(kind) == "string" and string.lower(kind) == "manage_tasks" then
			var3 = true
		else
			local rawInput = p3.rawInput
			
			if typeof(rawInput) == "table" then
				kind = rawInput.name
				var3 = typeof(kind) == "string" and string.lower(kind) == "manage_tasks"
				
				if not var3 then
					kind = rawInput.toolName
					var3 = false
					
					if typeof(kind) == "string" then
						var3 = string.lower(kind) == "manage_tasks"
						var3 = nil
					end
				end
			else
				var3 = false
			end
		end
		if not var3 then
			return nil
		end
		local t = {}
		appendTasksFromMaybeJson(p3.rawInput, t)
		
		return if #t > 0 then t else nil
	end
end

local function orderedManageTasksToolCalls(p3)
	local kind
	local t = {}
	local t_1 = {}
	
	for i, v in p3.activityItems do
		if v.kind == "tool_call" then
			local toolCallId = p3.toolCalls[v.toolCallId]
			
			if toolCallId ~= nil then
				local var3
				kind = toolCallId.kind
				
				if not (typeof(kind) == "string" and string.lower(kind) == "manage_tasks") then
					kind = toolCallId.title
					
					if typeof(kind) == "string" and string.lower(kind) == "manage_tasks" then
						var3 = true
					else
						local rawInput = toolCallId.rawInput
						
						if typeof(rawInput) == "table" then
							kind = rawInput.name
							var3 = typeof(kind) == "string" and string.lower(kind) == "manage_tasks"
							
							if not var3 then
								kind = rawInput.toolName
								var3 = false
								
								if typeof(kind) == "string" then
									var3 = string.lower(kind) == "manage_tasks"
									var3 = nil
								end
							end
						else
							var3 = false
						end
					end
					if var3 then
						table.insert(t, toolCallId)
						t_1[toolCallId.toolCallId] = true
					end
				end
			end
		end
	end
	local t_2 = {}
	
	for i_1, v_1 in p3.toolCalls do
		if not t_1[i_1] then
			local var4
			kind = v_1.kind
			
			if not (typeof(kind) == "string" and string.lower(kind) == "manage_tasks") then
				kind = v_1.title
				
				if typeof(kind) == "string" and string.lower(kind) == "manage_tasks" then
					var4 = true
				else
					local rawInput = v_1.rawInput
					
					if typeof(rawInput) == "table" then
						kind = rawInput.name
						var4 = typeof(kind) == "string" and string.lower(kind) == "manage_tasks"
						
						if not var4 then
							kind = rawInput.toolName
							var4 = false
							
							if typeof(kind) == "string" then
								var4 = string.lower(kind) == "manage_tasks"
								var4 = nil
							end
						end
					else
						var4 = false
					end
				end
				if var4 then
					table.insert(t_2, i_1)
				end
			end
		end
	end
	table.sort(t_2)
	
	for i_1, v_2 in t_2 do
		table.insert(t, p3.toolCalls[v_2])
	end
	return t
end

local _ = function(p4)
	return `{p4.category}:{p4.text}`
end

local function applyTasks(p4, p5, p6)
	for i, v in p4 do
		local category = `{v.category}:{v.text}`
		
		if p6[category] == nil then
			table.insert(p5, v)
		end
		p6[category] = v
	end
end

local function groupTasks(p7)
	-- upvalues: subagentTaskStatus (ref), t_2 (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p7 do
		local category = t_1[v.category]
		
		if category == nil then
			category = {
				isComplete = true,
				isLoading = false,
				name = v.category,
				tasks = {}
			}
			t_1[v.category] = category
			table.insert(t, category)
		end
		table.insert(category.tasks, v)
		
		if v.status ~= subagentTaskStatus.Done then
			category.isComplete = false
		end
	end
	for i, v_1 in t do
		local cloned = table.clone(v_1.tasks)
		table.sort(cloned, function(p8, p9)
			-- upvalues: t_2 (copy)
			local status = p8.status
			local status_1 = p9.status
			
			return (if status == nil then 6 else t_2[status] or 6) < (if status_1 == nil then 6 else t_2[status_1] or 6)
		end)
		v_1.tasks = cloned
		v_1.isLoading = false
		
		for i_2, v_2 in v_1.tasks do
			if v_2.status == subagentTaskStatus.InProgress then
				v_1.isLoading = true
				continue
			end
		end
	end
	return t
end

local function toTaskState(p8, p9)
	-- upvalues: groupTasks (ref)
	if #p8 == 0 then
		return nil
	end
	local t = {}
	
	for i, v in p8 do
		table.insert(t, p9[`{v.category}:{v.text}`])
	end
	local var5 = groupTasks(t)
	local var6 = #var5 > 0
	
	for i_1, v_1 in var5 do
		if not v_1.isComplete then
			var6 = false
			break
		end
	end
	return { groups = var5, allComplete = var6 }
end

return {
	TOOL_NAME = "manage_tasks",
	extractTasksFromToolCall = extractTasksFromToolCall,
	fromTasks = function(p10)
		-- upvalues: toTaskItem (ref), applyTasks (ref), toTaskState (ref)
		if typeof(p10) ~= "table" then
			return nil
		end
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		for i, v in p10 do
			local var7 = toTaskItem(v)
			
			if var7 ~= nil then
				table.insert(t_2, var7)
			end
		end
		applyTasks(t_2, t, t_1)
		
		return toTaskState(t, t_1)
	end,
	fromTurnState = function(p11)
		-- upvalues: orderedManageTasksToolCalls (ref), appendTasksFromMaybeJson (ref), applyTasks (ref), toTaskState (ref)
		local t = {}
		local t_1 = {}
		
		for i, v in orderedManageTasksToolCalls(p11) do
			local var8
			local kind = v.kind
			
			if not (typeof(kind) == "string" and string.lower(kind) == "manage_tasks") then
				kind = v.title
				
				if typeof(kind) == "string" and string.lower(kind) == "manage_tasks" then
					var8 = true
				else
					local rawInput = v.rawInput
					
					if typeof(rawInput) == "table" then
						kind = rawInput.name
						var8 = typeof(kind) == "string" and string.lower(kind) == "manage_tasks"
						
						if not var8 then
							local var9
							kind = rawInput.toolName
							var8 = false
							
							if typeof(kind) == "string" then
								var8 = string.lower(kind) == "manage_tasks"
								var8 = nil
							end
						end
					else
						var8 = false
					end
				end
				if var8 then
					var8 = {}
					appendTasksFromMaybeJson(v.rawInput, var8)
					var9 = if #var8 > 0 then var8 else nil
				else
					var9 = nil
				end
				if var9 ~= nil then
					applyTasks(var9, t, t_1)
				end
			end
		end
		return toTaskState(t, t_1)
	end,
	isTaskComplete = isTaskComplete,
	isTaskLoading = isTaskLoading
}