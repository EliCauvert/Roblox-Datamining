local _ = require(script.Parent.chatTypes)
local ThoughtHeadingModule = require(script.Parent.thoughtHeading)

local function normalize(Text: string): string
	return (string.match(string.gsub(string.gsub(string.lower(Text), "[%p%c]", " "), "%s+", " "), "^%s*(.-)%s*$"))
end

local function _(p1, p2): boolean
	-- upvalues: normalize (copy)
	local NormalizeResult = normalize(p1)
	
	return NormalizeResult ~= "" and NormalizeResult == normalize(p2)
end

local _ = function(p1, p2): boolean
	-- upvalues: normalize (copy)
	if p1.isFailed == true ~= (p2.isFailed == true) then
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
	-- upvalues: normalize (copy)
	local List1 = {}
	
	for _, value in List do
		local Entry = List1[#List1]
		
		if Entry ~= nil then
			local IsToolKeyMatch = nil
			if Entry.isFailed == true == (value.isFailed == true) then
				if Entry.isFallback or value.isFallback then
					IsToolKeyMatch = Entry.isFallback == value.isFallback and Entry.toolKey == value.toolKey
				else
					local Title = value.title
					local NormalizeResult = normalize(Entry.title)
					IsToolKeyMatch = NormalizeResult ~= "" and NormalizeResult == normalize(Title)
				end
			else
				IsToolKeyMatch = false
			end
			if IsToolKeyMatch then
				if value.isFallback then
					Entry.title = value.title
				end
				Entry.itemIndex = value.itemIndex
				Entry.isThought = value.isThought
				
				if value.body ~= nil then
					Entry.body = if Entry.body == nil then value.body else `{Entry.body}\n\n{value.body}`
					continue
				end
				continue
			end
		end
		table.insert(List1, table.clone(value))
	end
	return List1
end

local _ = function(p1, p2)
	return if p1 == nil or p1 == "" then p2 elseif p2 == nil or p2 == "" then p1 else `{p1}\n\n{p2}`
end

local function groupSteps(MoveResult, Callback, p1)
	-- upvalues: ThoughtHeadingModule (copy)
	local List = {}
	local Body = nil
	
	for ItemIndex, value in MoveResult do
		if value.kind ~= "thought" then
			if value.kind == "tool_call" then
				if value.status == "failed" then
					table.insert(List, {
						isFailed = true,
						isThought = false,
						key = `Step{ItemIndex}`,
						title = Callback(value),
						itemIndex = ItemIndex
					})
					continue
				else
					local DisplaySummary = value.displaySummary
					local Entry = List[#List]
					
					if DisplaySummary == nil and Entry ~= nil and not Entry.isFailed and not Entry.isFallback then
						local Body3 = Entry.body
						Entry.body = if Body3 == nil or Body3 == "" then Body elseif Body == nil or Body == "" then Body3 else `{Body3}\n\n{Body}`
						Body = nil
						continue
					else
						local config = {
							isThought = false,
							key = `Step{ItemIndex}`,
							title = DisplaySummary or Callback(value)
						}
						config.body = Body
						config.isFallback = DisplaySummary == nil
						config.toolKey = if DisplaySummary == nil then value.title or "" else nil
						config.itemIndex = ItemIndex
						table.insert(List, config)
						Body = nil
						continue
					end
				end
			end
			continue
		end
		local SplitThoughtResult = ThoughtHeadingModule.splitThought(value.text)
		local Title = SplitThoughtResult.title
		
		if Title ~= nil then
			local Body1 = if SplitThoughtResult.body == "" then nil else SplitThoughtResult.body
			table.insert(List, {
				isThought = true,
				key = `Step{ItemIndex}`,
				title = Title,
				body = if Body == nil or Body == "" then Body1 elseif Body1 == nil or Body1 == "" then Body else `{Body}\n\n{Body1}`,
				itemIndex = ItemIndex
			})
			Body = nil
		elseif SplitThoughtResult.body ~= "" then
			local Body2 = SplitThoughtResult.body
			Body = if Body == nil or Body == "" then Body2 elseif Body2 == nil or Body2 == "" then Body else `{Body}\n\n{Body2}`
		end
	end
	local Entry = List[#List]
	
	if not p1 and Body ~= nil and Entry ~= nil and not Entry.isFailed then
		local Body4 = Entry.body
		Entry.body = if Body4 == nil or Body4 == "" then Body elseif Body == nil or Body == "" then Body4 else `{Body4}\n\n{Body}`
	end
	return List
end

local _ = function(List)
	for i, value in List do
		if value.kind == "tool_call" and (value.status == "pending" or (value.status == "in_progress" or value.status == nil)) then
			return i
		end
	end
	return nil
end

local _ = function(p2, p3, p4)
	local v1 = p2[#p2]
	
	if v1 == nil then
		return nil
	end
	if p4 then
		return v1
	end
	if not v1.isThought then
		return nil
	end
	for i = v1.itemIndex + 1, #p3 do
		if p3[i].kind == "tool_call" then
			return nil
		end
	end
	return v1
end

local function buildStepRows(List, p5, p6)
	-- upvalues: mergeRepeats (copy), groupSteps (copy)
	local v2 = nil
	if p6 then
		v2 = nil
		
		for i, value in List do
			if value.kind == "tool_call" and (value.status == "pending" or (value.status == "in_progress" or value.status == nil)) then
				v2 = i
				break
			end
		end
	else
		v2 = nil
	end
	local MergeRepeatsResult = mergeRepeats((groupSteps(if v2 == nil then List else table.move(List, 1, v2, 1, {}), p5, p6)))
	local v3 = nil
	
	if p6 then
		local v4 = v2 ~= nil
		local MergeRepeatsResultEntry = MergeRepeatsResult[#MergeRepeatsResult]
		
		if MergeRepeatsResultEntry == nil then
			v3 = nil
		elseif v4 then
			v3 = MergeRepeatsResultEntry
		elseif MergeRepeatsResultEntry.isThought then
			for i1 = MergeRepeatsResultEntry.itemIndex + 1, #List do
				if List[i1].kind ~= "tool_call" then
					continue
				end
				v3 = nil
			end
			v3 = MergeRepeatsResultEntry
		else
			v3 = nil
		end
	else
		v3 = nil
	end
	local List1 = {}
	
	for _, value1 in MergeRepeatsResult do
		table.insert(List1, {
			key = value1.key,
			title = value1.title,
			body = value1.body,
			isFailed = value1.isFailed,
			isRunning = value1 == v3 or nil
		})
	end
	return List1
end

return {
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