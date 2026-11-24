local _ = require(script:FindFirstAncestor("BuildExperience").Chat.chatTypes)

local function createEmptyStats()
	return { count = 0, titleSources = {}, fallbackTools = {} }
end

local function _(List, Value)
	if Value ~= "" and not table.find(List, Value) then
		table.insert(List, Value)
	end
end

return {
	summarizeSteps = function(List)
		-- upvalues: createEmptyStats (copy)
		local EmptyStats = createEmptyStats()
		EmptyStats.count = #List
		
		for _, value in List do
			local TitleSource = value.titleSource
			EmptyStats.titleSources[TitleSource] = (EmptyStats.titleSources[TitleSource] or 0) + 1
			
			if value.titleSource == "fallback" and value.toolKey ~= nil then
				local FallbackTools = EmptyStats.fallbackTools
				local ToolKey = value.toolKey
				
				if ToolKey ~= "" and not table.find(FallbackTools, ToolKey) then
					table.insert(FallbackTools, ToolKey)
				end
			end
		end
		return EmptyStats
	end,
	combineStats = function(List)
		-- upvalues: createEmptyStats (copy)
		local EmptyStats = createEmptyStats()
		
		for _, EmptyStats1 in List do
			EmptyStats.count += EmptyStats1.count
			
			for i, titleSource in EmptyStats1.titleSources do
				EmptyStats.titleSources[i] = (EmptyStats.titleSources[i] or 0) + titleSource
			end
			for _, fallbackTool in EmptyStats1.fallbackTools do
				local FallbackTools = EmptyStats.fallbackTools
				
				if fallbackTool ~= "" and not table.find(FallbackTools, fallbackTool) then
					table.insert(FallbackTools, fallbackTool)
				end
			end
		end
		return EmptyStats
	end,
	joinFallbackTools = function(Tbl): string
		local Copy = table.clone(Tbl)
		table.sort(Copy)
		local v1 = ""
		
		for _, value in Copy do
			local Text = if v1 == "" then value else `{v1},{value}`
			
			if #Text > 200 then break end
			v1 = Text
		end
		return v1
	end
}