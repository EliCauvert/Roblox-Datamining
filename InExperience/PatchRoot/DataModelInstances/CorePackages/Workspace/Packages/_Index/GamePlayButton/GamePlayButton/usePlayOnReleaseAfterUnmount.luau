local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("GamePlayButton").Parent.React)
local pressCaptureUtilsModule = require(script.Parent.PressCaptureUtils)
local isPointInsideBounds = pressCaptureUtilsModule.isPointInsideBounds
local getInputPosition = pressCaptureUtilsModule.getInputPosition
local isPressInput = pressCaptureUtilsModule.isPressInput

local function _(p1)
	if p1.inputEndedConnection then
		p1.inputEndedConnection:Disconnect()
		p1.inputEndedConnection = nil
	end
end

local _ = function(p1)
	if p1.destroyingConnection then
		p1.destroyingConnection:Disconnect()
		p1.destroyingConnection = nil
	end
	if p1.instanceInputEndedConnection then
		p1.instanceInputEndedConnection:Disconnect()
		p1.instanceInputEndedConnection = nil
	end
end

local _ = function(p1)
	p1.isPressed = false
	p1.boundsPosition = nil
	p1.boundsSize = nil
	
	if p1.destroyingConnection then
		p1.destroyingConnection:Disconnect()
		p1.destroyingConnection = nil
	end
	if p1.instanceInputEndedConnection then
		p1.instanceInputEndedConnection:Disconnect()
		p1.instanceInputEndedConnection = nil
	end
end

local _ = function(p1)
	p1.isPressed = false
	p1.boundsPosition = nil
	p1.boundsSize = nil
	
	if p1.destroyingConnection then
		p1.destroyingConnection:Disconnect()
		p1.destroyingConnection = nil
	end
	if p1.instanceInputEndedConnection then
		p1.instanceInputEndedConnection:Disconnect()
		p1.instanceInputEndedConnection = nil
	end
	if p1.inputEndedConnection then
		p1.inputEndedConnection:Disconnect()
		p1.inputEndedConnection = nil
	end
end

