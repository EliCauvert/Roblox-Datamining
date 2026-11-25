local RunService = game:GetService("RunService")
local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local MotionModule = require(Parent.Motion)
local ReactModule = require(Parent.React)
local WorldCutoutTransitionModule = require(script.Parent.WorldCutoutTransition)
local UserGameSettings = UserSettings():GetService("UserGameSettings")

local function _(Frame: Frame)
	return if Frame == nil or Frame.AbsoluteSize.X <= 1 or Frame.AbsoluteSize.Y <= 1 then nil else Rect.new(Frame.AbsolutePosition, Frame.AbsolutePosition + Frame.AbsoluteSize)
end

local _ = function(p1, p2)
	local ScrollingFrame = p1:FindFirstAncestorWhichIsA("ScrollingFrame")
	
	return if ScrollingFrame == nil then p2 else Rect.new(p2.Min + ScrollingFrame.CanvasPosition, p2.Max + ScrollingFrame.CanvasPosition)
end

return function(Current)
	-- upvalues: FoundationModule (copy), UserGameSettings (copy), ReactModule (copy), WorldCutoutTransitionModule (copy), MotionModule (copy), RunService (copy)
	local ReducedMotion = FoundationModule.Hooks.usePreferences().reducedMotion or UserGameSettings.ReducedMotion
	local UseRefResult = ReactModule.useRef(WorldCutoutTransitionModule.initialState)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseRefResult.current.phase)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(nil)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(nil)
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion({ progress = 0 })
	local Progress = UseMotionResult.progress
	local UseRefResult1 = ReactModule.useRef(UseMotionResult2)
	UseRefResult1.current = UseMotionResult2
	local UseRefResult2 = ReactModule.useRef(Current)
	UseRefResult2.current = Current
	local IsHome: boolean = Current.isAvailable and (Current.isHome and (Current.isOpen and UseStateResult == "Home"))
	local UseRefResult3 = ReactModule.useRef(IsHome)
	UseRefResult3.current = IsHome
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: UseRefResult (copy), WorldCutoutTransitionModule (upval), UseStateResult2 (copy)
		local Current = UseRefResult.current
		UseRefResult.current = WorldCutoutTransitionModule.reduce(Current, p1)
		
		if UseRefResult.current.phase ~= Current.phase then
			UseStateResult2(UseRefResult.current.phase)
		end
		return UseRefResult.current
	end, {})
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseRefResult7 = ReactModule.useRef(nil)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult6 (copy), UseBindingResult2_1 (copy), UseRefResult4 (copy), UseBindingResult2 (copy), UseStateResult2_1 (copy), UseRefResult5 (copy), UseRefResult3 (copy), UseRefResult2 (copy)
		local Current = UseRefResult6.current
		local _Rect = if Current == nil or Current.AbsoluteSize.X <= 1 or Current.AbsoluteSize.Y <= 1 then nil else Rect.new(Current.AbsolutePosition, Current.AbsolutePosition + Current.AbsoluteSize)
		
		if _Rect ~= nil then
			UseBindingResult2_1(_Rect)
		end
		local Current1 = UseRefResult4.current
		local _Rect1 = if Current1 == nil or Current1.AbsoluteSize.X <= 1 or Current1.AbsoluteSize.Y <= 1 then nil else Rect.new(Current1.AbsolutePosition, Current1.AbsolutePosition + Current1.AbsoluteSize)
		
		if Current1 == nil or _Rect1 == nil then return end
		UseBindingResult2(_Rect1)
		UseStateResult2_1(true)
		local ScrollingFrame = Current1:FindFirstAncestorWhichIsA("ScrollingFrame")
		UseRefResult5.current = if ScrollingFrame == nil then _Rect1 else Rect.new(_Rect1.Min + ScrollingFrame.CanvasPosition, _Rect1.Max + ScrollingFrame.CanvasPosition)
		
		if UseRefResult3.current then
			UseRefResult2.current.onViewportRectChanged(UseRefResult5.current)
		end
	end, { UseBindingResult2, UseBindingResult2_1 })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseResult1 (copy), UseRefResult7 (copy)
		UseResult1()
		
		if UseRefResult7.current == nil then
			UseRefResult7.current = task.defer(function()
				-- upvalues: UseRefResult7 (upval), UseResult1 (upval)
				UseRefResult7.current = nil
				UseResult1()
			end)
		end
	end, { UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult7 (copy)
		return function()
			-- upvalues: UseRefResult7 (upval)
			if UseRefResult7.current ~= nil then
				task.cancel(UseRefResult7.current)
				UseRefResult7.current = nil
			end
		end
	end, {})
	local UseResult3 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult4 (copy), UseResult2 (copy)
		UseRefResult4.current = Current
		UseResult2()
	end, { UseResult2 })
	local UseResult4 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult6 (copy), UseResult2 (copy)
		UseRefResult6.current = Current
		UseResult2()
	end, { UseResult2 })
	local UseResult5 = ReactModule.useCallback(function(): boolean
		-- upvalues: UseRefResult2 (copy), UseRefResult (copy), UseResult (copy)
		local Current = UseRefResult2.current
		local Phase = UseRefResult.current.phase
		
		if Current.isAvailable and Current.isHome and Current.isOpen and (Phase == "Home" or Phase == "Collapsing") then
			UseResult({ type = "Expand" })
			
			return true
		else
			return false
		end
	end, { UseResult })
	local UseResult6 = ReactModule.useCallback(function(): boolean
		-- upvalues: UseRefResult (copy), UseResult (copy)
		local Phase = UseRefResult.current.phase
		
		if Phase == "World" or Phase == "Expanding" then
			UseResult({ type = "Collapse" })
			
			return true
		else
			return false
		end
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: IsHome (copy), UseRefResult5 (copy), Current (copy), UseStateResult (copy)
		if IsHome then
			local Current1 = UseRefResult5.current
			
			if Current1 ~= nil then
				Current.onViewportRectChanged(Current1)
				
				return
			end
		elseif Current.isAvailable and Current.isOpen and UseStateResult == "Home" then
			Current.onViewportRectChanged(nil)
		end
	end, {
		IsHome, UseStateResult, Current.isAvailable, Current.isOpen,
		Current.onViewportRectChanged, UseBindingResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), Current (copy), UseResult (copy)
		if UseStateResult ~= "Home" and (not Current.isAvailable or not Current.isHome or UseStateResult == "World" and Current.isOpen) then
			UseResult({ type = "Reset" })
		end
	end, {
		UseStateResult,
		Current.isAvailable,
		Current.isHome,
		Current.isOpen,
		UseResult
	})
	ReactModule.useEffect(function()
		-- upvalues: WorldCutoutTransitionModule (upval), UseStateResult (copy), RunService (upval), UseResult (copy), Progress (copy), UseBindingResult (copy), UseBindingResult1 (copy), UseRefResult2 (copy), UseRefResult1 (copy), MotionModule (upval), ReducedMotion (copy), UseRefResult (copy)
		local IsTransitioning = WorldCutoutTransitionModule.isTransitioning(UseStateResult)
		local Flag = false
		local HeartbeatConnection = if IsTransitioning then RunService.Heartbeat:Connect(function()
			-- upvalues: UseResult (upval), Progress (upval), UseBindingResult (upval), UseBindingResult1 (upval), WorldCutoutTransitionModule (upval), UseRefResult2 (upval)
			local UseResultResult = UseResult({ type = "Progress", progress = Progress:getValue() })
			local Value = UseBindingResult:getValue()
			local Value1 = UseBindingResult1:getValue()
			
			if WorldCutoutTransitionModule.isTransitioning(UseResultResult.phase) and Value ~= nil and Value1 ~= nil then
				UseRefResult2.current.onViewportRectChanged(WorldCutoutTransitionModule.interpolateRect(Value, Value1, UseResultResult.progress))
			end
		end) else nil
		UseRefResult1.current(MotionModule.createState({
			progress = WorldCutoutTransitionModule.getTarget(UseStateResult)
		}, {
			default = MotionModule.transition({
				duration = if ReducedMotion or not IsTransitioning then 0 else 0.3,
				easingStyle = Enum.EasingStyle.Quad
			})
		}), {
			onAnimationComplete = function(Enabled)
				-- upvalues: Flag (ref), UseRefResult (upval), UseStateResult (upval), UseResult (upval)
				if Enabled == true and not Flag and UseRefResult.current.phase == UseStateResult then
					UseResult({ type = "Settle" })
				end
			end
		})
		
		return function()
			-- upvalues: Flag (ref), HeartbeatConnection (ref)
			Flag = true
			
			if HeartbeatConnection ~= nil then
				HeartbeatConnection:Disconnect()
			end
		end
	end, {
		UseStateResult, ReducedMotion, Progress, UseBindingResult, UseBindingResult1,
		UseResult
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), Progress (copy), UseBindingResult (copy), UseBindingResult1 (copy), WorldCutoutTransitionModule (upval)
		return ReactModule.joinBindings({
			progress = Progress,
			cell = UseBindingResult,
			content = UseBindingResult1
		}):map(function(p1): Rect?
			-- upvalues: WorldCutoutTransitionModule (upval)
			if p1.cell == nil or p1.content == nil then
				return nil
			else
				local InterpolateRectResult = WorldCutoutTransitionModule.interpolateRect(p1.cell, p1.content, p1.progress)
				local Min = p1.content.Min
				
				return Rect.new(InterpolateRectResult.Min - Min, InterpolateRectResult.Max - Min)
			end
		end)
	end, { Progress, UseBindingResult, UseBindingResult1 })
	local IsTransitioning = WorldCutoutTransitionModule.isTransitioning(UseStateResult)
	
	return {
		phase = UseStateResult,
		isMeasured = UseStateResult1,
		enter = UseResult5,
		exit = UseResult6,
		onCellRectChanged = UseResult3,
		view = if Current.isAvailable then {
			isTransitioning = IsTransitioning,
			showHole = IsTransitioning or Current.isHome and UseStateResult == "Home",
			progress = Progress,
			hole = UseMemoResult,
			onContentRectChanged = UseResult4
		} else nil
	}
end