local FFlagBuildExperienceTurnWorkTelemetryModule = require(script:FindFirstAncestor("BuildExperience").Flags.FFlagBuildExperienceTurnWorkTelemetry)
local _ = require(script.Parent.chatTypes)
local ThoughtHeadingModule = require(script.Parent.thoughtHeading)

local function normalize(Text: string): string
	return (string.match(string.gsub(string.gsub(string.lower(Text), "[%p%c]", " "), "%s+", " "), "^%s*(.-)%s*$"))
end

local function readsAsSameStep(p1, p2): boolean
	-- upvalues: normalize (copy)
	if p1.localTool ~= nil or p2.localTool ~= nil then
		return false
	elseif p1.isFailed == true ~= (p2.isFailed == true) then
		return false
	elseif p1.isFallback or p2.isFallback then
		return p1.isFallback == p2.isFallback and p1.toolKey == p2.toolKey
	else
		local Title = p2.title
		local NormalizeResult = normalize(p1.title)
		
		return NormalizeResult ~= "" and NormalizeResult == normalize(Title)
	end
end

local function mergeRepeats(List)
	-- upvalues: readsAsSameStep (copy)
	local List1 = {}
	
	for _, value in List do
		local Entry = List1[#List1]
		
		if Entry == nil or not readsAsSameStep(Entry, value) then
			table.insert(List1, table.clone(value))
		else
			if value.isFallback then
				Entry.title = value.title
			end
			Entry.hasActiveCall = Entry.hasActiveCall == true or value.hasActiveCall == true
			
			if value.body ~= nil then
				Entry.body = if Entry.body == nil then value.body else `{Entry.body}\n\n{value.body}`
			end
		end
	end
	return List1
end

local function _(p1, p2)
	return if p1 == nil or p1 == "" then p2 elseif p2 == nil or p2 == "" then p1 else `{p1}\n\n{p2}`
end

local function groupSteps(List, Callback, p1, p2)
	-- upvalues: ThoughtHeadingModule (copy), FFlagBuildExperienceTurnWorkTelemetryModule (copy)
	local List1 = {}
	local Body = nil
	
	for i, value in List do
		if value.kind ~= "thought" then
			if value.kind == "tool_call" then
				local LocalTool = if p2 == nil then nil else p2[value.toolCallId]
				
				if value.status == "failed" then
					table.insert(List1, {
						isFailed = true,
						key = `Step{i}`,
						title = Callback(value),
						titleSource = if FFlagBuildExperienceTurnWorkTelemetryModule then "failed" else nil,
						localTool = LocalTool
					})
					continue
				else
					local DisplaySummary = value.displaySummary
					local Entry = List1[#List1]
					
					if LocalTool ~= nil then
						local config = {
							key = `Step{i}`,
							title = DisplaySummary or Callback(value),
							titleSource = if FFlagBuildExperienceTurnWorkTelemetryModule then "askedUser" else nil
						}
						config.body = Body
						config.hasActiveCall = LocalTool.isWaiting
						config.localTool = LocalTool
						table.insert(List1, config)
						Body = nil
						continue
					elseif DisplaySummary == nil and Entry ~= nil and not Entry.isFailed and not Entry.isFallback and Entry.localTool == nil then
						local Body3 = Entry.body
						Entry.body = if Body3 == nil or Body3 == "" then Body elseif Body == nil or Body == "" then Body3 else `{Body3}\n\n{Body}`
						Entry.hasActiveCall = Entry.hasActiveCall == true or value.kind == "tool_call" and (value.status == "pending" or (value.status == "in_progress" or value.status == nil))
						Body = nil
					else
						local config = {
							key = `Step{i}`,
							title = DisplaySummary or Callback(value),
							titleSource = if FFlagBuildExperienceTurnWorkTelemetryModule then if DisplaySummary == nil then "fallback" else "summary" else nil
						}
						config.body = Body
						config.isFallback = DisplaySummary == nil
						config.toolKey = if DisplaySummary == nil then value.title or "" else nil
						config.hasActiveCall = value.kind == "tool_call" and (value.status == "pending" or (value.status == "in_progress" or value.status == nil))
						table.insert(List1, config)
						Body = nil
					end
					continue
				end
				continue
			end
			continue
		end
		local SplitThoughtResult = ThoughtHeadingModule.splitThought(value.text)
		local Title = SplitThoughtResult.title
		
		if Title ~= nil then
			local Body1 = if SplitThoughtResult.body == "" then nil else SplitThoughtResult.body
			table.insert(List1, {
				key = `Step{i}`,
				title = Title,
				titleSource = if FFlagBuildExperienceTurnWorkTelemetryModule then "heading" else nil,
				body = if Body == nil or Body == "" then Body1 elseif Body1 == nil or Body1 == "" then Body else `{Body}\n\n{Body1}`
			})
			Body = nil
		elseif SplitThoughtResult.body ~= "" then
			local Body2 = SplitThoughtResult.body
			Body = if Body == nil or Body == "" then Body2 elseif Body2 == nil or Body2 == "" then Body else `{Body}\n\n{Body2}`
		end
	end
	local v1 = nil
	
	for i1 = #List1, 1, -1 do
		if List1[i1].localTool ~= nil then
			continue
		end
		v1 = List1[i1]
		break
	end
	if not p1 and Body ~= nil and v1 ~= nil and not v1.isFailed then
		local Body4 = v1.body
		v1.body = if Body4 == nil or Body4 == "" then Body elseif Body == nil or Body == "" then Body4 else `{Body4}\n\n{Body}`
	end
	return List1
end

local function buildStepRows(p3, p4, p5, Enabled, p6, Callback)
	-- upvalues: mergeRepeats (copy), groupSteps (copy), FFlagBuildExperienceTurnWorkTelemetryModule (copy)
	local List = {}
	
	for _, value in mergeRepeats((groupSteps(p3, p4, p5 and Enabled ~= true, p6))) do
		local IsHasActiveCall: boolean = p5 and (not value.isFailed and value.hasActiveCall == true)
		local LocalTool = value.localTool
		local CallbackResult = if LocalTool == nil or Callback == nil then nil else Callback(LocalTool)
		local Body = value.body
		local Text = if CallbackResult == nil then nil else CallbackResult.text
		table.insert(List, {
			key = value.key,
			title = value.title,
			titleSource = value.titleSource,
			toolKey = if FFlagBuildExperienceTurnWorkTelemetryModule then value.toolKey else nil,
			body = if Body == nil or Body == "" then Text elseif Text == nil or Text == "" then Body else `{Body}\n\n{Text}`,
			markdown = if CallbackResult == nil then nil else CallbackResult.markdown,
			answers = if LocalTool == nil then nil else LocalTool.answers,
			isFailed = value.isFailed,
			isRunning = if IsHasActiveCall then true else nil
		})
	end
	return List
end

return {
	sameTitle = function(p7, p8): boolean
		-- upvalues: normalize (copy)
		local NormalizeResult = normalize(p7)
		
		return NormalizeResult ~= "" and NormalizeResult == normalize(p8)
	end,
	buildStepRows = buildStepRows,
	hasSteps = function(p7): boolean
		-- upvalues: buildStepRows (copy)
		return #buildStepRows(p7, function(): string
			return ""
		end, false) > 0
	end,
	isActiveCall = function(p7): boolean
		return p7.kind == "tool_call" and (p7.status == "pending" or (p7.status == "in_progress" or p7.status == nil))
	end
}