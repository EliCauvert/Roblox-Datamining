local ReactModule = require(script:FindFirstAncestor("RobloxAppHooks").Parent.React)
local UserScrollInputModule = require(script.Parent.userScrollInput)
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

return function(p1)
	-- upvalues: ReactModule (copy), UserInputService (copy), UserScrollInputModule (copy), RunService (copy)
	local Enabled = p1.enabled
	local Ready = p1.ready
	local ScrollToFunction = p1.scrollTo
	local ScrollingFrameRef = p1.scrollingFrameRef
	local TargetRef = p1.targetRef
	local IsScrollingDirectionMatch = p1.scrollingDirection == Enum.ScrollingDirection.X
	local Timeout = p1.timeout or 10
	local RequestKey = p1.requestKey
	local UseRefResult = ReactModule.useRef(Enabled)
	local UseRefResult1 = ReactModule.useRef(RequestKey)
	ReactModule.useEffect(function()
		-- upvalues: RequestKey (copy), UseRefResult1 (copy), UseRefResult (copy), Enabled (copy), UserInputService (upval), UserScrollInputModule (upval), Ready (copy), IsScrollingDirectionMatch (copy), Timeout (copy), RunService (upval), ScrollingFrameRef (copy), TargetRef (copy), ScrollToFunction (copy)
		if RequestKey ~= UseRefResult1.current then
			UseRefResult1.current = RequestKey
			UseRefResult.current = true
		end
		if not Enabled then
			UseRefResult.current = false
		end
		if not UseRefResult.current then
			return nil
		end
		local Connections = {}
		local SpawnedThread = nil
		
		local function cleanup()
			-- upvalues: Connections (copy), SpawnedThread (ref)
			for _, connection in Connections do
				connection:Disconnect()
			end
			if SpawnedThread then
				task.cancel(SpawnedThread)
				SpawnedThread = nil
			end
		end
		
		local function _()
			-- upvalues: UseRefResult (upval), Connections (copy), SpawnedThread (ref)
			UseRefResult.current = false
			
			for _, connection in Connections do
				connection:Disconnect()
			end
			if SpawnedThread then
				task.cancel(SpawnedThread)
				SpawnedThread = nil
			end
		end
		
		table.insert(Connections, UserInputService.InputBegan:Connect(function(Input)
			-- upvalues: UserScrollInputModule (upval), UseRefResult (upval), Connections (copy), SpawnedThread (ref)
			if UserScrollInputModule.isUserInput(Input) then
				UseRefResult.current = false
				
				for _, connection in Connections do
					connection:Disconnect()
				end
				if SpawnedThread then
					task.cancel(SpawnedThread)
					SpawnedThread = nil
				end
			end
		end))
		table.insert(Connections, UserInputService.InputChanged:Connect(function(Input)
			-- upvalues: UserScrollInputModule (upval), UseRefResult (upval), Connections (copy), SpawnedThread (ref)
			if UserScrollInputModule.isUserScroll(Input) then
				UseRefResult.current = false
				
				for _, connection in Connections do
					connection:Disconnect()
				end
				if SpawnedThread then
					task.cancel(SpawnedThread)
					SpawnedThread = nil
				end
			end
		end))
		
		if Ready then
			local _ = function(Vector)
				-- upvalues: IsScrollingDirectionMatch (upval)
				return if IsScrollingDirectionMatch then Vector.X else Vector.Y
			end
			
			SpawnedThread = task.spawn(function()
				-- upvalues: Timeout (upval), RunService (upval), ScrollingFrameRef (upval), TargetRef (upval), IsScrollingDirectionMatch (upval), SpawnedThread (ref), UseRefResult (upval), Connections (copy), ScrollToFunction (upval)
				local v1: number? = nil
				local X: number? = nil
				local X1: number? = nil
				local NewDeltaTime = 0
				local Current = nil
				local Current1 = nil
				while NewDeltaTime < Timeout do
					NewDeltaTime += RunService.Heartbeat:Wait()
					Current = ScrollingFrameRef.current
					Current1 = TargetRef.current
					
					if not Current or not Current1 then
						v1 = nil
						X = nil
						X1 = nil
						continue
					end
					local AbsolutePosition = Current1.AbsolutePosition
					local AbsolutePosition1 = Current.AbsolutePosition
					local v2 = (if IsScrollingDirectionMatch then AbsolutePosition.X else AbsolutePosition.Y) - (if IsScrollingDirectionMatch then AbsolutePosition1.X else AbsolutePosition1.Y)
					local CanvasPosition = Current.CanvasPosition
					local v3 = v2 + (if IsScrollingDirectionMatch then CanvasPosition.X else CanvasPosition.Y)
					local AbsoluteSize = Current1.AbsoluteSize
					local X2 = if IsScrollingDirectionMatch then AbsoluteSize.X else AbsoluteSize.Y
					local AbsoluteCanvasSize = Current.AbsoluteCanvasSize
					local X3 = if IsScrollingDirectionMatch then AbsoluteCanvasSize.X else AbsoluteCanvasSize.Y
					local Flag = false
					
					if X2 > 0 then
						Flag = false
						local AbsoluteWindowSize = Current.AbsoluteWindowSize
						
						if (if IsScrollingDirectionMatch then AbsoluteWindowSize.X else AbsoluteWindowSize.Y) > 0 then
							Flag = X3 + 1 >= v3 + X2
						end
					end
					if Flag and v3 == v1 and X2 == X and X3 == X1 then
						SpawnedThread = nil
						UseRefResult.current = false
						
						for _, connection in Connections do
							connection:Disconnect()
						end
						if SpawnedThread then
							task.cancel(SpawnedThread)
							SpawnedThread = nil
						end
						ScrollToFunction(Current, Current1)
						
						return
					end
					if Flag then
						v1 = v3
						X = X2
						X1 = X3
					else
						v1 = nil
						X = nil
						X1 = nil
					end
				end
				SpawnedThread = nil
				UseRefResult.current = false
				
				for _, connection1 in Connections do
					connection1:Disconnect()
				end
				if SpawnedThread then
					task.cancel(SpawnedThread)
					SpawnedThread = nil
				end
			end)
		end
		return cleanup
	end, {
		Enabled, Ready, ScrollToFunction, IsScrollingDirectionMatch, Timeout,
		RequestKey
	})
end