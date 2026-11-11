local ReactModule = require(script:FindFirstAncestor("AppDebug").Parent.React)
local CollectionService = game:GetService("CollectionService")
local config = { DevDebugPanel = true, TagAnnotation = true }

local function isInExcludedScreenGui(ScreenGui): boolean
	-- upvalues: config (copy)
	local ScreenGui1 = ScreenGui
	while ScreenGui1 do
		if ScreenGui1:IsA("ScreenGui") and config[ScreenGui1.Name] then
			return true
		end
		ScreenGui1 = ScreenGui1.Parent
	end
	return false
end

local function _(Text: string)
	return if string.sub(Text, 1, 12) == "data-testid=" then string.sub(Text, 13) else nil
end

local function getInstancePath(Frame): string
	local List = {}
	local Parent = Frame
	while Parent and Parent ~= game do
		table.insert(List, 1, Parent.Name)
		Parent = Parent.Parent
	end
	return table.concat(List, "/")
end

local function createTagInfo(Frame: Frame, FullTag, Segment)
	-- upvalues: getInstancePath (copy)
	local _Vector2 = Vector2.new(0, 0)
	local _Vector2_1 = Vector2.new(0, 0)
	
	if Frame:IsA("GuiObject") then
		_Vector2 = Frame.AbsolutePosition
		_Vector2_1 = Frame.AbsoluteSize
	end
	return {
		instance = Frame,
		testId = Segment,
		fullTag = FullTag,
		absolutePosition = _Vector2,
		absoluteSize = _Vector2_1,
		className = Frame.ClassName,
		name = Frame.Name,
		path = getInstancePath(Frame)
	}
end

local function scanAllTags()
	-- upvalues: CollectionService (copy), isInExcludedScreenGui (copy), createTagInfo (copy)
	local List = {}
	local Success, Result = pcall(function()
		-- upvalues: CollectionService (upval)
		return CollectionService:GetAllTags()
	end)
	
	if not Success then
		return {}, {}, {}
	end
	local List1 = {}
	
	for _, Text in Result do
		local Segment = if string.sub(Text, 1, 12) == "data-testid=" then string.sub(Text, 13) else nil
		
		if Segment then
			table.insert(List1, Text)
			local Success1, Result1 = pcall(function()
				-- upvalues: CollectionService (upval), Text (copy)
				return CollectionService:GetTagged(Text)
			end)
			
			if Success1 then
				for _, value in Result1 do
					if not isInExcludedScreenGui(value) then
						local Success2, Result2 = pcall(function()
							-- upvalues: createTagInfo (upval), value (copy), Text (copy), Segment (copy)
							return (createTagInfo(value, Text, Segment))
						end)
						
						if Success2 then
							table.insert(List, Result2)
						end
					end
				end
			end
		end
	end
	return List, Result, List1
end

local function subscribeToTag(Tag, Callback, Callback1)
	-- upvalues: CollectionService (copy)
	local Connection = CollectionService:GetInstanceAddedSignal(Tag):Connect(Callback)
	local Connection1 = CollectionService:GetInstanceRemovedSignal(Tag):Connect(Callback1)
	
	return function()
		-- upvalues: Connection (copy), Connection1 (copy)
		Connection:Disconnect()
		Connection1:Disconnect()
	end
end

