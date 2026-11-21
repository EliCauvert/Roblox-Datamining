local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local UserInputService = game:GetService("UserInputService")

local function _(Input): boolean
	return Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1
end

return function(Current)
	-- upvalues: ReactModule (copy), UserInputService (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(Current)
	UseRefResult2.current = Current
	
	local function _(p1): number
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		return if Current == nil or Current.AbsoluteSize.X <= 0 then 0 else math.clamp((p1.X - Current.AbsolutePosition.X) / Current.AbsoluteSize.X, 0, 1)
	end
	
	local _ = function()
		-- upvalues: UseRefResult1 (copy)
		local Current = UseRefResult1.current
		
		if Current == nil then return end
		UseRefResult1.current = nil
		
		for _, connection in Current.connections do
			connection:Disconnect()
		end
	end
	
	local function finish()
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy)
		if UseRefResult1.current == nil then return end
		local Current = UseRefResult1.current
		
		if Current ~= nil then
			UseRefResult1.current = nil
			
			for _, connection in Current.connections do
				connection:Disconnect()
			end
		end
		local OnScrubEndedFunction: () -> () = UseRefResult2.current.onScrubEnded
		
		if OnScrubEndedFunction ~= nil then
			OnScrubEndedFunction()
		end
	end
	
	local UseResult = ReactModule.useCallback(function(_, Input)
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), UserInputService (upval), UseRefResult (copy), finish (copy)
		local Current = UseRefResult2.current
		
		if Current.onScrub == nil or Input.UserInputType ~= Enum.UserInputType.Touch and Input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
		if UseRefResult1.current ~= nil then
			local Current1 = UseRefResult1.current
			
			if Current1 ~= nil then
				UseRefResult1.current = nil
				
				for _, connection in Current1.connections do
					connection:Disconnect()
				end
			end
			local OnScrubEndedFunction: () -> () = UseRefResult2.current.onScrubEnded
			
			if OnScrubEndedFunction ~= nil then
				OnScrubEndedFunction()
			end
		end
		local IsUserInputTypeMatch = Input.UserInputType == Enum.UserInputType.Touch
		
		local function _(Input1, p1): boolean
			-- upvalues: IsUserInputTypeMatch (copy), Input (copy)
			return if IsUserInputTypeMatch then Input1 == Input else Input1.UserInputType == (if p1 then Enum.UserInputType.MouseMovement else Enum.UserInputType.MouseButton1)
		end
		
		UseRefResult1.current = {
			connections = {
				UserInputService.InputChanged:Connect(function(Input1)
					-- upvalues: UseRefResult2 (upval), IsUserInputTypeMatch (copy), Input (copy), UseRefResult (upval)
					local OnScrubFunction: (any) -> () = UseRefResult2.current.onScrub
					
					if OnScrubFunction ~= nil and (if IsUserInputTypeMatch then Input1 == Input else Input1.UserInputType == Enum.UserInputType.MouseMovement) then
						local Position = Input1.Position
						local Current = UseRefResult.current
						OnScrubFunction(if Current == nil or Current.AbsoluteSize.X <= 0 then 0 else math.clamp((Position.X - Current.AbsolutePosition.X) / Current.AbsoluteSize.X, 0, 1))
					end
				end),
				UserInputService.InputEnded:Connect(function(Input1)
					-- upvalues: IsUserInputTypeMatch (copy), Input (copy), UseRefResult2 (upval), UseRefResult (upval), UseRefResult1 (upval)
					if not (if IsUserInputTypeMatch then Input1 == Input else Input1.UserInputType == Enum.UserInputType.MouseButton1) then return end
					local OnScrubFunction: (any) -> () = UseRefResult2.current.onScrub
					
					if OnScrubFunction ~= nil then
						local Position = Input1.Position
						local Current = UseRefResult.current
						OnScrubFunction(if Current == nil or Current.AbsoluteSize.X <= 0 then 0 else math.clamp((Position.X - Current.AbsolutePosition.X) / Current.AbsoluteSize.X, 0, 1))
					end
					if UseRefResult1.current == nil then return end
					local Current = UseRefResult1.current
					
					if Current ~= nil then
						UseRefResult1.current = nil
						
						for _, connection in Current.connections do
							connection:Disconnect()
						end
					end
					local OnScrubEndedFunction: () -> () = UseRefResult2.current.onScrubEnded
					
					if OnScrubEndedFunction ~= nil then
						OnScrubEndedFunction()
					end
				end),
				UserInputService.WindowFocusReleased:Connect(finish)
			}
		}
		
		if Current.onScrubStarted ~= nil then
			Current.onScrubStarted()
		end
		local Position = Input.Position
		local Current2 = UseRefResult.current
		Current.onScrub(if Current2 == nil or Current2.AbsoluteSize.X <= 0 then 0 else math.clamp((Position.X - Current2.AbsolutePosition.X) / Current2.AbsoluteSize.X, 0, 1))
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy)
		return function()
			-- upvalues: UseRefResult1 (upval)
			local Current = UseRefResult1.current
			
			if Current == nil then return end
			UseRefResult1.current = nil
			
			for _, connection in Current.connections do
				connection:Disconnect()
			end
		end
	end, {})
	
	return UseRefResult, UseResult
end