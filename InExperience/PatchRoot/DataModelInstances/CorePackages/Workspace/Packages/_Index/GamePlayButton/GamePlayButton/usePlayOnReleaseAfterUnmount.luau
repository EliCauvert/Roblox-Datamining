local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script:FindFirstAncestor("GamePlayButton").Parent.React)
local PressCaptureUtilsModule = require(script.Parent.PressCaptureUtils)
local IsPointInsideBoundsFunction = PressCaptureUtilsModule.isPointInsideBounds
local GetInputPositionFunction = PressCaptureUtilsModule.getInputPosition
local IsPressInputFunction = PressCaptureUtilsModule.isPressInput

local function _(p1) --[[ Line: 21 | Named "disconnectGlobalInputEnded" ]]
	if p1.inputEndedConnection then
		p1.inputEndedConnection:Disconnect()
		p1.inputEndedConnection = nil
	end
end

local _ = function(p1) --[[ Line: 28 | Named "disconnectInstanceListeners" ]]
	if p1.destroyingConnection then
		p1.destroyingConnection:Disconnect()
		p1.destroyingConnection = nil
	end
	if p1.instanceInputEndedConnection then
		p1.instanceInputEndedConnection:Disconnect()
		p1.instanceInputEndedConnection = nil
	end
end

local _ = function(p1) --[[ Line: 39 | Named "clearPressTracking" ]]
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

local _ = function(p1) --[[ Line: 46 | Named "disconnectAllPressCapture" ]]
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

