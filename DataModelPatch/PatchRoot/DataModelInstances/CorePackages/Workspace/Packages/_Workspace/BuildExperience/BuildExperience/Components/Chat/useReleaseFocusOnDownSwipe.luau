local UserInputService = game:GetService("UserInputService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local _ = require(BuildExperience.Chat.useChatSessionCore)

local function _(p1): Vector2
	return Vector2.new(p1.Position.X, p1.Position.Y)
end

local _ = function(p1, Frame: Frame): boolean
	local XDelta = p1.X - Frame.AbsolutePosition.X
	
	return XDelta >= 0 and XDelta <= Frame.AbsoluteSize.X
end

local _ = function(Vector): boolean
	return Vector.Y >= 24 and math.abs(Vector.X) < Vector.Y
end

local function didDownSwipeCrossGuiObject(Current, Vector, Frame: Frame): boolean
	local VectorDelta = Vector - Current
	
	if VectorDelta.Y >= 24 and VectorDelta.Y > math.abs(VectorDelta.X) then
		local X = Frame.AbsolutePosition.X
		local NewX = X + Frame.AbsoluteSize.X
		local Smallest = math.min(Current.X, Vector.X)
		local Y = Frame.AbsolutePosition.Y
		local NewY = Y + Frame.AbsoluteSize.Y
		
		return X <= math.max(Current.X, Vector.X) and (Smallest <= NewX and Current.Y <= NewY) and Y <= Vector.Y
	else
		return false
	end
end

return function(p1, p2)
	-- upvalues: ReactModule (copy), didDownSwipeCrossGuiObject (copy), UserInputService (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), UseRefResult (copy), UseRefResult1 (copy)
		if UseRefResult2.current then
			UseRefResult2.current:Disconnect()
			UseRefResult2.current = nil
		end
		UseRefResult.current = nil
		UseRefResult1.current = nil
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p2 (copy)
		local Current = if p2 then p2.current else nil
		
		if Current then
			Current.releaseFocus()
		end
	end, { p2 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy), p1 (copy), didDownSwipeCrossGuiObject (upval), UseResult (copy), UseResult1 (copy), UserInputService (upval), p2 (copy), UseRefResult2 (copy)
		local function _(Current): boolean
			-- upvalues: UseRefResult1 (upval), UseRefResult (upval), p1 (upval), didDownSwipeCrossGuiObject (upval), UseResult (upval), UseResult1 (upval)
			local Current1 = UseRefResult1.current
			
			if UseRefResult.current ~= Current or Current1 == nil then
				return false
			end
			local Current2 = p1.current
			local _Vector2 = Vector2.new(Current.Position.X, Current.Position.Y)
			
			if Current2 == nil or not didDownSwipeCrossGuiObject(Current1, _Vector2, Current2) then
				return false
			else
				UseResult()
				UseResult1()
				
				return true
			end
		end
		
		local _ = function(Input)
			-- upvalues: UseRefResult1 (upval), UseRefResult (upval), p1 (upval), didDownSwipeCrossGuiObject (upval), UseResult (upval), UseResult1 (upval)
			local Current = UseRefResult1.current
			local Flag = nil
			
			if UseRefResult.current == Input and Current ~= nil then
				local Current1 = p1.current
				local _Vector2 = Vector2.new(Input.Position.X, Input.Position.Y)
				
				if Current1 == nil or not didDownSwipeCrossGuiObject(Current, _Vector2, Current1) then
					Flag = false
				else
					UseResult()
					UseResult1()
					Flag = true
				end
			else
				Flag = false
			end
			if Flag then return end
			if Input.UserInputState == Enum.UserInputState.End or Input.UserInputState == Enum.UserInputState.Cancel then
				UseResult()
			end
		end
		
		local TouchStartedConnection = UserInputService.TouchStarted:Connect(function(Input)
			-- upvalues: UseResult (upval), p1 (upval), p2 (upval), UseRefResult (upval), UseRefResult1 (upval), UseRefResult2 (upval), didDownSwipeCrossGuiObject (upval), UseResult1 (upval)
			UseResult()
			local Current = p1.current
			local Current1 = if p2 then p2.current else nil
			
			if Current == nil or Current1 == nil then return end
			local _Vector2 = Vector2.new(Input.Position.X, Input.Position.Y)
			local XDelta = _Vector2.X - Current.AbsolutePosition.X
			
			if XDelta >= 0 and XDelta <= Current.AbsoluteSize.X and Current.AbsolutePosition.Y + Current.AbsoluteSize.Y >= _Vector2.Y then
				UseRefResult.current = Input
				UseRefResult1.current = _Vector2
				UseRefResult2.current = Input.Changed:Connect(function()
					-- upvalues: Input (copy), UseRefResult1 (upval), UseRefResult (upval), p1 (upval), didDownSwipeCrossGuiObject (upval), UseResult (upval), UseResult1 (upval)
					local Current = UseRefResult1.current
					local Flag = nil
					
					if UseRefResult.current == Input and Current ~= nil then
						local Current1 = p1.current
						local _Vector2 = Vector2.new(Input.Position.X, Input.Position.Y)
						
						if Current1 == nil or not didDownSwipeCrossGuiObject(Current, _Vector2, Current1) then
							Flag = false
						else
							UseResult()
							UseResult1()
							Flag = true
						end
					else
						Flag = false
					end
					if Flag then return end
					if Input.UserInputState == Enum.UserInputState.End or Input.UserInputState == Enum.UserInputState.Cancel then
						UseResult()
					end
				end)
				
				return
			end
		end)
		local TouchEndedConnection = UserInputService.TouchEnded:Connect(function(Hit)
			-- upvalues: UseRefResult (upval), UseRefResult1 (upval), p1 (upval), didDownSwipeCrossGuiObject (upval), UseResult (upval), UseResult1 (upval)
			if UseRefResult.current == Hit then
				local Current = UseRefResult1.current
				local Flag = nil
				
				if UseRefResult.current == Hit and Current ~= nil then
					local Current1 = p1.current
					local _Vector2 = Vector2.new(Hit.Position.X, Hit.Position.Y)
					
					if Current1 == nil or not didDownSwipeCrossGuiObject(Current, _Vector2, Current1) then
						Flag = false
					else
						UseResult()
						UseResult1()
						Flag = true
					end
				else
					Flag = false
				end
				if not Flag then
					UseResult()
				end
			end
		end)
		
		return function()
			-- upvalues: TouchStartedConnection (copy), TouchEndedConnection (copy), UseResult (upval)
			TouchStartedConnection:Disconnect()
			TouchEndedConnection:Disconnect()
			UseResult()
		end
	end, { p1, p2, UseResult, UseResult1 })
end