return function(p1)
	-- upvalues: reactModule (ref), getInputPosition (ref), isPointInsideBounds (ref), userInputService (ref), isPressInput (ref)
	local var1 = reactModule.useRef(p1)
	var1.current = p1
	local var2 = reactModule.useRef({
		isPressed = false,
		boundsPosition = nil,
		boundsSize = nil,
		destroyingConnection = nil,
		inputEndedConnection = nil,
		instanceInputEndedConnection = nil
	})
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(false)
	local var6 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var5 (ref), var1 (ref)
		local current = var2.current
		
		if current.isPressed then
			if var5.current then return end
		else
			var5.current = false
		end
		var5.current = true
		current.isPressed = false
		current.boundsPosition = nil
		current.boundsSize = nil
		
		if current.destroyingConnection then
			current.destroyingConnection:Disconnect()
			current.destroyingConnection = nil
		end
		if current.instanceInputEndedConnection then
			current.instanceInputEndedConnection:Disconnect()
			current.instanceInputEndedConnection = nil
		end
		if current.inputEndedConnection then
			current.inputEndedConnection:Disconnect()
			current.inputEndedConnection = nil
		end
		var1.current()
	end, {})
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), getInputPosition (copy), isPointInsideBounds (copy), var6 (ref)
		local current = var2.current
		
		if current.isPressed and current.boundsPosition and current.boundsSize then
			if isPointInsideBounds(getInputPosition(p2), current.boundsPosition, current.boundsSize) then
				var6()
				
				return
			end
			current.isPressed = false
			current.boundsPosition = nil
			current.boundsSize = nil
			
			if current.destroyingConnection then
				current.destroyingConnection:Disconnect()
				current.destroyingConnection = nil
			end
			if current.instanceInputEndedConnection then
				current.instanceInputEndedConnection:Disconnect()
				current.instanceInputEndedConnection = nil
			end
			if current.inputEndedConnection then
				current.inputEndedConnection:Disconnect()
				current.inputEndedConnection = nil
			end
			return
		else
			current.isPressed = false
			current.boundsPosition = nil
			current.boundsSize = nil
			
			if current.destroyingConnection then
				current.destroyingConnection:Disconnect()
				current.destroyingConnection = nil
			end
			if current.instanceInputEndedConnection then
				current.instanceInputEndedConnection:Disconnect()
				current.instanceInputEndedConnection = nil
			end
			if current.inputEndedConnection then
				current.inputEndedConnection:Disconnect()
				current.inputEndedConnection = nil
			end
		end
	end, { var6 })
	local var8 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), userInputService (copy), isPressInput (copy), var7 (ref)
		local current = var2.current
		
		if current.inputEndedConnection then
			return
		end
		current.inputEndedConnection = userInputService.InputEnded:Connect(function(p2)
			-- upvalues: isPressInput (copy), var7 (copy)
			if isPressInput(p2) then
				var7(p2)
				
				return
			end
		end)
	end, { var7 })
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), var8 (ref), isPressInput (copy), var5 (ref)
		if p2 == nil then
			return function() end
		end
		local function onPressInstanceDestroyed()
			-- upvalues: var2 (copy), var8 (copy)
			if not var2.current.isPressed then return end
			local current = var2.current
			
			if current.destroyingConnection then
				current.destroyingConnection:Disconnect()
				current.destroyingConnection = nil
			end
			if current.instanceInputEndedConnection then
				current.instanceInputEndedConnection:Disconnect()
				current.instanceInputEndedConnection = nil
			end
			var8()
		end
		
		local inputBeganConnection = p2.InputBegan:Connect(function(p3)
			-- upvalues: isPressInput (copy), var2 (copy), var5 (copy), p2 (ref), onPressInstanceDestroyed (ref)
			if not isPressInput(p3) then return end
			local current = var2.current
			var5.current = false
			current.isPressed = true
			current.boundsPosition = p2.AbsolutePosition
			current.boundsSize = p2.AbsoluteSize
			
			if current.destroyingConnection then
				current.destroyingConnection:Disconnect()
				current.destroyingConnection = nil
			end
			if current.instanceInputEndedConnection then
				current.instanceInputEndedConnection:Disconnect()
				current.instanceInputEndedConnection = nil
			end
			current.destroyingConnection = p2.Destroying:Connect(onPressInstanceDestroyed)
			current.instanceInputEndedConnection = p2.InputEnded:Connect(function(p4)
				-- upvalues: isPressInput (copy), var2 (copy)
				if not isPressInput(p4) then return end
				if var2.current.isPressed then
					local current = var2.current
					current.isPressed = false
					current.boundsPosition = nil
					current.boundsSize = nil
					
					if current.destroyingConnection then
						current.destroyingConnection:Disconnect()
						current.destroyingConnection = nil
					end
					if current.instanceInputEndedConnection then
						current.instanceInputEndedConnection:Disconnect()
						current.instanceInputEndedConnection = nil
					end
					if current.inputEndedConnection then
						current.inputEndedConnection:Disconnect()
						current.inputEndedConnection = nil
					end
				end
			end)
		end)
		
		return function()
			-- upvalues: inputBeganConnection (ref)
			inputBeganConnection:Disconnect()
		end
	end, { var8 })
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), var9 (ref)
		if var3.current then
			var3.current()
			var3.current = nil
		end
		if p2 and p2:IsA("GuiObject") then
			var3.current = var9(p2)
		end
	end, { var9 })
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), var9 (ref)
		if var4.current then
			var4.current()
			var4.current = nil
		end
		if p2 and p2:IsA("GuiObject") then
			var4.current = var9(p2)
		end
	end, { var9 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var4 (ref), var2 (ref), var8 (ref)
		return function()
			-- upvalues: var3 (copy), var4 (copy), var2 (copy), var8 (copy)
			if var3.current then
				var3.current()
				var3.current = nil
			end
			if var4.current then
				var4.current()
				var4.current = nil
			end
			local current = var2.current
			
			if current.isPressed and not current.inputEndedConnection then
				if current.destroyingConnection then
					current.destroyingConnection:Disconnect()
					current.destroyingConnection = nil
				end
				if current.instanceInputEndedConnection then
					current.instanceInputEndedConnection:Disconnect()
					current.instanceInputEndedConnection = nil
				end
				var8()
				
				return
			elseif not current.inputEndedConnection then
				current.isPressed = false
				current.boundsPosition = nil
				current.boundsSize = nil
				
				if current.destroyingConnection then
					current.destroyingConnection:Disconnect()
					current.destroyingConnection = nil
				end
				if current.instanceInputEndedConnection then
					current.instanceInputEndedConnection:Disconnect()
					current.instanceInputEndedConnection = nil
				end
			end
		end
	end, { var8 })
	
	return {
		onActivated = var6,
		playButtonRef = var10,
		loadingCaptureRef = var11
	}
end