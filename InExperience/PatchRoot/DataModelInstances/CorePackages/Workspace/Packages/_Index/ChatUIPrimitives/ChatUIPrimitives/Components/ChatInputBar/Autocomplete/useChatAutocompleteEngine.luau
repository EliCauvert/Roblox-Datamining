local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local InternalProvidersModule = require(script.Parent.internalProviders)
local FFlagExpChatAutocompleteOptimization = require(Parent.SharedFlags).FFlagExpChatAutocompleteOptimization
local FFlagExpChatAutocompleteLazyBuildModule = require(ChatUIPrimitives.Flags.FFlagExpChatAutocompleteLazyBuild)
local config = {
	activated = false,
	selectedIndex = 0,
	keyboardIndex = 0,
	currentMatch = nil,
	results = {}
}

local function _(p1, p2: number, p3: number, Text) --[[ Line: 47 | Named "spliceInto" ]]
	local Text1: string = p1.Text
	p1.Text = string.sub(Text1, 1, p2 - 1) .. Text .. string.sub(Text1, p3 + 1)
	p1.CursorPosition = p2 + #Text
end

return function(p1, p2) --[[ Line: 53 | Named "useChatAutocompleteEngine" ]]
	-- upvalues: ReactModule (copy), FFlagExpChatAutocompleteOptimization (copy), FFlagExpChatAutocompleteLazyBuildModule (copy), InternalProvidersModule (copy), config (copy), UserInputService (copy), ContextActionService (copy), CryoModule (copy)
	local Commands = if p2 then p2.commands else nil
	local Current: boolean = if p2 and p2.emojis then true else false
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 61 ]]
		-- upvalues: Commands (copy), Current (copy), FFlagExpChatAutocompleteOptimization (upval), FFlagExpChatAutocompleteLazyBuildModule (upval), InternalProvidersModule (upval)
		return if Commands or Current then if FFlagExpChatAutocompleteOptimization then {
			emoji = if Current and not FFlagExpChatAutocompleteLazyBuildModule then InternalProvidersModule.getEmojiStructure() else nil,
			command = if Commands then InternalProvidersModule.buildCommandTrie(Commands) else nil
		} else InternalProvidersModule.buildTrie(Commands, Current) else nil
	end, { Commands or false, Current })
	local UseStateResult, UseStateResult2 = ReactModule.useState(config)
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(UseStateResult)
	UseRefResult2.current = UseStateResult
	local UseRefResult3 = ReactModule.useRef(UseMemoResult)
	UseRefResult3.current = UseMemoResult
	local UseRefResult4 = ReactModule.useRef(Current)
	UseRefResult4.current = Current
	local Text = "ChatAutocompleteSink_" .. tostring(p1)
	ReactModule.useEffect(function() --[[ Line: 96 ]]
		-- upvalues: p1 (copy), p2 (copy), UseRefResult (copy)
		local Current = p1.current
		
		if not Current or not p2 then return end
		local Connection = Current:GetPropertyChangedSignal("CursorPosition"):Connect(function() --[[ Line: 101 ]]
			-- upvalues: Current (copy), UseRefResult (upval)
			local CursorPosition: number = Current.CursorPosition
			
			if CursorPosition >= 0 then
				UseRefResult.current = CursorPosition
			end
		end)
		
		return function() --[[ Line: 107 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { p1.current, p2 })
	
	local function _(p3) --[[ Line: 112 | Named "spliceResult" ]]
		-- upvalues: UseRefResult2 (copy), p1 (copy), InternalProvidersModule (upval), UseStateResult2 (copy), config (upval)
		local Current = UseRefResult2.current
		local Result = Current.results[p3]
		local Current1 = p1.current
		local CurrentMatch = Current.currentMatch
		
		if Result and Current1 and CurrentMatch then
			local ReplaceStart: number = CurrentMatch.replaceStart
			local FormatReplacementResult = InternalProvidersModule.formatReplacement(Result)
			local Text: string = Current1.Text
			Current1.Text = string.sub(Text, 1, ReplaceStart - 1) .. FormatReplacementResult .. string.sub(Text, CurrentMatch.replaceFinish + 1)
			Current1.CursorPosition = ReplaceStart + #FormatReplacementResult
			UseStateResult2(config)
			
			return
		end
	end
	
	local function commitSelection(p3) --[[ Line: 125 ]]
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy), p1 (copy), InternalProvidersModule (upval), UseStateResult2 (copy), config (upval)
		UseRefResult1.current = true
		local Current = UseRefResult2.current
		local Result = Current.results[p3]
		local Current1 = p1.current
		local CurrentMatch = Current.currentMatch
		
		if Result and Current1 and CurrentMatch then
			local ReplaceStart: number = CurrentMatch.replaceStart
			local FormatReplacementResult = InternalProvidersModule.formatReplacement(Result)
			local Text: string = Current1.Text
			Current1.Text = string.sub(Text, 1, ReplaceStart - 1) .. FormatReplacementResult .. string.sub(Text, CurrentMatch.replaceFinish + 1)
			Current1.CursorPosition = ReplaceStart + #FormatReplacementResult
			UseStateResult2(config)
		end
		task.defer(function() --[[ Line: 128 ]]
			-- upvalues: UseRefResult1 (upval), p1 (upval)
			UseRefResult1.current = false
			local Current = p1.current
			
			if Current then
				Current:CaptureFocus()
			end
		end)
	end
	
	ReactModule.useEffect(function() --[[ Line: 140 ]]
		-- upvalues: p2 (copy), UserInputService (upval), UseRefResult2 (copy), UseStateResult2 (copy), config (upval), p1 (copy), UseRefResult (copy)
		if not p2 then return end
		local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input) --[[ Line: 144 ]]
			-- upvalues: UseRefResult2 (upval), UseStateResult2 (upval), config (upval), p1 (upval), UseRefResult (upval)
			local Current = UseRefResult2.current
			
			if not Current.activated or #Current.results == 0 then return end
			if Input.KeyCode == Enum.KeyCode.Up then
				UseStateResult2(function(p3) --[[ Line: 151 ]]
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
				UseStateResult2(function(p3) --[[ Line: 169 ]]
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
				task.defer(function() --[[ Line: 185 ]]
					-- upvalues: Current1 (copy), UseRefResult (upval)
					if Current1 then
						Current1:CaptureFocus()
						Current1.CursorPosition = UseRefResult.current
					end
				end)
			end
		end)
		
		return function() --[[ Line: 193 ]]
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, { p2 })
	ReactModule.useEffect(function() --[[ Line: 198 ]]
		-- upvalues: UseStateResult (copy), ContextActionService (upval), Text (copy)
		if not UseStateResult.activated or #UseStateResult.results == 0 then return end
		ContextActionService:BindCoreAction(Text, function() --[[ Line: 202 ]]
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.Up, Enum.KeyCode.Down, Enum.KeyCode.Escape)
		
		return function() --[[ Line: 205 ]]
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
		onTextChanged = ReactModule.useCallback(function(p3) --[[ Line: 210 ]]
			-- upvalues: UseRefResult1 (copy), UseRefResult3 (copy), p1 (copy), UseRefResult (copy), UseRefResult4 (copy), InternalProvidersModule (upval), UseRefResult2 (copy), UseStateResult2 (copy), config (upval), FFlagExpChatAutocompleteOptimization (upval), FFlagExpChatAutocompleteLazyBuildModule (upval), CryoModule (upval)
			if UseRefResult1.current then return end
			local Current = UseRefResult3.current
			
			if not Current then return end
			local Current1 = p1.current
			local CursorPosition = if Current1 and Current1.CursorPosition >= 0 then Current1.CursorPosition else UseRefResult.current
			
			if UseRefResult4.current and Current1 then
				local MatchColonCompletionResult = InternalProvidersModule.matchColonCompletion(p3, CursorPosition)
				
				if MatchColonCompletionResult then
					UseRefResult1.current = true
					local ReplaceStart: number = MatchColonCompletionResult.replaceStart
					local Replacement = MatchColonCompletionResult.replacement
					local Text: string = Current1.Text
					Current1.Text = string.sub(Text, 1, ReplaceStart - 1) .. Replacement .. string.sub(Text, MatchColonCompletionResult.replaceFinish + 1)
					Current1.CursorPosition = ReplaceStart + #Replacement
					task.defer(function() --[[ Line: 228 ]]
						-- upvalues: UseRefResult1 (upval), p1 (upval)
						UseRefResult1.current = false
						local Current = p1.current
						
						if Current then
							Current:CaptureFocus()
						end
					end)
					
					if UseRefResult2.current.activated then
						UseStateResult2(config)
					end
					return
				end
			end
			local MatchTriggerResult = InternalProvidersModule.matchTrigger(p3, CursorPosition)
			
			if MatchTriggerResult then
				if FFlagExpChatAutocompleteOptimization and FFlagExpChatAutocompleteLazyBuildModule and UseRefResult4.current and not Current.emoji and string.sub(MatchTriggerResult.query, 1, 1) == ":" then
					Current.emoji = InternalProvidersModule.getEmojiStructure()
				end
				local SearchStructuresResult = if FFlagExpChatAutocompleteOptimization then InternalProvidersModule.searchStructures(Current, MatchTriggerResult.query) else InternalProvidersModule.search(Current, MatchTriggerResult.query)
				
				if #SearchStructuresResult > 20 then
					SearchStructuresResult = CryoModule.List.getRange(SearchStructuresResult, 1, 20)
				end
				UseStateResult2({
					selectedIndex = 0,
					keyboardIndex = 0,
					activated = #SearchStructuresResult > 0,
					results = SearchStructuresResult,
					currentMatch = MatchTriggerResult
				})
				
				return
			elseif UseRefResult2.current.activated then
				UseStateResult2(config)
			end
		end, {}),
		setSelectedIndex = ReactModule.useCallback(function(Value) --[[ Line: 309 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(p3) --[[ Line: 310 ]]
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
		interceptSend = ReactModule.useCallback(function(TextBox, p3): boolean --[[ Line: 276 ]]
			-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), p1 (copy), InternalProvidersModule (upval), UseStateResult2 (copy), config (upval)
			if not p3 then
				return false
			end
			local Current = UseRefResult2.current
			
			if not Current.activated or #Current.results == 0 then
				return false
			end
			if Current.selectedIndex < 1 then
				return false
			end
			UseRefResult1.current = true
			local Current1 = UseRefResult2.current
			local Result = Current1.results[Current.selectedIndex]
			local Current2 = p1.current
			local CurrentMatch = Current1.currentMatch
			
			if Result and Current2 and CurrentMatch then
				local ReplaceStart: number = CurrentMatch.replaceStart
				local FormatReplacementResult = InternalProvidersModule.formatReplacement(Result)
				local Text: string = Current2.Text
				Current2.Text = string.sub(Text, 1, ReplaceStart - 1) .. FormatReplacementResult .. string.sub(Text, CurrentMatch.replaceFinish + 1)
				Current2.CursorPosition = ReplaceStart + #FormatReplacementResult
				UseStateResult2(config)
			end
			task.defer(function() --[[ Line: 289 ]]
				-- upvalues: UseRefResult1 (upval), TextBox (copy)
				UseRefResult1.current = false
				
				if TextBox then
					TextBox:CaptureFocus()
				end
			end)
			
			return true
		end, {}),
		dismiss = ReactModule.useCallback(function() --[[ Line: 302 ]]
			-- upvalues: UseStateResult2 (copy), config (upval)
			UseStateResult2(config)
		end, {})
	}
end