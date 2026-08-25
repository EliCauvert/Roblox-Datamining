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

local function _(p0)
	-- upvalues: subagentTaskStatus (ref), t (ref)
	return if typeof(p0) == "string" then t[string.lower(p0)] or p0 else subagentTaskStatus.Pending
end

local _ = function(p1)
	-- upvalues: t_1 (ref)
	return if typeof(p1) == "string" then t_1[string.lower(p1)] or p1 else nil
end

local _ = function(p2)
	return typeof(p2) == "string" and string.lower(p2) == "manage_tasks"
end

local _ = function(p3)
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

local function toTaskMetadata(p4)
	-- upvalues: httpService (ref)
	if p4 == nil then
		return nil
	elseif typeof(p4) == "table" then
		return p4
	elseif typeof(p4) == "string" then
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p4 (ref)
			return httpService:JSONDecode(p4)
		end)
		
		return if ok and typeof(status) == "table" then status else nil
	end
end

local function toTaskItem(p5)
	-- upvalues: t_1 (ref), subagentTaskStatus (ref), t (ref), toTaskMetadata (ref)
	if typeof(p5) ~= "table" or typeof(p5.text) ~= "string" or p5.text == "" then
		return nil
	end
	local category = p5.category
	local var16 = if typeof(category) ~= "string" then t_1[string.lower(category)] or category else nil
	
	if var16 == nil then
		return nil
	end
	local t_2 = { text = p5.text, description = p5.description }
	local status = p5.status
	t_2.status = if typeof(status) ~= "string" then t[string.lower(status)] or status else subagentTaskStatus.Pending
	t_2.category = var16
	t_2.metadata = toTaskMetadata(p5.metadata)
	t_2.created_timestamp = if typeof(p5.created_timestamp) == "string" then p5.created_timestamp else nil
	
	return t_2
end

local function isTaskComplete(p6)
	-- upvalues: subagentTaskStatus (ref)
	return p6.status == subagentTaskStatus.Done
end

local function isTaskLoading(p7)
	-- upvalues: subagentTaskStatus (ref)
	return p7.status == subagentTaskStatus.InProgress
end

local _ = function(p8)
	-- upvalues: t_2 (ref)
	return if p8 == nil then 6 else t_2[p8] or 6
end

local _ = function(p9)
	-- upvalues: t_2 (ref)
	local cloned = table.clone(p9)
	table.sort(cloned, function(p10, p11)
		-- upvalues: t_2 (copy)
		local status = p10.status
		local status_1 = p11.status
		
		return (if status == nil then 6 else t_2[status] or 6) < (if status_1 == nil then 6 else t_2[status_1] or 6)
	end)
	
	return cloned
end

local function appendTasksFromPayload(p12, p13)
	-- upvalues: toTaskItem (ref)
	local var19 = if typeof(p12) == "table" then p12.tasks else nil
	
	if typeof(var19) ~= "table" then return end
	for i, v in var19 do
		local var20 = toTaskItem(v)
		
		if var20 ~= nil then
			table.insert(p13, var20)
		end
	end
end

local function appendTasksFromMaybeJson(p14, p15)
	-- upvalues: appendTasksFromPayload (ref), httpService (ref)
	if typeof(p14) == "table" then
		appendTasksFromPayload(p14, p15)
		
		return
	elseif typeof(p14) == "string" then
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p14 (ref)
			return httpService:JSONDecode(p14)
		end)
		
		if not ok then return end
		local var21 = if typeof(status) == "table" then status.text else nil
		
		if typeof(var21) == "string" then
			local ok_1, status_1 = pcall(function()
				-- upvalues: httpService (copy), var21 (ref)
				return httpService:JSONDecode(var21)
			end)
			
			if ok_1 then
				appendTasksFromPayload(status_1, p15)
			end
		end
		appendTasksFromPayload(status, p15)
	end
end

local function extractTasksFromToolCall(p16)
	-- upvalues: appendTasksFromMaybeJson (ref)
	local var22
	local kind = p16.kind
	
	if not (typeof(kind) == "string" and string.lower(kind) == "manage_tasks") then
		kind = p16.title
		
		if typeof(kind) == "string" and string.lower(kind) == "manage_tasks" then
			var22 = true
		else
			local rawInput = p16.rawInput
			
			if typeof(rawInput) == "table" then
				kind = rawInput.name
				var22 = typeof(kind) == "string" and string.lower(kind) == "manage_tasks"
				
				if not var22 then
					kind = rawInput.toolName
					var22 = false
					
					if typeof(kind) == "string" then
						var22 = string.lower(kind) == "manage_tasks"
						var22 = nil
					end
				end
			else
				var22 = false
			end
		end
		if not var22 then
			return nil
		end
		local t = {}
		appendTasksFromMaybeJson(p16.rawInput, t)
		
		return if #t > 0 then t else nil
	end
end

