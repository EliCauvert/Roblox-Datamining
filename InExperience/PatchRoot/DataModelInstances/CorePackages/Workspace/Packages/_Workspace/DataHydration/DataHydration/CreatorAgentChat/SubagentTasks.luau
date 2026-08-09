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

local function _(p0) --[[ line: 39 | named "toTaskStatus" ]]
	-- upvalues: subagentTaskStatus (ref), t (ref)
	return if typeof(p0) == "string" then t[string.lower(p0)] or p0 else subagentTaskStatus.Pending
end

local _ = function(p1) --[[ line: 46 | named "toTaskCategory" ]]
	-- upvalues: t_1 (ref)
	return if typeof(p1) == "string" then t_1[string.lower(p1)] or p1 else nil
end

local _ = function(p2) --[[ line: 53 | named "valueLooksLikeToolName" ]]
	return typeof(p2) == "string" and string.lower(p2) == "manage_tasks"
end

local _ = function(p3) --[[ line: 57 | named "toolCallLooksLikeManageTasks" ]]
	local kind = p3.kind
	
	if not (typeof(kind) == "string" and string.lower(kind) == "manage_tasks") then
		kind = p3.title
		
		if typeof(kind) == "string" and string.lower(kind) == "manage_tasks" then
			return true
		end
		local rawInput = p3.rawInput
		
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

local function toTaskMetadata(p4) --[[ line: 70 ]]
	-- upvalues: httpService (ref)
	if p4 == nil then
		return nil
	elseif typeof(p4) == "table" then
		return p4
	elseif typeof(p4) == "string" then
		local ok, status = pcall(function() --[[ line: 77 ]]
			-- upvalues: httpService (copy), p4 (ref)
			return httpService:JSONDecode(p4)
		end)
		
		return if ok and typeof(status) == "table" then status else nil
	end
end

local function toTaskItem(p5) --[[ line: 87 ]]
	-- upvalues: t_1 (ref), subagentTaskStatus (ref), t (ref), toTaskMetadata (ref)
	if typeof(p5) ~= "table" or typeof(p5.text) ~= "string" or p5.text == "" then
		return nil
	end
	local category = p5.category
	local var15 = if typeof(category) ~= "string" then t_1[string.lower(category)] or category else nil
	
	if var15 == nil then
		return nil
	end
	local t_2 = { text = p5.text, description = p5.description }
	local status = p5.status
	t_2.status = if typeof(status) ~= "string" then t[string.lower(status)] or status else subagentTaskStatus.Pending
	t_2.category = var15
	t_2.metadata = toTaskMetadata(p5.metadata)
	t_2.created_timestamp = if typeof(p5.created_timestamp) == "string" then p5.created_timestamp else nil
	
	return t_2
end

local function isTaskComplete(p6) --[[ line: 107 ]]
	-- upvalues: subagentTaskStatus (ref)
	return p6.status == subagentTaskStatus.Done
end

local function isTaskLoading(p7) --[[ line: 111 ]]
	-- upvalues: subagentTaskStatus (ref)
	return p7.status == subagentTaskStatus.InProgress
end

local function appendTasksFromPayload(p8, p9) --[[ line: 115 ]]
	-- upvalues: toTaskItem (ref)
	local var17 = if typeof(p8) == "table" then p8.tasks else nil
	
	if typeof(var17) ~= "table" then return end
	for i, v in var17 do
		local var18 = toTaskItem(v)
		
		if var18 ~= nil then
			table.insert(p9, var18)
		end
	end
end

local function appendTasksFromMaybeJson(p10, p11) --[[ line: 129 ]]
	-- upvalues: appendTasksFromPayload (ref), httpService (ref)
	if typeof(p10) == "table" then
		appendTasksFromPayload(p10, p11)
		
		return
	elseif typeof(p10) == "string" then
		local ok, status = pcall(function() --[[ line: 133 ]]
			-- upvalues: httpService (copy), p10 (ref)
			return httpService:JSONDecode(p10)
		end)
		
		if not ok then return end
		local var19 = if typeof(status) == "table" then status.text else nil
		
		if typeof(var19) == "string" then
			local ok_1, status_1 = pcall(function() --[[ line: 142 ]]
				-- upvalues: httpService (copy), var19 (ref)
				return httpService:JSONDecode(var19)
			end)
			
			if ok_1 then
				appendTasksFromPayload(status_1, p11)
			end
		end
		appendTasksFromPayload(status, p11)
	end
end

local function extractTasksFromToolCall(p12) --[[ line: 153 ]]
	-- upvalues: appendTasksFromMaybeJson (ref)
	local var20
	local kind = p12.kind
	
	if not (typeof(kind) == "string" and string.lower(kind) == "manage_tasks") then
		kind = p12.title
		
		if typeof(kind) == "string" and string.lower(kind) == "manage_tasks" then
			var20 = true
		else
			local rawInput = p12.rawInput
			
			if typeof(rawInput) == "table" then
				kind = rawInput.name
				var20 = typeof(kind) == "string" and string.lower(kind) == "manage_tasks"
				
				if not var20 then
					kind = rawInput.toolName
					var20 = false
					
					if typeof(kind) == "string" then
						var20 = string.lower(kind) == "manage_tasks"
						var20 = nil
					end
				end
			else
				var20 = false
			end
		end
		if not var20 then
			return nil
		end
		local t = {}
		appendTasksFromMaybeJson(p12.rawInput, t)
		
		return if #t > 0 then t else nil
	end
