local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local AppPageShell = script:FindFirstAncestor("AppPageShell")
local Parent = AppPageShell.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local OtterModule = require(Parent.Otter)
local RobloxAppEventsModule = require(Parent.RobloxAppEvents)
local ScrollToTopModule = require(AppPageShell.scrollToTop)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local FFlagAppPageShellScrollToTopFocus = require(Parent.SharedFlags).FFlagAppPageShellScrollToTopFocus

return ReactModule.memo(function(Frame) --[[ Line: 41 | Named "PullToRefreshSpinner" ]]
	-- upvalues: ReactModule (copy), OtterModule (copy), RobloxAppEventsModule (copy), FFlagAppPageShellScrollToTopFocus (copy), ScrollToTopModule (copy), UserInputService (copy), RunService (copy), View (copy), Icon (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(0)
	local UseBindingResult4, UseBindingResult2_3 = ReactModule.useBinding(0)
	local Idle, Idle2 = ReactModule.useState("idle")
	local Idle1 = ReactModule.useRef("idle")
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseRefResult2 = ReactModule.useRef(nil)
	
	if UseRefResult2.current == nil then
		UseRefResult2.current = OtterModule.createSingleMotor(0)
	end
	ReactModule.useEffect(function() --[[ Line: 64 ]]
		-- upvalues: UseRefResult2 (copy), UseBindingResult2_1 (copy), Idle1 (copy), Idle2 (copy)
		local Current = UseRefResult2.current
		local OnStepResult = Current:onStep(function(p1) --[[ Line: 67 ]]
			-- upvalues: UseBindingResult2_1 (upval)
			UseBindingResult2_1(p1)
		end)
		local OnCompleteResult = Current:onComplete(function() --[[ Line: 70 ]]
			-- upvalues: Idle1 (upval), Idle2 (upval), UseBindingResult2_1 (upval)
			if Idle1.current == "tweenBack" then
				Idle1.current = "idle"
				Idle2("idle")
				UseBindingResult2_1(0)
				
				return
			end
		end)
		
		return function() --[[ Line: 79 ]]
			-- upvalues: OnStepResult (copy), OnCompleteResult (copy), Current (copy)
			OnStepResult()
			OnCompleteResult()
			Current:destroy()
		end
	end, {})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 87 ]]
		-- upvalues: Frame (copy), Idle1 (copy), Idle2 (copy), UseRefResult1 (copy), UseRefResult2 (copy), OtterModule (upval), UseBindingResult2_1 (copy), UseBindingResult2_3 (copy)
		if not Frame.onRefresh or Idle1.current ~= "idle" then return end
		Idle1.current = "refreshing"
		Idle2("refreshing")
		
		if UseRefResult1.current >= -52 then
			UseRefResult2.current:setGoal(OtterModule.spring(52, { dampingRatio = 0.735, frequency = 1.95 }))
		else
			UseBindingResult2_1(52)
		end
		local function onSettled() --[[ Line: 108 ]]
			-- upvalues: Idle1 (upval), Idle2 (upval), UseBindingResult2_3 (upval), UseRefResult2 (upval), OtterModule (upval)
			Idle1.current = "tweenBack"
			Idle2("tweenBack")
			UseBindingResult2_3(0)
			UseRefResult2.current:setGoal(OtterModule.spring(0, {
				dampingRatio = 0.735,
				frequency = 1.95,
				startingValue = 52
			}))
		end
		
		local Success, Result = pcall(Frame.onRefresh)
		
		if not Success then
			onSettled()
			
			return
		end
		if Result and typeof(Result) == "table" and Result.andThen then
			Result:finally(onSettled)
			
			return
		else
			onSettled()
		end
	end, { Frame.onRefresh })
	ReactModule.useEffect(function() --[[ Line: 134 ]]
		-- upvalues: Frame (copy), RobloxAppEventsModule (upval), FFlagAppPageShellScrollToTopFocus (upval), ScrollToTopModule (upval), UseResult (copy)
		if Frame.appEventName then
			local ReloadPageConnection = RobloxAppEventsModule.ReloadPage:connect(function(AppEventName) --[[ Line: 139 ]]
				-- upvalues: Frame (upval), FFlagAppPageShellScrollToTopFocus (upval), ScrollToTopModule (upval), UseResult (upval)
				if AppEventName ~= Frame.appEventName then return end
				local Current = Frame.scrollingFrameRef.current
				
				if not Current then return end
				if Current.CanvasPosition.Y == 0 then
					UseResult()
					
					return
				end
				if FFlagAppPageShellScrollToTopFocus then
					ScrollToTopModule(Current)
					
					return
				else
					Current:ScrollToTop()
				end
			end)
			
			return function() --[[ Line: 158 ]]
				-- upvalues: ReloadPageConnection (copy)
				ReloadPageConnection:disconnect()
			end
		else
			return nil
		end
	end, { UseResult, Frame.appEventName, Frame.scrollingFrameRef })
	
	if FFlagAppPageShellScrollToTopFocus then
		ReactModule.useEffect(function() --[[ Line: 164 ]]
			-- upvalues: UserInputService (upval), Frame (copy), ScrollToTopModule (upval)
			local StatusBarTappedConnection = UserInputService.StatusBarTapped:Connect(function() --[[ Line: 165 ]]
				-- upvalues: Frame (upval), ScrollToTopModule (upval)
				local Current = Frame.scrollingFrameRef.current
				
				if Current then
					ScrollToTopModule(Current)
				end
			end)
			
			return function() --[[ Line: 172 ]]
				-- upvalues: StatusBarTappedConnection (copy)
				StatusBarTappedConnection:Disconnect()
			end
		end, { Frame.scrollingFrameRef })
	end
	ReactModule.useEffect(function() --[[ Line: 179 ]]
		-- upvalues: UserInputService (upval), UseRefResult (copy), UseRefResult1 (copy), Idle1 (copy), UseResult (copy)
		local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input) --[[ Line: 180 ]]
			-- upvalues: UseRefResult (upval)
			if Input.UserInputType == Enum.UserInputType.Touch then
				UseRefResult.current += 1
				
				return
			end
		end)
		local InputEndedConnection = UserInputService.InputEnded:Connect(function(Input) --[[ Line: 187 ]]
			-- upvalues: UseRefResult (upval), UseRefResult1 (upval), Idle1 (upval), UseResult (upval)
			if Input.UserInputType ~= Enum.UserInputType.Touch then return end
			if UseRefResult.current > 0 then
				UseRefResult.current -= 1
			end
			if UseRefResult.current > 0 then return end
			if UseRefResult1.current < -52 and Idle1.current == "idle" then
				UseResult()
			end
		end)
		
		return function() --[[ Line: 206 ]]
			-- upvalues: InputBeganConnection (copy), InputEndedConnection (copy)
			InputBeganConnection:Disconnect()
			InputEndedConnection:Disconnect()
		end
	end, { UseResult })
	ReactModule.useEffect(function() --[[ Line: 213 ]]
		-- upvalues: Frame (copy), UseRefResult1 (copy), UseBindingResult2 (copy)
		local Current = Frame.scrollingFrameRef and Frame.scrollingFrameRef.current
		
		if Current then
			local Connection = Current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 219 ]]
				-- upvalues: Frame (upval), Current (copy), UseRefResult1 (upval), UseBindingResult2 (upval)
				if Frame.onRefresh then
					local Y: number = Current.CanvasPosition.Y
					UseRefResult1.current = Y
					UseBindingResult2(if Y < 0 then Y else 0)
					
					return
				end
			end)
			
			return function() --[[ Line: 228 ]]
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		else
			return nil
		end
	end, { Frame.scrollingFrameRef, Frame.onRefresh })
	ReactModule.useEffect(function() --[[ Line: 234 ]]
		-- upvalues: Idle (copy), RunService (upval), Idle1 (copy), UseBindingResult2_2 (copy), UseBindingResult2_3 (copy)
		if Idle == "idle" then
			return nil
		else
			local Total = 0
			local RenderSteppedConnection = RunService.RenderStepped:Connect(function(DeltaTime: number) --[[ Line: 240 ]]
				-- upvalues: Total (ref), Idle1 (upval), UseBindingResult2_2 (upval), UseBindingResult2_3 (upval)
				Total += DeltaTime
				
				if Idle1.current == "refreshing" then
					UseBindingResult2_2(Total * 540)
					
					return
				end
				if Idle1.current == "tweenBack" then
					UseBindingResult2_3(Total)
				end
			end)
			
			return function() --[[ Line: 249 ]]
				-- upvalues: RenderSteppedConnection (copy)
				RenderSteppedConnection:Disconnect()
			end
		end
	end, { Idle })
	
	return ReactModule.createElement(View, {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = ReactModule.useMemo(function() --[[ Line: 255 ]]
			-- upvalues: ReactModule (upval), UseBindingResult (copy), UseBindingResult1 (copy), Idle1 (copy), UseRefResult (copy)
			return ReactModule.joinBindings({ UseBindingResult, UseBindingResult1 }):map(function(Entry): UDim2 --[[ Line: 256 ]]
				-- upvalues: Idle1 (upval), UseRefResult (upval)
				local Entry1: number = Entry[1]
				local Entry2: number = Entry[2]
				
				return if Idle1.current == "idle" then if UseRefResult.current == 0 or Entry1 >= 0 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0, (math.min(52, (math.abs(Entry1))))) elseif Idle1.current == "refreshing" then UDim2.new(1, 0, 0, (math.max(Entry2, 0))) else UDim2.new(1, 0, 0, Entry2)
			end)
		end, {}),
		GroupTransparency = ReactModule.useMemo(function() --[[ Line: 291 ]]
			-- upvalues: ReactModule (upval), UseBindingResult (copy), UseBindingResult1 (copy), UseBindingResult4 (copy), Idle1 (copy), UseRefResult (copy)
			return ReactModule.joinBindings({ UseBindingResult, UseBindingResult1, UseBindingResult4 }):map(function(Entry): number --[[ Line: 292 ]]
				-- upvalues: Idle1 (upval), UseRefResult (upval)
				local Entry1: number = Entry[1]
				local Entry2: number = Entry[2]
				local Entry3: number = Entry[3]
				
				return if Idle1.current == "idle" then if UseRefResult.current == 0 or Entry1 >= 0 then 1 elseif Entry1 <= -52 then 0 else 1 - math.abs(Entry1) * 0.04 elseif Idle1.current == "refreshing" then if Entry2 < 52 then math.max(0, 1 - Entry2 / 52) else 0 else math.min(1, 2 * Entry3)
			end)
		end, {}),
		LayoutOrder = Frame.LayoutOrder
	}, {
		Spinner = ReactModule.createElement(Icon, {
			name = "two-arrows-spin-clockwise",
			Rotation = ReactModule.useMemo(function() --[[ Line: 273 ]]
				-- upvalues: ReactModule (upval), UseBindingResult (copy), UseBindingResult3 (copy), Idle1 (copy)
				return ReactModule.joinBindings({ UseBindingResult, UseBindingResult3 }):map(function(Entry) --[[ Line: 274 ]]
					-- upvalues: Idle1 (upval)
					local Entry1: number = Entry[1]
					local Entry2 = Entry[2]
					
					return if Idle1.current == "idle" then if Entry1 >= 0 or Entry1 <= -52 then 0 else math.abs(Entry1) * 9.6 - 240 elseif Idle1.current == "refreshing" then Entry2 else 0
				end)
			end, {}),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		})
	})
end)