local function orderedManageTasksToolCalls(p17)
	local kind
	local t = {}
	local t_1 = {}
	
	for i, v in p17.activityItems do
		if v.kind == "tool_call" then
			local toolCallId = p17.toolCalls[v.toolCallId]
			
			if toolCallId ~= nil then
				local var28
				kind = toolCallId.kind
				
				if not (typeof(kind) == "string" and string.lower(kind) == "manage_tasks") then
					kind = toolCallId.title
					
					if typeof(kind) == "string" and string.lower(kind) == "manage_tasks" then
						var28 = true
					else
						local rawInput = toolCallId.rawInput
						
						if typeof(rawInput) == "table" then
							kind = rawInput.name
							var28 = typeof(kind) == "string" and string.lower(kind) == "manage_tasks"
							
							if not var28 then
								kind = rawInput.toolName
								var28 = false
								
								if typeof(kind) == "string" then
									var28 = string.lower(kind) == "manage_tasks"
									var28 = nil
								end
							end
						else
							var28 = false
						end
					end
					if var28 then
						table.insert(t, toolCallId)
						t_1[toolCallId.toolCallId] = true
					end
				end
			end
		end
	end
	local t_2 = {}
	
	for i_1, v_1 in p17.toolCalls do
		if not t_1[i_1] then
			local var27
			kind = v_1.kind
			
			if not (typeof(kind) == "string" and string.lower(kind) == "manage_tasks") then
				kind = v_1.title
				
				if typeof(kind) == "string" and string.lower(kind) == "manage_tasks" then
					var27 = true
				else
					local rawInput = v_1.rawInput
					
					if typeof(rawInput) == "table" then
						kind = rawInput.name
						var27 = typeof(kind) == "string" and string.lower(kind) == "manage_tasks"
						
						if not var27 then
							kind = rawInput.toolName
							var27 = false
							
							if typeof(kind) == "string" then
								var27 = string.lower(kind) == "manage_tasks"
								var27 = nil
							end
						end
					else
						var27 = false
					end
				end
				if var27 then
					table.insert(t_2, i_1)
				end
			end
		end
	end
	table.sort(t_2)
	
	for i_1, v_2 in t_2 do
		table.insert(t, p17.toolCalls[v_2])
	end
	return t
end

local _ = function(p18)
	return `{p18.category}:{p18.text}`
end

local function applyTasks(p19, p20, p21)
	for i, v in p19 do
		local category = `{v.category}:{v.text}`
		
		if p21[category] == nil then
			table.insert(p20, v)
		end
		p21[category] = v
	end
end

local function groupTasks(p22)
	-- upvalues: subagentTaskStatus (ref), t_2 (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p22 do
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
		table.sort(cloned, function(p23, p24)
			-- upvalues: t_2 (copy)
			local status = p23.status
			local status_1 = p24.status
			
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

local function toTaskState(p25, p26)
	-- upvalues: groupTasks (ref)
	if #p25 == 0 then
		return nil
	end
	local t = {}
	
	for i, v in p25 do
		table.insert(t, p26[`{v.category}:{v.text}`])
	end
	local var34 = groupTasks(t)
	local var35 = #var34 > 0
	
	for i_1, v_1 in var34 do
		if not v_1.isComplete then
			var35 = false
			break
		end
	end
	return { groups = var34, allComplete = var35 }
end

return {
	TOOL_NAME = "manage_tasks",
	extractTasksFromToolCall = extractTasksFromToolCall,
	fromTasks = function(p27)
		-- upvalues: toTaskItem (ref), applyTasks (ref), toTaskState (ref)
		if typeof(p27) ~= "table" then
			return nil
		end
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		for i, v in p27 do
			local var39 = toTaskItem(v)
			
			if var39 ~= nil then
				table.insert(t_2, var39)
			end
		end
		applyTasks(t_2, t, t_1)
		
		return toTaskState(t, t_1)
	end,
	fromTurnState = function(p28)
		-- upvalues: orderedManageTasksToolCalls (ref), appendTasksFromMaybeJson (ref), applyTasks (ref), toTaskState (ref)
		local t = {}
		local t_1 = {}
		
		for i, v in orderedManageTasksToolCalls(p28) do
			local var42
			local kind = v.kind
			
			if not (typeof(kind) == "string" and string.lower(kind) == "manage_tasks") then
				kind = v.title
				
				if typeof(kind) == "string" and string.lower(kind) == "manage_tasks" then
					var42 = true
				else
					local rawInput = v.rawInput
					
					if typeof(rawInput) == "table" then
						kind = rawInput.name
						var42 = typeof(kind) == "string" and string.lower(kind) == "manage_tasks"
						
						if not var42 then
							local var43
							kind = rawInput.toolName
							var42 = false
							
							if typeof(kind) == "string" then
								var42 = string.lower(kind) == "manage_tasks"
								var42 = nil
							end
						end
					else
						var42 = false
					end
				end
				if var42 then
					var42 = {}
					appendTasksFromMaybeJson(v.rawInput, var42)
					var43 = if #var42 > 0 then var42 else nil
				else
					var43 = nil
				end
				if var43 ~= nil then
					applyTasks(var43, t, t_1)
				end
			end
		end
		return toTaskState(t, t_1)
	end,
	isTaskComplete = isTaskComplete,
	isTaskLoading = isTaskLoading
}