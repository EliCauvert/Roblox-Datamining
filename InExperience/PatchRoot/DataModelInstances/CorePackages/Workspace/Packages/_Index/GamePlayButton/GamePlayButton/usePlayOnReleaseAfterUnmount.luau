local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("GamePlayButton").Parent.React)
local pressCaptureUtilsModule = require(script.Parent.PressCaptureUtils)
local isPointInsideBounds = pressCaptureUtilsModule.isPointInsideBounds
local getInputPosition = pressCaptureUtilsModule.getInputPosition
local isPressInput = pressCaptureUtilsModule.isPressInput

local function _(p0)
	if p0.inputEndedConnection then
		p0.inputEndedConnection:Disconnect()
		p0.inputEndedConnection = nil
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

local _ = function(p2)
	p2.isPressed = false
	p2.boundsPosition = nil
	p2.boundsSize = nil
	
	if p2.destroyingConnection then
		p2.destroyingConnection:Disconnect()
		p2.destroyingConnection = nil
	end
	if p2.instanceInputEndedConnection then
		p2.instanceInputEndedConnection:Disconnect()
		p2.instanceInputEndedConnection = nil
	end
end

local _ = function(p3)
	p3.isPressed = false
	p3.boundsPosition = nil
	p3.boundsSize = nil
	
	if p3.destroyingConnection then
		p3.destroyingConnection:Disconnect()
		p3.destroyingConnection = nil
	end
	if p3.instanceInputEndedConnection then
		p3.instanceInputEndedConnection:Disconnect()
		p3.instanceInputEndedConnection = nil
	end
	if p3.inputEndedConnection then
		p3.inputEndedConnection:Disconnect()
		p3.inputEndedConnection = nil
	end
end

return function(p4)
	-- upvalues: reactModule (ref), getInputPosition (ref), isPointInsideBounds (ref), userInputService (ref), isPressInput (ref)
	local var3 = reactModule.useRef(p4)
	var3.current = p4
	local var4 = reactModule.useRef({
		isPressed = false,
		boundsPosition = nil,
		boundsSize = nil,
		destroyingConnection = nil,
		inputEndedConnection = nil,
		instanceInputEndedConnection = nil
	})
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(false)
	local var8 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var7 (ref), var3 (ref)
		local current = var4.current
		
		if current.isPressed then
			if var7.current then return end
		else
			var7.current = false
		end
		var7.current = true
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
		var3.current()
	end, {})
	local var9 = reactModule.useCallback(function(p5)
		-- upvalues: var4 (ref), getInputPosition (copy), isPointInsideBounds (copy), var8 (ref)
		local current = var4.current
		
		if current.isPressed and current.boundsPosition and current.boundsSize then
			if isPointInsideBounds(getInputPosition(p5), current.boundsPosition, current.boundsSize) then
				var8()
				
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
	end, { var8 })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), userInputService (copy), isPressInput (copy), var9 (ref)
		local current = var4.current
		
		if current.inputEndedConnection then
			return
		end
		current.inputEndedConnection = userInputService.InputEnded:Connect(function(p6)
			-- upvalues: isPressInput (copy), var9 (copy)
			if isPressInput(p6) then
				var9(p6)
				
				return
			end
		end)
	end, { var9 })
	local var11 = reactModule.useCallback(function(p7)
		-- upvalues: var4 (ref), var10 (ref), isPressInput (copy), var7 (ref)
		if p7 == nil then
			return function() end
		end
		local function onPressInstanceDestroyed()
			-- upvalues: var4 (copy), var10 (copy)
			if not var4.current.isPressed then return end
			local current = var4.current
			
			if current.destroyingConnection then
				current.destroyingConnection:Disconnect()
				current.destroyingConnection = nil
			end
			if current.instanceInputEndedConnection then
				current.instanceInputEndedConnection:Disconnect()
				current.instanceInputEndedConnection = nil
			end
			var10()
		end
		
		local inputBeganConnection = p7.InputBegan:Connect(function(p8)
			-- upvalues: isPressInput (copy), var4 (copy), var7 (copy), p7 (ref), onPressInstanceDestroyed (ref)
			if not isPressInput(p8) then return end
			local current = var4.current
			var7.current = false
			current.isPressed = true
			current.boundsPosition = p7.AbsolutePosition
			current.boundsSize = p7.AbsoluteSize
			
			if current.destroyingConnection then
				current.destroyingConnection:Disconnect()
				current.destroyingConnection = nil
			end
			if current.instanceInputEndedConnection then
				current.instanceInputEndedConnection:Disconnect()
				current.instanceInputEndedConnection = nil
			end
			current.destroyingConnection = p7.Destroying:Connect(onPressInstanceDestroyed)
			current.instanceInputEndedConnection = p7.InputEnded:Connect(function(p9)
				-- upvalues: isPressInput (copy), var4 (copy)
				if not isPressInput(p9) then return end
				if var4.current.isPressed then
					local current = var4.current
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
	end, { var10 })
	local var12 = reactModule.useCallback(function(p10)
		-- upvalues: var5 (ref), var11 (ref)
		if var5.current then
			var5.current()
			var5.current = nil
		end
		if p10 and p10:IsA("GuiObject") then
			var5.current = var11(p10)
		end
	end, { var11 })
	local var13 = reactModule.useCallback(function(p11)
		-- upvalues: var6 (ref), var11 (ref)
		if var6.current then
			var6.current()
			var6.current = nil
		end
		if p11 and p11:IsA("GuiObject") then
			var6.current = var11(p11)
		end
	end, { var11 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var6 (ref), var4 (ref), var10 (ref)
		return function()
			-- upvalues: var5 (copy), var6 (copy), var4 (copy), var10 (copy)
			if var5.current then
				var5.current()
				var5.current = nil
			end
			if var6.current then
				var6.current()
				var6.current = nil
			end
			local current = var4.current
			
			if current.isPressed and not current.inputEndedConnection then
				if current.destroyingConnection then
					current.destroyingConnection:Disconnect()
					current.destroyingConnection = nil
				end
				if current.instanceInputEndedConnection then
					current.instanceInputEndedConnection:Disconnect()
					current.instanceInputEndedConnection = nil
				end
				var10()
				
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
	end, { var10 })
	
	return {
		onActivated = var8,
		playButtonRef = var12,
		loadingCaptureRef = var13
	}
end