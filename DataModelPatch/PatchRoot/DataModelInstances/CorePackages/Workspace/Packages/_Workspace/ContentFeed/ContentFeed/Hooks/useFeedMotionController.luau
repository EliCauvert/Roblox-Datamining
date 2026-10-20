local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent1.React)
local OtterModule = require(Parent1.Otter)
local Signal = require(Parent1.AppCommonLib).Signal
local FeedDirectionTypeModule = require(Parent.Enums.FeedDirectionType)
local NavigationTypeModule = require(Parent.Enums.NavigationType)
local UseEventConnectionFunction = require(Parent1.ReactUtils).useEventConnection
local UseGuiInsetFunction = require(Parent1.CapturesCommon).Hooks.useGuiInset
local UseRefFunction = ReactModule.useRef
local UseScreenSizeFunction = require(Parent1.RobloxAppHooks).useScreenSize

local function v8(Offset, ClampedValue, p1, p2, p3)
	-- upvalues: OtterModule (copy)
	local SingleMotor = OtterModule.createSingleMotor(Offset)
	SingleMotor:onStep(p1)
	SingleMotor:onComplete(p2)
	p3.current = true
	SingleMotor:setGoal(OtterModule.spring(ClampedValue, { frequency = 8 }))
end

return function(p1, p2, p3, p4)
	-- upvalues: UseScreenSizeFunction (copy), UseGuiInsetFunction (copy), UseRefFunction (copy), Signal (copy), UseEventConnectionFunction (copy), UserInputService (copy), NavigationTypeModule (copy), v8 (copy), ReactModule (copy), FeedDirectionTypeModule (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseGuiInsetResult = UseGuiInsetFunction()
	local UseRefResult = UseRefFunction(nil)
	local UseRefResult1 = UseRefFunction(false)
	local UseRefResult2 = UseRefFunction(false)
	local UseRefResult3 = UseRefFunction(nil)
	local UseRefResult4 = UseRefFunction(nil)
	local UseRefResult5 = UseRefFunction(nil)
	local UseRefResult6 = UseRefFunction(Signal.new())
	
	local function _(p5: number, p6: number): number
		-- upvalues: UseGuiInsetResult (copy)
		local v1 = p5 % p6
		
		return if p6 / 2 < v1 then math.min(p5 + (p6 - v1), 0) - UseGuiInsetResult.top else p5 - v1 - UseGuiInsetResult.top
	end
	
	UseEventConnectionFunction(UserInputService.TouchPinch, function(_, _, _, UserInputState, _)
		-- upvalues: UseRefResult2 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			UseRefResult2.current = true
		end
	end)
	UseEventConnectionFunction(UserInputService.TouchStarted, function(Current)
		-- upvalues: UseRefResult1 (copy), UseRefResult3 (copy), UseRefResult (copy), UseRefResult5 (copy), p4 (copy), UseRefResult4 (copy)
		UseRefResult1.current = false
		
		if UseRefResult3.current == nil and UseRefResult.current and UseRefResult5.current == nil and not p4 then
			UseRefResult3.current = UseRefResult.current.Position.Y.Offset
			UseRefResult4.current = Current.Position.Y
			UseRefResult5.current = Current
		end
	end)
	UseEventConnectionFunction(UserInputService.TouchMoved, function(Current)
		-- upvalues: UseRefResult (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult4 (copy), UseRefResult5 (copy), p4 (copy), p1 (copy), p2 (copy)
		if UseRefResult.current and not UseRefResult2.current and UseRefResult3.current ~= nil and UseRefResult4.current ~= nil and Current == UseRefResult5.current and not p4 then
			local YDelta = Current.Position.Y - UseRefResult4.current
			
			if p1 then
				YDelta = math.min(YDelta, 100)
			end
			if p2 then
				YDelta = math.max(YDelta, -100)
			end
			UseRefResult.current.Position = UDim2.fromOffset(0, UseRefResult3.current + YDelta)
		end
	end)
	UseEventConnectionFunction(UserInputService.TouchSwipe, function(SwipeDirection)
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), p4 (copy), p1 (copy), p2 (copy), UseScreenSizeResult (copy), NavigationTypeModule (upval), UseGuiInsetResult (copy), p3 (copy), UseRefResult6 (copy), v8 (upval)
		if not UseRefResult.current or UseRefResult1.current or UseRefResult2.current or p4 then return end
		assert(UseRefResult.current ~= nil, "feedMotionRef.current is nil")
		
		if p1 and SwipeDirection == Enum.SwipeDirection.Down then return end
		if not p2 or SwipeDirection ~= Enum.SwipeDirection.Up then
			local NavigatedToPreviousItem = if SwipeDirection == Enum.SwipeDirection.Up then NavigationTypeModule.NavigatedToPreviousItem else NavigationTypeModule.NavigatedToNextItem
			local Offset = UseRefResult.current.Position.Y.Offset
			local OffsetDelta = UseRefResult.current.Position.Y.Offset - (if SwipeDirection == Enum.SwipeDirection.Up and UseScreenSizeResult.Y / 2 < UseRefResult.current.Position.Y.Offset % UseScreenSizeResult.Y then UseScreenSizeResult.Y elseif SwipeDirection == Enum.SwipeDirection.Down and UseRefResult.current.Position.Y.Offset % UseScreenSizeResult.Y < UseScreenSizeResult.Y / 2 then -UseScreenSizeResult.Y else 0)
			local Y: number = UseScreenSizeResult.Y
			local OffsetDeltaRemainder = OffsetDelta % Y
			local ClampedValue = math.clamp(if Y / 2 < OffsetDeltaRemainder then math.min(OffsetDelta + (Y - OffsetDeltaRemainder), 0) - UseGuiInsetResult.top else OffsetDelta - OffsetDeltaRemainder - UseGuiInsetResult.top, -(p3 - 1) * UseScreenSizeResult.Y - UseGuiInsetResult.top, 0)
			v8(Offset, ClampedValue, function(YOffset)
				-- upvalues: UseRefResult (upval)
				if UseRefResult.current then
					UseRefResult.current.Position = UDim2.fromOffset(0, YOffset)
					
					return
				end
			end, function()
				-- upvalues: Offset (copy), ClampedValue (copy), UseRefResult1 (upval), UseRefResult6 (upval), NavigatedToPreviousItem (copy)
				if math.abs(Offset - ClampedValue) >= 2 then
					UseRefResult1.current = false
					UseRefResult6.current:fire(NavigatedToPreviousItem)
					
					return
				end
			end, UseRefResult1)
			
			return
		end
	end)
	UseEventConnectionFunction(UserInputService.TouchEnded, function(Current)
		-- upvalues: UseRefResult5 (copy), UseRefResult (copy), UseRefResult3 (copy), UseRefResult1 (copy), p4 (copy), UseScreenSizeResult (copy), UseGuiInsetResult (copy), UseRefResult2 (copy), NavigationTypeModule (upval), UseRefResult6 (copy), v8 (upval)
		if UseRefResult5.current == Current then
			UseRefResult5.current = nil
		end
		if not UseRefResult.current or not UseRefResult3.current or UseRefResult1.current or UseRefResult5.current ~= nil or p4 then return end
		assert(UseRefResult.current ~= nil, "feedMotionRef.current is nil")
		assert(UseRefResult3.current ~= nil, "feedStartPositionYOffset.current is nil")
		local NavigatedToCurrentItem = nil
		local Current1: number = UseRefResult3.current
		local Y: number = UseScreenSizeResult.Y
		local CurrentRemainder = Current1 % Y
		local SmallestDelta: number = if Y / 2 < CurrentRemainder then math.min(Current1 + (Y - CurrentRemainder), 0) - UseGuiInsetResult.top else Current1 - CurrentRemainder - UseGuiInsetResult.top
		local Offset: number = UseRefResult.current.Position.Y.Offset
		local Y1: number = UseScreenSizeResult.Y
		local OffsetRemainder = Offset % Y1
		local SmallestDelta1: number = if Y1 / 2 < OffsetRemainder then math.min(Offset + (Y1 - OffsetRemainder), 0) - UseGuiInsetResult.top else Offset - OffsetRemainder - UseGuiInsetResult.top
		NavigatedToCurrentItem = if UseRefResult2.current then NavigationTypeModule.NavigatedToCurrentItem elseif SmallestDelta < SmallestDelta1 then NavigationTypeModule.NavigatedToPreviousItem elseif SmallestDelta1 < SmallestDelta then NavigationTypeModule.NavigatedToNextItem else NavigationTypeModule.NavigatedToCurrentItem
		UseRefResult3.current = nil
		local Offset1 = UseRefResult.current.Position.Y.Offset
		task.wait()
		UseRefResult2.current = false
		
		if not UseRefResult.current then return end
		if Offset1 == UseRefResult.current.Position.Y.Offset then
			v8(UseRefResult.current.Position.Y.Offset, SmallestDelta1, function(YOffset)
				-- upvalues: UseRefResult (upval)
				if UseRefResult.current then
					UseRefResult.current.Position = UDim2.fromOffset(0, YOffset)
					
					return
				end
			end, function()
				-- upvalues: UseRefResult1 (upval), NavigatedToCurrentItem (ref), UseRefResult6 (upval)
				UseRefResult1.current = false
				
				if NavigatedToCurrentItem then
					UseRefResult6.current:fire(NavigatedToCurrentItem)
				end
			end, UseRefResult1)
			
			return
		end
	end)
	local UseResult = ReactModule.useCallback(function(Down)
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), FeedDirectionTypeModule (upval), UseScreenSizeResult (copy), UseGuiInsetResult (copy), p3 (copy), UseRefResult6 (copy), NavigationTypeModule (upval), v8 (upval)
		if UseRefResult.current and not UseRefResult1.current then
			assert(UseRefResult.current ~= nil, "feedMotionRef.current is nil")
			local OffsetDelta = UseRefResult.current.Position.Y.Offset - (if Down == FeedDirectionTypeModule.Up then -UseScreenSizeResult.Y elseif Down == FeedDirectionTypeModule.Down then UseScreenSizeResult.Y else 0)
			local Y: number = UseScreenSizeResult.Y
			local OffsetDeltaRemainder = OffsetDelta % Y
			local ClampedValue = math.clamp(if Y / 2 < OffsetDeltaRemainder then math.min(OffsetDelta + (Y - OffsetDeltaRemainder), 0) - UseGuiInsetResult.top else OffsetDelta - OffsetDeltaRemainder - UseGuiInsetResult.top, -(p3 - 1) * UseScreenSizeResult.Y, 0)
			UseRefResult1.current = true
			v8(UseRefResult.current.Position.Y.Offset, ClampedValue, function(YOffset)
				-- upvalues: ClampedValue (copy), UseRefResult (upval)
				if ClampedValue - YOffset < 2 and ClampedValue - YOffset > -2 then
					UseRefResult.current.Position = UDim2.fromOffset(0, ClampedValue)
					
					return
				else
					UseRefResult.current.Position = UDim2.fromOffset(0, YOffset)
				end
			end, function()
				-- upvalues: UseRefResult1 (upval), Down (copy), FeedDirectionTypeModule (upval), UseRefResult6 (upval), NavigationTypeModule (upval)
				UseRefResult1.current = false
				
				if Down == FeedDirectionTypeModule.Down then
					UseRefResult6.current:fire(NavigationTypeModule.NavigatedToPreviousItem)
					
					return
				end
				if Down == FeedDirectionTypeModule.Up then
					UseRefResult6.current:fire(NavigationTypeModule.NavigatedToNextItem)
				end
			end, UseRefResult1)
			
			return
		end
	end, { p3, UseScreenSizeResult })
	UseEventConnectionFunction(UserInputService.PointerAction, (ReactModule.useCallback(function(p5: number)
		-- upvalues: p4 (copy), p1 (copy), UseResult (copy), FeedDirectionTypeModule (upval), p2 (copy)
		if p4 then return end
		if p5 > 0 and not p1 then
			UseResult(FeedDirectionTypeModule.Up)
			
			return
		end
		if p5 < 0 and not p2 then
			UseResult(FeedDirectionTypeModule.Down)
		end
	end, { p4, p1, p2, UseResult })))
	
	return UseRefResult, UseRefResult6.current, UseResult
end