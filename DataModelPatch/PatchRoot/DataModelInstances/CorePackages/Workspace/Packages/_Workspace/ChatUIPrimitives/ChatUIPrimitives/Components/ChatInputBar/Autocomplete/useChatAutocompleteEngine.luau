local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local InternalProvidersModule = require(script.Parent.internalProviders)
local config = {
	activated = false,
	selectedIndex = 0,
	keyboardIndex = 0,
	currentMatch = nil,
	results = {}
}

return function(p1, p2)
	-- upvalues: ReactModule (copy), InternalProvidersModule (copy), config (copy), UserInputService (copy), ContextActionService (copy), CryoModule (copy)
	local Commands = if p2 then p2.commands else nil
	local v1: boolean = if p2 and p2.emojis then true else false
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Commands (copy), v1 (copy), InternalProvidersModule (upval)
		return if Commands or v1 then InternalProvidersModule.buildTrie(Commands, v1) else nil
	end, { Commands or false, v1 })
	local UseStateResult, UseStateResult2 = ReactModule.useState(config)
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(UseStateResult)
	UseRefResult2.current = UseStateResult
	local UseRefResult3 = ReactModule.useRef(UseMemoResult)
	UseRefResult3.current = UseMemoResult
	local Text = "ChatAutocompleteSink_" .. tostring(p1)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), p2 (copy), UseRefResult (copy)
		local Current = p1.current
		
		if not Current or not p2 then return end
		local Connection = Current:GetPropertyChangedSignal("CursorPosition"):Connect(function()
			-- upvalues: Current (copy), UseRefResult (upval)
			local CursorPosition: number = Current.CursorPosition
			
			if CursorPosition >= 0 then
				UseRefResult.current = CursorPosition
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { p1.current, p2 })
	
	local function spliceResult(SelectedIndex)
		-- upvalues: UseRefResult2 (copy), p1 (copy), InternalProvidersModule (upval), UseStateResult2 (copy), config (upval)
		local Current = UseRefResult2.current
		local Result = Current.results[SelectedIndex]
		local Current1 = p1.current
		local CurrentMatch = Current.currentMatch
		
		if Result and Current1 and CurrentMatch then
			local FormatReplacementResult = InternalProvidersModule.formatReplacement(Result)
			local Text: string = Current1.Text
			Current1.Text = string.sub(Text, 1, CurrentMatch.replaceStart - 1) .. FormatReplacementResult .. string.sub(Text, CurrentMatch.replaceFinish + 1)
			Current1.CursorPosition = CurrentMatch.replaceStart + #FormatReplacementResult
			UseStateResult2(config)
			
			return
		end
	end
	
	local function commitSelection(p3)
		-- upvalues: UseRefResult1 (copy), spliceResult (copy), p1 (copy)
		UseRefResult1.current = true
		spliceResult(p3)
		task.defer(function()
			-- upvalues: UseRefResult1 (upval), p1 (upval)
			UseRefResult1.current = false
			local Current = p1.current
			
			if Current then
				Current:CaptureFocus()
			end
		end)
	end
	
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), UserInputService (upval), UseRefResult2 (copy), UseStateResult2 (copy), config (upval), p1 (copy), UseRefResult (copy)
		if not p2 then return end
		local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input)
			-- upvalues: UseRefResult2 (upval), UseStateResult2 (upval), config (upval), p1 (upval), UseRefResult (upval)
			local Current = UseRefResult2.current
			
			if not Current.activated or #Current.results == 0 then return end
			if Input.KeyCode == Enum.KeyCode.Up then
				UseStateResult2(function(p3)
					local CountResults: number = if p3.selectedIndex <= 0 then 1 elseif p3.selectedIndex == 1 then #p3.results else p3.selectedIndex - 1
					
					return {
						activated = p3.activated,
						results = p3.results,
						selectedIndex = CountResults,
						keyboardIndex = CountResults,
						currentMatch = p3.currentMatch
					}
				end)
				
				return
			end
			if Input.KeyCode == Enum.KeyCode.Down then
				UseStateResult2(function(p3)
					local NewSelectedIndex = p3.selectedIndex + 1
					
					if #p3.results < NewSelectedIndex then
						NewSelectedIndex = 1
					end
					return {
						activated = p3.activated,
						results = p3.results,
						selectedIndex = NewSelectedIndex,
						keyboardIndex = NewSelectedIndex,
						currentMatch = p3.currentMatch
					}
				end)
				
				return
			end
			if Input.KeyCode == Enum.KeyCode.Escape then
				UseStateResult2(config)
				local Current1 = p1.current
				task.defer(function()
					-- upvalues: Current1 (copy), UseRefResult (upval)
					if Current1 then
						Current1:CaptureFocus()
						Current1.CursorPosition = UseRefResult.current
					end
				end)
			end
		end)
		
		return function()
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, { p2 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), ContextActionService (upval), Text (copy)
		if not UseStateResult.activated or #UseStateResult.results == 0 then return end
		ContextActionService:BindCoreAction(Text, function()
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.Up, Enum.KeyCode.Down, Enum.KeyCode.Escape)
		
		return function()
			-- upvalues: ContextActionService (upval), Text (upval)
			ContextActionService:UnbindCoreAction(Text)
		end
	end, { UseStateResult.activated, #UseStateResult.results })
	
	return {
		isOpen = UseStateResult.activated and #UseStateResult.results > 0,
		results = UseStateResult.results,
		selectedIndex = UseStateResult.selectedIndex,
		keyboardIndex = UseStateResult.keyboardIndex,
		renderEntry = InternalProvidersModule.renderEntry,
		onTextChanged = ReactModule.useCallback(function(p3)
			-- upvalues: UseRefResult1 (copy), UseRefResult3 (copy), p1 (copy), UseRefResult (copy), InternalProvidersModule (upval), CryoModule (upval), UseStateResult2 (copy), UseRefResult2 (copy), config (upval)
			if UseRefResult1.current then return end
			local Current = UseRefResult3.current
			
			if not Current then return end
			local Current1 = p1.current
			local MatchTriggerResult = InternalProvidersModule.matchTrigger(p3, if Current1 and Current1.CursorPosition >= 0 then Current1.CursorPosition else UseRefResult.current)
			
			if MatchTriggerResult then
				local SearchResult = InternalProvidersModule.search(Current, MatchTriggerResult.query)
				
				if #SearchResult > 20 then
					SearchResult = CryoModule.List.getRange(SearchResult, 1, 20)
				end
				UseStateResult2({
					selectedIndex = 0,
					keyboardIndex = 0,
					activated = #SearchResult > 0,
					results = SearchResult,
					currentMatch = MatchTriggerResult
				})
				
				return
			elseif UseRefResult2.current.activated then
				UseStateResult2(config)
			end
		end, {}),
		setSelectedIndex = ReactModule.useCallback(function(Value)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(p3)
				-- upvalues: Value (copy)
				return {
					activated = p3.activated,
					results = p3.results,
					selectedIndex = math.clamp(Value, 1, (math.max(1, #p3.results))),
					keyboardIndex = p3.keyboardIndex,
					currentMatch = p3.currentMatch
				}
			end)
		end, {}),
		commitSelection = commitSelection,
		interceptSend = ReactModule.useCallback(function(TextBox, p3): boolean
			-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), spliceResult (copy)
			if not p3 then
				return false
			end
			local Current = UseRefResult2.current
			
			if not Current.activated or #Current.results == 0 then
				return false
			elseif Current.selectedIndex < 1 then
				return false
			else
				UseRefResult1.current = true
				spliceResult(Current.selectedIndex)
				task.defer(function()
					-- upvalues: UseRefResult1 (upval), TextBox (copy)
					UseRefResult1.current = false
					
					if TextBox then
						TextBox:CaptureFocus()
					end
				end)
				
				return true
			end
		end, {}),
		dismiss = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy), config (upval)
			UseStateResult2(config)
		end, {})
	}
end