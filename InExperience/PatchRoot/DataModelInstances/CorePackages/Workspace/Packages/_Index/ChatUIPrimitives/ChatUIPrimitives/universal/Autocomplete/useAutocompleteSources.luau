local ReactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)
local _ = require(script.Parent.AutocompleteTypes)
local AssertUniqueSourceIdsModule = require(script.Parent.assertUniqueSourceIds)
local TextBoxRangeModule = require(script.Parent.textBoxRange)
local UseAutocompleteKeyboardNavigationModule = require(script.Parent.useAutocompleteKeyboardNavigation)
local config = {
	activated = false,
	selectedIndex = 0,
	keyboardIndex = 0,
	sections = {},
	rows = {}
}

local function _(KeyCode, p1: number, p2)
	if KeyCode == Enum.KeyCode.Up then
		return if p1 <= 0 then 1 elseif p1 == 1 then p2 else p1 - 1
	elseif KeyCode == Enum.KeyCode.Down then
		local v1 = p1 + 1
		
		return if p2 < v1 then 1 else v1
	else
		return nil
	end
end

local _ = function(p1)
	-- upvalues: AssertUniqueSourceIdsModule (copy)
	local t = {}
	
	if p1 == nil then
		return t
	end
	AssertUniqueSourceIdsModule(p1.sources)
	
	for _, source in p1.sources do
		t[source.id] = source
	end
	return t
end

local _ = function(p2, p3)
	if #p2 <= p3 then
		return p2
	end
	local t = {}
	
	for i = 1, p3 do
		t[i] = p2[i]
	end
	return t
end

