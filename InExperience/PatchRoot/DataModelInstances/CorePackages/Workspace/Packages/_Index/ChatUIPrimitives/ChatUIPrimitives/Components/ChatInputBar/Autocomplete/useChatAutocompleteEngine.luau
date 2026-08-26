local contextActionService = game:GetService("ContextActionService")
local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local internalProvidersModule = require(script.Parent.internalProviders)
local fFlagExpChatEmojiInputParity = require(parent.SharedFlags).FFlagExpChatEmojiInputParity
local t = {
	activated = false,
	selectedIndex = 0,
	keyboardIndex = 0,
	currentMatch = nil,
	results = {}
}

local function _(p1, p2, p3, p4)
	local text = p1.Text
	p1.Text = string.sub(text, 1, p2 - 1) .. p3 .. string.sub(text, p3 + 1)
	p1.CursorPosition = p2 + #p4
end

return function(p1, p2)
	-- upvalues: reactModule (ref), internalProvidersModule (ref), t (ref), userInputService (ref), contextActionService (ref), fFlagExpChatEmojiInputParity (ref), cryoModule (ref)
	local var1 = if p2 then p2.commands else nil
	local var2 = if p2 and p2.emojis then true else false
	local var3 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), var2 (ref), internalProvidersModule (copy)
		return if var1 or var2 then internalProvidersModule.buildTrie(var1, var2) else nil
	end, { var1 or false, var2 })
	local var4, var5 = reactModule.useState(t)
	local var6 = reactModule.useRef(0)
	local var7 = reactModule.useRef(false)
	local var8 = reactModule.useRef(var4)
	var8.current = var4
	local var9 = reactModule.useRef(var3)
	var9.current = var3
	local var10 = reactModule.useRef(var2)
	var10.current = var2
	local text = "ChatAutocompleteSink_" .. tostring(p1)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p2 (ref), var6 (ref)
		local current = p1.current
		
		if current and p2 then
			local var11 = current:GetPropertyChangedSignal("CursorPosition"):Connect(function()
				-- upvalues: current (ref), var6 (copy)
				local cursorPosition = current.CursorPosition
				
				if cursorPosition >= 0 then
					var6.current = cursorPosition
				end
			end)
			
			return function()
				-- upvalues: var11 (ref)
				var11:Disconnect()
			end
		end
	end, { p1.current, p2 })
	
	local function _(p3)
		-- upvalues: var8 (ref), p1 (ref), internalProvidersModule (copy), var5 (ref), t (copy)
		local current = var8.current
		local var11 = current.results[p3]
		local current_1 = p1.current
		local currentMatch = current.currentMatch
		
		if var11 and current_1 and currentMatch then
			local replaceStart = currentMatch.replaceStart
			local replaceFinish = currentMatch.replaceFinish
			local var12 = internalProvidersModule.formatReplacement(var11)
			local text = current_1.Text
			current_1.Text = string.sub(text, 1, replaceStart - 1) .. var20 .. string.sub(text, replaceFinish + 1)
			current_1.CursorPosition = replaceStart + #var12
			var5(t)
			
			return
		end
	end
	
	local function commitSelection(p3)
		-- upvalues: var7 (ref), var8 (ref), p1 (ref), internalProvidersModule (copy), var5 (ref), t (copy)
		var7.current = true
		local current = var8.current
		local var11 = current.results[p3]
		local current_1 = p1.current
		local currentMatch = current.currentMatch
		
		if var11 and current_1 and currentMatch then
			local replaceStart = currentMatch.replaceStart
			local replaceFinish = currentMatch.replaceFinish
			local var12 = internalProvidersModule.formatReplacement(var11)
			local text = current_1.Text
			current_1.Text = string.sub(text, 1, replaceStart - 1) .. var22 .. string.sub(text, replaceFinish + 1)
			current_1.CursorPosition = replaceStart + #var12
			var5(t)
		end
		task.defer(function()
			-- upvalues: var7 (copy), p1 (copy)
			var7.current = false
			local current = p1.current
			
			if current then
				current:CaptureFocus()
			end
		end)
	end
	
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), userInputService (copy), var8 (ref), var5 (ref), t (copy), p1 (ref), var6 (ref)
		if p2 then
			local inputBeganConnection = userInputService.InputBegan:Connect(function(p3)
				-- upvalues: var8 (copy), var5 (copy), t (copy), p1 (copy), var6 (copy)
				local current = var8.current
				
				if not current.activated or #current.results == 0 then return end
				if p3.KeyCode == Enum.KeyCode.Up then
					var5(function(p4)
						local var11 = if p4.selectedIndex <= 0 then 1 elseif p4.selectedIndex == 1 then #p4.results else p4.selectedIndex - 1
						
						return {
							activated = p4.activated,
							results = p4.results,
							selectedIndex = var11,
							keyboardIndex = var11,
							currentMatch = p4.currentMatch
						}
					end)
					
					return
				elseif p3.KeyCode == Enum.KeyCode.Down then
					var5(function(p4)
						local var11 = p4.selectedIndex + 1
						
						if #p4.results < var11 then
							var11 = 1
						end
						return {
							activated = p4.activated,
							results = p4.results,
							selectedIndex = var11,
							keyboardIndex = var11,
							currentMatch = p4.currentMatch
						}
					end)
					
					return
				elseif p3.KeyCode == Enum.KeyCode.Escape then
					var5(t)
					local current_1 = p1.current
					task.defer(function()
						-- upvalues: current_1 (ref), var6 (copy)
						if current_1 then
							current_1:CaptureFocus()
							current_1.CursorPosition = var6.current
						end
					end)
				end
			end)
			
			return function()
				-- upvalues: inputBeganConnection (ref)
				inputBeganConnection:Disconnect()
			end
		end
	end, { p2 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), contextActionService (copy), text (ref)
		if var4.activated and #var4.results ~= 0 then
			contextActionService:BindCoreAction(text, function()
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.Up, Enum.KeyCode.Down, Enum.KeyCode.Escape)
			
			return function()
				-- upvalues: contextActionService (copy), text (copy)
				contextActionService:UnbindCoreAction(text)
			end
		end
	end, { var4.activated, #var4.results })
	
	return {
		isOpen = var4.activated and #var4.results > 0,
		results = var4.results,
		selectedIndex = var4.selectedIndex,
		keyboardIndex = var4.keyboardIndex,
		renderEntry = internalProvidersModule.renderEntry,
		onTextChanged = reactModule.useCallback(function(p3)
			-- upvalues: var7 (ref), var9 (ref), p1 (ref), var6 (ref), fFlagExpChatEmojiInputParity (copy), var10 (ref), internalProvidersModule (copy), var8 (ref), var5 (ref), t (copy), cryoModule (copy)
			if var7.current then return end
			local current = var9.current
			
			if not current then return end
			local current_1 = p1.current
			local var11 = if current_1 and current_1.CursorPosition >= 0 then current_1.CursorPosition else var6.current
			
			if fFlagExpChatEmojiInputParity and var10.current and current_1 then
				local var12 = internalProvidersModule.matchColonCompletion(p3, var11)
				
				if var12 then
					var7.current = true
					local replaceStart = var12.replaceStart
					local replaceFinish = var12.replaceFinish
					local replacement = var12.replacement
					local text = current_1.Text
					current_1.Text = string.sub(text, 1, replaceStart - 1) .. replacement .. string.sub(text, replaceFinish + 1)
					current_1.CursorPosition = replaceStart + #replacement
					task.defer(function()
						-- upvalues: var7 (copy), p1 (copy)
						var7.current = false
						local current = p1.current
						
						if current then
							current:CaptureFocus()
						end
					end)
					
					if var8.current.activated then
						var5(t)
					end
					return
				else
					local var13 = internalProvidersModule.matchTrigger(p3, var11)
					
					if var13 then
						local var14 = internalProvidersModule.search(current, var13.query)
						
						if #var14 > 20 then
							var14 = cryoModule.List.getRange(var14, 1, 20)
						end
						var5({
							selectedIndex = 0,
							keyboardIndex = 0,
							activated = #var14 > 0,
							results = var14,
							currentMatch = var13
						})
						
						return
					elseif var8.current.activated then
						var5(t)
					end
				end
			end
		end, {}),
		setSelectedIndex = reactModule.useCallback(function(p3)
			-- upvalues: var5 (ref)
			var5(function(p4)
				-- upvalues: p3 (ref)
				return {
					activated = p4.activated,
					results = p4.results,
					selectedIndex = math.clamp(p3, 1, math.max(1, #p4.results)),
					keyboardIndex = p4.keyboardIndex,
					currentMatch = p4.currentMatch
				}
			end)
		end, {}),
		commitSelection = commitSelection,
		interceptSend = reactModule.useCallback(function(p3, p4)
			-- upvalues: var8 (ref), var7 (ref), p1 (ref), internalProvidersModule (copy), var5 (ref), t (copy)
			if not p4 then
				return false
			end
			local current = var8.current
			
			if not current.activated or #current.results == 0 then
				return false
			elseif current.selectedIndex < 1 then
				return false
			end
			var7.current = true
			local current_1 = var8.current
			local selectedIndex = current_1.results[current.selectedIndex]
			local current_2 = p1.current
			local currentMatch = current_1.currentMatch
			
			if selectedIndex and current_2 and currentMatch then
				local replaceStart = currentMatch.replaceStart
				local replaceFinish = currentMatch.replaceFinish
				local var11 = internalProvidersModule.formatReplacement(selectedIndex)
				local text = current_2.Text
				current_2.Text = string.sub(text, 1, replaceStart - 1) .. var30 .. string.sub(text, replaceFinish + 1)
				current_2.CursorPosition = replaceStart + #var11
				var5(t)
			end
			task.defer(function()
				-- upvalues: var7 (copy), p3 (ref)
				var7.current = false
				
				if p3 then
					p3:CaptureFocus()
				end
			end)
			
			return true
		end, {}),
		dismiss = reactModule.useCallback(function()
			-- upvalues: var5 (ref), t (copy)
			var5(t)
		end, {})
	}
end