end

local function orderedManageTasksToolCalls(p13) --[[ line: 163 ]]
	local kind
	local t = {}
	local t_1 = {}
	
	for i, v in p13.activityItems do
		if v.kind == "tool_call" then
			local toolCallId = p13.toolCalls[v.toolCallId]
			
			if toolCallId ~= nil then
				local var26
				kind = toolCallId.kind
				
				if not (typeof(kind) == "string" and string.lower(kind) == "manage_tasks") then
					kind = toolCallId.title
					
					if typeof(kind) == "string" and string.lower(kind) == "manage_tasks" then
						var26 = true
					else
						local rawInput = toolCallId.rawInput
						
						if typeof(rawInput) == "table" then
							kind = rawInput.name
							var26 = typeof(kind) == "string" and string.lower(kind) == "manage_tasks"
							
							if not var26 then
								kind = rawInput.toolName
								var26 = false
								
								if typeof(kind) == "string" then
									var26 = string.lower(kind) == "manage_tasks"
									var26 = nil
								end
							end
						else
							var26 = false
						end
					end
					if var26 then
						table.insert(t, toolCallId)
						t_1[toolCallId.toolCallId] = true
					end
				end
			end
		end
	end
	local t_2 = {}
	
	for i_1, v_1 in p13.toolCalls do
		if not t_1[i_1] then
			local var25
			kind = v_1.kind
			
			if not (typeof(kind) == "string" and string.lower(kind) == "manage_tasks") then
				kind = v_1.title
				
				if typeof(kind) == "string" and string.lower(kind) == "manage_tasks" then
					var25 = true
				else
					local rawInput = v_1.rawInput
					
					if typeof(rawInput) == "table" then
						kind = rawInput.name
						var25 = typeof(kind) == "string" and string.lower(kind) == "manage_tasks"
						
						if not var25 then
							kind = rawInput.toolName
							var25 = false
							
							if typeof(kind) == "string" then
								var25 = string.lower(kind) == "manage_tasks"
								var25 = nil
							end
						end
					else
						var25 = false
					end
				end
				if var25 then
					table.insert(t_2, i_1)
				end
			end
		end
	end
	table.sort(t_2)
	
	for i_1, v_2 in t_2 do
		table.insert(t, p13.toolCalls[v_2])
	end
	return t
end

local _ = function(p14) --[[ line: 191 | named "taskKey" ]]
	return `{p14.category}:{p14.text}`
end

local function applyTasks(p15, p16, p17) --[[ line: 195 ]]
	for i, v in p15 do
		local category = `{v.category}:{v.text}`
		
		if p17[category] == nil then
			table.insert(p16, v)
		end
		p17[category] = v
	end
end

local function groupTasks(p18) --[[ line: 205 ]]
	-- upvalues: subagentTaskStatus (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p18 do
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

local function toTaskState(p19, p20) --[[ line: 241 ]]
	-- upvalues: groupTasks (ref)
	if #p19 == 0 then
		return nil
	end
	local t = {}
	
	for i, v in p19 do
		table.insert(t, p20[`{v.category}:{v.text}`])
	end
	local var31 = groupTasks(t)
	local var32 = #var31 > 0
	
	for i_1, v_1 in var31 do
		if not v_1.isComplete then
			var32 = false
			break
		end
	end
	return { groups = var31, allComplete = var32 }
end

return {
	TOOL_NAME = "manage_tasks",
	extractTasksFromToolCall = extractTasksFromToolCall,
	fromTasks = function(p21) --[[ line: 266 ]]
		-- upvalues: toTaskItem (ref), applyTasks (ref), toTaskState (ref)
		if typeof(p21) ~= "table" then
			return nil
		end
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		for i, v in p21 do
			local var36 = toTaskItem(v)
			
			if var36 ~= nil then
				table.insert(t_2, var36)
			end
		end
		applyTasks(t_2, t, t_1)
		
		return toTaskState(t, t_1)
	end,
	fromTurnState = function(p22) --[[ line: 284 ]]
		-- upvalues: orderedManageTasksToolCalls (ref), appendTasksFromMaybeJson (ref), applyTasks (ref), toTaskState (ref)
		local t = {}
		local t_1 = {}
		
		for i, v in orderedManageTasksToolCalls(p22) do
			local var39
			local kind = v.kind
			
			if not (typeof(kind) == "string" and string.lower(kind) == "manage_tasks") then
				kind = v.title
				
				if typeof(kind) == "string" and string.lower(kind) == "manage_tasks" then
					var39 = true
				else
					local rawInput = v.rawInput
					
					if typeof(rawInput) == "table" then
						kind = rawInput.name
						var39 = typeof(kind) == "string" and string.lower(kind) == "manage_tasks"
						
						if not var39 then
							local var40
							kind = rawInput.toolName
							var39 = false
							
							if typeof(kind) == "string" then
								var39 = string.lower(kind) == "manage_tasks"
								var39 = nil
							end
						end
					else
						var39 = false
					end
				end
				if var39 then
					var39 = {}
					appendTasksFromMaybeJson(v.rawInput, var39)
					var40 = if #var39 > 0 then var39 else nil
				else
					var40 = nil
				end
				if var40 ~= nil then
					applyTasks(var40, t, t_1)
				end
			end
		end
		return toTaskState(t, t_1)
	end,
	isTaskComplete = isTaskComplete,
	isTaskLoading = isTaskLoading
}