return function(p4, Current, p5)
	-- upvalues: ReactModule (copy), config (copy), TextBoxRangeModule (copy), UseAutocompleteKeyboardNavigationModule (copy), AssertUniqueSourceIdsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(config)
	local UseRefResult = ReactModule.useRef(UseStateResult)
	UseRefResult.current = UseStateResult
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef({})
	local UseRefResult3 = ReactModule.useRef(Current)
	local UseRefResult4 = ReactModule.useRef(0)
	local UseRefResult5 = ReactModule.useRef("")
	local UseRefResult6 = ReactModule.useRef(false)
	
	local function _()
		-- upvalues: p4 (copy), TextBoxRangeModule (upval), UseRefResult4 (copy)
		local Current = p4.current
		
		if Current ~= nil then
			local Cursor = TextBoxRangeModule.readCursor(Current)
			
			if Cursor ~= nil then
				return Cursor
			end
		end
		return UseRefResult4.current
	end
	
	local _ = function(p6)
		-- upvalues: UseRefResult6 (copy), p4 (copy), TextBoxRangeModule (upval)
		task.defer(function()
			-- upvalues: UseRefResult6 (upval), p4 (upval), p6 (copy), TextBoxRangeModule (upval)
			UseRefResult6.current = false
			local Current = p4.current
			
			if Current == nil then return end
			Current:CaptureFocus()
			
			if p6 ~= nil then
				TextBoxRangeModule.placeCursor(Current, p6)
			end
		end)
	end
	
	local function spliceRow(SelectedIndex)
		-- upvalues: UseRefResult (copy), p4 (copy), UseRefResult2 (copy), TextBoxRangeModule (upval)
		local Current = UseRefResult.current
		local Row = Current.rows[SelectedIndex]
		local Current1 = p4.current
		
		if Row == nil or Current1 == nil then
			return false, nil
		end
		local Section = Current.sections[Row.sectionIndex]
		local CurrentEntry = UseRefResult2.current[Row.sourceId]
		
		if Section == nil or CurrentEntry == nil then
			return false, nil
		else
			return TextBoxRangeModule.splice(Current1, Section.replaceStart, Section.replaceFinish, CurrentEntry.formatReplacement(Row.item))
		end
	end
	
	local UseResult = ReactModule.useCallback(function(Text)
		-- upvalues: UseRefResult6 (copy), UseRefResult1 (copy), UseRefResult (copy), UseStateResult2 (copy), config (upval), p4 (copy), TextBoxRangeModule (upval), UseRefResult4 (copy)
		if UseRefResult6.current then return end
		local Current = UseRefResult1.current
		
		if Current == nil then return end
		if utf8.len(Text) ~= nil then
			local Current1 = p4.current
			local Current2 = nil
			repeat
				if Current1 ~= nil then
					local Cursor = TextBoxRangeModule.readCursor(Current1)
					
					if Cursor ~= nil then
						Current2 = Cursor
						break
					end
				end
				Current2 = UseRefResult4.current
			until true
			local Current3 = p4.current
			
			if Current3 ~= nil then
				local SpliceResult2 = nil
				for _, source in Current.sources do
					local NoMatchCompletion = source.matchCompletion == nil
					local MatchCompletionResult = nil
					
					if not NoMatchCompletion then
						MatchCompletionResult = source.matchCompletion(Text, Current2)
						NoMatchCompletion = MatchCompletionResult == nil
					end
					if not NoMatchCompletion then
						UseRefResult6.current = true
						local SpliceResult
						SpliceResult, SpliceResult2 = TextBoxRangeModule.splice(Current3, MatchCompletionResult.replaceStart, MatchCompletionResult.replaceFinish, MatchCompletionResult.replacement)
						
						if not SpliceResult then
							UseRefResult6.current = false
							continue
						end
						if UseRefResult.current.activated then
							UseStateResult2(config)
						end
						task.defer(function()
							-- upvalues: UseRefResult6 (upval), p4 (upval), SpliceResult2 (copy), TextBoxRangeModule (upval)
							UseRefResult6.current = false
							local Current = p4.current
							
							if Current == nil then return end
							Current:CaptureFocus()
							
							if SpliceResult2 ~= nil then
								TextBoxRangeModule.placeCursor(Current, SpliceResult2)
							end
						end)
						
						return
					end
				end
			end
			local Sections = {}
			local Rows = {}
			
			for _, source1 in Current.sources do
				local MatchTriggerResult = source1.matchTrigger(Text, Current2)
				
				if MatchTriggerResult ~= nil then
					local MaxResults = if source1.maxResults == nil then 20 else source1.maxResults
					local SearchResult = source1.search(MatchTriggerResult.query)
					local Results = nil
					
					if #SearchResult <= MaxResults then
						Results = SearchResult
					else
						local t = {}
						
						for i = 1, MaxResults do
							t[i] = SearchResult[i]
						end
						Results = t
					end
					if #Results > 0 then
						table.insert(Sections, {
							sourceId = source1.id,
							results = Results,
							replaceStart = MatchTriggerResult.replaceStart,
							replaceFinish = MatchTriggerResult.replaceFinish
						})
						local CountSections = #Sections
						
						for RowIndex, result in Results do
							table.insert(Rows, {
								sourceId = source1.id,
								item = result,
								sectionIndex = CountSections,
								rowIndex = RowIndex
							})
						end
					end
				end
			end
			if #Rows > 0 then
				UseStateResult2({
					activated = true,
					selectedIndex = 0,
					keyboardIndex = 0,
					sections = Sections,
					rows = Rows
				})
				
				return
			end
			if UseRefResult.current.activated then
				UseStateResult2(config)
			end
			return
		elseif UseRefResult.current.activated then
			UseStateResult2(config)
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: p4 (copy), Current (copy), TextBoxRangeModule (upval), UseRefResult4 (copy)
		local Current1 = p4.current
		
		if Current1 == nil or Current == nil then return end
		local Connection = Current1:GetPropertyChangedSignal("CursorPosition"):Connect(function()
			-- upvalues: TextBoxRangeModule (upval), Current1 (copy), UseRefResult4 (upval)
			local Cursor = TextBoxRangeModule.readCursor(Current1)
			
			if Cursor ~= nil then
				UseRefResult4.current = Cursor
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { p4.current, Current })
	local UseResult1 = ReactModule.useCallback(function(KeyCode)
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy), config (upval), p4 (copy), UseRefResult4 (copy), TextBoxRangeModule (upval)
		local Current = UseRefResult.current
		
		if not Current.activated or #Current.rows == 0 then return end
		if KeyCode == Enum.KeyCode.Escape then
			UseStateResult2(config)
			local Current1 = p4.current
			local Current2 = UseRefResult4.current
			task.defer(function()
				-- upvalues: Current1 (copy), TextBoxRangeModule (upval), Current2 (copy)
				if Current1 then
					Current1:CaptureFocus()
					TextBoxRangeModule.placeCursor(Current1, Current2)
				end
			end)
			
			return
		end
		local SelectedIndex: number = Current.selectedIndex
		local CountRows = #Current.rows
		local CountRows1 = nil
		
		if KeyCode == Enum.KeyCode.Up then
			CountRows1 = if SelectedIndex <= 0 then 1 elseif SelectedIndex == 1 then CountRows else SelectedIndex - 1
		elseif KeyCode == Enum.KeyCode.Down then
			local NewSelectedIndex = SelectedIndex + 1
			CountRows1 = if CountRows < NewSelectedIndex then 1 else NewSelectedIndex
		else
			CountRows1 = nil
		end
		if CountRows1 ~= nil then
			UseStateResult2(function(p6)
				-- upvalues: KeyCode (copy)
				local SelectedIndex: number = p6.selectedIndex
				local CountRows = #p6.rows
				local CountRows1 = nil
				
				if KeyCode == Enum.KeyCode.Up then
					CountRows1 = if SelectedIndex <= 0 then 1 elseif SelectedIndex == 1 then CountRows else SelectedIndex - 1
				elseif KeyCode == Enum.KeyCode.Down then
					local NewSelectedIndex = SelectedIndex + 1
					CountRows1 = if CountRows < NewSelectedIndex then 1 else NewSelectedIndex
				else
					CountRows1 = nil
				end
				return if CountRows1 == nil then p6 else {
					activated = p6.activated,
					sections = p6.sections,
					rows = p6.rows,
					selectedIndex = CountRows1,
					keyboardIndex = CountRows1
				}
			end)
			
			return
		end
	end, {})
	UseAutocompleteKeyboardNavigationModule(UseStateResult.activated and #UseStateResult.rows > 0, if Current == nil then nil else UseResult1, p5)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseResult (copy), UseRefResult5 (copy), p4 (copy), UseStateResult2 (copy), config (upval)
		local Current = UseRefResult1.current
		
		if Current == nil then return end
		local Flag = false
		local List = {}
		
		for _, source in Current.sources do
			if source.subscribe ~= nil then
				table.insert(List, (source.subscribe(function()
					-- upvalues: Flag (ref), UseResult (upval), UseRefResult5 (upval)
					if not Flag then
						UseResult(UseRefResult5.current)
						
						return
					end
				end)))
			end
		end
		local Current1 = p4.current
		local Current11 = if Current1 == nil then UseRefResult5.current else Current1.Text
		UseRefResult5.current = Current11
		UseResult(Current11)
		
		return function()
			-- upvalues: Flag (ref), List (copy), UseStateResult2 (upval), config (upval)
			Flag = true
			
			for _, value in List do
				value()
			end
			UseStateResult2(config)
		end
	end, { Current, UseResult })
	local UseResult2 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult5 (copy), UseResult (copy)
		UseRefResult5.current = Current
		UseResult(Current)
	end, { UseResult })
	local UseResult3 = ReactModule.useCallback(function(p6)
		-- upvalues: UseRefResult6 (copy), spliceRow (copy), UseStateResult2 (copy), config (upval), p4 (copy), TextBoxRangeModule (upval)
		UseRefResult6.current = true
		local SpliceRowResult, SpliceRowResult2 = spliceRow(p6)
		
		if SpliceRowResult then
			UseStateResult2(config)
		end
		task.defer(function()
			-- upvalues: UseRefResult6 (upval), p4 (upval), SpliceRowResult2 (copy), TextBoxRangeModule (upval)
			UseRefResult6.current = false
			local Current = p4.current
			
			if Current == nil then return end
			Current:CaptureFocus()
			
			if SpliceRowResult2 ~= nil then
				TextBoxRangeModule.placeCursor(Current, SpliceRowResult2)
			end
		end)
	end, {})
	local UseResult4 = ReactModule.useCallback(function(_, p6): boolean
		-- upvalues: UseRefResult (copy), UseRefResult6 (copy), spliceRow (copy), UseStateResult2 (copy), config (upval), p4 (copy), TextBoxRangeModule (upval)
		if not p6 then
			return false
		end
		local Current = UseRefResult.current
		
		if not Current.activated or #Current.rows == 0 or Current.selectedIndex < 1 then
			return false
		end
		UseRefResult6.current = true
		local SpliceRowResult, SpliceRowResult2 = spliceRow(Current.selectedIndex)
		
		if SpliceRowResult then
			UseStateResult2(config)
		end
		task.defer(function()
			-- upvalues: UseRefResult6 (upval), p4 (upval), SpliceRowResult2 (copy), TextBoxRangeModule (upval)
			UseRefResult6.current = false
			local Current = p4.current
			
			if Current == nil then return end
			Current:CaptureFocus()
			
			if SpliceRowResult2 ~= nil then
				TextBoxRangeModule.placeCursor(Current, SpliceRowResult2)
			end
		end)
		
		return if SpliceRowResult then true else false
	end, {})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), config (upval)
		UseStateResult2(config)
	end, {})
	local UseResult6 = ReactModule.useCallback(function(Value)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p6)
			-- upvalues: Value (copy)
			return {
				activated = p6.activated,
				sections = p6.sections,
				rows = p6.rows,
				selectedIndex = math.clamp(Value, 1, (math.max(1, #p6.rows))),
				keyboardIndex = p6.keyboardIndex
			}
		end)
	end, {})
	local UseResult7 = ReactModule.useCallback(function(p6, p7)
		-- upvalues: UseRefResult2 (copy)
		local CurrentEntry = UseRefResult2.current[p6.sourceId]
		
		return if CurrentEntry == nil then nil else CurrentEntry.renderEntry(p6.item, p7)
	end, {})
	local t = {}
	local Current1 = nil
	
	if Current == nil then
		Current1 = t
	else
		AssertUniqueSourceIdsModule(Current.sources)
		
		for _, source in Current.sources do
			t[source.id] = source
		end
		Current1 = t
	end
	if UseRefResult3.current ~= Current then
		UseRefResult3.current = Current
		
		if UseStateResult.activated then
			UseStateResult2(config)
		end
	end
	UseRefResult1.current = Current
	UseRefResult2.current = Current1
	
	return {
		isOpen = UseStateResult.activated and #UseStateResult.rows > 0,
		results = UseStateResult.rows,
		selectedIndex = UseStateResult.selectedIndex,
		keyboardIndex = UseStateResult.keyboardIndex,
		renderEntry = UseResult7,
		onTextChanged = UseResult2,
		setSelectedIndex = UseResult6,
		commitSelection = UseResult3,
		interceptSend = UseResult4,
		dismiss = UseResult5
	}
end