return function(_, p1)
	-- upvalues: ReactModule (copy), isInExcludedScreenGui (copy), createTagInfo (copy), subscribeToTag (copy), CollectionService (copy), scanAllTags (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState({})
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef({})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(function(p2: number): number
			return p2 + 1
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Frame, Text: string)
		-- upvalues: isInExcludedScreenGui (upval), createTagInfo (upval), UseStateResult2 (copy)
		if isInExcludedScreenGui(Frame) then return end
		local Segment = if string.sub(Text, 1, 12) == "data-testid=" then string.sub(Text, 13) else nil
		
		if Segment then
			local TagInfo = createTagInfo(Frame, Text, Segment)
			UseStateResult2(function(Tbl)
				-- upvalues: TagInfo (copy)
				local Copy = table.clone(Tbl)
				table.insert(Copy, TagInfo)
				
				return Copy
			end)
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(List)
			-- upvalues: p2 (copy)
			local List1 = {}
			
			for _, value in List do
				if value.instance ~= p2 then
					table.insert(List1, value)
				end
			end
			return List1
		end)
	end, {})
	local UseResult3 = ReactModule.useCallback(function(Value: string)
		-- upvalues: UseRefResult (copy), subscribeToTag (upval), UseResult1 (copy), UseResult2 (copy), CollectionService (upval), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		if UseRefResult.current[Value] then return end
		UseRefResult.current[Value] = subscribeToTag(Value, function(p3)
			-- upvalues: UseResult1 (upval), Value (copy)
			UseResult1(p3, Value)
		end, function(p3)
			-- upvalues: UseResult2 (upval)
			UseResult2(p3)
		end)
		local Segment = if string.sub(Value, 1, 12) == "data-testid=" then string.sub(Value, 13) else nil
		
		if Segment then
			for _, value in CollectionService:GetTagged(Value) do
				UseResult1(value, Value)
			end
		end
		UseStateResult2_1(function(List)
			-- upvalues: Value (copy)
			if table.find(List, Value) then
				return List
			else
				local Copy = table.clone(List)
				table.insert(Copy, Value)
				
				return Copy
			end
		end)
		
		if Segment then
			UseStateResult2_2(function(List)
				-- upvalues: Value (copy)
				if table.find(List, Value) then
					return List
				else
					local Copy = table.clone(List)
					table.insert(Copy, Value)
					
					return Copy
				end
			end)
		end
	end, { UseResult1, UseResult2 })
	local UseResult4 = ReactModule.useCallback(function(FullTag)
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseStateResult2 (copy)
		local CurrentEntry: () -> () = UseRefResult.current[FullTag]
		
		if CurrentEntry then
			CurrentEntry()
			UseRefResult.current[FullTag] = nil
		end
		UseStateResult2_1(function(List)
			-- upvalues: FullTag (copy)
			local List1 = {}
			
			for _, value in List do
				if value ~= FullTag then
					table.insert(List1, value)
				end
			end
			return List1
		end)
		UseStateResult2_2(function(List)
			-- upvalues: FullTag (copy)
			local List1 = {}
			
			for _, value in List do
				if value ~= FullTag then
					table.insert(List1, value)
				end
			end
			return List1
		end)
		UseStateResult2(function(List)
			-- upvalues: FullTag (copy)
			local List1 = {}
			
			for _, value in List do
				if value.fullTag ~= FullTag then
					table.insert(List1, value)
				end
			end
			return List1
		end)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: CollectionService (upval), UseResult3 (copy), UseResult4 (copy), scanAllTags (upval), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), subscribeToTag (upval), createTagInfo (upval), UseRefResult (copy)
		local List = {}
		local Success, Result = pcall(function()
			-- upvalues: CollectionService (upval), UseResult3 (upval)
			return CollectionService.TagAdded:Connect(function(Tag)
				-- upvalues: UseResult3 (upval)
				UseResult3(Tag)
			end)
		end)
		
		if Success then
			table.insert(List, Result)
		end
		local Success1, Result1 = pcall(function()
			-- upvalues: CollectionService (upval), UseResult4 (upval)
			return CollectionService.TagRemoved:Connect(function(Tag)
				-- upvalues: UseResult4 (upval)
				UseResult4(Tag)
			end)
		end)
		
		if Success1 then
			table.insert(List, Result1)
		end
		local ScanAllTagsResult, ScanAllTagsResult2, ScanAllTagsResult3 = scanAllTags()
		UseStateResult2(ScanAllTagsResult)
		UseStateResult2_1(ScanAllTagsResult2)
		UseStateResult2_2(ScanAllTagsResult3)
		
		for _, Text in ScanAllTagsResult2 do
			local Success2, Result2 = pcall(function()
				-- upvalues: subscribeToTag (upval), Text (copy), createTagInfo (upval), UseStateResult2 (upval)
				return (subscribeToTag(Text, function(Frame)
					-- upvalues: Text (upval), createTagInfo (upval), UseStateResult2 (upval)
					local Segment = if string.sub(Text, 1, 12) == "data-testid=" then string.sub(Text, 13) else nil
					
					if Segment then
						local TagInfo = createTagInfo(Frame, Text, Segment)
						UseStateResult2(function(Tbl)
							-- upvalues: TagInfo (copy)
							local Copy = table.clone(Tbl)
							table.insert(Copy, TagInfo)
							
							return Copy
						end)
					end
				end, function(p3)
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(function(List)
						-- upvalues: p3 (copy)
						local List1 = {}
						
						for _, value in List do
							if value.instance ~= p3 then
								table.insert(List1, value)
							end
						end
						return List1
					end)
				end))
			end)
			
			if Success2 then
				UseRefResult.current[Text] = Result2
			end
		end
		return function()
			-- upvalues: List (copy), UseRefResult (upval)
			for _, Connection in List do
				pcall(function()
					-- upvalues: Connection (copy)
					Connection:Disconnect()
				end)
			end
			for _, value in UseRefResult.current do
				pcall(value)
			end
			UseRefResult.current = {}
		end
	end, { UseStateResult4, UseResult3, UseResult4, p1 })
	
	return {
		tags = UseStateResult,
		allTags = UseStateResult1,
		testIdTags = UseStateResult3,
		rescan = UseResult
	}
end