return function(Current) --[[ Line: 51 ]]
	-- upvalues: ReactModule (copy), GetInputPositionFunction (copy), IsPointInsideBoundsFunction (copy), UserInputService (copy), IsPressInputFunction (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseRefResult1 = ReactModule.useRef({
		isPressed = false,
		boundsPosition = nil,
		boundsSize = nil,
		destroyingConnection = nil,
		inputEndedConnection = nil,
		instanceInputEndedConnection = nil
	})
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 72 ]]
		-- upvalues: UseRefResult1 (copy), UseRefResult4 (copy), UseRefResult (copy)
		local Current = UseRefResult1.current
		
		if not Current.isPressed then
			UseRefResult4.current = false
		elseif UseRefResult4.current then return end
		UseRefResult4.current = true
		Current.isPressed = false
		Current.boundsPosition = nil
		Current.boundsSize = nil
		
		if Current.destroyingConnection then
			Current.destroyingConnection:Disconnect()
			Current.destroyingConnection = nil
		end
		if Current.instanceInputEndedConnection then
			Current.instanceInputEndedConnection:Disconnect()
			Current.instanceInputEndedConnection = nil
		end
		if Current.inputEndedConnection then
			Current.inputEndedConnection:Disconnect()
			Current.inputEndedConnection = nil
		end
		UseRefResult.current()
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p1) --[[ Line: 87 ]]
		-- upvalues: UseRefResult1 (copy), GetInputPositionFunction (upval), IsPointInsideBoundsFunction (upval), UseResult (copy)
		local Current = UseRefResult1.current
		
		if Current.isPressed and Current.boundsPosition and Current.boundsSize then
			if IsPointInsideBoundsFunction(GetInputPositionFunction(p1), Current.boundsPosition, Current.boundsSize) then
				UseResult()
				
				return
			end
			Current.isPressed = false
			Current.boundsPosition = nil
			Current.boundsSize = nil
			
			if Current.destroyingConnection then
				Current.destroyingConnection:Disconnect()
				Current.destroyingConnection = nil
			end
			if Current.instanceInputEndedConnection then
				Current.instanceInputEndedConnection:Disconnect()
				Current.instanceInputEndedConnection = nil
			end
			if Current.inputEndedConnection then
				Current.inputEndedConnection:Disconnect()
				Current.inputEndedConnection = nil
			end
			return
		else
			Current.isPressed = false
			Current.boundsPosition = nil
			Current.boundsSize = nil
			
			if Current.destroyingConnection then
				Current.destroyingConnection:Disconnect()
				Current.destroyingConnection = nil
			end
			if Current.instanceInputEndedConnection then
				Current.instanceInputEndedConnection:Disconnect()
				Current.instanceInputEndedConnection = nil
			end
			if Current.inputEndedConnection then
				Current.inputEndedConnection:Disconnect()
				Current.inputEndedConnection = nil
			end
		end
	end, { UseResult })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 103 ]]
		-- upvalues: UseRefResult1 (copy), UserInputService (upval), IsPressInputFunction (upval), UseResult1 (copy)
		local Current = UseRefResult1.current
		
		if not Current.inputEndedConnection then
			Current.inputEndedConnection = UserInputService.InputEnded:Connect(function(Input) --[[ Line: 109 ]]
				-- upvalues: IsPressInputFunction (upval), UseResult1 (upval)
				if IsPressInputFunction(Input) then
					UseResult1(Input)
					
					return
				end
			end)
			
			return
		end
	end, { UseResult1 })
	local UseResult3 = ReactModule.useCallback(function(Frame: Frame) --[[ Line: 117 ]]
		-- upvalues: UseRefResult1 (copy), UseResult2 (copy), IsPressInputFunction (upval), UseRefResult4 (copy)
		if Frame == nil then
			return function() --[[ Line: 119 ]] end
		else
			local function onPressInstanceDestroyed() --[[ Line: 122 ]]
				-- upvalues: UseRefResult1 (upval), UseResult2 (upval)
				if not UseRefResult1.current.isPressed then return end
				local Current = UseRefResult1.current
				
				if Current.destroyingConnection then
					Current.destroyingConnection:Disconnect()
					Current.destroyingConnection = nil
				end
				if Current.instanceInputEndedConnection then
					Current.instanceInputEndedConnection:Disconnect()
					Current.instanceInputEndedConnection = nil
				end
				UseResult2()
			end
			
			local InputBeganConnection = Frame.InputBegan:Connect(function(Input) --[[ Line: 130 ]]
				-- upvalues: IsPressInputFunction (upval), UseRefResult1 (upval), UseRefResult4 (upval), Frame (copy), onPressInstanceDestroyed (copy)
				if not IsPressInputFunction(Input) then return end
				local Current = UseRefResult1.current
				UseRefResult4.current = false
				Current.isPressed = true
				Current.boundsPosition = Frame.AbsolutePosition
				Current.boundsSize = Frame.AbsoluteSize
				
				if Current.destroyingConnection then
					Current.destroyingConnection:Disconnect()
					Current.destroyingConnection = nil
				end
				if Current.instanceInputEndedConnection then
					Current.instanceInputEndedConnection:Disconnect()
					Current.instanceInputEndedConnection = nil
				end
				Current.destroyingConnection = Frame.Destroying:Connect(onPressInstanceDestroyed)
				Current.instanceInputEndedConnection = Frame.InputEnded:Connect(function(Input) --[[ Line: 143 ]]
					-- upvalues: IsPressInputFunction (upval), UseRefResult1 (upval)
					if not IsPressInputFunction(Input) then return end
					if UseRefResult1.current.isPressed then
						local Current = UseRefResult1.current
						Current.isPressed = false
						Current.boundsPosition = nil
						Current.boundsSize = nil
						
						if Current.destroyingConnection then
							Current.destroyingConnection:Disconnect()
							Current.destroyingConnection = nil
						end
						if Current.instanceInputEndedConnection then
							Current.instanceInputEndedConnection:Disconnect()
							Current.instanceInputEndedConnection = nil
						end
						if Current.inputEndedConnection then
							Current.inputEndedConnection:Disconnect()
							Current.inputEndedConnection = nil
						end
					end
				end)
			end)
			
			return function() --[[ Line: 153 ]]
				-- upvalues: InputBeganConnection (copy)
				InputBeganConnection:Disconnect()
			end
		end
	end, { UseResult2 })
	local UseResult4 = ReactModule.useCallback(function(Gui) --[[ Line: 158 ]]
		-- upvalues: UseRefResult2 (copy), UseResult3 (copy)
		if UseRefResult2.current then
			UseRefResult2.current()
			UseRefResult2.current = nil
		end
		if Gui and Gui:IsA("GuiObject") then
			UseRefResult2.current = UseResult3(Gui)
		end
	end, { UseResult3 })
	local UseResult5 = ReactModule.useCallback(function(Gui) --[[ Line: 169 ]]
		-- upvalues: UseRefResult3 (copy), UseResult3 (copy)
		if UseRefResult3.current then
			UseRefResult3.current()
			UseRefResult3.current = nil
		end
		if Gui and Gui:IsA("GuiObject") then
			UseRefResult3.current = UseResult3(Gui)
		end
	end, { UseResult3 })
	ReactModule.useEffect(function() --[[ Line: 180 ]]
		-- upvalues: UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult1 (copy), UseResult2 (copy)
		return function() --[[ Line: 181 ]]
			-- upvalues: UseRefResult2 (upval), UseRefResult3 (upval), UseRefResult1 (upval), UseResult2 (upval)
			if UseRefResult2.current then
				UseRefResult2.current()
				UseRefResult2.current = nil
			end
			if UseRefResult3.current then
				UseRefResult3.current()
				UseRefResult3.current = nil
			end
			local Current = UseRefResult1.current
			
			if Current.isPressed and not Current.inputEndedConnection then
				if Current.destroyingConnection then
					Current.destroyingConnection:Disconnect()
					Current.destroyingConnection = nil
				end
				if Current.instanceInputEndedConnection then
					Current.instanceInputEndedConnection:Disconnect()
					Current.instanceInputEndedConnection = nil
				end
				UseResult2()
				
				return
			else
				if not Current.inputEndedConnection then
					Current.isPressed = false
					Current.boundsPosition = nil
					Current.boundsSize = nil
					
					if Current.destroyingConnection then
						Current.destroyingConnection:Disconnect()
						Current.destroyingConnection = nil
					end
					if Current.instanceInputEndedConnection then
						Current.instanceInputEndedConnection:Disconnect()
						Current.instanceInputEndedConnection = nil
					end
				end
			end
		end
	end, { UseResult2 })
	
	return {
		onActivated = UseResult,
		playButtonRef = UseResult4,
		loadingCaptureRef = UseResult5
	}
end