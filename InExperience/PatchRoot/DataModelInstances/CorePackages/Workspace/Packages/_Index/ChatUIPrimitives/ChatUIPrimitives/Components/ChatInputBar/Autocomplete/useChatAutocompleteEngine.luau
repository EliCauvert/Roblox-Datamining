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

local function _(p0, p1, p2, p3)
	local text = p0.Text
	p0.Text = string.sub(text, 1, p1 - 1) .. p3 .. string.sub(text, p2 + 1)
	p0.CursorPosition = p1 + #p3
end

return function(p4, p5)
	-- upvalues: reactModule (ref), internalProvidersModule (ref), t (ref), userInputService (ref), contextActionService (ref), fFlagExpChatEmojiInputParity (ref), cryoModule (ref)
	local var6 = if p5 then p5.commands else nil
	local var7 = if p5 and p5.emojis then true else false
	local var8 = reactModule.useMemo(function()
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
	local var15 = reactModule.useRef(var7)
	var15.current = var7
	local text = "ChatAutocompleteSink_" .. tostring(p4)
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), p5 (ref), var11 (ref)
		local current = p4.current
		
		if current and p5 then
			local var18 = current:GetPropertyChangedSignal("CursorPosition"):Connect(function()
				-- upvalues: current (ref), var11 (copy)
				local cursorPosition = current.CursorPosition
				
				if cursorPosition >= 0 then
					var11.current = cursorPosition
				end
			end)
			
			return function()
				-- upvalues: var18 (ref)
				var18:Disconnect()
			end
		end
	end, { p4.current, p5 })
	
	local function _(p6)
		-- upvalues: var13 (ref), p4 (ref), internalProvidersModule (copy), var10 (ref), t (copy)
		local current = var13.current
		local var19 = current.results[p6]
		local current_1 = p4.current
		local currentMatch = current.currentMatch
		
		if var19 and current_1 and currentMatch then
			local replaceStart = currentMatch.replaceStart
			local replaceFinish = currentMatch.replaceFinish
			local var20 = internalProvidersModule.formatReplacement(var19)
			local text = current_1.Text
			current_1.Text = string.sub(text, 1, replaceStart - 1) .. var20 .. string.sub(text, replaceFinish + 1)
			current_1.CursorPosition = replaceStart + #var20
			var10(t)
			
			return
		end
	end
	
	local function commitSelection(p7)
		-- upvalues: var12 (ref), var13 (ref), p4 (ref), internalProvidersModule (copy), var10 (ref), t (copy)
		var12.current = true
		local current = var13.current
		local var21 = current.results[p7]
		local current_1 = p4.current
		local currentMatch = current.currentMatch
		
		if var21 and current_1 and currentMatch then
			local replaceStart = currentMatch.replaceStart
			local replaceFinish = currentMatch.replaceFinish
			local var22 = internalProvidersModule.formatReplacement(var21)
			local text = current_1.Text
			current_1.Text = string.sub(text, 1, replaceStart - 1) .. var22 .. string.sub(text, replaceFinish + 1)
			current_1.CursorPosition = replaceStart + #var22
			var10(t)
		end
		task.defer(function()
			-- upvalues: var12 (copy), p4 (copy)
			var12.current = false
			local current = p4.current
			
			if current then
				current:CaptureFocus()
			end
		end)
	end
	
	reactModule.useEffect(function()
		-- upvalues: p5 (ref), userInputService (copy), var13 (ref), var10 (ref), t (copy), p4 (ref), var11 (ref)
		if p5 then
			local inputBeganConnection = userInputService.InputBegan:Connect(function(p8)
				-- upvalues: var13 (copy), var10 (copy), t (copy), p4 (copy), var11 (copy)
				local current = var13.current
				
				if not current.activated or #current.results == 0 then return end
				if p8.KeyCode == Enum.KeyCode.Up then
					var10(function(p9)
						local var24 = if p9.selectedIndex <= 0 then 1 elseif p9.selectedIndex == 1 then #p9.results else p9.selectedIndex - 1
						
						return {
							activated = p9.activated,
							results = p9.results,
							selectedIndex = var24,
							keyboardIndex = var24,
							currentMatch = p9.currentMatch
						}
					end)
					
					return
				elseif p8.KeyCode == Enum.KeyCode.Down then
					var10(function(p10)
						local var25 = p10.selectedIndex + 1
						
						if #p10.results < var25 then
							var25 = 1
						end
						return {
							activated = p10.activated,
							results = p10.results,
							selectedIndex = var25,
							keyboardIndex = var25,
							currentMatch = p10.currentMatch
						}
					end)
					
					return
				elseif p8.KeyCode == Enum.KeyCode.Escape then
					var10(t)
					local current_1 = p4.current
					task.defer(function()
						-- upvalues: current_1 (ref), var11 (copy)
						if current_1 then
							current_1:CaptureFocus()
							current_1.CursorPosition = var11.current
						end
					end)
				end
			end)
			
			return function()
				-- upvalues: inputBeganConnection (ref)
				inputBeganConnection:Disconnect()
			end
		end
	end, { p5 })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), contextActionService (copy), text (ref)
		if var9.activated and #var9.results ~= 0 then
			contextActionService:BindCoreAction(text, function()
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.Up, Enum.KeyCode.Down, Enum.KeyCode.Escape)
			
			return function()
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
		onTextChanged = reactModule.useCallback(function(p11)
			-- upvalues: var12 (ref), var14 (ref), p4 (ref), var11 (ref), fFlagExpChatEmojiInputParity (copy), var15 (ref), internalProvidersModule (copy), var13 (ref), var10 (ref), t (copy), cryoModule (copy)
			if var12.current then return end
			local current = var14.current
			
			if not current then return end
			local current_1 = p4.current
			local var26 = if current_1 and current_1.CursorPosition >= 0 then current_1.CursorPosition else var11.current
			
			if fFlagExpChatEmojiInputParity and var15.current and current_1 then
				local var27 = internalProvidersModule.matchColonCompletion(p11, var26)
				
				if var27 then
					var12.current = true
					local replaceStart = var27.replaceStart
					local replaceFinish = var27.replaceFinish
					local replacement = var27.replacement
					local text = current_1.Text
					current_1.Text = string.sub(text, 1, replaceStart - 1) .. replacement .. string.sub(text, replaceFinish + 1)
					current_1.CursorPosition = replaceStart + #replacement
					task.defer(function()
						-- upvalues: var12 (copy), p4 (copy)
						var12.current = false
						local current = p4.current
						
						if current then
							current:CaptureFocus()
						end
					end)
					
					if var13.current.activated then
						var10(t)
					end
					return
				else
					local var28 = internalProvidersModule.matchTrigger(p11, var26)
					
					if var28 then
						local var29 = internalProvidersModule.search(current, var28.query)
						
						if #var29 > 20 then
							var29 = cryoModule.List.getRange(var29, 1, 20)
						end
						var10({
							selectedIndex = 0,
							keyboardIndex = 0,
							activated = #var29 > 0,
							results = var29,
							currentMatch = var28
						})
						
						return
					elseif var13.current.activated then
						var10(t)
					end
				end
			end
		end, {}),
		setSelectedIndex = reactModule.useCallback(function(p12)
			-- upvalues: var10 (ref)
			var10(function(p13)
				-- upvalues: p12 (ref)
				return {
					activated = p13.activated,
					results = p13.results,
					selectedIndex = math.clamp(p12, 1, math.max(1, #p13.results)),
					keyboardIndex = p13.keyboardIndex,
					currentMatch = p13.currentMatch
				}
			end)
		end, {}),
		commitSelection = commitSelection,
		interceptSend = reactModule.useCallback(function(p14, p15)
			-- upvalues: var13 (ref), var12 (ref), p4 (ref), internalProvidersModule (copy), var10 (ref), t (copy)
			if not p15 then
				return false
			end
			local current = var13.current
			
			if not current.activated or #current.results == 0 then
				return false
			elseif current.selectedIndex < 1 then
				return false
			end
			var12.current = true
			local current_1 = var13.current
			local selectedIndex = current_1.results[current.selectedIndex]
			local current_2 = p4.current
			local currentMatch = current_1.currentMatch
			
			if selectedIndex and current_2 and currentMatch then
				local replaceStart = currentMatch.replaceStart
				local replaceFinish = currentMatch.replaceFinish
				local var30 = internalProvidersModule.formatReplacement(selectedIndex)
				local text = current_2.Text
				current_2.Text = string.sub(text, 1, replaceStart - 1) .. var30 .. string.sub(text, replaceFinish + 1)
				current_2.CursorPosition = replaceStart + #var30
				var10(t)
			end
			task.defer(function()
				-- upvalues: var12 (copy), p14 (ref)
				var12.current = false
				
				if p14 then
					p14:CaptureFocus()
				end
			end)
			
			return true
		end, {}),
		dismiss = reactModule.useCallback(function()
			-- upvalues: var10 (ref), t (copy)
			var10(t)
		end, {})
	}
end