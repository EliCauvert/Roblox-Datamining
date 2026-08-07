local contextActionService = game:GetService("ContextActionService")
local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local internalProvidersModule = require(script.Parent.internalProviders)
local t = {
	activated = false,
	selectedIndex = 0,
	keyboardIndex = 0,
	currentMatch = nil,
	results = {}
}

return function(p0, p1) --[[ line: 40 | named "useChatAutocompleteEngine" ]]
	-- upvalues: reactModule (ref), internalProvidersModule (ref), t (ref), userInputService (ref), contextActionService (ref), cryoModule (ref)
	local var6 = if p1 then p1.commands else nil
	local var7 = if p1 and p1.emojis then true else false
	local var8 = reactModule.useMemo(function() --[[ line: 48 ]]
		-- upvalues: var6 (ref), var7 (ref), internalProvidersModule (copy)
		return if var6 or var7 then internalProvidersModule.buildTrie(var6, var7) else nil
	end, { var6 or false, var7 })
	local var9, var10 = reactModule.useState(t)
	local var11 = reactModule.useRef(0)
	local var12 = reactModule.useRef(false)
	local var13 = reactModule.useRef(var9)
	var13.current = var9
	local var14 = reactModule.useRef(var8)
	var14.current = var8
	local text = "ChatAutocompleteSink_" .. tostring(p0)
	reactModule.useEffect(function() --[[ line: 69 ]]
		-- upvalues: p0 (ref), p1 (ref), var11 (ref)
		local current = p0.current
		
		if current and p1 then
			local var18 = current:GetPropertyChangedSignal("CursorPosition"):Connect(function() --[[ line: 74 ]]
				-- upvalues: current (ref), var11 (copy)
				local cursorPosition = current.CursorPosition
				
				if cursorPosition >= 0 then
					var11.current = cursorPosition
				end
			end)
			
			return function() --[[ line: 80 ]]
				-- upvalues: var18 (ref)
				var18:Disconnect()
			end
		end
	end, { p0.current, p1 })
	
	local function spliceResult(p2) --[[ line: 85 ]]
		-- upvalues: var13 (ref), p0 (ref), internalProvidersModule (copy), var10 (ref), t (copy)
		local current = var13.current
		local var19 = current.results[p2]
		local current_1 = p0.current
		local currentMatch = current.currentMatch
		
		if var19 and current_1 and currentMatch then
			local var20 = internalProvidersModule.formatReplacement(var19)
			local text = current_1.Text
			current_1.Text = string.sub(text, 1, currentMatch.replaceStart - 1) .. var20 .. string.sub(text, currentMatch.replaceFinish + 1)
			current_1.CursorPosition = currentMatch.replaceStart + #var20
			var10(t)
			
			return
		end
	end
	
	local function commitSelection(p3) --[[ line: 106 ]]
		-- upvalues: var12 (ref), spliceResult (ref), p0 (ref)
		var12.current = true
		spliceResult(p3)
		task.defer(function() --[[ line: 109 ]]
			-- upvalues: var12 (copy), p0 (copy)
			var12.current = false
			local current = p0.current
			
			if current then
				current:CaptureFocus()
			end
		end)
	end
	
	reactModule.useEffect(function() --[[ line: 121 ]]
		-- upvalues: p1 (ref), userInputService (copy), var13 (ref), var10 (ref), t (copy), p0 (ref), var11 (ref)
		if p1 then
			local inputBeganConnection = userInputService.InputBegan:Connect(function(p4) --[[ line: 125 ]]
				-- upvalues: var13 (copy), var10 (copy), t (copy), p0 (copy), var11 (copy)
				local current = var13.current
				
				if not current.activated or #current.results == 0 then return end
				if p4.KeyCode == Enum.KeyCode.Up then
					var10(function(p5) --[[ line: 132 ]]
						local var22 = if p5.selectedIndex <= 0 then 1 elseif p5.selectedIndex == 1 then #p5.results else p5.selectedIndex - 1
						
						return {
							activated = p5.activated,
							results = p5.results,
							selectedIndex = var22,
							keyboardIndex = var22,
							currentMatch = p5.currentMatch
						}
					end)
					
					return
				elseif p4.KeyCode == Enum.KeyCode.Down then
					var10(function(p6) --[[ line: 150 ]]
						local var23 = p6.selectedIndex + 1
						
						if #p6.results < var23 then
							var23 = 1
						end
						return {
							activated = p6.activated,
							results = p6.results,
							selectedIndex = var23,
							keyboardIndex = var23,
							currentMatch = p6.currentMatch
						}
					end)
					
					return
				elseif p4.KeyCode == Enum.KeyCode.Escape then
					var10(t)
					local current_1 = p0.current
					task.defer(function() --[[ line: 166 ]]
						-- upvalues: current_1 (ref), var11 (copy)
						if current_1 then
							current_1:CaptureFocus()
							current_1.CursorPosition = var11.current
						end
					end)
				end
			end)
			
			return function() --[[ line: 174 ]]
				-- upvalues: inputBeganConnection (ref)
				inputBeganConnection:Disconnect()
			end
		end
	end, { p1 })
	reactModule.useEffect(function() --[[ line: 179 ]]
		-- upvalues: var9 (ref), contextActionService (copy), text (ref)
		if var9.activated and #var9.results ~= 0 then
			contextActionService:BindCoreAction(text, function() --[[ line: 183 ]]
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.Up, Enum.KeyCode.Down, Enum.KeyCode.Escape)
			
			return function() --[[ line: 186 ]]
				-- upvalues: contextActionService (copy), text (copy)
				contextActionService:UnbindCoreAction(text)
			end
		end
	end, { var9.activated, #var9.results })
	
	return {
		isOpen = var9.activated and #var9.results > 0,
		results = var9.results,
		selectedIndex = var9.selectedIndex,
		keyboardIndex = var9.keyboardIndex,
		renderEntry = internalProvidersModule.renderEntry,
		onTextChanged = reactModule.useCallback(function(p7) --[[ line: 191 ]]
			-- upvalues: var12 (ref), var14 (ref), p0 (ref), var11 (ref), internalProvidersModule (copy), cryoModule (copy), var10 (ref), var13 (ref), t (copy)
			if var12.current then return end
			local current = var14.current
			
			if not current then return end
			local current_1 = p0.current
			local var24 = internalProvidersModule.matchTrigger(p7, if current_1 and current_1.CursorPosition >= 0 then current_1.CursorPosition else var11.current)
			
			if var24 then
				local var25 = internalProvidersModule.search(current, var24.query)
				
				if #var25 > 20 then
					var25 = cryoModule.List.getRange(var25, 1, 20)
				end
				var10({
					selectedIndex = 0,
					keyboardIndex = 0,
					activated = #var25 > 0,
					results = var25,
					currentMatch = var24
				})
				
				return
			elseif var13.current.activated then
				var10(t)
			end
		end, {}),
		setSelectedIndex = reactModule.useCallback(function(p8) --[[ line: 256 ]]
			-- upvalues: var10 (ref)
			var10(function(p9) --[[ line: 257 ]]
				-- upvalues: p8 (ref)
				return {
					activated = p9.activated,
					results = p9.results,
					selectedIndex = math.clamp(p8, 1, math.max(1, #p9.results)),
					keyboardIndex = p9.keyboardIndex,
					currentMatch = p9.currentMatch
				}
			end)
		end, {}),
		commitSelection = commitSelection,
		interceptSend = reactModule.useCallback(function(p10, p11) --[[ line: 223 ]]
			-- upvalues: var13 (ref), var12 (ref), spliceResult (ref)
			if not p11 then
				return false
			end
			local current = var13.current
			
			if not current.activated or #current.results == 0 then
				return false
			elseif current.selectedIndex < 1 then
				return false
			end
			var12.current = true
			spliceResult(current.selectedIndex)
			task.defer(function() --[[ line: 236 ]]
				-- upvalues: var12 (copy), p10 (ref)
				var12.current = false
				
				if p10 then
					p10:CaptureFocus()
				end
			end)
			
			return true
		end, {}),
		dismiss = reactModule.useCallback(function() --[[ line: 249 ]]
			-- upvalues: var10 (ref), t (copy)
			var10(t)
		end, {})
	}
end